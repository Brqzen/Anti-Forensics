Write-Host "Clearing Compatibility Store"
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f
Start-Sleep -Milliseconds 100
Write-Host "Clearing MuiCache"
reg delete "HKCR\Local Settings\Software\Microsoft\Windows\Shell" /f
Start-Sleep -Milliseconds 100
Write-Host "Clearing ?"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage" /f
Start-Sleep -Milliseconds 100
Write-Host "Clearing ComDlg32"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32" /f
Start-Sleep -Milliseconds 100
Write-Host "Clearing RecentDocs"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
Start-Sleep -Milliseconds 100
Write-Host "Clearing UserAssist"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
Start-Sleep -Milliseconds 100
Write-Host "Clearing Taskband"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f
Start-Sleep -Milliseconds 100
Write-Host "Clearing RunMRU"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f
Start-Sleep -Milliseconds 100


taskkill /f /im explorer.exe
net stop EventLog


Write-Host "Clearing Prefetch"
Remove-Item "C:\Windows\Prefetch\*.pf" -Force
Start-Sleep -Milliseconds 100
Write-Host "Clearing Event Logs"
Remove-Item "C:\Windows\System32\winevt\Logs\*.evtx" -Force
Start-Sleep -Milliseconds 100
Write-Host "Clearing pca"
Remove-Item "C:\Windows\appcompat\pca\*.txt" -Force
Start-Sleep -Milliseconds 100
Write-Host "Clearing SRUM"
Remove-Item "C:\Windows\System32\sru\SRUDB.dat" -Force
Start-Sleep -Milliseconds 100
Write-Host "Clearing NvAppTimestamps"
Remove-Item "C:\ProgramData\NVIDIA Corporation\Drs\nvAppTimestamps" -Force
Start-Sleep -Milliseconds 100
Write-Host "Clearing Temp"
Remove-Item "$env:temp\*" -Force
Start-Sleep -Milliseconds 100
Write-Host "Clearing Recent Files"
Remove-Item "$env:AppData\Microsoft\Windows\Recent\*.lnk" -Force
Remove-Item "$env:AppData\Microsoft\Windows\Recent\CustomDestinations\*ms" -Force
Remove-Item "$env:AppData\Microsoft\Windows\Recent\AutomaticDestinations\*ms" -Force
Start-Sleep -Milliseconds 100
Write-Host "Clearing PSReadLine"
Remove-Item "$env:AppData\Microsoft\Windows\PowerShell\PSReadLine\*.txt" -Force
Start-Sleep -Milliseconds 100

Write-Host "Clearing ShimCache"
Rundll32.exe apphelp.dll,ShimFlushCache
Start-Sleep -Milliseconds 100

$drives = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }
foreach ($drive in $drives) {
    $driveLetter = $drive.DeviceID
    Write-Host "Deleting USN journal on $driveLetter"
    fsutil usn deleteJournal /d $driveLetter
}
Start-Sleep -Milliseconds 100

Start-Process explorer.exe
net start EventLog
Pause
