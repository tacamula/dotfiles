function install_homebrew_and_libraries {
  print_info "installing homebrew..."
  if command -v brew >/dev/null 2>&1; then
    brew_command update
    brew_command doctor
    brew_command prune
    brew_command cleanup
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  print_info "start brew install..."
  brew bundle

  # sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
}
