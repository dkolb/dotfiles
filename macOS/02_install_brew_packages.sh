#!/bin/sh
PLIST=""

function ap {
 PLIST="$PLIST $1"
}

ap fish
ap git
ap neovim
ap tmux
ap rbenv
ap ruby-build
ap nodenv
ap golang
ap tfenv
ap caskroom/cask/slack
 
brew install $PLIST
