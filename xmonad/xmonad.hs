import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.Place

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook 
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppCurrent = xmobarColor "#b57614" "" . wrap "[" "]"
                        , ppTitle = xmobarColor "#d65d0e" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , focusFollowsMouse = False
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command --lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; gnome-screenshot -a")
        , ((0, xK_Print), spawn "gnome-screenshot")
        , ((mod4Mask, xK_o), spawn "amixer set Master 2+")
        , ((mod4Mask, xK_i), spawn "amixer set Master 2-")
        , ((mod4Mask, xK_u), spawn "~/.bin/toggl-layout")
        ]
