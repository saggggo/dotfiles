import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/ryota/.xmobarrc"
  xmonad $ defaultConfig 
       { manageHook = manageDocks <+> manageHook defaultConfig
       , layoutHook = avoidStruts  $  layoutHook defaultConfig
       , startupHook = myStartupHook
       , logHook = dynamicLogWithPP xmobarPP
                       { ppOutput = hPutStrLn xmproc
                       , ppTitle = xmobarColor "green" "" . shorten 50
                       }
       , modMask = mod4Mask     -- Rebind Mod to the Windows key
       }

myStartupHook = do
  spawn "dex -ae xmonad"
  spawn "trayer --SetDockType true --expand true --edge top --align right --width 15 --height 18 --transparent true --alpha 255" 
