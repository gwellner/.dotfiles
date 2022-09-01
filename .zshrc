# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#export ZSH='/usr/share/oh-my-zsh'
export ZSH='/home/gw/.oh-my-zsh'
#export ZSH_CUSTOM='/usr/share/zsh'

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fasd extract zsh-vi-mode cp oc)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# https://wiki.archlinux.org/index.php/Dotfiles
#

# git init --bare $HOME/.dotfiles/.git
alias dt='git --git-dir=/home/gw/.dotfiles --work-tree=/home/gw'
# dt config status.showUntrackedFiles no
# complete -F _complete_alias config

# git clone --seperate-git-dir=~/.myconf /path/to/repo

alias vim=nvim

# Added package place for glibal nps without sudo
# npm config set prefix "${HOME}/.npm-packages

NPM_PACKAGES="${HOME}/.npm-packages"
N_PREFIX="${HOME}/.npm-packages"

export N_PREFIX=$N_PREFIX
export PATH="$PATH:$NPM_PACKAGES/bin"

# IntelliJ Workaround BSPWM
export _JAVA_AWT_WM_NONREPARENTING=1.

# Starship init prompt for zsh
eval "$(starship init zsh)"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
