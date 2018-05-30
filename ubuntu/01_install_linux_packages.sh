#!/bin/bash
set -xeo pipefail

PLIST=""

ap() {
 PLIST="$PLIST $1"
}

ap fish
ap neovim
ap tmux
ap golang
ap curl

sudo apt-get -y install $PLIST

# Install rbenv the fun way!
rm -rf $HOME/.rbenv
git clone --depth=1 https://github.com/rbenv/rbenv.git $HOME/.rbenv
mkdir -p $HOME/.rbenv/plugins
git clone --depth=1 https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins


# Install nodenv
rm -rf $HOME/.nodenv
git clone --depth=1 https://github.com/nodenv/nodenv.git $HOME/.nodenv
mkdir -p $HOME/.nodenv/plugins
git clone https://github.com/nodenv/node-build.git $HOME/.nodenv/plugins/node-build


# Install tgenv
rm -rf $HOME/.tgenv
git clone --depth=1 https://github.com/cunymatthieu/tgenv.git $HOME/.tgenv

# Set Fish Shell
sudo chsh --shell /usr/bin/fish $USER

REPO_ROOT=$( cd "$(dirname $0)/.."; pwd)
. "$REPO_ROOT/ubuntu/common_functions.sh"

mkdir -p $HOME/bin
mkdir -p $HOME/.config

lf "$REPO_ROOT/fish" "$HOME/.config/fish"
lf "$REPO_ROOT/omf" "$HOME/.config/omf"

rm -rf $HOME/.local/share/omf
curl -L https://get.oh-my.fish > /tmp/install_omf.fish
/usr/bin/fish /tmp/install_omf.fish --noninteractive
rm /tmp/install_omf.fish

# Solarize the terminal
/usr/bin/fish xubuntu_stuff.fish

# Setup NeoVim
/usr/bin/fish nvim.fish

# Setup Tmux
/usr/bin/fish tmux.fish

# We really only use Xubuntu, still need to figure out how to detect this.
/usr/bin/fish xubuntu_stuff.fish

echo "HEY! Restart your terminal to get a fish shell and continue."
