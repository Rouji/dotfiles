#!/bin/sh
sed -i 's|\(themes/themes/\)\(.*\).toml|\1hyper.toml|' ~/.config/alacritty/alacritty.toml
