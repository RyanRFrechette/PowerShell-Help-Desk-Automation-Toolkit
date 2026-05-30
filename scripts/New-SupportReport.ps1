$ErrorActionPreference = "Stop"
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$outputPath = Join-Path $PSScriptRoot "..\outputs\reports\support-report-$timestamp.txt"
$sysPath = Join-Path $PSScriptRoot "..\outputs\system-info-example.txt"
$diskPath = Join-Path $PSScriptRoot "..\outputs\disk-space-example.txt"
$netPath = Join-Path $PSScriptRoot "..\outputs\network-connectivity-example.txt"
$userPath = Join-Path $PSScriptRoot "..\outputs\local-user-summary-example.txt"
& "$PSScriptRoot\Get-SystemInfoReport.ps1" *> $null
& "$PSScriptRoot\Get-DiskSpaceReport.ps1" *> $null
& "$PSScriptRoot\Test-NetworkConnectivity.ps1" *> $null
& "$PSScriptRoot\Get-LocalUserSummary.ps1" *> $null
$report=@()
$report+="=============================="
$report+="  Help Desk Support Report"
$report+="=============================="
$report+="Generated: $(Get-Date)"
$report+=""
$report+="--- System Info ---"
$report+=(Get-Content $sysPath -Raw).TrimEnd()
$report+=""
$report+="--- Disk Space ---"
$report+=(Get-Content $diskPath -Raw).TrimEnd()
$report+=""
$report+="--- Network Connectivity ---"
$report+=(Get-Content $netPath -Raw).TrimEnd()
$report+=""
$report+="--- Local User Summary ---"
$report+=(Get-Content $userPath -Raw).TrimEnd()
$report+="=============================="
$report | Set-Content -Path $outputPath
Get-Content $outputPath
Write-Host ""
Write-Host "Support report saved to: $outputPath"
