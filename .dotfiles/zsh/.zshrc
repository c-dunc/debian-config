
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git
	zsh-autosuggestions
	zsh-completions
	F-Sy-H
)

source $ZSH/oh-my-zsh.sh

cd ~

alias ll="ls -a"
