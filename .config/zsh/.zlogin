#!/usr/bin/env zsh

# Start the x server
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	for i in {1..5}; do
		if [[ -e /dev/dri/card0 ]]; then
			startx
			break
		fi
		sleep 0.5s
	done
fi
