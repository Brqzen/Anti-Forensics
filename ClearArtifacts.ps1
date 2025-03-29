Write-Host "Clearing MuiCache"
reg delete "HKCR\Local Settings\Software\Microsoft\Windows\Shell" /f
Start-Sleep -Milliseconds 50
Write-Host "Clearing ComDlg32"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32" /f
Start-Sleep -Milliseconds 50
Write-Host "Clearing RecentDocs"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
Start-Sleep -Milliseconds 50
Write-Host "Clearing UserAssist"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
Start-Sleep -Milliseconds 50
Write-Host "Clearing RunMRU"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f
Start-Sleep -Milliseconds 50
Write-Host "Clearing Compatibility Store"
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f
Start-Sleep -Milliseconds 50
Write-Host "Clearing AppSwitch"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage" /f
Start-Sleep -Milliseconds 50
Write-Host "Clearing Taskband"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f

taskkill /f /im explorer.exe

net stop EventLog /y

Write-Host "Clearing Prefetch"
Remove-Item "C:\Windows\Prefetch\*.pf" -Force -Recurse
Write-Host "Clearing Event Logs"
Remove-Item "C:\Windows\System32\winevt\Logs\*.evtx" -Force -Recurse
Write-Host "Clearing pca"
Remove-Item "C:\Windows\appcompat\pca\*.txt" -Force -Recurse
Write-Host "Clearing SRUM"
Remove-Item "C:\Windows\System32\sru\SRUDB.dat" -Force -Recurse
Write-Host "Clearing NvAppTimestamps"
Remove-Item "C:\ProgramData\NVIDIA Corporation\Drs\nvAppTimestamps" -Force -Recurse
Write-Host "Clearing Recent Files"
Remove-Item "$env:AppData\Microsoft\Windows\Recent\*.lnk" -Force -Recurse
Remove-Item "$env:AppData\Microsoft\Windows\Recent\CustomDestinations\*ms" -Force -Recurse
Remove-Item "$env:AppData\Microsoft\Windows\Recent\AutomaticDestinations\*ms" -Force -Recurse
Write-Host "Clearing PSReadLine"
Remove-Item "$env:AppData\Microsoft\Windows\PowerShell\PSReadLine\*.txt" -Force -Recurse
Write-Host "Clearing Temp"
Remove-Item "$env:temp\*" -Force -Recurse

Write-Host "Clearing ShimCache"
Rundll32.exe apphelp.dll,ShimFlushCache

$drives = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }
foreach ($drive in $drives) {
    $driveLetter = $drive.DeviceID
    Write-Host "Deleting USN journal on $driveLetter"
    fsutil usn deleteJournal /d $driveLetter
}

Start-Process explorer.exe
net start EventLog /y
Pause
