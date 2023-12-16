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
| Terminal | Alacritty, Sakura |
| Font | IosevkaTerm |
| Notification | Dunst |
| Launcher | Rofi, dmenu |
| Wallpaper | feh |
| Lock Screen | i3lock-color |
| Text Editor | Sublime Text, nano |

## Usage
Requires [stow](https://www.gnu.org/software/stow/). Also, obtain the id of your current (i.e. default-release) Firefox profile from [about:profiles](about:profiles).

### Install
Once the base OS and all needed packages are installed, run:
```sh
FF=[FIREFOX PROFILE ID] make all
```

### Network Share Mounting
Network share is through sshfs.
1. Make sure to manually mount the sshfs as root at least once, using user ssh keys, to ensure host's public key is in root's known_hosts file.
2. Edit fstab [accordingly](https://wiki.archlinux.org/title/SSHFS#Secure_user_access).

### Uninstall
To uninstall configurations provided by this dotfile repo, run:
```sh
FF=[FIREFOX PROFILE ID] make clean
```

## Screenshots
![Clean](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/clean.png)
![Rofi](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/rofi.png)
![Power menu](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/powermenu.png)
![Terminals](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/term.png)
![Dev setup](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/dev.png)
![Web browser](https://raw.githubusercontent.com/njhlai/dotfiles/master/.github/web.png)

## Caveats
* The `texlive-fontsextra` is very, very bloated, with a lot of unnecessary fonts for me. Debloated `texlive-fontsextra` using this [guide](https://h3fang.github.io/post/2019/texlive-fontsextra/).
* If using the XDG base directory recommended directory for `GnuPG`, you'll need to update each associated user`systemd` sockets' `ListenStream` location. See [here](https://wiki.archlinux.org/title/GnuPG#gpg-agent).
* Currently, System76's power management for its laptops, `system76-power`, is not persistent, so every setting for power is reset on reboot. To prevent that, refer to this [guide](https://support.system76.com/articles/laptop-battery-thresholds/#at-boot).
