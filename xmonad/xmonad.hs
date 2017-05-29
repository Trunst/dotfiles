import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.Place
import XMonad.Layout.IndependentScreens
import XMonad.Actions.UpdatePointer
import qualified XMonad.StackSet as W

conf = defaultConfig
        { manageHook = manageDocks <+> myManageHook 
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , focusFollowsMouse = False
        , workspaces = myWorkspaces
        } `additionalKeys` myKeys

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]
-- myWorkspaces = withScreens 2 ["1","2","3","4","5","6","7","8","9"]

myKeys = [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command --lock")
    , ((controlMask, xK_Print), spawn "sleep 0.2; gnome-screenshot -a")
    , ((0, xK_Print), spawn "gnome-screenshot")
    , ((mod4Mask, xK_o), spawn "amixer set Master 2+")
    , ((mod4Mask, xK_i), spawn "amixer set Master 2-")
    , ((mod4Mask, xK_u), spawn "~/.bin/toggl-layout")
    , ((mod4Mask, xK_a), spawn "~/.bin/toggl-touchpad")
    ]
    ++
    [((m .|. mod4Mask, k), windows $ f i) -- Replace 'mod1Mask' with your mod key of choice.
         | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
         , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


--    [
     -- workspaces are distinct by screen
--      ((m .|. mod4Mask, k), windows $ onCurrentScreen f i)
--           | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9]
--           , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
--    ]
--    ++
--    [
--         -- swap screen order
--      ((m .|. mod4Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
--           | (key, sc) <- zip [xK_w, xK_e, xK_r] [1,0,2]
--           , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ conf
        { logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppCurrent = xmobarColor "#b57614" "" . wrap "[" "]"
                        , ppTitle = xmobarColor "#d65d0e" "" . shorten 50
                        }
        }

