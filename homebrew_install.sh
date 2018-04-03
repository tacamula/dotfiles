NoColor='\033[0m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Red='\033[0;31m'


function info {
  echo "${Green}[I] $1${NoColor}"
}

function warn {
  echo "${Yellow}[W] $1${NoColor}"
}

function install_brew {
  if [ $# -eq 2 ]; then
    name=$1
    command=$2
  else
    name=$1
    command=$1
  fi

  if command -v $command > /dev/null  2>&1; then
    info "$name found..."
  else
    (warn "$name not found, installing via homebrew..." && brew install $name)
  fi
}

function brew_command {
  info "run brew $1 ..." && brew $1
}

info "installing homebrew..."
if command -v brew >/dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew_command update
  brew_command doctor
  brew_command prune
  brew_command cleanup
fi

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
  redis,redis-server
  ruby-build
  sqlite,sqlite3
  tig
  tmux
  yarn
  zplug
  zsh
)

info "start brew install..."
for formula in "${formulae[@]}"; do
  install_brew `echo $formula | sed 's/,/ /'`
done
