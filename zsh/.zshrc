# zshell specifics
fpath=("$ZDOTDIR/functions" $fpath)
path=('/usr/local/bin' $path)

autoload $ZDOTDIR/functions/*

source "${HOME}/.dotfiles/private/manheim_env"

# zgen setup
export ZGEN_RESET_ON_CHANGE=(${HOME}/.config/zsh/.zshrc)
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  #plugins
  # zgen oh-my-zsh plugins/git
  # zgen oh-my-zsh plugins/sudo
  # zgen oh-my-zsh plugins/command-not-found
  # zgen load zsh-users/zsh-syntax-highlighting
  # zgen load zsh-users/zsh-completions
  # zgen load zsh-users/zsh-autosuggestions
  # zgen load zsh-users/zsh-history-substring-search
  # zgen load unixorn/tumult.plugin.zsh
  # zgen load chrissicool/zsh-256color

  #theme
  zgen oh-my-zsh themes/arrow

  zgen save
fi