#include "RosLink.hpp"

ROSLink::ROSLink(QObject *parent):
    QObject(parent), Node("ros_link")
{
    pub.joy  = this->create_publisher<joyMsg>("joy",10);
    pub.point = this->create_publisher<pointMsg>("point",10);
    pub.button = this->create_publisher<int16Msg>("button",10);
}

void ROSLink::joyCallback()
{
}

void ROSLink::buttonCallback(int number)
{
    int16Msg msg;
    msg.data = number;
    pub.button->publish(msg);
}

void ROSLink::pointCallback(int x, int y)
{
    pointMsg msg;
    msg.x = x;
    msg.y = y;
    msg.z = 0;
    pub.point->publish(msg);
}

ROSLink::~ROSLink()
{
    if(rclcpp::ok())
    {
        rclcpp::shutdown();
    }
}
