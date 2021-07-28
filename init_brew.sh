ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# add Repos
brew tap homebrew/binary

# install cask
brew install caskroom/cask/brew-cask

# install
brew install openssl
brew install readline
brew install wget
brew install zsh
brew install tmux
brew install colordiff
brew install tree
brew install git
brew install gibo
brew install git-now
brew install jq
brew install ack
brew install ag
brew install rbenv
brew install ruby-build
brew install rbenv-gem-rehash
brew install rbenv-gemset
brew install plenv
brew install perl-build
brew install pyenv
brew install pyenv-virtualenv
brew install volta
brew install emacs --with-cocoa
brew install go
brew install awscli
brew install peco
brew install ghq
brew install source-highlight

# install binary
brew install packer

# install GUI Applications
brew cask install dropbox
brew cask install java
brew cask install vagrant
brew cask install alfred
brew cask install vmware-fusion
brew cask install sublime-text
brew cask install bartender
brew cask install intellij-idea
brew cask install webstorm
brew cask install datagrip
brew cask install bettertouchtool
# brew cask install karabiner
brew cask install dash
brew cask install the-unarchiver
brew cask install atom
brew cask install visual-studio-code
brew cask install macid
brwe cask install sketch

# link /Applications
brew linkapps

# install QuickLook Plugins
brew cask install quicklook-json
brew cask install betterzipql
brew cask install qlimagesize
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install suspicious-package
