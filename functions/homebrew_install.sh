function install_brew {
  if [ $# -eq 2 ]; then
    name=$1
    command=$2
  else
    name=$1
    command=$1
  fi

  if command -v $command > /dev/null  2>&1; then
    print_info "$name found..."
  else
    (print_warn "$name not found, installing via homebrew..." && brew install $name)
  fi
}

function brew_command {
  print_info "run brew $1 ..." && brew $1
}

formulae=(
  ansible
  chromedriver
  gawk
  gcc
  ghq
  go
  gpg-agent
  graphviz,neato
  heroku
  imagemagick@6
  libxml2,xmllint
  libxslt
  mecab
  mongodb,mongod
  mysql56
  nginx
  neovim,nvim
  nkf
  node
  openssl
  peco
  phantomjs
  pinentry-mac
  postgresql,psql
  pyenv
  r
  rbenv
  readline
  reattach-to-user-namespace
  redis,redis-server
  ruby-build
  sqlite,sqlite3
  tig
  tmux
  yarn
  zplug
  zsh
)

function install_with_homebrew {
  print_info "installing homebrew..."
  if command -v brew >/dev/null 2>&1; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew_command update
    brew_command doctor
    brew_command prune
    brew_command cleanup
  fi

  print_info "start brew install..."
  for formula in "${formulae[@]}"; do
    install_brew `echo $formula | sed 's/,/ /'`
  done

  brew cask install ngrok
}
