/*=======================================================
 *                     ᯓᡣ𐭩Djxs4n.ᐟ⊹
 *                  DJXS4N QUICKSHELL
 *            ROLES DE COLOR DEL LOCKSCREEN
 *  ~/.config/quickshell/djxs4n/lockscreen/LockTheme.qml
 ========================================================*/

 pragma Singleton
 import Quickshell
 import QtQuick
 import "../common"

Singleton {
  function withAlpha(col, alpha) {
    if (!col) return Qt.rgba(0.10, 0.07, 0.14, alpha)
    return Qt.rgba(col.r, col.g, col.b, alpha)
  }

  readonly property color base: Palette.background

  readonly property color overlay: withAlpha(base, 0.55)
  readonly property color panel:   withAlpha(Palette.color7, 0.96)
  readonly property color card:    withAlpha(Palette.color6, 0.80)

  readonly property color text:    Palette.background
  readonly property color muted:   Palette.color0
  readonly property color accent:  Palette.color5
  readonly property color accent2: Palette.color12
  readonly property color clock:   Palette.color11
  readonly property color danger:  Palette.color9

}
