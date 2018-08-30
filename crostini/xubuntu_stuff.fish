#!/usr/bin/fish

set file_dir (pushd (dirname (status -f)); pwd; popd)
set repo_root (pushd "$file_dir/../"; pwd; popd)

echo "Working with a dotfile repo_root of: $repo_root"

source $repo_root/ubuntu/common_functions.fish

git clone --depth=1 git@github.com:ryanoasis/nerd-fonts.git "$HOME/.nerd_fonts"
pushd "$HOME/.nerd_fonts"
./install.sh "Blex"

popd
