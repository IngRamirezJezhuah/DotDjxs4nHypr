/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *      ESPECTOGRAMA DE AUDIO CHULISIMO
 *  ~/.config/quickshell/djxs4n/Spectrum.qml
 ===========================================*/
import QtQuick

Row {
    id: root
    spacing: 3
    height: 18

    Repeater {
        model: 12
        Rectangle {
            required property int index
            width: 3
            radius: 1.5
            anchors.verticalCenter: parent.verticalCenter
            color: Theme.cyan
            height: 4 + (index * 7 % 12)
        }
    }
}
