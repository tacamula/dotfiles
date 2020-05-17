#!/bin/sh

CONFIG_DIR="${HOME}/dotfiles/configs/vscode"
VSCODE_CONFIG_DIR="${HOME}/Library/Application Support/Code/User"

# link config file
rm "${VSCODE_CONFIG_DIR}/settings.json"
rm "${VSCODE_CONFIG_DIR}/keybindings.json"
ln -s "$CONFIG_DIR/settings.json" "${VSCODE_CONFIG_DIR}"
ln -s "$CONFIG_DIR/keybindings.json" "${VSCODE_CONFIG_DIR}"

# install extention
cat "$CONFIG_DIR/extensions" | xargs -I % code --install-extension %
