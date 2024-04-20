#!/usr/bin/env zsh
set -o noclobber
set -o pipefail

# Inspired by https://github.com/mattmc3/zsh_unplugged?tab=readme-ov-file#tada-the-code
export ZPLUG_DIR="${XDG_DATA_HOME:-$HOME/.local.share}/zsh-plugins"
mkdir -p "${ZPLUG_DIR}"

zplug-update() {
  rm -rf "${ZPLUG_DIR}"
  echo "Update complete! Please reopen a new zsh shell"
}

# install and source plugins
# powerlevel10k
[[ ! -d "${ZPLUG_DIR}/powerlevel10k" ]] && \
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZPLUG_DIR}/powerlevel10k"
source "${ZPLUG_DIR}/powerlevel10k/powerlevel10k.zsh-theme"
# source custom config
source "${XDG_CONFIG_HOME:-$HOME/.config}/powerlevel10k/.p10k.zsh"

# zsh-autosuggestions
[[ ! -d "${ZPLUG_DIR}/zsh-autosuggestions" ]] && \
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "${ZPLUG_DIR}/zsh-autosuggestions"
source "${ZPLUG_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting
[[ ! -d "${ZPLUG_DIR}/zsh-syntax-highlighting" ]] && \
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZPLUG_DIR}/zsh-syntax-highlighting"
source "${ZPLUG_DIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# zsh-vi-mode
[[ ! -d "${ZPLUG_DIR}/zsh-vi-mode" ]] && \
  git clone --depth=1 https://github.com/jeffreytse/zsh-vi-mode.git "${ZPLUG_DIR}/zsh-vi-mode"
source "${ZPLUG_DIR}/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
# for zsh vi-mode, remap the `esc` key
export ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
