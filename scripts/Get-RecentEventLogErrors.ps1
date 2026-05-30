$ErrorActionPreference = "SilentlyContinue"
$outputPath = Join-Path $PSScriptRoot "..\outputs\event-log-errors-example.txt"
$since = (Get-Date).AddDays(-1)
$events = Get-WinEvent -FilterHashtable @{LogName=@("System","Application"); Level=2; StartTime=$since} -MaxEvents 20 | Select-Object TimeCreated, LogName, ProviderName, Id, LevelDisplayName
$report=@()
$report+="=============================="
$report+="  Recent Event Log Errors"
$report+="=============================="
$report+="Last 24 hours. Message bodies omitted to avoid private data."
$report+=""
if($events){$report+=($events | Format-Table -AutoSize | Out-String).TrimEnd()}else{$report+="No recent error events found."}
$report+="=============================="
$report | Tee-Object -FilePath $outputPath
Write-Host ""
Write-Host "Report saved to: $outputPath"
