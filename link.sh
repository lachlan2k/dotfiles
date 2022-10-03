#!/bin/bash

NC=$(printf '\033[0m')
BLUE=$(printf '\033[1;34m')
GREEN=$(printf '\033[1;32m')
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

function ln_() {
	echo "${BOLD}Linking ${2}${NORMAL}"
	ln -s $1 $2 2>/dev/null
	case $? in
		1) echo "$2 already exists...";;
		0) echo "${GREEN}Linked${NC}";;
	esac
	echo
}

function section() {
	echo =========
	echo "${BLUE}Linking ${1} config${NC}"
	echo
}


echo
echo "${BOLD}Dotfiles"
echo

section ZSH
ln_ ~/.dotfiles/zsh/ohmyzsh ~/.oh-my-zsh
ln_ ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln_ ~/.dotfiles/zsh/.zshenv ~/.zshenv

section tmux
ln_ ~/.dotfiles/tmux/.tmux ~/.tmux

ln_ ~/.dotfiles/tmux/.tmux/.tmux.conf ~/.tmux.conf
ln_ ~/.dotfiles/tmux/.tmux/.tmux.conf.local ~/.tmux.conf.local

echo
echo "${BOLD}All done!"
echo
