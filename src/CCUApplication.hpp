#ifndef __CCU_APPLICATION_HPP__
#define __CCU_APPLICATION_HPP__


#include <QGuiApplication>
#include <QQmlApplicationEngine>

class CCUApplication: public QGuiApplication{
    Q_OBJECT
public:
    explicit CCUApplication(int argc, char** argv);
    void loadQML();
    void commInit();

private:
    QQmlApplicationEngine engine;
};

#endif
