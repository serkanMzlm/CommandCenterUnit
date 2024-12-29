import QtQuick
import QtQuick.Dialogs


Rectangle {
    id: toolbarRoot
    color: toolbarColor
    width: parent.width
    height: parent.height * 0.05

    Item {
        id: logoItem
        height: parent.height * 0.7
        width: height
        anchors.left: parent.left
        anchors.leftMargin: height / 2
        anchors.verticalCenter: parent.verticalCenter

        CCUImage {
            source: "/svg/ccu_icon.svg"
            color: titleColor
        }
    }

    Item {
        id: exitItem
        height: parent.height * 0.7
        width: height
        anchors.right: parent.right
        anchors.rightMargin: parent.height * 0.15
        anchors.verticalCenter: parent.verticalCenter

        CCUImage {
            source: "/svg/reject.svg"
            color: titleColor
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: Qt.quit()
        }
    }

    Item {
        id: minimizeItem
        height: parent.height * 0.7
        width: height
        anchors.right: exitItem.left
        anchors.rightMargin: parent.height * 0.15
        anchors.verticalCenter: parent.verticalCenter
        Rectangle {
            width: parent.height * 0.8
            height: parent.height * 0.1
            radius: height
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.15
            color: titleColor
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                console.log(mainWindow.screen.height)
                // mainWindow.showMinimized()
            }
        }
    }
}
