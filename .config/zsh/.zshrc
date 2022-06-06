#!/usr/bin/env zsh
set -o noclobber
set -o pipefail

eval "$(zoxide init zsh)"

alias dot="git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"
alias j="z" # zoxide
alias ls="ls -1a"

help() {
	local -r command="${1}"
	bash <<< "help ${command} | less"
}
