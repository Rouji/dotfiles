umask 077

if [ -d "$HOME/.local/share/flatpak/exports/bin" ] ; then
    PATH="$HOME/.local/share/flatpak/exports/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export LANG=ja_JP.utf8
export MAKEFLAGS="j`nproc`"
export DXVK_HUD=fps
export MOSH_PREDICTION_DISPLAY="experimental"
export SSH_ASKPASS="$HOME/bin/ssh-askpass"
