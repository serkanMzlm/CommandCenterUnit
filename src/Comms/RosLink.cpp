#include "RosLink.hpp"

ROSLink::ROSLink(): Node("ros_link") {

}

ROSLink::~ROSLink() {
    if(rclcpp::ok()){
        rclcpp::shutdown();
    }
}
