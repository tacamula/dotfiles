echo "installing homebrew..."
command -v brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
command -v brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
command -v brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade

formulae=(
  ansible
  chromedriver
  gawk
  gcc
  ghq
  go
  gpg-agent
  graphviz
  heroku
  libxml2
  libxslt
  mecab
  mongodb
  mysql56
  nginx
  neovim
  nkf
  node
  openssl
  peco
  phantomjs
  pinentry-mac
  phstgresql
  pyenv
  r
  rbenv
  readline
  redis
  ruby-build
  sqlite
  tig
  tmux
  yarn
  zplug
  zsh
  zsh-completions
)

echo "start brew install..."
for formula in "${formulae[@]}"; do
    brew install $formula || brew upgrade $formula
done

