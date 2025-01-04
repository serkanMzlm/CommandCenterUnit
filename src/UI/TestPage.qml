import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: settingsPage
    height: mainWindow.height * 0.95
    width: mainWindow.width * 0.925

    Text {
        anchors.centerIn: parent
        text: "This Section Will Be Added Later."
        font.pointSize: fontSize * 3
        color: titleColor
    }
}
