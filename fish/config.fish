fish_vi_key_bindings

# Set up paths
set -g extra_paths "$HOME/bin" "$HOME/.rbenv/bin"
set -g extra_paths $extra_paths "$HOME/.tgenv/bin" "$HOME/.tfenv/bin"

if test (uname) = 'Darwin'
  set -g extra_paths $extra_paths "/usr/local/opt/go/libexec/bin"
else
  set -g extra_paths $extra_paths "$HOME/.nodenv/bin"
  set -g extra_paths $extra_paths $HOME/go/bin
end

set -gx fish_user_paths $extra_paths

# Set up rbenv
status --is-interactive; and source (rbenv init -|psub)

# Set up nodenv
status --is-interactive; and source (nodenv init -|psub)

alias gplr='git pull origin --rebase'
