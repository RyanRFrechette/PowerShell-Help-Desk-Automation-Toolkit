$ErrorActionPreference = "SilentlyContinue"
$outputPath = Join-Path $PSScriptRoot "..\outputs\network-connectivity-example.txt"
$gateway = (Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway } | Select-Object -First 1).IPv4DefaultGateway.NextHop
$dnsServer = (Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object { $_.ServerAddresses } | Select-Object -First 1).ServerAddresses[0]
$checks = @()
$checks += [pscustomobject]@{ Check="Default Gateway"; Target=$gateway; Result=if(Test-Connection $gateway -Count 2 -Quiet){"PASS"}else{"FAIL"} }
$checks += [pscustomobject]@{ Check="DNS Server"; Target=$dnsServer; Result=if(Test-Connection $dnsServer -Count 2 -Quiet){"PASS"}else{"FAIL"} }
$checks += [pscustomobject]@{ Check="Internet IP"; Target="8.8.8.8"; Result=if(Test-Connection "8.8.8.8" -Count 2 -Quiet){"PASS"}else{"FAIL"} }
$checks += [pscustomobject]@{ Check="DNS Resolution"; Target="google.com"; Result=if(Resolve-DnsName "google.com"){"PASS"}else{"FAIL"} }
$report=@()
$report+="=============================="
$report+="  Network Connectivity Report"
$report+="=============================="
$report+=($checks | Format-Table -AutoSize | Out-String).TrimEnd()
$report+="=============================="
$report | Tee-Object -FilePath $outputPath
Write-Host ""
Write-Host "Report saved to: $outputPath"
