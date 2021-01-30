#!/bin/bash
set -xeo pipefail

PLIST=""

ap() {
 PLIST="$PLIST $1"
}

ap aspell
ap ca-certificates
ap cmake
ap curl
ap file
ap fish
ap ghostscript
ap git
ap jq
ap man-db
ap neovim
ap pass
ap python3
ap python3-pip
ap silversearcher-ag
ap texstudio
ap tmux
ap wget
ap zip
ap zlib1g-dev


sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install $PLIST

# Install rbenv the fun way!
rm -rf "$HOME/.rbenv"
git clone --depth=1 'https://github.com/rbenv/rbenv.git' "$HOME/.rbenv"
mkdir -p "$HOME/.rbenv/plugins"
git clone --depth=1 'https://github.com/rbenv/ruby-build.git' "$HOME/.rbenv/plugins/ruby-build"


# Install nodenv
rm -rf "$HOME/.nodenv"
git clone --depth=1 'https://github.com/nodenv/nodenv.git' "$HOME/.nodenv"
mkdir -p "$HOME/.nodenv/plugins"
git clone 'https://github.com/nodenv/node-build.git' "$HOME/.nodenv/plugins/node-build"


# Install tgenv
rm -rf "$HOME/.tgenv"
git clone --depth=1 'https://github.com/cunymatthieu/tgenv.git' "$HOME/.tgenv"

# Install tfenv
rm -rf "$HOME/.tfenv"
git clone --depth=1 'https://github.com/kamatama41/tfenv.git' "$HOME/.tfenv"

# Set Fish Shell
sudo chsh --shell /usr/bin/fish "$USER"

REPO_ROOT=$( cd "$(dirname $0)/.."; pwd)
. "$REPO_ROOT/crostini/common_functions.sh"

mkdir -p "$HOME/bin"
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.jenv/bin"
mkdir -p "$HOME/go/packages/bin"
mkdir -p "$HOME/.local/bin"

lf "$REPO_ROOT/fish" "$HOME/.config/fish"
lf "$REPO_ROOT/omf" "$HOME/.config/omf"

rm -rf "$HOME/.local/share/omf"
curl -L 'https://get.oh-my.fish' > /tmp/install_omf.fish
/usr/bin/fish /tmp/install_omf.fish --noninteractive
rm /tmp/install_omf.fish

# Setup NeoVim
/usr/bin/fish nvim.fish

# Setup Tmux
/usr/bin/fish tmux.fish

# Installate and setup keybase
/usr/bin/fish keybase.fish

pip3 install neovim-remote

pip3 install awscli

echo "HEY! Restart your terminal to get a fish shell and continue."

