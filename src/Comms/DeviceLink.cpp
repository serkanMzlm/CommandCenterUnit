#include "DeviceLink.hpp"

DeviceLink::DeviceLink(QObject *parent) : QObject{parent}
{
    setLocalTime("01.01.2000  00:00");
    timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &DeviceLink::updateSystemInfo);
    qDebug() << "kdkdkdkd";
    timer->start(1000);
}

void DeviceLink::updateSystemInfo()
{
    current_time = std::time(nullptr);
    local_time = std::localtime(&current_time);

    QString format_date = QString("%1.%2.%3")
                              .arg(local_time->tm_mday, 2, 10, QChar('0'))
                              .arg(local_time->tm_mon + 1, 2, 10, QChar('0'))
                              .arg(local_time->tm_year + 1900);

    QString format_time = QString("%1:%2")
                              .arg(local_time->tm_hour, 2, 10, QChar('0'))
                              .arg(local_time->tm_min, 2, 10, QChar('0'));

    setLocalTime(format_date + "  " + format_time);
}

void DeviceLink::setLocalTime(const QString &newLocalTime)
{
    m_localTime = newLocalTime;
    emit localTimeChanged();
}

QString DeviceLink::localTime() const { return m_localTime; }
