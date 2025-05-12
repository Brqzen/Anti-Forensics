do {
    Clear-Host
    Write-Host "Select an option:"
    Write-Host "1 - Enable Services"
    Write-Host "2 - Disable Services"
    Write-Host "3 - Check Services"
    Write-Host "0 - Exit"

    $choice = Read-Host "Enter 0, 1, 2, or 3"

    switch ($choice) {
        "1" { 
        Write-Host "Enabling Sysmain"
            sc.exe config sysmain start=auto
        Write-Host "Enabling cdpsvc"
            sc.exe config cdpsvc start=auto
        Write-Host "Enabling pcasvc"
            sc.exe config pcasvc start=auto
        Write-Host "Enabling dps"
            sc.exe config dps start=auto
        Write-Host "Enabling EventLog"
            sc.exe config eventlog start=auto
        Write-Host "Enabling Scheduler"
            sc.exe config scheduler start=auto
        Write-Host "Enabling SearchIndexer"
            sc.exe config searchindexer start=auto
        Write-Host "Enabling BAM"
            sc.exe config bam start=auto
        Write-Host "Enabling DusmSvc"
            sc.exe config dusmsvc start=auto
        Write-Host "Enabling AppInfo"
            sc.exe config appinfo start=auto
        Write-Host "Enabling Diagtrack"
            sc.exe config diagtrack start=auto
        Write-Host "Enabling SgrmBroker"
            sc.exe config sgrmbroker start=auto
            Write-Host "Services enabled." 
        }
        "2" { 
        Write-Host "Disabling Sysmain"
            sc.exe config sysmain start=disabled
        Write-Host "Disabling cdpsvc"
            sc.exe config cdpsvc start=disabled
        Write-Host "Disabling pcasvc"
            sc.exe config pcasvc start=disabled
        Write-Host "Disabling dps"
            sc.exe config dps start=disabled
        Write-Host "Disabling EventLog"
            sc.exe config eventlog start=disabled
        Write-Host "Disabling Scheduler"
            sc.exe config scheduler start=disabled
        Write-Host "Disabling SearchIndexer"
            sc.exe config searchindexer start=disabled
        Write-Host "Disabling BAM"
            sc.exe config bam start=disabled
        Write-Host "Disabling DusmSvc"
            sc.exe config dusmsvc start=disabled
        Write-Host "Disabling AppInfo"
            sc.exe config appinfo start=disabled
        Write-Host "Disabling Diagtrack"
            sc.exe config diagtrack start=disabled
        Write-Host "Disabling SgrmBroker"
            sc.exe config sgrmbroker start=disabled
            Write-Host "Services disabled." 
        }
        "3" { 
            cls
            Required Services
            get-service | findstr -i "sysmain"
            get-service | findstr -i "cdpsvc"
            get-service | findstr -i "pcasvc"
            get-service | findstr -i "dps"
            get-service | findstr -i "eventlog"
            get-service | findstr -i "scheduler"
            get-service | findstr -i "searchindexer"
            get-service | findstr -i "bam"
            get-service | findstr -i "dusmsvc"
            get-service | findstr -i "appinfo"
        Write-Host "Not Required Services"
            get-service | findstr -i "diagtrack"
            get-service | findstr -i "sgrmbroker"
        }
        "0" { Write-Host "Exiting..."; return 0 }
        default { Write-Host "Invalid choice, please select 0, 1, 2, or 3." }
    }
pause
} while ($true)



