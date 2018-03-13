fish_vi_key_bindings

# Set up paths
set -g extra_paths "$HOME/bin" "$HOME/.rbenv/bin"
set -g extra_paths $extra_paths "$HOME/.tgenv/bin" "$HOME/.tfenv/bin"
set -gx fish_user_paths $extra_paths

# Set up rbenv
status --is-interactive; and source (rbenv init -|psub)

alias gplr='git pull origin --rebase'
