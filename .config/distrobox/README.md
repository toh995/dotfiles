# Linux container-based workflow

> [!WARNING]  
> This does NOT work for macOS hosts; distrobox doesn't support it. See the [github issue](https://github.com/89luca89/distrobox/issues/36)

## Host Setup
### OpenSUSE MicroOS
Website: https://microos.opensuse.org/

MicroOS comes with `podman` and `distrobox` installed out of the box.

Install `podman-compose`
```bash
sudo transactional-update pkg install podman-compose
```

Then, reboot.

Relevant docs on `transactional-update`: https://en.opensuse.org/Portal:Aeon#transactional-update_-_Example_Commands

## Container Setup
### Distrobox
From the host:
```bash
# Create the distrobox
curl https://raw.githubusercontent.com/toh995/dotfiles/main/.config/distrobox/distrobox.ini > /tmp/distrobox.ini
distrobox assemble create --replace --file /tmp/distrobox.ini

# Enter the distrobox
distrobox enter void
```

Inside the distrobox:
```bash
# System upgrade
sudo xbps-install -Su && sudo xbps-remove -Oo

# Set up github ssh
# Guide: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys

# Clone dotfiles
git clone --bare git@github.com:toh995/dotfiles.git $HOME/.dotfiles
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
dot checkout
dot config --local status.showUntrackedFiles no
dot submodule update --init --recursive

# Change the default shell to zsh
sudo chsh -s /usr/bin/zsh toh995
# exit the distrobox, then re-enter, to use zsh

# install volta
# Reference: https://volta.sh/
curl https://get.volta.sh | bash

# install neovim dependencies
volta install node # unsure what this is for...?
volta install yarn@1 # for markdown-preview See https://github.com/iamcco/markdown-preview.nvim/issues/612#issuecomment-1763546868

# Clone the neovim repo
git clone git@github.com:toh995/nvim.git $XDG_CONFIG_HOME/nvim

# Open neovim, install plugins
nvim .
```

### Podman compose
```bash
# start
cd $XDG_CONFIG_HOME/distrobox
podman compose up -d

# stop
podman compose stop
```
