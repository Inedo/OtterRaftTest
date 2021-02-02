<#
    .SYNOPSIS
    A demo script that shows off a few features of Otter

    .PARAMETER YourName
    When specified, the script will behave a little differently

    .PARAMETER EnableCuteMode
    When checked, the script will display an Otter in ASCII Art
#>

param ([string]$YourName, [bool]$EnableCuteMode)

Write-Output "`n$('=' * 100)`n== Otter Demo script`n$('=' * 100)"

if ($YourName) {
  Write-Output @"
  
Hello $YourName! 

You've successfully passed a parameter to the script.
"@

} else {

  Write-Output @"
  
Hello from PowerShell!

Otter can run PowerShell Scripts you write against the servers you target. That's what's
technically happening here, but this script doesn't do much.

Of course, a PowerShell script normally does a lot more than just write log messages like 
this, but this is a demo, and it didn't seem appropriate to do things to your server.
"@

}

if ($EnableCuteMode) {
  Write-Output "`n**Cute mode enabled! Please standby...**`n"
  Start-Sleep 2
  Write-Output "`n       .-`"`"`"-.`n       /      o\`n      |    o   0).-.`n      |       .-;(_/     .-.`n       \     /  /)).---._|  ``\   ,`n        '.  '  /((       ``'-./ _/|`n          \  .'  )        .-.;``  /`n           '.             |  ``\-'`n             '._        -'    /`n                `````"`"--``------``"
  Start-Sleep 2
} else {

  Write-Output "Sleeping for 3 seconds..."
  Start-Sleep 3

}

Write-Host Demo script finished!

Write-Output "`n$('=' * 100)`n== / Otter Demo script`n$('=' * 100)"