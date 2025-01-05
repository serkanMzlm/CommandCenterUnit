
add_library(CCU STATIC
    CCUApplication.cpp
    CCUApplication.hpp
)

add_subdirectory(Comms)

target_link_libraries(CCU PUBLIC
        Qt6::Quick
        Qt6::Core5Compat
        Qt6::Bluetooth
        Qt6::Core
        Qt6::Widgets
        Comms
)

target_include_directories(CCU PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
