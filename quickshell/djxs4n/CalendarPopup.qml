/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *          POPUP DEL CALENDARIO 
 *~/.config/quickshell/djxs4n/CalendarPopup.qml
 ===========================================*/
import Quickshell
import QtQuick
import QtQuick.Controls

PopupWindow {
  id: popup
  required property Item anchorItem
  property bool open: false

  anchor.item: anchorItem
  anchor.rect.x: (anchorItem.width - width ) / 2
  anchor.rect.y: anchorItem.height

  implicitWidth: 260
  implicitHeight: 250
  color: "transparent"
  visible: open || popupHover.hovered

  Rectangle {
    anchors.fill: parent
    anchors.topMargin: Theme.barMargin
    radius: 14
    color: Theme.island
    border.width: 1
    border.color: Theme.border

    HoverHandler { id: popupHover }

    Column {
      anchors.fill: parent
      anchors.margins: 12
      spacing: 6

      Label {
        anchors.horizontalCenter: parent.horizontalCenter
        color: Theme.cyan
        text: Qt.formatDate(new Date(grid.year, grid.mount, 1), "MMMM yyyy")
      }

      DayOfWeekRow {
        width: parent.width
        locale: grid.locale
        delegate: Text {
          required property var model
          text: model.shortName
          color: Theme.orange
          horizontalAlignment: Text.AligHCenter
          font.family: Theme.fontFamily
          font.pixelSize: 11
        }
      }

      MonthGrid {
        id: grid
        width: parent.width
        height: 170
        locale: Qt.locale("es_MX")

        delegate: Text {
          required property var model
          text: moedl.day
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          font.family: Theme.fontFamily
          font.pixelSize: 12
          font.bold: model.month === grid.motnh ? 1 : 0.3
          opacity: model.month === graid.montj ? 1 : 0.3
          color: model.today ? Theme.cyan : Theme.text
        }
      }
    }
  }
}
