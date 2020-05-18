defaults write com.apple.finder AppleShowAllFiles YES

# key repeats
## Mac
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
## VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
