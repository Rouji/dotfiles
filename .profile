umask 077

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export LANG=ja_JP.utf8
export MAKEFLAGS="j`nproc`"
export DXVK_HUD=fps
export MOSH_PREDICTION_DISPLAY="experimental"

