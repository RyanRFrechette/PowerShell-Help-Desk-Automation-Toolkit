# CLAUDE.md — PowerShell Help Desk Automation Toolkit

## Output style
- Short responses. No padding. No summaries of what was just done.
- Caveman mode active by default.

## Language
- PowerShell first. One-liners preferred.
- No Bash unless explicitly asked.

## Pacing
- One phase at a time. Do not start Phase N+1 until Phase N is committed and verified.
- Do not build scripts until Phase 1 is explicitly started.

## Scanning
- No broad repo scans. Target specific files only.

## Privacy and safety
- No private data in outputs, screenshots, or committed files.
- No real hostnames, usernames, IPs, or credentials anywhere.
- All scripts default read-only. No system modifications without explicit per-change approval.
- Run powershell-safety-reviewer before every script commit.

## Screenshot workflow
1. Capture screenshot.
2. Rename with step number (e.g., `01-system-info-output.png`).
3. Move to correct `screenshots/` subfolder.
4. Add README image block with HR-friendly caption.
5. Commit. Push. Verify git status.

## Commit discipline
- Commit after each proof step only.
- Run git-qa-reviewer before push.
- Run hiring-manager-reviewer on README edits.

## Agents
- powershell-helpdesk-engineer: write/review scripts
- powershell-safety-reviewer: before every script commit
- hiring-manager-reviewer: README, case-study, resume-bullets
- screenshot-docs-agent: after each screenshot
- git-qa-reviewer: before and after each commit
