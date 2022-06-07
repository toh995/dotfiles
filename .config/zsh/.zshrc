#!/usr/bin/env zsh
set -o noclobber
set -o pipefail

alias dot="git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"
alias j="z" # zoxide
alias ls="ls -1a"

help() {
	local -r command="${1}"
	bash <<< "help ${command} | less"
}

########
# less #
########
export LESS="${LESS} -R --mouse"
# set colors, i.e. for man pages
autoload -U colors && colors
export LESS_TERMCAP_mb="${fg_bold[red]}"
export LESS_TERMCAP_md="${fg_bold[red]}"
export LESS_TERMCAP_me="${reset_color}"
export LESS_TERMCAP_so="${fg_bold[yellow]}${fg_bold[blue]}"
export LESS_TERMCAP_se="${reset_color}"
export LESS_TERMCAP_us="${fg_bold[green]}"
export LESS_TERMCAP_ue="${reset_color}"

#################
# powerlevel10k #
#################
case "${OSTYPE}" in
	"darwin"*)
		source "$(brew --prefix)"/opt/powerlevel10k/powerlevel10k.zsh-theme
		;;
	"linux"*)
		[[ "$(cat /etc/os-release)" =~ "ID=arch" ]] && \
			source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
		;;
esac

source "${XDG_CONFIG_HOME}/powerlevel10k/.p10k.zsh"

##########
# zoxide #
##########
eval "$(zoxide init zsh)"
