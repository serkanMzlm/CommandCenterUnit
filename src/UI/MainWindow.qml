import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    id: mainWindow
    // width: mainWindow.screen.width
    // height: mainWindow.screen.height
    // visibility: Window.FullScreen

    width: 640
    height: 480

    visible: true
    color: backgroundColor
    title: qsTr("Command Center Unit")

    property bool isDarkTheme: true
    property color lineColor: "#929292"
    property color iconColor: isDarkTheme ? "#3b3c3d" : "#F5F5F5"
    property color textColor: isDarkTheme ? "#e0e0e0" : "#3b3c3d"
    property color titleColor: isDarkTheme ? "#FFFFFF" : "#1d1c1c"
    property color buttonColor: isDarkTheme ? "#444648" : "#cccbc8"
    property color toolbarColor: isDarkTheme ? "#2c2e30" : "#cccbc8"
    property color conceptColor: isDarkTheme ? "#FF6600" : "#006fff"
    property color backgroundColor:  isDarkTheme ? "#1D1F21" : "#fffefb"

    property bool isMaximized: false
    property string selectPage: "Home"
    property int fontSize: (height <= 0.01 ? 0.01 : height * 0.015)

    Toolbar {
        id: toolbar
    }

    MenuPanel {
        id: menuPanel
        width: parent.width * 0.075
        height: parent.height * 0.95

        anchors.top: toolbar.bottom
        anchors.left: parent.left

        Loader {
            id: pageLoader
            anchors.bottom: parent.bottom
            anchors.left: parent.right
        }
    }
}
