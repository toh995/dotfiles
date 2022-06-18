# Arch Install Notes
1. Use the [Arch Wiki Install Guide](https://wiki.archlinux.org/title/installation_guide)
2. [Configure encryption](https://wiki.archlinux.org/title/dm-crypt/Encrypting_an_entire_system#LUKS_on_a_partition).
3. [Configure systemd-boot](https://wiki.archlinux.org/title/systemd-boot)
	- Save the following to `/boot/loader/loader.conf`
		```
		default arch.conf
		console-mode max
		editor no
		beep no
		```
	- Save the following to `/boot/loader/entries/arch.conf`
		```
		title Arch Linux
		linux /vmlinuz-linux
		initrd /amd-ucode.img
		initrd /initramfs-linux.img
		```
	- Find the UUID (not PARTUUID)
		```bash
		blkid | grep /dev/${partition} >> /boot/loader/entries/arch.conf
		```
	- Append the following to `/boot/loader/entries/arch.conf`
		```
		options cryptdevice=UUID=${device_UUID}:root root=/dev/mapper/root
		```
