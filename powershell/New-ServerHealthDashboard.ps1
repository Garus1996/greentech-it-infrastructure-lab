# GreenTech Server Health Dashboard
# Generates an HTML health report for GT-DC01.

$ErrorActionPreference = "SilentlyContinue"

$ReportDirectory = "C:\Temp\GreenTechReports"
$ReportPath = Join-Path $ReportDirectory "ServerHealthDashboard.html"

New-Item -ItemType Directory -Path $ReportDirectory -Force | Out-Null

$ComputerSystem = Get-CimInstance Win32_ComputerSystem
$OperatingSystem = Get-CimInstance Win32_OperatingSystem

$LastBootTime = $OperatingSystem.LastBootUpTime
$Uptime = (Get-Date) - $LastBootTime

$TotalMemoryGB = [math]::Round(
    $ComputerSystem.TotalPhysicalMemory / 1GB,
    2
)

$FreeMemoryGB = [math]::Round(
    $OperatingSystem.FreePhysicalMemory / 1MB,
    2
)

$UsedMemoryGB = [math]::Round(
    $TotalMemoryGB - $FreeMemoryGB,
    2
)

$SystemInformation = [PSCustomObject]@{
    ComputerName    = $env:COMPUTERNAME
    Domain          = $ComputerSystem.Domain
    OperatingSystem = $OperatingSystem.Caption
    OSVersion       = $OperatingSystem.Version
    LastBootTime    = $LastBootTime
    UptimeDays      = [math]::Round($Uptime.TotalDays, 2)
}

$MemoryInformation = [PSCustomObject]@{
    TotalMemoryGB = $TotalMemoryGB
    UsedMemoryGB  = $UsedMemoryGB
    FreeMemoryGB  = $FreeMemoryGB
}

$DiskInformation = Get-CimInstance Win32_LogicalDisk |
    Where-Object DriveType -eq 3 |
    Select-Object DeviceID,
        @{Name = "SizeGB"; Expression = {
            [math]::Round($_.Size / 1GB, 2)
        }},
        @{Name = "FreeSpaceGB"; Expression = {
            [math]::Round($_.FreeSpace / 1GB, 2)
        }},
        @{Name = "FreePercent"; Expression = {
            if ($_.Size -gt 0) {
                [math]::Round(($_.FreeSpace / $_.Size) * 100, 2)
            }
        }}

$CriticalServices = Get-Service DNS, DHCPServer, NTDS, W32Time |
    Select-Object DisplayName, Name, Status, StartType

$RecentSystemErrors = Get-WinEvent -FilterHashtable @{
    LogName   = "System"
    Level     = 2
    StartTime = (Get-Date).AddDays(-1)
} -MaxEvents 10 |
    Select-Object TimeCreated, Id, ProviderName, LevelDisplayName,
        @{Name = "Message"; Expression = {
            ($_.Message -replace "`r|`n", " ")
        }}

$RecentSecurityEvents = Get-WinEvent -FilterHashtable @{
    LogName   = "Security"
    StartTime = (Get-Date).AddHours(-24)
} -MaxEvents 10 |
    Select-Object TimeCreated, Id, ProviderName,
        @{Name = "Message"; Expression = {
            ($_.Message -replace "`r|`n", " ")
        }}

$InstalledUpdates = Get-HotFix |
    Sort-Object InstalledOn -Descending |
    Select-Object -First 10 HotFixID, Description, InstalledOn

$FirewallProfiles = Get-NetFirewallProfile |
    Select-Object Name, Enabled, DefaultInboundAction,
        DefaultOutboundAction

$HtmlStyle = @"
<style>
body {
    font-family: Arial, sans-serif;
    margin: 30px;
    background-color: #f4f6f8;
    color: #222;
}

h1 {
    background-color: #1f4e78;
    color: white;
    padding: 18px;
}

h2 {
    margin-top: 30px;
    color: #1f4e78;
    border-bottom: 2px solid #1f4e78;
    padding-bottom: 5px;
}

table {
    border-collapse: collapse;
    width: 100%;
    margin-bottom: 25px;
    background-color: white;
}

th {
    background-color: #d9eaf7;
    text-align: left;
}

th,
td {
    border: 1px solid #bbbbbb;
    padding: 8px;
    vertical-align: top;
}

.footer {
    margin-top: 30px;
    font-size: 12px;
    color: #666666;
}
</style>
"@

$HtmlBody = @"
<h1>GreenTech Server Health Dashboard</h1>

<p>
Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
</p>

<h2>System Information</h2>
$($SystemInformation | ConvertTo-Html -Fragment)

<h2>Memory Information</h2>
$($MemoryInformation | ConvertTo-Html -Fragment)

<h2>Disk Information</h2>
$($DiskInformation | ConvertTo-Html -Fragment)

<h2>Critical Services</h2>
$($CriticalServices | ConvertTo-Html -Fragment)

<h2>Firewall Profiles</h2>
$($FirewallProfiles | ConvertTo-Html -Fragment)

<h2>Recent System Errors</h2>
$($RecentSystemErrors | ConvertTo-Html -Fragment)

<h2>Recent Security Events</h2>
$($RecentSecurityEvents | ConvertTo-Html -Fragment)

<h2>Recently Installed Updates</h2>
$($InstalledUpdates | ConvertTo-Html -Fragment)

<div class="footer">
GreenTech IT Infrastructure Lab
</div>
"@

ConvertTo-Html `
    -Title "GreenTech Server Health Dashboard" `
    -Head $HtmlStyle `
    -Body $HtmlBody |
    Set-Content -Path $ReportPath -Encoding UTF8

Write-Host ""
Write-Host "Server health dashboard created successfully."
Write-Host "Report path: $ReportPath"
Write-Host ""