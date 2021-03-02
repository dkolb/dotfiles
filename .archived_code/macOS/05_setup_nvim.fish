#!/usr/bin/env fish

set file_dir (pushd (dirname (status -f)); pwd; popd)
set repo_root (pushd "$file_dir/../"; pwd; popd)

echo "Working with a dotfile repo_root of: $repo_root"

source $repo_root/macOS/common_functions.fish

lf "$repo_root/nvim" "$HOME/.config/nvim"

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +'PlugInstall --sync' +qa
