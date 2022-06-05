#!/usr/bin/env zsh

export EDITOR="nvim"
export VISUAL="nvim"

alias dot="git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"
alias ls="ls -1a"

help() {
	local -r command="${1}"
	bash <<< "help ${command}"
}
