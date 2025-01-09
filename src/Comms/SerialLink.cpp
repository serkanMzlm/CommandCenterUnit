#include "SerialLink.hpp"

SerialLink::SerialLink(QObject *parent) : QObject{parent}
{
    init();
    connect(port, &QSerialPort::readyRead, this, &SerialLink::readBytes);
    connect(connection_timer, &QTimer::timeout, this, &SerialLink::checkDeviceConnection);
    connection_timer->start();
}

SerialLink::~SerialLink()
{
    serialDisconnect();
    delete connection_timer;
}

void SerialLink::init()
{
    port = new QSerialPort(this);
    connection_timer = new QTimer(this);
    connection_timer->setInterval(1000);
    checkDeviceConnection();
}

void SerialLink::serialDisconnect()
{
    if(port->isOpen()) {
        port->close();
        qDebug() << "Port Disconnect";
        portConnection(false);
    }
}

void SerialLink::serialConnect()
{
    qDebug() << "asdasdasdasda!";
    serialDisconnect();
    port->setPortName(port_name);
    port->setBaudRate(baudrate);
    port->setDataBits(QSerialPort::Data8);
    if (!port->open(QIODevice::ReadWrite)) {
        qDebug() << "Failed to open port:" << port->errorString();
    } else {
        qDebug() << "Port opened successfully!";
        portConnection(true);
    }
}

void SerialLink::checkDeviceConnection()
{
    elapsed_time = std::chrono::steady_clock::now() - prev_time;
    bool is_found = false;

    if((elapsed_time.count() / 1000000) < time_coef * TIME_OUT || !is_auto_connect) { return; }

    for(const QSerialPortInfo &port_list : QSerialPortInfo::availablePorts()){
        is_found = ((port_list.manufacturer() == "FTDI") ||
                    (port_list.description() == "Arduino Mega 2560") ||
                    (port_list.description() == "STLINK-V3") ||
                    (port_list.manufacturer() == "STMicroelectronics") ||
                    (port_list.description() == "USB-SERIAL CH340") ||
                    (port_list.description() == "USB2.0-Serial"));
        if(is_found){
            if(!port->isOpen()) {
                prev_time = std::chrono::steady_clock::now();
                port_name = port_list.portName();
                baudrate = DEFAULT_BAUDRATE;
                serialConnect();
                time_coef = 10;
                sleepForTimeout(TIME_OUT);
                qDebug() << "Connected with Device";
            }
            break;
        }
    }
    if(!is_found && port->isOpen()) {
        qDebug() << "Device Connection Lost";
        port->close();
    }
}

void SerialLink::readBytes()
{
    while(port->bytesAvailable()){
        uint8_t cur_byte;
        port->read((char*)&cur_byte, 1);
        QString new_data_ = QString::number(cur_byte);
    }
}


void SerialLink::writeBytes(uint8_t new_data)
{
    if (!(port->isOpen()))
    {
        qDebug() << "Port Closed";
        return ;
    }

    QString new_data_str = QString::fromStdString(std::to_string(static_cast<int>(new_data)));
    char dataToSend[1] = { static_cast<char>(new_data) };
    qint64 bytesWritten = port->write(dataToSend, 1);
    if (bytesWritten == -1) {
        qDebug() << "Could not write data to port: " << port->errorString();
    } else {
        port->flush();
        QString new_data_ = QString::number(new_data);
    }
}

void SerialLink::updatePortList()
{
    QStringList ports;
    const auto serialPorts = QSerialPortInfo::availablePorts();
    for (const QSerialPortInfo &info : serialPorts) {
        ports.append(info.portName());
    }
    availablePorts = ports;
    emit portListUpdated(availablePorts);
}

void SerialLink::setSelectedPort(const QString &portName)
{
    port_name = portName;
    port->setPortName(portName);
    port->setBaudRate(baudrate);
    if (!port->open(QIODevice::ReadWrite)) {
        qDebug() << "Failed to open port:" << port->errorString();
    }
}

void SerialLink::setBaudrate(int new_data) { baudrate = new_data; }
void SerialLink::setAutoConnect(bool new_data) { is_auto_connect = new_data; }

void SerialLink::listPortInfo(){
    for(const QSerialPortInfo &port_list : QSerialPortInfo::availablePorts()){
        qDebug() << "-----------------------------------------------------";
        qDebug() << "portName:          " << port_list.portName();
        qDebug() << "systemLocation:    " << port_list.systemLocation();
        qDebug() << "description:       " << port_list.description();
        qDebug() << "manufacturer:      " << port_list.manufacturer();
        qDebug() << "serialNumber:      " << port_list.serialNumber();
        qDebug() << "vendorIdentifier:  " << port_list.vendorIdentifier();
        qDebug() << "productIdentifier: " << port_list.productIdentifier();
    }
}

void SerialLink::sleepForTimeout(int timeout_ms)
{
    QThread::msleep(timeout_ms);
}
