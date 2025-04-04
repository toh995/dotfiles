# Instructions

## General

### Brave setup
- Switch to dark mode
- Add extensions
    - [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)
    - [privacytools.io](https://www.privacytools.io/#browser-addons)
- Change the downloads folder
    - Open Settings
    - Search for downloads
- Set the default font (e.g. Noto family fonts)
- Change search engine
- Disable Leo
- Update "home" page

### Distrobox setup
If using distrobox, follow the [setup instructions](../.config/distrobox/README.md).

### GitHub ssh setup
Follow the [GitHub instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Clone this repo
```bash
git clone --bare git@github.com:toh995/dotfiles.git $HOME/.dotfiles
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
dot checkout
dot submodule update --init --recursive
dot config --local status.showUntrackedFiles no
```

### Neovim
Clone dotfiles:
```bash
cd ~/.config
git clone git@github.com:toh995/nvim.git
```

Then, open neovim to bootstrap/install packages

### Install Fonts
Either:
- Use one of the install options on the [README](https://github.com/ryanoasis/nerd-fonts) (e.g. install via package manager)
- Direct download from the [nerd fonts website](https://www.nerdfonts.com/font-downloads)

### Password manager
Clone stuff to $XDG_DATA_HOME

### Spotify setup

Run `spotify_setup`

## Gnome
To load the gnome settings config, run:
```bash
dconf load / < $XDG_CONFIG_HOME/gnome-settings/config.ini
```

To save the gnome settings config, run:
```bash
dconf dump / >! $XDG_CONFIG_HOME/gnome-settings/config.ini
```

## macOS

- May need to log in to the apple account
- When connecting a new keyboard, remap the command and option keys at `System Preferences > Keyboard > Modifier Keys...`

## Arch Linux

### Network Setup

Use `nmtui`


### Video Drivers

See:

- https://wiki.archlinux.org/title/Xorg#Driver_installation
- https://wiki.archlinux.org/title/Hardware_video_acceleration

### Power Saving

See: https://wiki.archlinux.org/title/Power_management#Power_saving

### Hibernation

#### Add a swapfile

**Reference:** https://wiki.archlinux.org/title/Swap#Swap_file

1. Check `cat /sys/power/image_size`, and modify it as necessary
2. Create a swapfile, for example for 8GB swapfile:

```bash
sudo dd if=/dev/zero of=/swapfile bs=1000000 count=8000 status=progress
sudo chmod 0600 /swapfile
sudo mkswap -U clear /swapfile
sudo swapon /swapfile
```

3. Add the new swapfile to `/etc/fstab`, as sudo:

```
/swapfile none swap defaults 0 0
```

#### Initramfs and Kernel Parameters

**Reference:** https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Hibernation

1. Add the following hook in `/etc/mkinitcpio.conf` as sudo
<pre>
HOOKS=(base udev autodetect keyboard modconf block filesystems <b>resume</b> fsck)
</pre>
2. Regenerate the initramfs: `sudo mkinitcpio -P`
3. Add the kernel params. See https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Hibernation_into_swap_file
   - For `systemd-boot`, update kernel params can go in: `/boot/loader/entries/arch.conf`

#### Configure suspend-then-hibernate on laptop lid close (Optional)

1. Add to `/etc/systemd/sleep.conf`:

```
HibernateDelaySec=15min
```

2. Add to `/etc/systemd/logind.conf`:

```
HandleLidSwitch=suspend-then-hibernate
```

---

## Legacy

### Firefox setup

1. Open up firefox, then close it
2. Run the script `arkenfox_update`
3. Enable dark mode
4. Add extensions
   - [Arkenfox Recommended Extensions](https://github.com/arkenfox/user.js/wiki/4.1-Extensions)
   - [Vimium](https://addons.mozilla.org/en-GB/firefox/addon/vimium-ff/)
