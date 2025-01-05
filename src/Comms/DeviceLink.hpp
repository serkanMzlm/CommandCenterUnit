#ifndef __DEVICE_LINK_HPP__
#define __DEVICE_LINK_HPP__

#include <QObject>
#include <QTimer>
#include <QDebug>

class DeviceLink: public QObject {
    Q_OBJECT
    Q_PROPERTY(QString localTime READ localTime WRITE setLocalTime NOTIFY localTimeChanged FINAL)
public:
    explicit DeviceLink(QObject *parent = nullptr);
    void updateSystemInfo();
    QString localTime() const;
    void setLocalTime(const QString &newLocalTime);

private:
    std::tm* local_time;
    std::time_t current_time;
    QTimer *timer;    
    QString m_localTime;

signals:
    void localTimeChanged();
};

#endif