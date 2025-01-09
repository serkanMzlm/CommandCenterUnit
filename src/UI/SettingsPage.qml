import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import CCU.SerialLink 1.0

Item {
    id: settingsPage
    height: mainWindow.height * 0.95
    width: mainWindow.width * 0.925

    property bool isConnect: false
    property string serialPortName: ""
    property bool isConnectSerial: false

    SerialLink {
        id: serialLink
    }

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

        CCUImage {
            id: themeImage
            width: parent.height * 0.4
            height: width
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: height * 0.4
            source: "/svg/theme.svg"
            color: titleColor
            Text {
                id: iconText
                text: "Theme"
                anchors.left: themeImage.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: parent.width * 0.4
                color: textColor
                font.pointSize: fontSize * 1.2
            }
        }

        CCUSwitch {
            id: themeSwitch
            height: themeImage.height
            width: height * 4
            anchors.verticalCenter: themeImage.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: height * 0.5
            onText: "Light"
            offText: "Dark"
            mouseArea.onClicked: isDarkTheme = !isDarkTheme
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
        anchors.topMargin: themeRec.height * 0.1

        Rectangle {
            height: serialImage.height
            width: height
            radius: height * 0.2
            color: isConnectSerial ? "darkgreen" : lineColor
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: height * 0.4
            anchors.rightMargin: height * 0.5
            Connections {
                target: serialLink
                function onPortConnection(new_data) {
                    isConnectSerial = new_data
                }
            }
        }

        CCUImage {
            id: serialImage
            width: themeImage.height
            height: width
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: height * 0.4
            anchors.topMargin: height * 0.4
            source: "/svg/drive.svg"
            color: titleColor
            Text {
                id: serialText
                text: "Serial"
                anchors.left: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: parent.width * 0.1
                color: titleColor
                font.pointSize: fontSize * 1.2
            }
        }

        Text {
            id: autoDetectText
            anchors.top: serialImage.bottom
            anchors.left: serialImage.left
            anchors.topMargin: themeRec.height * 0.3
            text: "Auto Serial Connect"
            color: textColor
            font.pointSize: fontSize
        }

        CCUSwitch {
            id: autoDetectSwitch
            height: serialImage.height
            width: height * 4
            anchors.verticalCenter: autoDetectText.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: height * 0.5
            onText: "Off"
            offText: "On"
            mouseArea.onClicked: {
                serialLink.updatePortList()
                serialLink.setAutoConnect(!isAutoDecet)
                if(isAutoDecet) {
                    serialLink.serialDisconnect()
                }
                isAutoDecet = !isAutoDecet
            }
        }

        Text {
            id: serialPortListText
            anchors.top: autoDetectText.bottom
            anchors.left: autoDetectText.left
            anchors.topMargin: parent.height * 0.075
            text: "Serial Port Name"
            color: textColor
            font.pointSize: fontSize
            visible: !isAutoDecet
        }

        Column {
            spacing: 20
            anchors.verticalCenter: serialPortListText.verticalCenter
            anchors.right: autoDetectSwitch.right
            visible: !isAutoDecet

            ComboBox {
                id: portSelector
                width: autoDetectSwitch.width
                height: autoDetectSwitch.height
                textRole: "portName"

                onActivated: {
                    serialPortName = portSelector.currentText
                }

                model: ListModel {
                    id: portListModel
                }

                Connections {
                    target: serialLink
                    function onPortListUpdated(ports) {
                        portListModel.clear()
                        for (var i = 0; i < ports.length; i++) {
                            portListModel.append({"portName": ports[i]})
                        }
                    }
                }
            }
        }

        Text {
            id: baudrateText
            anchors.top: serialPortListText.bottom
            anchors.left: serialPortListText.left
            anchors.topMargin: parent.height * 0.075
            text: "Baudrate"
            color: textColor
            font.pointSize: fontSize
            visible: !isAutoDecet
        }

        TextField {
            id: baudrateDataField
            width: autoDetectSwitch.width
            height: autoDetectSwitch.height
            anchors.verticalCenter: baudrateText.verticalCenter
            anchors.right: autoDetectSwitch.right
            color: "black"
            visible: !isAutoDecet
        }

        CCUSwitch {
            id: connectSwitch
            height: serialImage.height
            width: height * 6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: baudrateDataField.bottom
            anchors.topMargin: parent.height * 0.1
            onText: "Connect"
            offText: "Disconnect"
            visible: !isAutoDecet
            mouseArea.onClicked: {
                isConnect = !isConnect
                if(isConnect) {
                    var baudrate = parseInt(baudrateDataField.text.length > 0 ? baudrateDataField.text : 115200);
                    serialLink.setBaudrate(baudrate)
                    serialLink.setSelectedPort(serialPortName)
                    serialLink.serialConnect()
                } else {
                    serialLink.serialDisconnect()
                }
            }
        }
    }
}
