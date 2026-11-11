/*=========================================
 *            ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *         DJXS4N QUICKSHELL
 *          RELOJ Y FECHAS
 *  ~/.config/quickshell/djxs4n/Clock.qml
 ===========================================*/
import Quickshell
import QtQuick

Item {
  id: root
  property bool showDate: false

  implicitWidth: row.implicitWidth
  implicitHeight: Theme. barHeight

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }

  Row {
    id: row
    anchors.verticalCenter: parent.verticalCenter
    spacing: 6

    Glyph {text: ""; color: Theme.cyan }
    Label {
      text: Qt.formatDateTime(clock.date, "HH:mm:ss")
      color: Theme.cyan
    }
    Label {
      visible: root.showDate
      text: Qt.formatDateTime(clock.date, "yyyy, dd MMMM, dddd")
      color: Theme.cyan
    }
  }

  MouseArea {
    id: area
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: root.showDate = !root.showDate
  }

  CalendarPopup {
    anchorItem: root
    open: area.containsMouse
  }
}
