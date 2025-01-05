find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)
find_package(ament_cmake REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)

add_library(Comms STATIC
    RosLink.cpp
    RosLink.hpp
    SerialLink.cpp
    SerialLink.hpp
)

ament_target_dependencies(Comms
    rclcpp
    std_msgs
    geometry_msgs
    sensor_msgs
)

target_include_directories(Comms PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(Comms
                Qt${QT_VERSION_MAJOR}::Core
                Qt${QT_VERSION_MAJOR}::Quick
)
