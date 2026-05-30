# Case Study - PowerShell Help Desk Automation Toolkit

## Overview

This project is a screenshot-backed PowerShell automation toolkit for common Windows help desk checks. It was built as a practical portfolio project for remote help desk and junior IT support roles.

## Goal

Create a small, safe, repeatable toolkit that gathers common endpoint troubleshooting information without changing system settings.

## Problem

Help desk technicians often need to gather the same basic information repeatedly before troubleshooting can begin: system details, disk space, network connectivity, local account status, and recent error events. Doing that manually is slower and easier to document inconsistently.

## Solution

I built six read-only PowerShell scripts that collect common support details and save example outputs. Each script has a clear use case, a saved report file, and screenshot proof in the README.

## Tools Used

- PowerShell
- Windows Terminal
- Git and GitHub
- ShareX screenshots
- Markdown documentation

## Build Process

1. Created the repo structure and documentation files.
2. Built one script at a time.
3. Ran each script locally and saved example output.
4. Captured screenshots showing the command and terminal result.
5. Updated the README with HR-readable explanations.
6. Committed and pushed each proof step to GitHub.

## Scripts Built

| Script | Command | Use Case |
|---|---|---|
| `Get-SystemInfoReport.ps1` | `sysinfo` | Start-of-ticket endpoint summary |
| `Get-DiskSpaceReport.ps1` | `diskreport` | Storage and performance triage |
| `Test-NetworkConnectivity.ps1` | `netcheck` | Gateway, DNS, and internet troubleshooting |
| `Get-LocalUserSummary.ps1` | `usersummary` | Local account review |
| `New-SupportReport.ps1` | `supportreport` | Ticket escalation report |
| `Get-RecentEventLogErrors.ps1` | `eventerrors` | Recent error review without message bodies |

## Testing and Validation

Each script was run locally in PowerShell, saved output to the repo, and was reviewed through screenshot proof in the README. The final project was pushed to GitHub with a clean working tree.

## Safety

The scripts are read-only and avoid destructive commands. Event log message bodies are omitted to reduce private data exposure. Screenshots were captured from a personal lab machine and reviewed before being published.

## Result

The final repo demonstrates practical PowerShell scripting, Windows endpoint troubleshooting, support documentation, and GitHub portfolio presentation for help desk / IT support hiring managers.
