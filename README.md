# Needed packages

* xmonad
* trayer
* dmenu
* xmobar

* oh-my-zsh.sh


# Setup dotfiles

* ln -s ~/dev/dotfiles/zsh/themes/robbyrussell-gruvbox.zsh-theme ~/.oh-my-zsh/themese/robbyrussell-gruvbox.zsh-theme
* ln -s ~/dev/dotfiles/zsh/.zshrc ~/.zshrc
* ln -s ~/dev/dotfiles/xmonad/.xmobarrc ~/.xmobarrc
* ln -s ~/dev/dotfiles/xmonad/xmonad.hs ~/.xmonad/xmonad.hs
* ln -s ~/dev/dotfiles/xmonad/.icons ~/.icons
* ln -s ~/dev/dotfiles/bin ~/.bin/
* cp ~/dev/dotfiles/xmonad/xmonad.desktop /usr/share/xsessions/xmonad.desktop

# Useful commnads

* xrandr --output HDMI-1 --auto --right-of {output} 
* xrandr -q #List of available outputs and modes
* feh --bg-fill /usr/share/background.. # Chagne background
* nmcli d wifi #List of available wifi
* eog {filename} #Open image

