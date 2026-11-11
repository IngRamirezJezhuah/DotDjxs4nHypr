/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *        ISLA DERECHA DE LA BARRA
 *~/.config/quickshell/djxs4n/RightIsland.qml
 ===========================================*/
 
 import QtQuick

Island {
    width: row.implicitWidth + 28

    Row {
        id: row
        anchors.centerIn: parent
        spacing: Theme.spacing

        Glyph { text: "󰖩" }
        Glyph { text: ""; color: Theme.cyan }
        Label { text: "84.0B/s" }
        Glyph { text: ""; color: Theme.cyan }
        Label { text: "25.5kB/s" }
        Sep {}
        Glyph { text: "󰅟" }
        Glyph { text: "󰂯" }
        Glyph { text: "" }
        Glyph { text: "󰕾" }
        Glyph { text: "󰖔"; color: Theme.orange }
        Label { text: "25%" }
        Sep {}
        Glyph { text: "⏻"; color: Theme.accent }
    }
}
