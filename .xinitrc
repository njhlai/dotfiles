#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

usermodmap=$HOME/.Xmodmap
userprofile=$HOME/.xprofile
usersession=$HOME/.xsession
userresources=$HOME/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysxinitdir=/etc/X11/xinit/xinitrc.d

# Load user profile
[ -f $userprofile ] && . $userprofile

# Load resources
for resources in $sysresources $userresources; do
    [ -f $resources ] && xrdb -merge $resources
done
unset resources

# Load keymaps
for modmap in $sysmodmap $usermodmap; do
    [ -f $modmap ] && xmodmap $modmap
done
unset modmap

# Run all system xinitrc shell scripts
if [ -d "$sysxinitdir" ] ; then
    for f in "$sysxinitdir"/?*.sh ; do
        [ -x "$f" -a ! -d "$f" ] && . "$f"
    done
    unset f
fi

# Run user xsession shell script
[ -x "$usersession" -a ! -d "$usersession" ] && . "$usersession"

# set error file location
ERRFILE="${HOME}/.cache/X11/xsession-errors"

exec bspwm
