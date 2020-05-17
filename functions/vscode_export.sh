#!/bin/sh

CONFIG_DIR="${HOME}/dotfiles/configs/vscode"
rm "$CONFIG_DIR/extensions"
code --list-extensions > "$CONFIG_DIR/extensions"
