#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include "sqlquerymodel.h"
#include <QtSql/QSqlRecord>
#include <QtSql/QSqlField>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlDriver>
#include <QtSql/QSqlDriverPlugin>
#include <QtSql/QSql>
#include <QtSql/QSqlQuery>
#include <QtCore>
#include <QVariant>
#include <QDebug>
#include <QAbstractTableModel>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQmlContext>
#include <QtQuick/QQuickView>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    ///home/koffice/Qt/untitled1/db/testdb.sql
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("/home/koffice/Qt/untitled1/db/testdb2");
    if (db.open()) {
        qDebug() << "database open";
    }
    else {
        qDebug() << "database NOT open";
    }

    SqlQueryModel *modeldb = new SqlQueryModel(nullptr);
    modeldb->setQuery("SELECT * FROM test2");


    //qmlRegisterType<SqlQueryModel>("modeldb", 1, 0, "SqlQueryModel");

        QSqlQuery query;
        query.exec("SELECT name FROM test2 WHERE jd > 0");
        while (query.next()) {
                QString name = query.value(0).toString();
                qDebug() << "un user name:   "<< name; /* ottengo la lista corretta del campo name*/
            }


    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    qmlRegisterType<SqlQueryModel>("modeldb", 1, 0, "SqlQueryModel");
    SqlQueryModel myClass;
    engine.rootContext()->setContextProperty("myClass", &myClass);



    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    //qmlRegisterType<SqlQueryModel>("modeldb", 1, 0, "SqlQueryModel");



    return app.exec();
}
