/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *          BARRITA DE QUICKSHELL
 * ~/.config/quickshell/djxs4n/Bar.qml
 ===========================================*/
import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
    id: bar
    anchors { top: true; left: true; right: true }
    margins { top: Theme.barMargin; left: Theme.barMargin; right: Theme.barMargin }
    implicitHeight: Theme.barHeight
    color: "transparent"

    LeftIsland { anchors.left: parent.left }
    CenterIsland { anchors.horizontalCenter: parent.horizontalCenter }
    RightIsland { anchors.right: parent.right }
}
