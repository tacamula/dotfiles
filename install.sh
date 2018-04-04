#!/bin/bash

# TODO: call homebrew_install

echo "set zsh as default shell"
chsh -s $(which zsh)

echo "-- install tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "-- link dotfiles"
for file in $PWD/home/*
do
    [[ "$file" =~ .+/\.git ]] && continue
    [[ "$file" =~ .+/\.DS_Store ]] && continue

    echo "link $file to $HOME/$(basename $file)"
    ln -s $file $HOME/.$(basename $file)
done

echo "-- link .config"

# karabiner element https://github.com/tekezo/Karabiner-Elements
rm -rf ~/.config/karabiner/assets
ln -s $PWD/home/config/karabiner/assets ~/.config/karabiner/assets

# TODO: link files under 'config'

echo "setup prezto"
zplug "sorin-ionescu/prezto"
ln -s /usr/local/opt/zplug/repos/sorin-ionescu/prezto $HOME/.zprezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
