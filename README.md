# RyzenSelect
This simple and lightweight utility was created to allow you to quickly and easily switch Boost Mode on, off, and on when on DC power (plugged in) quickly and easily. Some gaming laptops, when running with Boost set to On, will thermal throttle needlessly when gaming performance won't be affected noticeable. Further, Windows is beginning to hide the CPU power settings by default, forcing users to edit the registry in order to expose the settings. This utility allows a user to bypass all of that and instructs Windows directly whether Boost should be on or off.

## Dependencies
1) Microsoft Windows 10/11 (untested and unsupported on all prior versions)
2) PowerShell - Included with Microsoft Windows by default, and PowerShell Core is available from [GitHub](https://github.com/PowerShell/PowerShell)

It should also be noted that, while this technically should work for Intel processors as well, it is untested on any Intel machines. If you happen to use it and it happens to work, please let me know!

## Usage

There are two ways to use the utility. Running the executable (.exe) directly presents a brief menu with selections. You can also call the PowerShell script (.ps1) with the following arguments:

**Setting Boost Mode to Always On**
```
.\RyzenSelect.ps1 on
```

**Setting Boost Mode to Always Off**
```
.\RyzenSelect.ps1 off
```
**Setting Boost Mode to On when plugged in, Off when on battery**
```
.\RyzenSelect.ps1 acon
```

## Roadmap
My intention is to use WinForms to give users a GUI to quickly launch, select a mode, and exit rather than a CLI menu. I also would like to display the current mode and, if possible, processor sensor statistics.

## Disclaimer and License
If you use this software, you use it ON YOUR OWN RISK. I **DO NOT** accept responsibility for anything that happens with the use of this software. Nothing here *should* cause anything bad to happen, and between PowerShell's safeguards and the means by which this software controls the power configuration the worst that should happen is it simply doesn't change anything, but this paragraph is just here so I can sleep at night. ;)

This software is licenced under the  [GPLv3](https://www.gnu.org/licenses/gpl-3.0.html)

This is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU GPL for more detail.