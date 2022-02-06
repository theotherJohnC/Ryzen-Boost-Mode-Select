
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

function aggOn {
    powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 2
    powercfg -setdcvalueindex scheme_current sub_processor PERFBOOSTMODE 2
}
function promptMode {
    $powerMode = Read-Host "Which power mode would you like (1, 2)"
    switch ($powerMode) {
        1 {
            Write-Host "`nSetting Ryzen Boost to ENABLED...`n"
            Start-Sleep -s 3
            boostOn
            $null = Read-Host 'Ryzen Boost is set to ON. Press any key to exit'
        }
        2 {
            Write-Host "`nSetting Ryzen Boost to ENABLED on AC POWER only...`n"
            Start-Sleep -s 3
            acOn
            $null = Read-Host 'Ryzen Boost is set to ENABLED on AC POWER only. Press any key to exit'
        }
        3 {
            Write-Host "`nSetting Ryzen Boost to AGGRESSIVE...`n"
            Start-Sleep -s 3
            aggOn
            $null = Read-Host 'Ryzen Boost is set to AGGRESSIVE. Press any key to exit'
        }
        4 {
            Write-Host "`nSetting Ryzen Boost to DISABLED...`n"
            Start-Sleep -s 3
            boostOff
            $null = Read-Host 'Ryzen Boost is set to DISABLED. Press any key to exit'
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
    Write-Host "1) Ryzen Boost ENABLED (higher CPU performance)"
    Write-Host "2) Ryzen Boost ENABLED on AC POWER only (power efficiency, lower temperatures)"
    Write-Host "3) Ryzen Boost AGGRESSIVE (highest CPU performance)"
    Write-Host "4) Ryzen Boost DISABLED`n"
    promptMode
}

$modeSwitch = $args[0]
switch ($modeSwitch) {
    "-enabled" {
        boostOn
    }
    "-enabledonac" {
        acOn
    }
    "-aggressive" {
        aggOn
    }
    "-disabled" {
        boostOff
    }
    default {
        writeMenu
    }
}