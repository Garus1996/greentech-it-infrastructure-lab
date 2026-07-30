Write-Host ""
Write-Host "===== GreenTech Active Directory Users =====" -ForegroundColor Green
Write-Host ""

Import-Module ActiveDirectory

Get-ADUser -Filter * |
Sort-Object Name |
Select-Object Name, SamAccountName, Enabled

Write-Host ""
Write-Host "Active Directory users listed successfully." -ForegroundColor Cyan