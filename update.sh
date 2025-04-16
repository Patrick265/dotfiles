#!/bin/bash

CONFIG_DIR=$HOME/.config

# i3wm
cp $CONFIG_DIR/i3/config i3/

# neovim
cp -r $CONFIG_DIR/nvim/* nvim/
