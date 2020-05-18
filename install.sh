#!/bin/bash

# load functions
source ./functions/colored_print

# homebrew install
source ./functions/homebrew_install.sh
install_homebrew_and_libraries

print_info "set zsh as default shell"
chsh -s $(which zsh)

print_info "-- install tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# link config files
source ./functions/link_config_files.sh
link_config_files

print_info "-- load zshrc"
source ~/.zshrc

# mysql config
#   assume install mysql5.6.39 via homebrew
rm -rf /usr/local/Cellar/mysql@5.6/5.6.39/my.cnf
ln -s $PWD/etc/mysql56/my.cnf /usr/local/Cellar/mysql@5.6/5.6.39/

# prezto
print_info "setup prezto"
zplug "sorin-ionescu/prezto"
ln -s /usr/local/opt/zplug/repos/sorin-ionescu/prezto $HOME/.zprezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

