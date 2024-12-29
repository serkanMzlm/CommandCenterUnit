#include <QIcon>
#include <QDebug>
#include <QQmlContext>
#include <QDirIterator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <rclcpp/rclcpp.hpp>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    rclcpp::init(argc, argv);
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

    if(rclcpp::ok())
    {
        rclcpp::shutdown();
    }

    return app.exec();
}
