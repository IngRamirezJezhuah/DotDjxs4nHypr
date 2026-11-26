/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *      ESPACIOS DE TRABAJO EN JAPONES
 * ~/.config/quickshell/djxs4n/Workspaces.qml
 ===========================================*/
import QtQuick
import Quickshell.Hyprland
import "../common"

Row {
    spacing: 6
    readonly property var names: ["一", "二", "三", "四", "五"]
    readonly property int active: Hyprland.focusedWorkspace ? Hyprland.focusedWorkspace.id: 1

    Repeater {
        model: parent.names
        Rectangle {
          required property int index
          required property string modelData
          readonly property int wsId: index + 1
          readonly property bool on: wsId === parent.active
          width: on ? 38 : 24
          height: 20
          radius: 10
          color: on ? Theme.pill : Theme.pillOff

        Behavior on width { NumberAnimation { duration: 150 } }

        Text {
            anchors.centerIn: parent
            text: parent.modelData
            color: parent.on ? Theme.pillText : Theme.muted
            font.family: Theme.fontFamily
            font.pixelSize: 11
        }

        MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          onClicked: Hyprland.dispatch( "hl.dps.focus({ workspace = " + parent.wsId + " })" )
      }
    }
  }
}
