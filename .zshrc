# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Enable Powerlevel10k instant prompt. This should stay close to the top of ~/.zshrc.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  HBPATH=/home/linuxbrew/.linuxbrew
elif [[ "$OSTYPE" == "darwin"* ]]; then
  HBPATH=/opt/homebrew
fi

source {"$HBPATH"}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source {"$HBPATH"}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source {"$HBPATH"}/share/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

alias ls="eza --icons=always"

export PATH="{$HOME}/bin:{$HBPATH}/bin:$PATH"
