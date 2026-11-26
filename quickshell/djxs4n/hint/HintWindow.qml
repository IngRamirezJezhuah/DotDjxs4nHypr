/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹
 *            DJXS4N QUICKSHELL
 *         VENTANA DE KEYBINDS (HINT)
 *  ~/.config/quickshell/djxs4n/HintWindow.qml
 ===========================================*/
import Quickshell
import Quickshell.Wayland
import QtQuick
import "../common"


 PanelWindow {
   id: root

   visible: HintState.open
   color: "transparent"

   anchors {
     top: true
     bottom: true
     left: true
     right: true
   }

   WlrLayershell.layer: WlrLayer.Overlay
   WlrLayershell.keyboardFocus: HintState.open ? WlrKeyboardFocus.Exclusive : WlrKeyboardFocus.None
   exclusionMode: ExclusionMode.Ignore

   Item {
     anchors.fill: parent
     focus: HintState.open
     Keys.onEscapePressed: HintState.open = false

     //fondo chulo de la keyhint
     Rectangle {
       anchors.fill: parent
       color: Qt.rgba(0.04, 0.03, 0.06, 0.45)

       MouseArea {
         anchors.fill: parent
         onClicked: HintState.open = false
       }
     }
   }

   // Trajetita centrada
   Rectangle {
     id: card
     anchors.centerIn: parent 
     width: Math.min(parent.width - 80, contentCol.implicitWidth +48 )
     height: Math.min(parent.heigth - 80, contentCol.implicitHeigth + 44 )
     radius: 16
     color: Theme.popup
     border.width: 1
     border.color: Theme.border
    // coso de los clics para no cerrarla por accidente
    MouseArea {
      anchors.fill: parent
    }
    Column {
      id: contentCol
      anchors.centerIn: parent
      spacing: 18

      //cabecera
      Item {
        width: sectionGrid.implicitWidth
        height: headerRow.implicitHeight

        Row {
          id: headerRow
          anchors.left: parent.left
          anchors.verticalCenter: parent.verticalCenter
          spacing: 8

          Glyph {
            text: "󰵙"
            color: Theme.orange
          }
          Label {
            anchors.top : parent.top
            text: "Atajos de Teclado"
            color: Theme.orange
          }
        }

        Row {
          anchors.right: parent.rigth
          anchors.verticalCenter: parent.verticalCenter
          spacing: 10
          
          Label {
            text: "ESC o click afuera para cerrar"
            color: Theme.muted
            font.pixelSize: 11
            font.bold: false
          }

          Glyph {
            text: "X"
            color: Theme.muted

            MouseArea {
              anchors.fill: parent
              cursorShape: Qt.PointingHandCursor
              onClicked: HintState.open = false
            }
          }
        }
      }
      // Seccion de 2x2
      Grid {
        id: sectionGrid
        columns: 2
        columnSpacing: 28
        rowSpacing: 20

        Repeater {
          model: KeybindsData.sections

          Column {
            required property var modelData
            width: 340
            spacing: 8

            Label {
              text: modelData.title
              color: Theme.cyan
            }
            Rectangle {
              width: parent.width
              height: 1
              color: Theme.border
            }

            Column {
              width: parent.width
              spacing: 6

              Repeater {
                model: modelData.items

                Item {
                  required property var modelData
                  width: parent.width
                  height: Math.max(keyBadge.implicitHeight, descText.implicitHeight)

                  Rectangle {
                    id: keyBadge
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    implicitWidth: keyLabel.implicitWidth + 12
                    implicitHeight: keyLabel.implicitHeight + 6
                    radius: 6
                    color: Theme.island
                    border.width: 1
                    border.color: Theme.border

                    Label {
                      id: keyLabel
                      anchors.centerIn: parent
                      text: modelData.k
                      color: Theme.accent
                      font.pixelSize: 11
                    }
                  }

                  Label {
                    id: descText
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    text: modelData.d
                    color: Theme.text
                    font.pixelSize: 11
                    font.bold: false
                  }
                }
              }
            }
          }
        }
      }
    }
  }
 }
