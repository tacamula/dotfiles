#!/bin/bash

for file in $HOME/dotfiles/.??*
do
    [[ "$file" =~ .+/\.git ]] && continue
    [[ "$file" =~ .+/\.DS_Store ]] && continue

    echo "$file"
    ln -s $file $HOME/$(basename $file)
done

