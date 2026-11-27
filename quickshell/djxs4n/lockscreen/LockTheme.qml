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

  readonly property color overlay: withAlpha(base, 0.45)
  readonly property color panel:   withAlpha(base, 0.88)
  readonly property color card:    withAlpha(Palette.color0, 0.92)

  readonly property color text:    Palette.foreground
  readonly property color muted:   Palette.color8
  readonly property color accent:  Palette.color7
  readonly property color accent2: Palette.color12
  readonly property color clock:   Palette.color13
  readonly property color danger:  Palette.color9

  // Debug temporal: quítalo cuando funcione
  Component.onCompleted: {
    console.log("LockTheme:", base, accent, clock, text)
  }
}
