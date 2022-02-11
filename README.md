# dotfiles

![Messy](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/messy.png)

## About
Personal dotfiles, almost all of which was assimilated and modified from all over the place.

| Item | Value |
| :--- | :---- |
| OS | Manjaro |
| WM | Bspwm |
| DM | LightDM |
| Bar | Lemonbar |
| Compositor | picom \[ibhagwan\] |
| Shell | bash |
| Terminal | Alacritty, Sakura |
| Font | Inconsolata |
| Mono Font | Iosevka |
| Notification | Dunst |
| Launcher | Rofi, dmenu |
| Wallpaper | feh |
| Lock Screen | i3lock-color |
| Text Editor | Sublime Text, nano |

## Installation
Will write an install script at some point...

### Network Share Mounting
Network share is through sshfs.
1. Make sure to manually mount the sshfs as root at least once, using user ssh keys, to ensure host's public key is in root's known_hosts file.
2. Edit fstab [accordingly](https://wiki.archlinux.org/title/SSHFS#Secure_user_access).

## Screenshots
![Clean](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/clean.png)
![Rofi](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/rofi.png)
![Power menu](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/powermenu.png)
![Terminals](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/term.png)
![Dev setup](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/dev.png)
![Web browser](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/web.png)

## Caveats
* The `texlive-fontsextra` is very, very bloated, with a lot of unnecessary fonts for me. Debloated `texlive-fontsextra` using this [guide](https://h3fang.github.io/post/2019/texlive-fontsextra/).