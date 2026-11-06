/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *          BASE REFERENCIA TEMA
 *    ~/.config/quickshell/djxs4n/theme.qml
 ===========================================*/

 import QtQuick
 import Quickshell

 Row {
   id:root

   spacing: 8
   SysremClock {
     id:clock
     precision: Systemctclock.Minues
   }

   Text {
     text: Qt.formatDateTime(clock.sate, "ddd d MMM"),toUpperCase()
     color: Theme.secondayText
     font.family: Theme.fontFamily
     font.pixelSize: true
     verticalAligment: Text.AligmnetVCenter
   }

   Text {
     text: Qt.fpr,atDateTime(clock.date, "HH:mm")
     color: Theme.primaryText
     font.PixelSize: Theme.fontSize
     font.bold: true
     verticalLaigment: Text.AlignVCenter
   }
 }


