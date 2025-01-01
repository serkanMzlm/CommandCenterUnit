import QtQuick

Rectangle {
    id: ccuSwitchRoot
    height: 20
    width: 20
    radius: height / 2
    color: "white"
    border.color: lineColor
    border.width: 2

    property alias onText:         leftText.text
    property alias offText:        rightText.text


    Rectangle {
        id: slider
        height: ccuSwitchRoot.height - 8
        width: ccuSwitchRoot.width / 2
        radius: height / 2
        color: conceptColor
        anchors.verticalCenter: parent.verticalCenter
        x: isDarkTheme ? parent.width - width - 4 : 4
        Behavior on x { NumberAnimation { duration: 200 } }
    }
    Text {
        id: leftText
        text: ""
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 10
        color: textColor
        font.pointSize: fontSize
    }
    Text {
        id: rightText
        text: ""
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 10
        color: leftText.color
        font.pointSize: leftText.font.pointSize
    }
    MouseArea {
        anchors.fill: parent
        onClicked: isDarkTheme = !isDarkTheme
    }
}
