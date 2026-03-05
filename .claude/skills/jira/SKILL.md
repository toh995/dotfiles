---
name: jira
description: >-
  Use when the user mentions Jira issues, tickets, sprints, epics, boards,
  or asks to create/view/move/assign/list/search/link issues, manage sprints,
  add comments, or do anything involving Jira project management. Also triggers
  on issue key patterns like PROJ-123. Wraps the jira-cli tool.
allowed-tools: Bash(jira issue list:*) Bash(jira issue view:*)
---

# Jira CLI Assistant

You manage Jira issues, sprints, epics, and boards using the `jira` CLI (`jira-cli` by ankitpokhrel). Run commands directly — don't explain how to run them unless asked.

## Before You Start

- Assume `jira` is installed and configured. If a command fails with auth/config errors, tell the user to run `jira init`.
- Use `--no-input` and `--plain` flags when running commands non-interactively (which is always, since you're in a CLI).
- For JSON output you need to parse, use `--raw`.
- `$(jira me)` gives the current user's account ID — use it for self-assignment and filtering.

## Core Operations

### Viewing & Searching

```bash
# View a specific issue
jira issue view ISSUE-1 --plain --comments 5

# List issues with filters
jira issue list --plain -a$(jira me)              # My issues
jira issue list --plain -s"In Progress"            # By status
jira issue list --plain --created -7d              # Recent
jira issue list --plain -q "summary ~ 'search term'"  # JQL search

# Sprint board
jira sprint list --plain
jira sprint list --plain -s"To Do" -a$(jira me)
```

### Creating

```bash
# Create issue (always use --no-input with all required flags)
jira issue create -tTask -s"Summary here" -b"Description" -yMedium --no-input

# Create and attach to epic
jira issue create -tStory -s"Summary" -PEPIC-42 --no-input

# Subtask
jira issue create -tSub-task -s"Subtask title" --parent ISSUE-1 --no-input
```

### Updating

```bash
# Transition/move
jira issue move ISSUE-1 "In Progress" --no-input
jira issue move ISSUE-1 Done --no-input

# Assign
jira issue assign ISSUE-1 $(jira me)   # To self
jira issue assign ISSUE-1 x            # Unassign

# Edit fields
jira issue edit ISSUE-1 -s"New title" -yHigh --no-input

# Comment
jira issue comment add ISSUE-1 "Comment body here"

# Link issues
jira issue link ISSUE-1 ISSUE-2 Blocks
```

### Sprints & Epics

```bash
# Sprint management
jira sprint list --plain
jira sprint add SPRINT_ID ISSUE-1
jira sprint remove SPRINT_ID ISSUE-1

# Epic management
jira epic list --plain
jira epic add EPIC-1 ISSUE-1
jira epic remove EPIC-1 ISSUE-1
```

## Behavior

- "what's on my plate" / "my tickets" → list assigned issues
- Issue key mentioned (e.g., PROJ-123) → view it
- "move X to done" / "start working on X" → transition
- Parse `--raw` JSON when you need structured data for follow-up operations
- If a command fails, read the error and adjust — don't blindly retry
- Bulk operations: run sequentially, report results

## Output

Keep it concise. Summarize what you did or found — don't dump raw CLI output unless the user asks for it or it's short enough to be useful.

## When Unsure About Flags

Run `jira <command> --help` — e.g., `jira issue create --help`, `jira sprint list --help`. It's always in sync with the installed version.
