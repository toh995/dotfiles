#!/usr/bin/env zsh

export ZDOTDIR="${HOME}/.config/zsh"

# XDG
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="${HOME}/.cache"
# XDG_BIN_HOME is not a standard part of the spec, but still useful
# See here https://gitlab.freedesktop.org/xdg/xdg-specs/-/issues/14
export XDG_BIN_HOME="${HOME}/.local/bin"
export PATH="${XDG_BIN_HOME}:${PATH}"

# ZSH History
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000

[[ -f "${HISTFILE}" ]] || \
  mkdir -p "$( dirname "${HISTFILE}" )"

# X11
# export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"

# Default apps
export BROWSER="brave"
export EDITOR="nvim"
export MANPAGER="less"
export PAGER="less"
export VISUAL="nvim"
