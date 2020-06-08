-------------
-- IMPORTS --
-------------

-- Base
import System.Exit
import System.IO (hPutStrLn)
import System.Process (readCreateProcess, shell)

-- XMonad
import XMonad
import XMonad.Config.Desktop 
import qualified XMonad.StackSet as W

-- Utilities
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig (additionalKeysP)  
import XMonad.Util.Run (spawnPipe, runProcessWithInput)

-- Hooks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, defaultPP, wrap, pad, xmobarPP, xmobarColor, shorten, PP(..))

-- Actions
import XMonad.Actions.Promote
import XMonad.Actions.WithAll    (killAll)
import XMonad.Actions.CopyWindow (kill1)

-- Layouts
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders          (noBorders, smartBorders)
import XMonad.Layout.IndependentScreens (countScreens)

------------
-- CONFIG --
------------
myBarHeight = 40
myTerminal  = "alacritty"
myModMask   = mod4Mask
myEditor    = "nvim"
myBorder    = 5
myGap       = 5

myManageHook = composeAll 
    [ manageDocks -- this line is all you needed
    , manageHook desktopConfig
    ]

main = do
    xmproc <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc"
    xmonad $ ewmh desktopConfig
        { modMask            = myModMask
        , terminal           = myTerminal
        , manageHook         = myManageHook
        , layoutHook         = myLayout
        , workspaces         = myWorkspaces
        , startupHook        = myStartHook
        , borderWidth        = myBorder
        , normalBorderColor  = "#504945"
        , focusedBorderColor = "#83a598"
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = \x -> hPutStrLn xmproc x
            , ppCurrent = xmobarColor "#689b6a" "" . wrap "[" "]"
            , ppVisible = xmobarColor "#c689b6" ""
            , ppHidden = xmobarColor "#d79921" ""
            , ppHiddenNoWindows = xmobarColor "#ebdbb2" ""
            , ppTitle = xmobarColor "#d0d0d0" "" . shorten 80
            , ppSep =  "<fc=#9AEDFE> : </fc>"
            , ppUrgent = xmobarColor "#cc241d" "" . wrap "!" "!"
            , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
            }

        } `additionalKeysP` myKeys

---------------
-- AUTOSTART --
---------------
myStartHook = do
    spawn "compton -b --backend xrender &"
    spawn "setxkbmap -option caps:escape"
    spawn "feh --bg-scale ~/.config/wall.jpg"
    setWMName "LG3D"

handleMonitors = do
    s <- readCreateProcess (shell "xrandr | grep \" connected \" | wc -l ") ""
    let n = read s :: Integer
    if n > 1
        then 
            spawn "xrandr --output eDP-1 --off; xrandr --output DP-1 --auto"
        else
            spawn "xrandr --output DP-1 --off; xrandr --output eDP-1 --auto"
------------------
-- KEYSBINDINGS --
------------------
myKeys = 
    -- Spawn applications
    [ ("M-<Return>", spawn myTerminal)
    , ("M-<Space>", spawn "rofi -show run")
    , ("M-b", spawn "firefox")
    -- Kill windows
    , ("M-q", kill1)
    , ("M-S-q", killAll)
    -- Reset XMonad
    , ("M-r", spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi") -- %! Restart xmonad
    , ("M-S-r", io exitSuccess)
    -- Windows Navigation
    , ("M-m", windows W.focusMaster)  -- Move focus to the master window
    , ("M-j", windows W.focusDown)    -- Move focus to the next window
    , ("M-k", windows W.focusUp)      -- Move focus to the prev window
    , ("M-S-m", windows W.swapMaster) -- Swap the focused window and the master window
    , ("M-S-j", windows W.swapDown)   -- Swap the focused window with the next window
    , ("M-S-k", windows W.swapUp)     -- Swap the focused window with the prev window
    , ("M-C-m", promote)             -- Moves focused window to master`
    , ("M-0", windows $ W.greedyView "0")
    , ("M-S-0", windows $ W.shift "0")
    -- Monitor setup
    , ("M-S-d", spawn "bash ~/.config/scripts/monitors.sh --xmonad")
    -- Multimedia
    , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
    , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
    ]

-------------
-- LAYOUTS --
-------------
myLayout = avoidStruts $ gaps $ smartBorders $ layoutHook def
    where
        window = (Border myGap myGap myGap myGap)
        screen = (Border (myBarHeight + myGap) myGap myGap myGap)
        gaps = spacingRaw True screen False window True -- gaps (border / window spacing)

----------------
-- WORKSPACES --
----------------
myWorkspaces = map show $ [1 .. 9 :: Int] ++ [0]
