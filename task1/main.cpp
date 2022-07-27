#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "text.h"
#include "image.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Text> ("ST", 1, 0, "TextClass");
    qmlRegisterType<Image> ("SI", 1, 0, "ImageClass");
    qmlRegisterSingletonType( QUrl("qrc:/HeaderLine.qml"), "MyStyle", 1, 0, "HeaderLine" );

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
