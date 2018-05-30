#!/usr/bin/fish

set file_dir (pushd (dirname (status -f)); pwd; popd)
set repo_root (pushd "$file_dir/../"; pwd; popd)

echo "Working with a dotfile repo_root of: $repo_root"

source $repo_root/ubuntu/common_functions.fish

lf "$repo_root/xfce4-terminal/terminalrc" "$HOME/.config/xfce4/terminal/terminalrc"
