#!/usr/local/bin/fish

set file_dir (pushd (dirname (status -f)); pwd; popd)
set repo_root (pushd "$file_dir/../"; pwd; popd)

echo "Working with a dotfile repo_root of: $repo_root"

source $repo_root/macOS/common_functions.fish

lf "$repo_root/git/gitconfig" "$HOME/.gitconfig"

git lfs install
git config --global commit.gpgsign true
git config --global user.signingkey 3BAC97A851B61A04  