import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: settingsPage
    height: mainWindow.height * 0.95
    width: mainWindow.width * 0.925

    property bool isConnect: false
    property string serialPortName: ""
    property bool isConnectSerial: false

    Rectangle {
        id: themeRec
        height: parent.height * 0.09
        width: height * 5
        radius: height * 0.2
        color: buttonColor
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: height * 0.5
        anchors.leftMargin: height * 0.5
        Item {
            id: themeItem
            width: parent.height * 0.4
            height: width
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: height * 0.4
            CCUImage {
                id: image
                source: "/svg/theme.svg"
                color: titleColor
            }
            Text {
                id: iconText
                text: "Theme"
                anchors.left: image.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: parent.width * 0.4
                color: textColor
                font.pointSize: fontSize * 1.2
            }
        }

        // Rectangle {
        //     id: themeSwitch
        //     height: image.height
        //     width: height * 4
        //     radius: height / 2
        //     color: buttonColor
        //     anchors.verticalCenter: image.verticalCenter
        //     anchors.right: parent.right
        //     anchors.rightMargin: height
        //     border.color: lineColor
        //     border.width: 2

        //     Rectangle {
        //         id: slider
        //         height: theme_switch.height - 8
        //         width: theme_switch.width / 2
        //         radius: height / 2
        //         color: conceptColor
        //         anchors.verticalCenter: parent.verticalCenter
        //         x: isDarkTheme ? theme_switch.width - width - 4 : 4
        //         Behavior on x { NumberAnimation { duration: 200 } }
        //     }

        //     Text {
        //         text: "Light"
        //         anchors.left: parent.left
        //         anchors.verticalCenter: parent.verticalCenter
        //         anchors.leftMargin: 10
        //         color: textColor
        //         font.pointSize: font_size * 0.8
        //     }
        //     Text {
        //         text: "Dark"
        //         anchors.right: parent.right
        //         anchors.verticalCenter: parent.verticalCenter
        //         anchors.rightMargin: 10
        //         color: textColor
        //         font.pointSize: font_size * 0.8
        //     }
        //     MouseArea {
        //         anchors.fill: parent
        //         onClicked: isDarkTheme = !isDarkTheme
        //     }
        // }
    }
}
