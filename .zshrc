# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. Initialization code that may require console input (password prompts, [y/n] confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.scripts:/usr/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fasd extract zsh-vi-mode azure-cli)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# For the zsh-vi-mode plugin
export ZVM_VI_EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# create server in nvim with echo serverstart('/tmp/nvim.pipe')
#alias tovim='xargs -0 nvim --server /tmp/nvim.pipe --remote-send'
#alias vim='nvim  --listen /tmp/nvim.pipe'
alias vim=nvim
alias t=task
alias tt=taskwarrior-tui
alias tw=timew
alias m=neomutt

#alias do=docker

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Added package place for glibal nps without sudo
# npm config set prefix "${HOME}/.npm-packages
NPM_PACKAGES="${HOME}/.npm-packages"
N_PREFIX="${HOME}/.npm-packages"

export N_PREFIX=$N_PREFIX
export PATH="$PATH:$NPM_PACKAGES/bin"

# IntelliJ Workaround BSPWM
export _JAVA_AWT_WM_NONREPARENTING=1.

source ~/.secret/api-key.sh

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

setopt HIST_IGNORE_SPACE

#source ~/.nvm/nvm.sh;nvm use lts/gallium
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
# This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#source /usr/share/nvm/init-nvm.sh
