Install debian with no dependencies

Log in as root
```bash
apt-get update && apt-get upgrade 

apt-get install sudo
usermod --append --groups sudo $USER

apt-get install alacritty

# References:
# https://www.reddit.com/r/debian/comments/14hrrjh/is_there_any_way_to_install_debian_12_gnome/
# https://flatpak.org/setup/Debian
apt-get install gnome-core gnome-software-plugin-flatpak flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

apt-get autoremove && apt-get clean

reboot
```

Now, log in as non-root.
- Uninstall default apps
- Install flathub apps


Install brew and other dependencies
```bash
# Nix reference: https://nixos.org/download/#nix-install-linux
# sudo apt-get install curl xz-utils
# sh <(curl -L https://nixos.org/nix/install) --no-daemon

# Reference: https://brew.sh/
sudo apt-get install curl git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update && brew upgrade
brew install distrobox podman podman-compose podman-tui

brew autoremove
```
