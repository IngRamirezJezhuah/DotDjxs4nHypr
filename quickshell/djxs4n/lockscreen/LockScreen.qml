/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹
 *            DJXS4N QUICKSHELL
 *        SESION BLOQUEADA + IPC
 *  ~/.config/quickshell/djxs4n/lockscreen/LockScreen.qml
 ===========================================*/

 import Quickshell
 import Quickshell.Io
 import Quickshell.Wayland
 import QtQuick

 Scope {
   WlSessionLock {
     locked: LockState.locked

     LockSurface {
       onUnlocked: LockState.locked = false
     }
   }

   //qs ipc call
   IpcHandler {
     target: "lock"
     function lock(): void { LockState.locked = true }
   }
 }
