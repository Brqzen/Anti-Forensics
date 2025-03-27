Write-Host "Please fully close all Minecraft Launchers, AnyDesk, and Discord before continuing."
pause

Write-Host "Clearing Discord Traces"
Remove-Item "$env:AppData\discord\Local Storage\leveldb\*.ldb" -Force

Write-Host "Clearing AnyDesk Traces"
Remove-Item "$env:AppData\AnyDesk" -Force

Write-Host "Clearing .minecraft Traces"
Remove-Item "$env:AppData\.minecraft\user*" -Force
Remove-Item "$env:AppData\.minecraft\launcher*" -Force
Remove-Item "$env:AppData\.minecraft\logs" -Force
Remove-Item "$env:AppData\.minecraft\clientId.txt" -Force

Write-Host "Clearing Badlion Traces"
Remove-Item "$env:AppData\Badlion Client" -Force

Write-Host "Clearing Lunar Traces"
Remove-Item "$env:AppData\lunarclient" -Force

pause
