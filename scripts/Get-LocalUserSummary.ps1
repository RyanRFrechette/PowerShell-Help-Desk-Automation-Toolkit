$ErrorActionPreference = "Stop"
$outputPath = Join-Path $PSScriptRoot "..\outputs\local-user-summary-example.txt"
$users = Get-LocalUser | Sort-Object Name | ForEach-Object -Begin {$i=1} -Process {[pscustomobject]@{Name=("LocalUser{0:D2}" -f $i); Enabled=$ErrorActionPreference = "Stop"
$outputPath = Join-Path $PSScriptRoot "..\outputs\local-user-summary-example.txt"
$users = Get-LocalUser | Sort-Object Name | Select-Object Name, Enabled, LastLogon, PasswordRequired
$report=@()
$report+="=============================="
$report+="  Local User Summary Report"
$report+="=============================="
$report+=($users | Format-Table -AutoSize | Out-String).TrimEnd()
$report+="=============================="
$report | Tee-Object -FilePath $outputPath
Write-Host ""
Write-Host "Report saved to: $outputPath"
.Enabled; LastLogon=$ErrorActionPreference = "Stop"
$outputPath = Join-Path $PSScriptRoot "..\outputs\local-user-summary-example.txt"
$users = Get-LocalUser | Sort-Object Name | Select-Object Name, Enabled, LastLogon, PasswordRequired
$report=@()
$report+="=============================="
$report+="  Local User Summary Report"
$report+="=============================="
$report+=($users | Format-Table -AutoSize | Out-String).TrimEnd()
$report+="=============================="
$report | Tee-Object -FilePath $outputPath
Write-Host ""
Write-Host "Report saved to: $outputPath"
.LastLogon; PasswordRequired=$ErrorActionPreference = "Stop"
$outputPath = Join-Path $PSScriptRoot "..\outputs\local-user-summary-example.txt"
$users = Get-LocalUser | Sort-Object Name | Select-Object Name, Enabled, LastLogon, PasswordRequired
$report=@()
$report+="=============================="
$report+="  Local User Summary Report"
$report+="=============================="
$report+=($users | Format-Table -AutoSize | Out-String).TrimEnd()
$report+="=============================="
$report | Tee-Object -FilePath $outputPath
Write-Host ""
Write-Host "Report saved to: $outputPath"
.PasswordRequired}; $i++}
$report=@()
$report+="=============================="
$report+="  Local User Summary Report"
$report+="=============================="
$report+=($users | Format-Table -AutoSize | Out-String).TrimEnd()
$report+="=============================="
$report | Tee-Object -FilePath $outputPath
Write-Host ""
Write-Host "Report saved to: $outputPath"

