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

        CCUSwitch {
            id: themeSwitch
            height: image.height
            width: height * 5
            color: buttonColor
            anchors.verticalCenter: themeItem.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: height * 0.5
            onText: "Light"
            offText: "Dark"
        }
    }

    Rectangle {
        id: serialRec
        height: isAutoDecet ? parent.height * 0.15 : parent.height * 0.3
        width: themeRec.width
        radius: themeRec.radius
        color: buttonColor
        anchors.top: themeRec.bottom
        anchors.left: themeRec.left
        anchors.topMargin: themeRec.height * 0.5
    }

}
