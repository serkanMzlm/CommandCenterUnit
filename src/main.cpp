#include <QIcon>
#include <QDebug>
#include <QQmlContext>
#include <QDirIterator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "RosLink.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/icons/ccu_icon.ico"));

    QQmlApplicationEngine engine;    
    const QUrl url(QStringLiteral("qrc:/qml/MainWindow.qml"));

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl)
        {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.load(url);
    return app.exec();
}
