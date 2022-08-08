#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QQmlContext>
#include "listmodel.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/test1-8-4/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    ListModel model;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("MyModel", &model);
    return app.exec();
}
