#!/bin/bash

echo "link dotfiles"
for file in $HOME/dotfiles/.??*
do
    [[ "$file" =~ .+/\.git ]] && continue
    [[ "$file" =~ .+/\.DS_Store ]] && continue

    echo "link $file to $HOME/$(basename $file)"
    ln -s $file $HOME/$(basename $file)
done

# TODO: link files unser 'config'

echo "set zsh as default shell"
chsh -s $(which zsh)

echo "setup prezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
