#!/bin/bash

CONFIG_DIR=$HOME/.config
# i3wm
cp $CONFIG_DIR/i3/config i3/

# neovim
cp -r $CONFIG_DIR/nvim/* nvim/

# zsh
cp $HOME/.zshrc ohmyzsh/ 

# rofi/dunst
cp $CONFIG_DIR/rofi/config rofi/
cp $CONFIG_DIR/dunst/dunstrc dunst/
