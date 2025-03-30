Write-Host "Please fully close all Minecraft Launchers, AnyDesk, and Discord before continuing."
pause

Write-Host "Clearing Discord Traces"
Remove-Item "$env:AppData\discord\Local Storage\leveldb\*.ldb" -Force -Recurse

Write-Host "Clearing AnyDesk Traces"
Remove-Item "$env:AppData\AnyDesk" -Force -Recurse

Write-Host "Clearing .minecraft Traces"
Remove-Item "$env:AppData\.minecraft\user*" -Force -Recurse
Remove-Item "$env:AppData\.minecraft\launcher*" -Force -Recurse
Remove-Item "$env:AppData\.minecraft\logs" -Force -Recurse
Remove-Item "$env:AppData\.minecraft\clientId.txt" -Force -Recurse

Write-Host "Clearing Badlion Traces"
Remove-Item "$env:AppData\Badlion Client" -Force -Recurse

Write-Host "Clearing Lunar Traces"
Remove-Item "$env:AppData\lunarclient" -Force -Recurse

pause
