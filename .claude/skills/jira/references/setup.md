# Jira Skill — Setup & Troubleshooting

## Config File

Create `~/.claude/skills/jira/assets/config`:

    base_url=https://your-domain.atlassian.net
    email=your@email.com

## API Token

Create `~/.claude/skills/jira/assets/.token` with your Jira API token as the sole content (no trailing newline).

Generate a token at: https://id.atlassian.com/manage/api-tokens

## Error Codes

- **Error (401)** — Bad credentials. Verify email in assets/config and token in assets/.token.
- **Error (403)** — Authenticated but no permission for this project/issue.
- **Error (404)** — Issue doesn't exist OR no permission to see it. Jira intentionally conflates these — check the issue key is correct first.

If all requests fail with 404, auth is likely broken (Jira returns 404 instead of 401 when auth is missing).

## Notes

- Uses Jira REST API v2 `/search/jql` endpoint (plain text descriptions, not ADF)
- Sprint field not included (customfield_10020 varies by Jira instance). Can be added to the script later.
