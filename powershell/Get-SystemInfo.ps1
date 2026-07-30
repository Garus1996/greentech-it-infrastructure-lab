Write-Host ""
Write-Host "===== GreenTech System Information =====" -ForegroundColor Green
Write-Host ""

Get-ComputerInfo |
Select-Object `
CsName,
WindowsProductName,
WindowsVersion,
OsArchitecture,
CsDomain,
BiosManufacturer,
BiosVersion

Write-Host ""
Write-Host "Completed successfully." -ForegroundColor Cyan