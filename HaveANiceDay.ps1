$user = [System.Environment]::UserName
$hostName = [System.Environment]::MachineName

# Detect OS and hardware details
if ($IsWindows -or $env:OS -like "*Windows*") {
    $osDetail = (Get-CimInstance Win32_OperatingSystem).Caption
    $ramGB = [math]::Round((Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB, 2)
} else {
    $osDetail = [System.Runtime.InteropServices.RuntimeInformation]::OSDescription
    $ramGB = "N/A"
}

$psVersion = $PSVersionTable.PSVersion.ToString()

Write-Host "Hello world from $user on $hostName"
Write-Host "----------------------------------------"
Write-Host "OS:                 $osDetail"
Write-Host "PowerShell Version: $psVersion"
Write-Host "Total RAM:          $ramGB GB"