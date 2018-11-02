param([string]$Feature)
$restartNeeded = (Add-WindowsFeature $Feature).RestartNeeded -eq 'No'