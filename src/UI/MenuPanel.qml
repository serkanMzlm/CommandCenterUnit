import QtQuick 
import QtQuick.Window 
import QtQuick.Controls 
import QtQuick.Layouts 
import Qt5Compat.GraphicalEffects

Item {
    id: menuPanelRoot

    property var navItems: [
        {"label": "Home", "iconSource": "", "page": ""},
        {"label": "Joystick", "iconSource": "", "page": ""},
        {"label": "Settings", "iconSource": "", "page": ""},
    ]
}
