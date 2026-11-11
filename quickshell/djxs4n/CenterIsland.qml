/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *             ISLA DEL CENTRO 
 *~/.config/quickshell/djxs4n/CenterIsland.qml
 ===========================================*/
import QtQuick

Island {
  width: row.implicitWidth + 20
  radius: 10

    Row {
        id: row
        anchors.centerIn: parent
        spacing: 14

        Row {
            spacing: 5
            anchors.verticalCenter: parent.verticalCenter
            Label { text: "0"; color: Theme.orange }
            Glyph { text: "󰂚"; color: Theme.orange }
        }
        Spectrum { anchors.verticalCenter: parent.verticalCenter }
        Row {
            spacing: 6
            anchors.verticalCenter: parent.verticalCenter
            Glyph { text: ""; color: Theme.cyan }
            //Label { text: "12:58"; color: Theme.cyan }
            Clock {anchors.verticalCenter: parent.verticalCenter}
        }
        Row {
            spacing: 6
            anchors.verticalCenter: parent.verticalCenter
            Glyph { text: ""; color: Theme.cyan }
            Label { text: "2026, 09 noviembre, lunes"; color: Theme.cyan }
        }
        Workspaces { anchors.verticalCenter: parent.verticalCenter }
        Row {
            spacing: 6
            anchors.verticalCenter: parent.verticalCenter
            Glyph { text: "󰌌"; color: Theme.orange }
            Label { text: "HINT!"; color: Theme.orange }
        }
    }
}
