# zshell specifics
fpath=("$ZDOTDIR/functions" $fpath)

path=(
  '/usr/local/sbin'
  '/usr/local/bin'
  $path
)

autoload $ZDOTDIR/functions/*

source "${HOME}/.dotfiles/private/zsh/env"

source ~/.zinit/bin/zinit.zsh
# Oh My Zsh Prompt Setup
setopt promptsubst

PS1="READY >" #simple prompt until remaining prompt things load.

# Plugin options
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Vi Mode
#export ZVM_CURSOR_STYLE_ENABLED=false
#zinit depth"1" for jeffreytse/zsh-vi-mode

# VIM Mode
export MODE_CURSOR_VIINS="bar"
zinit for softmoth/zsh-vim-mode


# Prompt plugin, turbo mode and redraws the prompt.
zinit wait'!' lucid nocd depth"1" \
  atload"[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh; _p9k_precmd" \
  for romkatv/powerlevel10k

# Normal plugins in turbo mode.
zinit wait lucid for \
  OMZP::fzf \
  OMZP::kubectl \
  OMZP::sudo \
  OMZP::rbenv \
  OMZP::terraform \
  OMZP::virtualenvwrapper \
  chrissicool/zsh-256color \
  mattberther/zsh-nodenv \
  Meroje/zsh-rbenv \
  wfxr/forgit



# These plugins should always be last since they do compinits and stuff.
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
  blockf zsh-users/zsh-completions \
  blockf "https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker" \
  blockf "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/docker-compose/_docker-compose" \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
