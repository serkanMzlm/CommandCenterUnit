import QtQuick
import QtQuick.Dialogs
import Qt5Compat.GraphicalEffects

Rectangle {
    id: ccuSwitchRoot
    anchors.fill: parent

    property color color: "white"

    property alias asynchronous:        image.asynchronous
    property alias cache:               image.cache
    property alias fillMode:            image.fillMode
    property alias horizontalAlignment: image.horizontalAlignment
    property alias mirror:              image.mirror
    property alias paintedHeight:       image.paintedHeight
    property alias paintedWidth:        image.paintedWidth
    property alias progress:            image.progress
    property alias mipmap:              image.mipmap
    property alias source:              image.source
    property alias sourceSize:          image.sourceSize
    property alias status:              image.status
    property alias verticalAlignment:   image.verticalAlignment
    property alias mouseArea: mouseArea

    Image {
        id:                 image
        smooth:             true
        mipmap:             true
        antialiasing:       true
        visible:            false
        fillMode:           Image.PreserveAspectFit
        anchors.fill:       parent
        sourceSize.height:  height
    }

    ColorOverlay {
        anchors.fill:       image
        source:             image
        color:              parent.color
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: false
    }
}
