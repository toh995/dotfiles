---
name: jira
description: >-
  This skill should be used when the user mentions a Jira ticket key
  (e.g. SOX-1234, DEVTOOLS-456), asks about ticket details, or wants
  to look up a Jira issue. Fetches live ticket data from Jira Cloud.
disable-model-invocation: true
---

# Jira Ticket Fetcher

Fetch Jira ticket details via CLI. Returns clean, flat JSON.

## Usage

    ~/.claude/skills/jira/scripts/jira-tool get <ISSUE-KEY>

## Output Fields

| Field | Type | Example |
|---|---|---|
| key | string | "SOX-1234" |
| summary | string | "Fix login redirect loop" |
| type | string | "Bug", "Story", "Task", "Epic" |
| status | string | "To Do", "In Progress", "Done" |
| priority | string | "Highest", "High", "Medium", "Low" |
| assignee | string \| null | "Jane Dev" (null if unassigned) |
| labels | string[] | ["auth", "p1"] |
| description | string | Plain text (Jira wiki markup) |
| links | array | [{relation, key, summary, status, priority}] — empty if none |
| children | array | [{key, summary, type, status, priority, assignee}] — empty if none |

## Setup & Troubleshooting

See `references/setup.md` for config file format, API token setup, and error codes.
