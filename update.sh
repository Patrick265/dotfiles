#!/bin/bash

CONFIG_DIR=$HOME/.config
# i3wm
cp $CONFIG_DIR/i3/config i3/
cp $CONFIG_DIR/i3status-rust/config.toml i3status-rust/
# neovim
cp -r $CONFIG_DIR/nvim/* nvim/

# alacritty
cp -r $CONFIG_DIR/alacritty/* alacritty/
# zsh
cp $CONFIG_DIR/zsh/.zshrc ohmyzsh/

# rofi/dunst
cp -r $CONFIG_DIR/rofi/*     rofi/
cp $CONFIG_DIR/dunst/dunstrc dunst/
