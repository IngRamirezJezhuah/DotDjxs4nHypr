/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *          BASE REFERENCIA TEMA
 *    ~/.config/quickshell/djxs4n/theme.qml
 ===========================================*/

 import QtQuick
 import Quickshell

 ShellRoot {
   Variants {
     model: Quickshell.screens

     delegate: Component {
       Bar {
         required property var modelData
         screen: modelData
       }
     }
   }
 }
