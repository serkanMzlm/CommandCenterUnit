import QtQuick 
import QtQuick.Window 
import QtQuick.Controls 
import QtQuick.Layouts 
import Qt5Compat.GraphicalEffects

Item {
    id: menuPanelRoot

    property int selected_index: 0

    property var navItems: [
        {"label": "Home", "iconSource": "/svg/home.svg", "page": ""},
        {"label": "Joystick", "iconSource": "/svg/console.svg", "page": ""},
        {"label": "Camera", "iconSource": "/svg/camera.svg", "page": ""},
        {"label": "Model", "iconSource": "/svg/cube.svg", "page": ""},
        {"label": "Analysis", "iconSource": "/svg/analysis.svg", "page": ""},
        {"label": "Map", "iconSource": "/svg/map.svg", "page": ""},
        {"label": "Settings", "iconSource": "/svg/setting.svg", "page": "SettingsPage.qml"},
        {"label": "More", "iconSource": "/svg/more.svg", "page": ""},
    ]

    Rectangle {
        width: 2
        height: parent.height * 0.8
        color: lineColor
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    }

    ColumnLayout {
        height: parent.width * 4.2
        width: parent.width
        anchors.left: parent.left
        anchors.leftMargin: width * 0.25
        anchors.verticalCenter: parent.verticalCenter
        // anchors.centerIn: parent
        spacing: width * 0.1
        Repeater {
            model: navItems
            Rectangle {
                Layout.fillHeight: true
                width: height
                radius: height * 0.2
                color: menuPanelRoot.selected_index === index ? conceptColor : buttonColor
                CCUImage {
                    source: modelData.iconSource !== "" ? modelData.iconSource : "/svg/more.svg"
                    color: titleColor
                    anchors.margins: parent.width * 0.12
                    fillMode: Image.PreserveAspectCrop
                    mouseArea.onClicked: {
                        menuPanelRoot.selected_index = index
                        selectPage =  modelData.label
                        pageLoader.source = modelData.page
                    }
                }
            }
        }
    }
}
