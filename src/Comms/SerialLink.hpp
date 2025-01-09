#ifndef __SERIAL_LINK_HPP__
#define __SERIAL_LINK_HPP__

#include <QDebug>
#include <QTimer>
#include <QObject>
#include <QThread>
#include <QSerialPort>
#include <QSerialPortInfo>

#define TIME_OUT 1500    // ms
#define DEFAULT_BAUDRATE 115200

class SerialLink : public QObject{
    Q_OBJECT
public:
    explicit SerialLink(QObject *parent = nullptr);
    ~SerialLink();
    void init();
    void listPortInfo();
    void checkDeviceConnection();
    void sleepForTimeout(int timeout_ms);

    Q_INVOKABLE void readBytes();
    Q_INVOKABLE void writeBytes(uint8_t new_data);
    Q_INVOKABLE void serialDisconnect();
    Q_INVOKABLE void serialConnect();
    Q_INVOKABLE void updatePortList();
    Q_INVOKABLE void setSelectedPort(const QString &portName);
    Q_INVOKABLE void setBaudrate(int new_data);
    Q_INVOKABLE void setAutoConnect(bool new_data);

signals:
    void portListUpdated(const QStringList &ports);
    void portConnection(bool is_connect);

private:
    QSerialPort *port;
    QStringList availablePorts;
    QTimer* connection_timer;

    uint8_t time_coef = 1;
    QString port_name = "";
    int baudrate = 115200;
    bool is_auto_connect = true;

    std::chrono::steady_clock::time_point prev_time;
    std::chrono::steady_clock::duration elapsed_time;
};

#endif
