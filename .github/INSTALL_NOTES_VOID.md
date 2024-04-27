# Void Install Notes
- Use the [Void Guide for Full Disk Encryption](https://docs.voidlinux.org/installation/guides/fde.html)
- Partition 1G for the boot partition
- Use luks1 instead of luks2 for encryption
- Skip creating a separate logical volume for /home
- Use ext4 instead of xfs for the file system
- Mount the boot partition to `/boot`, NOT `/boot/efi`
- Directly edit the file `/etc/default/libc-locales`, instead of appending to it
- Do NOT add the line `GRUB_ENABLE_CRYPTODISK=y` to `/etc/default/grub`
- Skip the section `LUKS key setup`
- When installing GRUB, use the command `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id="Void"`

```bash
# Enable dhcpcd, to get internet access:
ln -s /etc/sv/dhcpcd /var/service/

xbps-install gnome-core
xbps-install alacritty

# Set up flatpak https://flatpak.org/setup/Void%20Linux

# UI for managing flatpak apps
xbps-install gnome-software

# Install distrobox
# Source: https://distrobox.it/#curl-or-wget
xbps-install curl
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

# Install podman
# Add `mount --make-rshared /` to `/etc/rc.local`
# Reference: https://www.reddit.com/r/voidlinux/comments/17oc7r3/podman_and_is_not_a_shared_mount/
xbps-install podman

# Install podman-compose
xbps-install podman-compose
touch /etc/modules-load.d/ip_tables.conf
echo "ip_tables" >> /etc/modules-load.d/ip_tables.conf

# Install podman-tui
xbps-install podman-tui
# How to start the podman service:
# podman system service --time 0 &
```

After first boot, set up distrobox, pull down the dotfiles, etc.

Then:
```bash
# Load gnome settings
dconf load / < $HOME/.config/gnome-settings/config.ini

# Install forge
busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s forge@jmmaranan.com

# Important for opening apps from the terminal
xbps-install xdg-utils

# Cosmetic things
xbps-install gnome-tweaks
xbps-install noto-fonts-cjk noto-fonts-emoji noto-fonts-ttf noto-fonts-ttf-extra
xbps-install nerd-fonts

# Install apple cursors:
# https://github.com/ful1e5/apple_cursor?tab=readme-ov-file#linuxx11
```
