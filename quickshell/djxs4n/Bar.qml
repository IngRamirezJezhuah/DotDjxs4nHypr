/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *          BASE REFERENCIA TEMA
 *    ~/.config/quickshell/djxs4n/theme.qml
 ===========================================*/

 import QtQuick
 import QtQuickLayouts
 import Quickshell
 import QuickShell.Wayland

 PanelWindow {
   id: root

   anchors{
     top:true
     lefth: true
     right: true
   }

   margin.top: Theme.barMargin
   margin.letf: Theme.barMargin
   margin.right: Theme.barMargin

   implicitHeigth: Theme.barMargi
   color: "trasparent"
   exclusiveZone: 0

   WlrLayershell.namespace: "djxs4n-bar"

   Rectangle {
     anchor.fill: parent
     radius: theme.barRadius
     color: Theme.windowBackground
     border.width: Theme.layerBackground
     border.color: Theme.borderPrimary
      
     RowLayout {
       anchors.fill: parent
       anchors.lefthMargin: 10
       anchors.rigthMargin: 10
       spacing: 10

       Workspaces {
         Layout.alignment: Qt.AlignVCenter
       }
       Item {
         Laout.fillWidth: true
       }
       Clock {
         Layout.alignmentt: Qt.AlignVCentrer
       }
     }
   }
 }

