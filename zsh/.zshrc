# zshell specifics
fpath=("$ZDOTDIR/functions" $fpath)

path=(
  '/usr/local/sbin'
  '/usr/local/bin'
  $path
)

autoload $ZDOTDIR/functions/*

if [[ -f "${HOME}/.dotfiles/private/zsh/manheim_env "]]; then
  source "${HOME}/.dotfiles/private/zsh/manheim_env"
fi

source ~/.zinit/bin/zinit.zsh
# Oh My Zsh Prompt Setup
setopt promptsubst

PS1="READY >" #simple prompt until remaining prompt things load.

# Plugin options
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
export ZVM_CURSOR_STYLE_ENABLED=false

# Plugins for before the prompt is shown.
zinit depth"1" for jeffreytse/zsh-vi-mode

# Prompt plugin, turbo mode and redraws the prompt.
zinit wait'!' lucid nocd depth"1" \
  atload"[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh; _p9k_precmd" \
  for romkatv/powerlevel10k

# Normal plugins in turbo mode.
zinit wait lucid for \
  wfxr/forgit \
  OMZP::fzf \
  OMZP::sudo \
  OMZP::kubectl \
  OMZP::virtualenvwrapper \
  OMZP::terraform \
  chrissicool/zsh-256color


# These plugins should always be last since they do compinits and stuff.
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
  blockf zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
