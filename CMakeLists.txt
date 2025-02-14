#######################################################
#            Command Center Unit (CCU)                #
#######################################################

cmake_minimum_required(VERSION 3.20)

list(APPEND CMAKE_MODULE_PATH
    ${CMAKE_SOURCE_DIR}/cmake
    ${CMAKE_SOURCE_DIR}/cmake/modules
)

include(GeneralOptions)

project(CommandCenterUnit 
    VERSION 
    0.1 
    LANGUAGES C CXX
)

if(UNIX AND NOT APPLE AND NOT ANDROID)
    set(LINUX TRUE)
endif()

if(APPLE AND NOT IOS)
    set(MACOS TRUE)
endif()

if(IOS OR ANDROID)
    set(MOBILE TRUE)
    add_compile_definitions(__mobile__)
endif()

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Quick Core Gui Qml)
find_package(Qt${QT_VERSION_MAJOR}
REQUIRED
COMPONENTS
Core
Quick
Concurrent
Core5Compat
Xml
Sql
Widgets
Svg
Multimedia
MultimediaQuickPrivate
Sensors
Network
Positioning
Location
Bluetooth
SerialPort
OpenGL
Quick3D
Gui
)

qt_standard_project_setup(REQUIRES 6.8)

list(APPEND CCU_RESOURCES
    ${CMAKE_SOURCE_DIR}/recourse.qrc
)

add_subdirectory(src)

add_executable(${PROJECT_NAME}
    ${CMAKE_SOURCE_DIR}/src/main.cpp
    ${CCU_RESOURCES}
)

target_link_libraries(${PROJECT_NAME}
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::Widgets
    Qt${QT_VERSION_MAJOR}::Svg
    Qt${QT_VERSION_MAJOR}::Gui
    CCU
)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
