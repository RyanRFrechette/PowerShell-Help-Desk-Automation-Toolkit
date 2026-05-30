$ErrorActionPreference = "Stop"
$outputPath = Join-Path $PSScriptRoot "..\outputs\disk-space-example.txt"
$drives = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | Sort-Object DeviceID
$rows = foreach ($drive in $drives) {
    $totalGB = [math]::Round($drive.Size / 1GB, 2)
    $freeGB = [math]::Round($drive.FreeSpace / 1GB, 2)
    $percentFree = if ($drive.Size -gt 0) { [math]::Round(($drive.FreeSpace / $drive.Size) * 100, 1) } else { 0 }
    $status = if ($percentFree -lt 15) { "LOW SPACE" } else { "OK" }
    [pscustomobject]@{ Drive=$drive.DeviceID; TotalGB=$totalGB; FreeGB=$freeGB; PercentFree="$percentFree%"; Status=$status }
}
$report = @()
$report += "=============================="
$report += "  Disk Space Report"
$report += "=============================="
$report += ($rows | Format-Table -AutoSize | Out-String).TrimEnd()
$report += "=============================="
$report | Tee-Object -FilePath $outputPath
Write-Host ""
Write-Host "Report saved to: $outputPath"
