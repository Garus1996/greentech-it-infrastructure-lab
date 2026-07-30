Write-Host ""
Write-Host "===== GreenTech Service Report =====" -ForegroundColor Green
Write-Host ""

Get-Service |
Where-Object {
    $_.Status -eq "Running"
} |
Sort-Object DisplayName |
Select-Object Status, Name, DisplayName

Write-Host ""
Write-Host "Running services displayed successfully." -ForegroundColor Cyan