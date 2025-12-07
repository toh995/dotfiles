#!/bin/bash

# Claude Code Notification Hook
# Sends macOS notifications when Claude finishes tasks or waits for input

# Read JSON data from stdin and extract the event type
JSON_INPUT=$(cat)
EVENT_TYPE=$(echo "$JSON_INPUT" | jq -r '.hook_event_name // "unknown"')

case "$EVENT_TYPE" in
    "Stop")
        # Notification when Claude finishes working and is ready for next prompt
        afplay /System/Library/Sounds/Glass.aiff &
        osascript -e 'display notification "Ready for your next command" with title "Claude Code" subtitle "Task Complete"'
        ;;
    "Notification")
        # Notification when Claude is asking for user input/permission
        afplay /System/Library/Sounds/Glass.aiff &
        osascript -e 'display notification "Waiting for your response" with title "Claude Code" subtitle "Input Required"'
        ;;
    *)
        # Default notification for other events
        afplay /System/Library/Sounds/Glass.aiff &
        osascript -e 'display notification "Claude Code event: '"$EVENT_TYPE"'" with title "Claude Code"'
        ;;
esac

# Exit with success
exit 0