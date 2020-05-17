function link_config_files {
    print_info "-- link dotfiles"
    for file in $PWD/home/*
    do
        [[ "$file" =~ .+/\.git ]] && continue
        [[ "$file" =~ .+/\.DS_Store ]] && continue

        print_info "link $file to $HOME/$(basename $file)"
        ln -s $file $HOME/.$(basename $file)
    done

    print_info "-- link .config"

    # config dir
    mkdir ~/.config
    ln -s $PWD/home/config ~/.config

    # git config
    # chmod -x ~/.config/git/hooks/*

    # link gnupg config
    ln -s $PWD/home/gnupg ~/.gnupg

    print_info "-- link dotfiles"
}
