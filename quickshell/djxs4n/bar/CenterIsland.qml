/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *             ISLA DEL CENTRO 
 *~/.config/quickshell/djxs4n/CenterIsland.qml
 ===========================================*/
import QtQuick
import "../common"
import "../hint"

IslandCenter {
  width: row.implicitWidth + 40

  Row {
    id:row
    anchors.centerIn: parent
    spacing: 14

    Spectrum { anchors.verticalCenter: parent.verticalCenter }

    Clock { anchors.verticalCenter: parent.verticalCenter }

    Workspaces { anchors.verticalCenter: parent.verticalCenter}

    Item {
      anchors.verticalCenter: parent.verticalCenter
      width: hintRow.implicitWidth
      height: hintRow.implicitHeight

      Row {
        id: hintRow
        spacing: 2
        Glyph { text: "󰵙"; color: Theme.orange }
        Label { text: "HINT!"; color: Theme.orange }
      }
      MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: HintState.toggle()
      }
    }

  }
}

