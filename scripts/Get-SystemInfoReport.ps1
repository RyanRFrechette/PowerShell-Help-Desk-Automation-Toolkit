$outputFolder = Join-Path $PSScriptRoot '..\outputs'
$outputFile   = Join-Path $outputFolder 'system-info-example.txt'

$computerSystem = Get-CimInstance -ClassName Win32_ComputerSystem
$operatingSystem = Get-CimInstance -ClassName Win32_OperatingSystem
$processor       = Get-CimInstance -ClassName Win32_Processor | Select-Object -First 1

$hostName      = $env:COMPUTERNAME
$osVersion     = $operatingSystem.Caption
$totalRamGB    = [math]::Round($computerSystem.TotalPhysicalMemory / 1GB, 2)
$cpuName       = $processor.Name.Trim()
$lastBootTime  = $operatingSystem.LastBootUpTime
$uptimeSpan    = (Get-Date) - $lastBootTime
$uptimeString  = '{0}d {1}h {2}m' -f $uptimeSpan.Days, $uptimeSpan.Hours, $uptimeSpan.Minutes

$reportLines = @(
    '==============================',
    '  System Information Report',
    '==============================',
    "Hostname    : $hostName",
    "OS Version  : $osVersion",
    "Uptime      : $uptimeString",
    "Total RAM   : $totalRamGB GB",
    "CPU         : $cpuName",
    '=============================='
)

$reportLines | ForEach-Object { Write-Host $_ }

if (-not (Test-Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder | Out-Null
}

$reportLines | Out-File -FilePath $outputFile -Encoding UTF8
Write-Host "`nReport saved to: $outputFile"
