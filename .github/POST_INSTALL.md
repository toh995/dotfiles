# Instructions

## General

### Network Setup
Use `sudo nmtui`

### Brave setup
1. Switch to dark mode
2. Add extensions
	- [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)
	- [privacytools.io](https://www.privacytools.io/#browser-addons)
3. Change the downloads folder
	- Open Settings
	- Search for downloads

### GitHub ssh setup
1. Log in to github
	- To access the USB, use [manual mounting](https://wiki.archlinux.org/title/USB_storage_devices#Manual_mounting)
2. Go to Profile > Settings > Developer Settings > Personal Access Tokens
3. Generate a new token, with `admin:public_key` selected
4. Run `github_ssh_setup`
5. Manually switch the `dotfiles` repo to use SSH: `dot remote set-url origin git@github.com:toh995/dotfiles.git`

## Arch Linux

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
