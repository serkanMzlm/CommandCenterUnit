#include <QIcon>
#include <QDebug>
#include <QQmlContext>
#include <QDirIterator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "CCUApplication.hpp"

int main(int argc, char *argv[])
{
    CCUApplication app(argc, argv);
    return app.exec();
}
