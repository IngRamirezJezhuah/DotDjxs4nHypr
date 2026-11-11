/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *      ESPACIOS DE TRABAJO EN JAPONES
 * ~/.config/quickshell/djxs4n/Workspaces.qml
 ===========================================*/
import QtQuick

Row {
    spacing: 6
    readonly property var names: ["一", "二", "三", "四", "五"]
    readonly property int active: 0

    Repeater {
        model: parent.names
        Rectangle {
            required property int index
            required property string modelData
            readonly property bool on: index === parent.active
            width: on ? 38 : 24
            height: 20
            radius: 10
            color: on ? Theme.pill : Theme.pillOff

            Text {
                anchors.centerIn: parent
                text: parent.modelData
                color: parent.on ? Theme.pillText : Theme.muted
                font.family: Theme.fontFamily
                font.pixelSize: 11
            }
        }
    }
}
