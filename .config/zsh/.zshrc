#!/usr/bin/env zsh
set -o noclobber
set -o pipefail

alias dot="git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"
alias ls="ls -1a"

# power management aliases
alias hibernate="systemctl hibernate"
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"
alias suspend="systemctl suspend"
alias suspend-then-hibernate="systemctl suspend-then-hibernate"

help() {
	local -r command="${1}"
	bash <<< "help ${command} | less"
}

########
# grip #
########
export GRIPHOME="${XDG_CONFIG_HOME:-$HOME/.config}/grip"

########
# less #
########
export LESS="${LESS} -R --mouse"
# set colors, i.e. for man pages
autoload -U colors && colors
export LESS_TERMCAP_mb="${fg_bold[red]}"
export LESS_TERMCAP_md="${fg_bold[red]}"
export LESS_TERMCAP_me="${reset_color}"
export LESS_TERMCAP_so="${bg_bold[yellow]}${fg_bold[black]}"
export LESS_TERMCAP_se="${reset_color}"
export LESS_TERMCAP_us="${fg_bold[green]}"
export LESS_TERMCAP_ue="${reset_color}"

########
# nnn  #
########
export NNN_OPTS="H"

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
# python #
##########
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/python/pythonstartup.py"
export PYTHONHISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/python/.python_history"

[[ -f "${PYTHONHISTFILE}" ]] || \
	mkdir -p "$( dirname "${PYTHONHISTFILE}" )"

########
# tmux #
########
alias ta="tmux attach-session -t"
alias tls="tmux ls"
alias tn="tmux new-session -s"

##########
# zoxide #
##########
eval "$(zoxide init zsh)"
alias j="z"
