fish_vi_key_bindings

# Set up paths
set -g extra_paths "$HOME/bin" 
set -g extra_paths $extra_paths "$HOME/.tgenv/bin" 

if test -d /usr/local/texlive/2018/bin/x86_64-linux
  set -g extra_paths $extra_paths "/usr/local/texlive/2018/bin/x86_64-linux"
end

if test (uname) = 'Darwin'
  set -g extra_paths $extra_paths "/usr/local/opt/gettext/bin"
  set -g extra_paths $extra_paths "/usr/local/opt/go/libexec/bin"
  set -g extra_paths $extra_paths "/usr/local/sbin"
  set -g extra_paths $extra_paths "$HOME/bin/gam"
else
  set -g extra_paths $extra_paths "$HOME/.nodenv/bin"
  set -g extra_paths $extra_paths "$HOME/.rbenv/bin"
  set -g extra_paths $extra_paths "$HOME/.tfenv/bin"
  set -g extra_paths $extra_paths "$HOME/.jenv/bin"
  set -g extra_paths $extra_paths "$HOME/go/packages/bin"
  set -g extra_paths $extra_paths "$HOME/.local/bin"
end


set -gx fish_user_paths $extra_paths

# Set up rbenv
status --is-interactive; and source (command rbenv init -|psub)

# Set up nodenv
status --is-interactive; and source (command nodenv init -|psub)

# Quick Aliases
alias gplr='git pull origin --rebase'
alias dos2unix_r='find . -type f -exec grep -Iq . {} \; -print0 | xargs -0 dos2unix'
alias kc='kubectl'

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

