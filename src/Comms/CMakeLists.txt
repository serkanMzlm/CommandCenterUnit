add_library(Comms STATIC
    RosLink.cpp
    RosLink.hpp
    SerialLink.cpp
    SerialLink.hpp
)

target_include_directories(Comms PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
