ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# add Repos
brew tap homebrew/binary
brew tap phinze/homebrew-cask
brew tap peco/peco

# install cask
brew install brew-cask

# install
brew install openssl
brew install readline
brew install wget
brew install zsh
brew install tmuz
brew install lv
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
brew install python-build
brew install pyenv-virtualenv
brew install nodebrew
brew install emacs --cocoa
# brew install nginx
# brew install redis
brew install go
brew install awscli
brew install peco

# install binary
brew install packer

# install GUI Applications
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install google-japanese-ime
brew cask install firefox
brew cask install dropbox
brew cask install java
brew cask install vagrant
brew cask install alfred
brew cask install vmware-fusion
brew cask install sublime-text
brew cask install bartender
brew cask install intellij-idea
brew cask install webstorm
brew cask install bettertouchtool
brew cask install evernote
brew cask install handbrake
brew cask install iterm2
brew cask install totalterminal
# brew cask install dash
brew cask install the-unarchiver
brew cask install sourcetree
# brew cask install yorufukurou
brew cask install atom
brew cask install adobe-reader
brew cask install flash


# install QuickLook Plugins
brew cask install quicklook-json
brew cask install betterzipql
brew cask install qlimagesize
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install suspicious-package

# Alfred link to app
brew cask link alfred link
