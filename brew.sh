#!/usr/bin/env bash

# Install command-line tools using Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/php56 --with-gmp

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

#Install Liron packages
brew install curl
brew install go
brew install jq
brew install python
brew install python3
brew install diff-so-fancy
brew install michaeldfallen/formula/git-radar

# Remove outdated versions from the cellar.
brew cleanup

# Get cask
brew tap caskroom/cask
brew tap homebrew/cask-versions

# Install casks
brew cask install google-chrome
brew cask install docker
brew cask install iterm2
brew cask install vlc
brew cask install spectacle
brew cask install teamviewer
brew cask install whatsapp
brew cask install the-unarchiver
brew cask install android-file-transfer
brew cask install keepingyouawake
brew cask install slack
brew cask install beardedspice
brew cask install spotify
brew cask install transmission
brew cask install mathtype
brew cask install usb-overdrive
brew cask install visual-studio-code
brew cask install postman
brew cask install mplayer-osx-extended
brew cask install authy
brew cask install zeplin
brew cask install google-cloud-sdk
brew cask install hammerspoon
brew cask install postico
brew cask install robo-3t

# Cask Cleanup
brew cleanup