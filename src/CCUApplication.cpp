#include <QUrl>
#include <QIcon>
#include <QQmlEngine>
#include <QCoreApplication>

#include "CCUApplication.hpp"
#include "RosLink.hpp"

CCUApplication::CCUApplication(int argc, char** argv):
    QGuiApplication(argc, argv) {
    setWindowIcon(QIcon(":/icons/ccu_icon.ico"));

    rclcpp::init(argc, argv);

    commInit();
    loadQML();
}

void CCUApplication::loadQML() {
    const QUrl url(QStringLiteral("qrc:/qml/MainWindow.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     this, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);
}

void CCUApplication::commInit() {
    qmlRegisterType<ROSLink>("CCU.ROSLink", 1, 0, "ROSLink");
}
