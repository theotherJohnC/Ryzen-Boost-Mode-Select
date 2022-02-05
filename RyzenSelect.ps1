function promptMode {
    $powerMode = Read-Host "Which power mode would you like (1, 2)"
    switch ($powerMode) {
        1 {
            Write-Host "`nSetting Ryzen Boost to ON...`n"
            Start-Sleep -s 3
            powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 1
            powercfg -setdcvalueindex scheme_current sub_processor PERFBOOSTMODE 1
            $null = Read-Host 'Ryzen Boost is set to ON. Press any key to exit'
        }
        2 {
            Write-Host "`nSetting Ryzen Boost to OFF...`n"
            Start-Sleep -s 3
            powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 0
            powercfg -setdcvalueindex scheme_current sub_processor PERFBOOSTMODE 0
            $null = Read-Host 'Ryzen Boost is set to OFF. Press any key to exit'
        }
        default {
            Write-Host "`n`nYou didn't select a valid menu option.`n"
            $null = Read-Host 'Press any key to exit...'
        }
    }
}

function writeMenu {
    Clear-Host
    Write-Host "Ryzen Boost Mode Selection Utility"
    Write-Host "Written by John Crist (john.crist@outlook.com)`n"
    Write-Host "Please select from the following performance modes:"
    Write-Host "1) Ryzen Boost ON (higher CPU performance)"
    Write-Host "2) Ryzen Boost OFF (power efficiency, lower temperatures)`n"
    promptMode
}

writeMenu