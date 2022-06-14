#!/usr/bin/env zsh

export ZDOTDIR="${HOME}/.config/zsh"

export PATH="${HOME}/.bin:${PATH}"

# default apps
export BROWSER="brave"
export EDITOR="nvim"
export PAGER="less"
export VISUAL="nvim"

# X11
export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"

# XDG
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="${HOME}/.cache"
