## List of applications I use
* Awesome WM for my window manager
* Picom, specifically, the Jonaburg fork for compistor
* Rofi for my dmenu
* Kitty for my terminal
* Zsh for my shell
* Tmux for my multiplexer
* Neovim for my text editor
* Betterlockscreen for screen locking
* Jet brains mono for font

## Ctags
* kulkarniamit.github.io/whatwhyhow/howto/use-vim-ctags.html

## Cool rofi themes
* https://opensourcelibs.com/lib/rofi

## Installing better lock screen on Ubuntu
* Install i3lock-color through github install script

# Fedora installation

## Awesome copycats on fedora
* sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3
* sudo dnf config-manager --add-repo https://rpm.librewolf.net
* xbacklight xsel slock mpc mpd scrot unclutter dmenu librewolf

## Installing jonaburg on fedora
* dnf install libXext-devel libevdevel-devel libev-devel xcb-util-renderutil-devel xcb-util-image-devel uthash-devel libconfig-devel 

## Tmux plugin installation
* `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
* `prefix - I`

## DPI monitor settings
* On certain monitors, the AwesomeWM bars may appear too big or too small. This is because the DPI setting is messed up.
* To fix it: 
  * Calculate the DPI 
  * Add it to `~/.Xresources` with a line like `Xft.dpi: 144`
  * Source this file with `xrdb -merge ~/.Xresources`
* I found [this](https://winaero.com/find-change-screen-dpi-linux/) really useful.

## Rust packages
* `cargo install --locked zellij`
* `cargo install --locked exa`
* `cargo install --locked zoxide`
