/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *          BASE REFERENCIA TEMA
 *    ~/.config/quickshell/djxs4n/theme.qml
 ===========================================*/
pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    id: root

    spacing: 4

    function focusWorkspace(ws) {
        if (!ws)
            return;
        if (Hyprland.usingLua) {
            const target = ws.id > 0 ? ws.id : JSON.stringify(ws.name);
            Hyprland.dispatch(`hl.dsp.focus({ workspace = ${target} })`);
        } else {
            const target = ws.id > 0 ? ws.id : `name:${ws.name}`;
            Hyprland.dispatch(`workspace ${target}`);
        }
    }

    Repeater {
        model: Hyprland.workspaces

        delegate: Rectangle {
            id: chip

            required property var modelData
            readonly property bool isFocused: !!modelData && modelData.focused

            implicitWidth: 24
            implicitHeight: 20
            radius: 0
            color: chip.isFocused ? Theme.accentPrimary : "transparent"
            border.width: chip.isFocused ? 0 : 1
            border.color: Theme.layerBackground3

            Text {
                anchors.centerIn: parent
                text: chip.modelData ? chip.modelData.name : ""
                color: chip.isFocused ? Theme.accentPrimaryText : Theme.secondaryText
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSize
                font.bold: chip.isFocused
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: root.focusWorkspace(chip.modelData)
            }
        }
    }
}
