#!/usr/bin/env zsh

set -o noclobber
set -o pipefail

alias dot="git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"
alias ls="ls -1a"

help() {
	local -r command="${1}"
	bash <<< "help ${command} | less"
}
