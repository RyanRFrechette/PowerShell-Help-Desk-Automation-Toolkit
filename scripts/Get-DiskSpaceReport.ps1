$outputFile = Join-Path $PSScriptRoot "..\outputs\disk-space-example.txt"

$fixedDrives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Used -ne $null -and $_.Free -ne $null }

$reportLines = foreach ($drive in $fixedDrives) {
    $totalBytes  = $drive.Used + $drive.Free
    $totalGB     = [math]::Round($totalBytes / 1GB, 1)
    $freeGB      = [math]::Round($drive.Free  / 1GB, 1)
    $percentFree = if ($totalBytes -gt 0) { [math]::Round(($drive.Free / $totalBytes) * 100, 1) } else { 0 }
    $lowMarker   = if ($percentFree -lt 15) { " [LOW]" } else { "" }

    "{0,-6} Total: {1,8} GB   Free: {2,8} GB   % Free: {3,6}%{4}" -f `
        "$($drive.Name):", $totalGB, $freeGB, $percentFree, $lowMarker
}

$header    = "Disk Space Report — $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
$separator = "-" * 60
$output    = @($header, $separator) + $reportLines + $separator

$output | ForEach-Object { Write-Host $_ }
$output | Out-File -FilePath $outputFile -Encoding UTF8
