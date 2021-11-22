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
| Compositor | picom |
| Shell | bash |
| Terminal | Alacritty, xfce4-terminal |
| Font | Inconsolata |
| Mono Font | Fira Code |
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
* Currently (nvidia v495.44 onwards at least, probably earlier) there is a bug in the nvidia driver which causes the driver to spam dbus a stupid amount of time and subsequently freezes the system, detailed [here](https://forums.developer.nvidia.com/t/bug-nvidia-v495-29-05-driver-spamming-dbus-enabled-applications-with-invalid-messages/192892). Currently need the [nvidia-fake-powerd](https://aur.archlinux.org/packages/nvidia-fake-powerd/) from the AUR to resolve this temporarily.