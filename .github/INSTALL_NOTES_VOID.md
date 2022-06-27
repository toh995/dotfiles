# Void Install Notes
- Use the [Void Guide for Full Disk Encryption](https://docs.voidlinux.org/installation/guides/fde.html)
- Use luks1 instead of luks2 for encryption
- Use ext4 instead of xfs for the file system
- Mount the boot partition to `/boot`, NOT `/boot/efi`
- Directly edit the file `/etc/default/libc-locales`, instead of appending to it
- Do NOT add the line `GRUB_ENABLE_CRYPTODISK=y` to `/etc/default/grub`
- Skip the section `LUKS key setup`
- When installing GRUB, use the command `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id="Void"`
