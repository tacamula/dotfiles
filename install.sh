#!/bin/bash

for file in $HOME/dotfiles/.??*
do
    [[ "$file" =~ .+/\.git ]] && continue
    [[ "$file" =~ .+/\.DS_Store ]] && continue

    echo "link $file to $HOME/$(basename $file)"
    ln -s $file $HOME/$(basename $file)
done

