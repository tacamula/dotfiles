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
  gauche,goch
  gawk
  gcc
  ghq
  go
  gpg-agent
  gradle
  graphviz,neato
  heroku
  imagemagick@6
  jenv
  libxml2,xmllint
  libxslt
  mecab
  mongodb,mongod
  mysql56
  neovim,nvim
  nginx
  nkf
  nodebrew
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
  watchman
  yarn
  zplug
  zsh
)

function install_with_homebrew {
  print_info "installing homebrew..."
  if command -v brew >/dev/null 2>&1; then
    brew_command update
    brew_command doctor
    brew_command prune
    brew_command cleanup
  else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  print_info "start brew install..."
  for formula in "${formulae[@]}"; do
    install_brew `echo $formula | sed 's/,/ /'`
  done

  brew tap caskroom/versions
  brew cask install ngrok
  brew cask install java8

  brew tap mscharley/homebrew
  brew install --HEAD alacritty
}
