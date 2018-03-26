#!/bin/sh
set -x
REPO_ROOT=$( cd "$(dirname $0)/.."; pwd)
. "$REPO_ROOT/macOS/common_functions.sh"

mkdir -p $HOME/bin
mkdir -p $HOME/.config
lf "$REPO_ROOT/fish" "$HOME/.config/fish"
lf "$REPO_ROOT/omf" "$HOME/.config/omf"

if grep '/usr/local/bin/fish' /etc/shells >/dev/null 2>&1; then
  echo "Shell is already allowed"
else
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
fi

chsh -s /usr/local/bin/fish

curl -L https://get.oh-my.fish > /tmp/install_omf.fish
fish /tmp/install_omf.fish --noninteractive
rm /tmp/install_omf.fish

echo "HEY! Restart your terminal to get a fish shell and continue."
