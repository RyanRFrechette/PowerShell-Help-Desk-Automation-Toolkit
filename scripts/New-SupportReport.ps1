$ErrorActionPreference = "Stop"
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$outputPath = Join-Path $PSScriptRoot "..\outputs\reports\support-report-$timestamp.txt"
$report=@()
$report+="=============================="
$report+="  Help Desk Support Report"
$report+="=============================="
$report+="Generated: $(Get-Date)"
$report+=""
$report+="--- System Info ---"
$report+=(& "$PSScriptRoot\Get-SystemInfoReport.ps1" | Out-String).TrimEnd()
$report+=""
$report+="--- Disk Space ---"
$report+=(& "$PSScriptRoot\Get-DiskSpaceReport.ps1" | Out-String).TrimEnd()
$report+=""
$report+="--- Network Connectivity ---"
$report+=(& "$PSScriptRoot\Test-NetworkConnectivity.ps1" | Out-String).TrimEnd()
$report+=""
$report+="--- Local User Summary ---"
$report+=(& "$PSScriptRoot\Get-LocalUserSummary.ps1" | Out-String).TrimEnd()
$report+="=============================="
$report | Tee-Object -FilePath $outputPath
Write-Host ""
Write-Host "Support report saved to: $outputPath"
