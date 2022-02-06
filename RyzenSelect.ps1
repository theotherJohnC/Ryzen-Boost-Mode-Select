
function boostOn {
    powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 1
    powercfg -setdcvalueindex scheme_current sub_processor PERFBOOSTMODE 1
}

function boostOff {
    powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 0
    powercfg -setdcvalueindex scheme_current sub_processor PERFBOOSTMODE 0
}

function acOn {
    powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 1
    powercfg -setdcvalueindex scheme_current sub_processor PERFBOOSTMODE 0
}
function promptMode {
    $powerMode = Read-Host "Which power mode would you like (1, 2)"
    switch ($powerMode) {
        1 {
            Write-Host "`nSetting Ryzen Boost to ON...`n"
            Start-Sleep -s 3
            boostOn
            $null = Read-Host 'Ryzen Boost is set to ON. Press any key to exit'
        }
        2 {
            Write-Host "`nSetting Ryzen Boost to OFF...`n"
            Start-Sleep -s 3
            boostOff
            $null = Read-Host 'Ryzen Boost is set to OFF. Press any key to exit'
        }
        3 {
            Write-Host "`nSetting Ryzen Boost to ON only when plugged in...`n"
            Start-Sleep -s 3
            acOn
            $null = Read-Host 'Ryzen Boost is set to ON only when plugged in. Press any key to exit'
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
    Write-Host "2) Ryzen Boost OFF (power efficiency, lower temperatures)"
    Write-Host "3) Ryzen Boost ON when plugged in, OFF when on battery`n"
    promptMode
}

$modeSwitch = $args[0]
switch ($modeSwitch) {
    "on" {
        boostOn
    }
    "off" {
        boostOff
    }
    "ac" {
        acOn
    }
    default {
        writeMenu
    }
}