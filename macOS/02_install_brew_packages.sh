#!/bin/sh
PLIST=""

function ap {
 PLIST="$PLIST $1"
}

ap fish
ap git
ap git-lfs
ap neovim
ap tmux
ap rbenv
ap ruby-build
ap nodenv
ap golang
ap tfenv
ap intellij-idea-ce
ap visual-studio-code
ap homebrew/cask/docker
ap watchman
ap python3
ap gh
ap homebrew/cask/meld
ap homebrew/cask/keybase
ap jenv
ap gnupg2
ap pinentry-mac
ap homebrew/cask/session-manager-plugin
ap the_silver_searcher
 
brew install $PLIST
