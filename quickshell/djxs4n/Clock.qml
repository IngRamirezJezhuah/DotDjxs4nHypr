/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *          BASE REFERENCIA TEMA
 *    ~/.config/quickshell/djxs4n/theme.qml
 ===========================================*/

import QtQuick
import Quickshell

Row {
    id: root

    spacing: 8

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Text {
        text: Qt.formatDateTime(clock.date, "ddd d MMM").toUpperCase()
        color: Theme.secondaryText
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        text: Qt.formatDateTime(clock.date, "HH:mm")
        color: Theme.primaryText
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        font.bold: true
        verticalAlignment: Text.AlignVCenter
    }
}

