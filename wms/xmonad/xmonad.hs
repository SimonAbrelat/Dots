-- minimal Ubuntu config file: ~/.xmonad/xmonad.hs
import XMonad
 
main = xmonad def
  { modMask     = mod4Mask -- set 'Mod' to windows key
  , terminal    = "alacritty" -- for Mod + Shift + Enter
  }
