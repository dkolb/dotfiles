#!/bin/bash
set -xeo pipefail

PLIST=""

ap() {
 PLIST="$PLIST $1"
}

ap ca-certificates
ap cmake
ap curl
ap fish
ap git
ap git-lfs
ap golang
ap groff
ap jq
ap libmysqlclient-dev
ap libreadline-dev
ap libsqlite3-dev
ap libssl-dev
ap libxml2-dev
ap libxslt1-dev
ap libyaml-dev
ap neovim
ap openconnect
ap openjdk-11-jdk-headless
ap openjdk-8-jdk-headless
ap pass
ap pkg-config
ap python3-pip
ap python3.9
ap silversearcher-ag
ap zip
ap zlib1g-dev


sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install $PLIST

# Grab common functions, set up paths, get fish set up.
REPO_ROOT=$( cd "$(dirname $0)/.."; pwd)
. "$REPO_ROOT/ubuntu/common_functions.sh"

mkdir -p "$HOME/bin"
mkdir -p "$HOME/.config"
mkdir -p "$HOME/go/packages"

lf "$REPO_ROOT/fish" "$HOME/.config/fish"
lf "$REPO_ROOT/omf" "$HOME/.config/omf"

rm -rf "$HOME/.local/share/omf"
curl -L 'https://get.oh-my.fish' > /tmp/install_omf.fish
/usr/bin/fish /tmp/install_omf.fish --noninteractive
rm /tmp/install_omf.fish

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

# Install tgenv
rm -rf "$HOME/.tfenv"
git clone --depth=1 'https://github.com/kamatama41/tfenv.git' "$HOME/.tfenv"

# Install jenv
rm -rf $HOME/.jenv
git clone --depth=1 'https://github.com/gcuisinier/jenv.git' "$HOME/.jenv"
cp "$HOME/.jenv/fish/jenv.fish" "$HOME/.config/fish/functions/jenv.fish"
PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
jenv add /usr/lib/jvm/java-1.8.0-openjdk-amd64
jenv add /usr/lib/jvm/java-11-openjdk-amd64
jenv global 11

# Make a quick go path.
mkdir -p "$HOME/go/bin"

# Set Fish Shell
sudo chsh --shell /usr/bin/fish "$USER"

# Setup NeoVim
/usr/bin/fish nvim.fish

# Installate and setup keybase
/usr/bin/fish keybase.fish

# Setup git.
/usr/bin/fish git.fish

pip3 install neovim-remote virtualfish
vf install

echo "HEY! Restart your terminal to get a fish shell and continue."
