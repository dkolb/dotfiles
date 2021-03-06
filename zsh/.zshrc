# zshell specifics
fpath=("$ZDOTDIR/functions" $fpath)

path=(
  '/usr/local/sbin'
  '/usr/local/bin'
  $path
)

autoload $ZDOTDIR/functions/*

# Make pinentry work because it's dumb AF for some reason.
export GPG_TTY=$(tty)

# Source private environment (and machine specific stuff if needed)
if [[ -f "${HOME}/.dotfiles/private/zsh/env" ]]; then
  source "${HOME}/.dotfiles/private/zsh/env"
fi

# ZSH Plugins
source ~/.zinit/bin/zinit.zsh

# Oh My Zsh Prompt Setup
setopt promptsubst

PS1="READY >" #simple prompt until remaining prompt things load.

# Plugin options
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

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
