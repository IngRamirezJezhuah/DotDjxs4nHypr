/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *          ISLA DE LA IZQUIERDA
 *~/.config/quickshell/djxs4n/lefthIsland.qml
 ===========================================*/
import Quickshell
import QtQuick

Island {
    id: root
    width: row.implicitWidth + 28

    HoverHandler { id: hover }

    Row {
        id: row
        anchors.centerIn: parent
        spacing: Theme.spacing

        Glyph { text: "" }
        Sep {}
        Glyph { text: ""; color: Theme.cyan }
        Label { text: "39°C" }
        Sep {}
        Glyph { text: ""; color: Theme.cyan }
        Label { text: "4.2G" }
        Sep {}
        Glyph { text: ""; color: Theme.orange }
        Label { text: "Full"; color: Theme.orange }
    }

    PopupWindow {
        anchor.item: root
        anchor.rect.x: 0
        anchor.rect.y: root.height
        implicitWidth: 240
        implicitHeight: 150
        color: "transparent"
        visible: hover.hovered || popupHover.hovered

        Rectangle {
            anchors.fill: parent
            anchors.topMargin: Theme.barMargin
            radius: 14
            color: Theme.popup
            border.width: 1
            border.color: Theme.border

            HoverHandler { id: popupHover }

            Column {
                anchors.fill: parent
                anchors.margins: 14
                spacing: 12

                Row {
                    spacing: 8
                    Glyph { text: "󰓅"; color: Theme.orange }
                    Label { text: "Modo" ; color: Theme.muted }
                    Label { text: "Ahorro · Rendimiento · Full"; color: Theme.orange }
                }
                Row {
                    spacing: 8
                    Glyph { text: ""; color: Theme.cyan }
                    Label { text: "CPU cores"; color: Theme.muted }
                    Label { text: "6 / 12" }
                }
                Row {
                    spacing: 8
                    Glyph { text: "󰋊"; color: Theme.cyan }
                    Label { text: "Disco"; color: Theme.muted }
                    Label { text: "212G / 512G" }
                }
            }
        }
    }
}
