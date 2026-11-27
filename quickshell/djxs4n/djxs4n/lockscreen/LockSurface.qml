/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹
 *            DJXS4N QUICKSHELL
 *    SUPERFICIE DE LOCK (L3: Panel Central)
 *  ~/.config/quickshell/djxs4n/lockscreen/LockSurface.qml
 ===========================================*/
import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Pam
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import "../common"

WlSessionLockSurface {
  id: root
  color: "black"
  signal unlocked()

  readonly property string home: Quickshell.env("HOME")
  property bool failed: false
  property bool useCapture: false

  // ==============
  //   Animacion
  // ==============
  readonly property int iconSize: 120
  readonly property real panelW: Math.max(iconSize, Math.min(width - 80, 1080))
  readonly property real panelH: Math.min(iconSize, Math.min(height - 80, col.implicitHeight + 100))

  property real grow: 0 // esacala giro y blur 
  property real expand: 0 // expansion panel  

  SequentialAnimation {
    running: true

    // fase 1 candado chiquito y giro de 360 grados
    NumberAnimation {
      target: root
      property: "grow"
      from: 0 
      to: 1
      duration: 1000
      easing.type: Easing.OutCubic
    }

    //fase 2 salida de la card y panel de lockscreen
    NumberAnimation {
      target: root
      property: "expand"
      from: 0 
      to: 1
      duration: 650
      easing.type: Easing.OutQuint
    }
  }

  // ===============================================
  // Fondo wallpaper (respaldo) + captura, con blur
  // ===============================================
  Item {
    anchors.fill: parent
    layer.enabled: true
    layer.effect: MultiEffect {
      blurEnabled: true
      blurMax: 64
      blur: root.grow
      autoPaddingEnabled: false
    }

    // Respaldo: wallpaper actual de tu config de Hyprland
    Image {
      anchors.fill: parent
      source: "file://" + root.home + "/.config/hypr/wallpaper_effects/.wallpaper_current"
      fillMode: Image.PreserveAspectCrop
    }

    ScreencopyView {
      anchors.fill: parent
      visible: root.useCapture
      captureSource: root.screen
      live: false
    }
  }

  Rectangle { 
    anchors.fill: parent 
    color: LockTheme.overlay
    opacity: root.grow
  }

  // ============================
  //   Cuadro animado candado 
  // ============================
  Rectangle {
    id: morph
    anchors.centerIn: parent
    width: root.iconSize + (root.panelW - root.iconSize) * root.expand
    height: root.iconSize + (root.panelH - root.iconSize) * root.expand
    radius: 20
    color: LockTheme.panel
    scale: 0.2 + 0.8 * root.grow
    rotation: 360 * root.grow

    Image {
      id: lockIcon
      anchors.centerIn: parent
      width: 64
      height: 64
      source: Qt.resolvedUrl("./assets/lock.svg")
      sourceSize: Qt.size(256, 256)
      visible: false
    }

    // el svg negro lo pinto segun el tema
    MultiEffect {
      anchors.fill: lockIcon 
      source: lockIcon
      colorization: 1.0
      colorizationColor: LockTheme.accent 
      opacity: 1 - root.expand
    }
  }

  // ==========================
  //  CONTENIDO DEL LOCKSCREEN
  // ==========================
  
  ColumnLayout {
    id: col
    anchors.centerIn: parent
    spacing: 8
    opacity: Math.max(0, (root.expand - 0.5) / 0.5)

    Text {
      Layout.alignment: Qt.AlignHCenter
      text: Qt.formatDateTime(clk.date, "HH:mm")
      font.family: Theme.fontFamily
      font.pixelSize: 96
      font.bold: true
      color: LockTheme.clock
    }

    Text {
      Layout.alignment: Qt.AlignHCenter
      text: clk.date.toLocaleDateString(Qt.locale("es_MX"), "dddd, d 'de MMMM")
      font.family: Theme.fontFamily
      font.pixelSize: 24 
      font.bold: true
      color: LockTheme.accent2
    }

    Item { Layout.preferredHeight: 24 }

    // avatar circular
    Item {
      Layout.alignment: Qt.AlignHCenter
      Layout.preferredWidth: 170
      Layout.preferredHeight: 170

      /*Image {
        id: avatar
        anchors.fill: parent
        source: "file://" + root.home + "/.face"
        sourceSize: Qt.size(340)
        fillMode: Image.PreserveAspectCrop
        visible: false
        layer.enabled: true
      }

      MultiEffect {
        anchors.fill: parent
        source: avatar 
        maskEnabled: true
        maskSource: avatarMask
      }*/ 

      Image {
        id: avatar
        anchors.fill: parent
        source: "file://" + root.home + "/.face"
        sourceSize: Qt.size(340, 340)
        fillMode: Image.PreserveAspectCrop
        visible: false
        layer.enabled: true
      }
      Rectangle {
        id: avatarMask
        anchors.fill: parent
        radius: width / 2
        visible: false
        layer.enabled: true
      }
      MultiEffect {
        anchors.fill: parent
        source: avatar
        maskEnabled: true
        maskSource: avatarMask
      }

      Rectangle {
        anchors.fill: parent
        radius: width / 2 
        color: "transparent"
        border.width: 4 
        border.color: LockTheme.accent
      }
    }

    Item { Layout.preferredHeight: 16 }

    // Campo de la contra 
    Rectangle {
      Layout.alignment: Qt.AlignHCenter
      Layout.preferredWidth: 300
      Layout.preferredHeight: 48
      radius: 24
      color: LockTheme.card
      border.width: 2 
      border.color: root.failed ? LockTheme.danger : LockTheme.muted

      Glyph {
        id: lockGlyph
        anchors.left: parent.left
        anchors.leftMargin: 18
        anchors.verticalCenter: parent.verticalCenter
        text: "\uf023"
        color: LockTheme.text
      }

      TextInput {
        id: input
        anchors.left: lockGlyph.right
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.rightMargin: 18
        anchors.verticalCenter: parent.verticalCenter
        echoMode: TextInput.Password
        passwordCharacter: "\ueb6f"
        font.family: Theme.fontFamily
        font.pixelSize: 15
        color : LockTheme.text
        enabled: !pam.active
        focus: true
        onAccepted: { root.failed = false; pam.start() }

        Text {
          visible: input.text.length === 0
          text: root.failed ? "contraseña incorrecta" : "contraseña"
          color: root.failed ? LockTheme.danger : LockTheme.muted
          font.family: Theme.fontFamily
          font.pixelSize: 15
          font.italic: true
        }
      }
    }
  } 
  
  SystemClock { id: clk; precision: SystemClock.Minutes }

  Component.onCompleted: input.forceActiveFocus()

  // ---------- PAM ----------
  PamContext {
    id: pam
    config: "hyprlock"  
    onPamMessage: { if (responseRequired) respond(input.text) }
    onCompleted: result => {
      if (result === PamResult.Success) {
        root.unlocked()
      } else {
        input.text = ""
        root.failed = true
        input.forceActiveFocus()
      }
    }
  }
}
