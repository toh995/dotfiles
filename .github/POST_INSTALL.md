## Instructions
### Network Setup
Use `nmtui`

### Brave setup
1. Switch to dark mode
2. Add extensions
	- [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)
	- [privacytools.io](https://www.privacytools.io/#browser-addons)

### GitHub ssh setup
1. Log in to github
2. Go to Profile > Settings > Developer Settings > Personal Access Tokens
3. Generate a new token, with `admin:public_key` selected
4. Run `github_ssh_setup`
5. Manually switch the `dotfiles` repo to use SSH: `dot remote set-url origin git@github.com:toh995/dotfiles.git`

---

## Legacy
### Firefox setup
1. Open up firefox, then close it
2. Run the script `arkenfox_update`
3. Enable dark mode
4. Add extensions
	- [Arkenfox Recommended Extensions](https://github.com/arkenfox/user.js/wiki/4.1-Extensions)
	- [Vimium](https://addons.mozilla.org/en-GB/firefox/addon/vimium-ff/)
