/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *          BASE REFERENCIA TEMA
 *    ~/.config/quickshell/djxs4n/theme.qml
 ===========================================*/

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    margins.top: Theme.barMargin
    margins.left: Theme.barMargin
    margins.right: Theme.barMargin

    implicitHeight: Theme.barHeight
    color: "transparent"
    exclusiveZone: 0

    WlrLayershell.namespace: "djxs4n-bar-test"

    Rectangle {
        anchors.fill: parent
        radius: Theme.barRadius
        color: Theme.windowBackground
        border.width: 1
        border.color: Theme.borderPrimary

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            spacing: 10

            Workspace {
                Layout.alignment: Qt.AlignVCenter
            }

            Item {
                Layout.fillWidth: true
            }

            Clock {
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
}
