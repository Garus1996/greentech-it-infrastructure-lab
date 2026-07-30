$ReportPath = "C:\Temp"

if (!(Test-Path $ReportPath)) {
    New-Item -ItemType Directory -Path $ReportPath | Out-Null
}

Get-ComputerInfo |
Select-Object `
CsName,
WindowsProductName,
WindowsVersion,
CsDomain,
OsArchitecture |
Export-Csv "$ReportPath\SystemReport.csv" -NoTypeInformation

Write-Host ""
Write-Host "System report exported successfully." -ForegroundColor Green
Write-Host ""
Write-Host "Location: C:\Temp\SystemReport.csv"