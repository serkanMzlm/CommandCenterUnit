find_package(rclcpp REQUIRED)
find_package(ament_cmake REQUIRED)
find_package(std_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)

add_library(CCU STATIC
    CCUApplication.cpp
    CCUApplication.hpp
)

add_subdirectory(Comms)

ament_target_dependencies(CCU
    rclcpp
    std_msgs
    geometry_msgs
)

target_link_libraries(CCU
        Qt6::Quick
        Qt6::Core5Compat
        Qt6::Bluetooth
        Qt6::Core
        Qt6::Widgets
        Comms
)

target_include_directories(CCU PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
