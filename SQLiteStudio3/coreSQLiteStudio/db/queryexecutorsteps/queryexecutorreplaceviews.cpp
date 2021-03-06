#include "queryexecutorreplaceviews.h"
#include "parser/ast/sqlitecreateview.h"
#include "schemaresolver.h"
#include <QDebug>

QueryExecutorReplaceViews::~QueryExecutorReplaceViews()
{
    if (schemaResolver)
    {
        delete schemaResolver;
        schemaResolver = nullptr;
    }
}

bool QueryExecutorReplaceViews::exec()
{
    SqliteSelectPtr select = getSelect();
    if (!select || select->explain)
        return true;

    if (select->coreSelects.size() > 1)
        return true;

    if (select->coreSelects.first()->distinctKw)
        return true;

    replaceViews(select.data());
    select->rebuildTokens();
    updateQueries();

    return true;
}

void QueryExecutorReplaceViews::init()
{
    if (!schemaResolver)
        schemaResolver = new SchemaResolver(db);
}

QStringList QueryExecutorReplaceViews::getViews(const QString& database)
{
    QString dbName = database.isNull() ? "main" : database.toLower();
    if (views.contains(dbName))
        return views[dbName];

    views[dbName] = schemaResolver->getViews(database);
    return views[dbName];
}

SqliteCreateViewPtr QueryExecutorReplaceViews::getView(const QString& database, const QString& viewName)
{
    View view(database, viewName);
    if (viewStatements.contains(view))
        return viewStatements[view];

    SqliteQueryPtr query = schemaResolver->getParsedObject(database, viewName, SchemaResolver::VIEW);
    if (!query)
        return SqliteCreateViewPtr();

    SqliteCreateViewPtr viewPtr = query.dynamicCast<SqliteCreateView>();
    if (!viewPtr)
        return SqliteCreateViewPtr();

    viewStatements[view] = viewPtr;
    return viewPtr;
}

void QueryExecutorReplaceViews::replaceViews(SqliteSelect* select)
{
    SqliteSelect::Core* core = select->coreSelects.first();

    QStringList viewsInDatabase;
    SqliteCreateViewPtr view;

    QList<SqliteSelect::Core::SingleSource*> sources = core->getAllTypedStatements<SqliteSelect::Core::SingleSource>();

    QList<SqliteSelect::Core::SingleSource*> viewSources;
    QSet<SqliteStatement*> parents;
    for (SqliteSelect::Core::SingleSource* src : sources)
    {
        if (src->table.isNull())
            continue;

        viewsInDatabase = getViews(src->database);
        if (!viewsInDatabase.contains(src->table, Qt::CaseInsensitive))
            continue;

        parents << src->parentStatement();
        viewSources << src;
    }

    if (parents.size() > 1)
    {
        // Multi-level views (view selecting from view, selecting from view...).
        // Such constructs build up easily to huge, non-optimized queries.
        // For performance reasons, we won't expand such views.
        qDebug() << "Multi-level views. Skipping view expanding feature of query executor. Some columns won't be editable due to that. Number of different view parents:"
                 << parents.size();
        return;
    }

    for (SqliteSelect::Core::SingleSource* src : viewSources)
    {
        view = getView(src->database, src->table);
        if (!view)
        {
            qWarning() << "Object" << src->database << "." << src->table
                       << "was identified to be a view, but could not get it's parsed representation.";
            continue;
        }

        QString alias = src->alias.isNull() ? view->view : src->alias;

        src->select = view->select;
        src->alias = alias;
        src->database = QString();
        src->table = QString();

        replaceViews(src->select);
    }
}

uint qHash(const QueryExecutorReplaceViews::View& view)
{
    return qHash(view.database + "." + view.view);
}

QueryExecutorReplaceViews::View::View(const QString& database, const QString& view) :
    database(database), view(view)
{
}

int QueryExecutorReplaceViews::View::operator==(const QueryExecutorReplaceViews::View& other) const
{
    return database == other.database && view == other.view;
}
