#!/usr/bin/env zsh
set -o noclobber
set -o pipefail

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH plugins get sourced at the END
# This is needed for zsh-syntax-highlighting
# More info: https://github.com/zsh-users/zsh-syntax-highlighting?tab=readme-ov-file#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file

# basic aliases
alias dot="git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"
alias lgd="lazygit --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"
# alias ls="ls -1AF --color=auto"
alias ls="eza -1aF"
[[ $OSTYPE == 'darwin'* ]] && alias trash="trash -F"

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

# brew
if [[ "${OSTYPE}" == "darwin"* ]]; then
  # make brew available in PATH
  eval "$(/opt/homebrew/bin/brew shellenv"")"
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_NO_AUTO_UPDATE=1
fi

# direnv
export DIRENV_LOG_FORMAT=
declare direnv_exists=$(command -v "direnv")
[[ "${direnv_exists}" ]] && eval "$(direnv hook zsh)"

# ghcup
export GHCUP_USE_XDG_DIRS="true"
# activate ghcup
[[ -f "${HOME}/.ghcup/env" ]] && source "${HOME}/.ghcup/env" # for root-level .ghcup
[ -f "${XDG_DATA_HOME}/ghcup/env" ] && source "${XDG_DATA_HOME}/ghcup/env" # for XDG

# gnupg
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local.share}/gnupg"
# if the directory $GNUPGHOME doesn't exist, then create it.
# also ensure permissions are adjusted appropriately.
if ! [[ -d "${GNUPGHOME}" ]]; then
  mkdir -p "${GNUPGHOME}"
  chown -R "$(whoami)" "${GNUPGHOME}"
  chmod 700 "${GNUPGHOME}"
fi

# go
export GOPATH="${XDG_DATA_HOME}/go"
export GOMODCACHE="${XDG_CACHE_HOME}/go/mod"
export PATH="${GOPATH}/bin:${PATH}"

# lazydocker
alias ld="lazydocker"

# lazygit
alias lg="lazygit"

# less
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
export GROFF_NO_SGR=1

# neovim
alias n="nvim ."

# node
export NODE_REPL_HISTORY="${XDG_STATE_HOME:-$HOME/.local/state}/node/.node_repl_history"
[[ -f "${NODE_REPL_HISTORY}" ]] || \
  mkdir -p "$( dirname "${NODE_REPL_HISTORY}" )"

# postgres
export PSQL_HISTORY="${XDG_STATE_HOME:-$HOME/.local/state}/psql/.psql_history"
[[ -f "${PSQL_HISTORY}" ]] || \
  mkdir -p "$( dirname "${PSQL_HISTORY}" )"

# pass
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/pass"
[[ -d "${PASSWORD_STORE_DIR}" ]] || \
  mkdir -p "${PASSWORD_STORE_DIR}"

# pnpm
export PNPM_HOME="${HOME}/.local/share/pnpm"
export PATH="${PNPM_HOME}:${PATH}"
alias p="pnpm"
alias pi="pnpm install"

# python
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/python/pythonstartup.py"
export PYTHONHISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/python/.python_history"
[[ -f "${PYTHONHISTFILE}" ]] || \
  mkdir -p "$( dirname "${PYTHONHISTFILE}" )"

# rust
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"

# spotify-player
alias spt="spotify_player"

# tealdeer
export TEALDEER_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/tealdeer"

# tmux
ta() {
  local -r session_name="${1}"
  if [[ -z "${session_name}" ]]; then
    tmux attach-session
  else
    tmux attach-session -t "${session_name}"
  fi
}
alias tls="tmux ls"
alias tn="tmux new-session -s"

# volta
export VOLTA_FEATURE_PNPM=1
export VOLTA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"
alias j="z"

# zsh plugins
source "${ZDOTDIR}/plugins.zsh"
