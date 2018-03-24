#!/usr/bin/env fish
set repo_root ''(pwd)'/'(dirname (status -f))''
echo "Working with a dotfile repo_root of: $repo_root"

function lf --description 'lf real_file link_name'
  rm $argv[2]
  ln -s $argv[1] $argv[2]
end

lf "$repo_root/vim"       "$HOME/.vim"
lf "$repo_root/vim/vimrc" "$HOME/.vimrc"
