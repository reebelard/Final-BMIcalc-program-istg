if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        $Command = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath PowerShell.exe -Verb RunAs -ArgumentList $Command
        Exit
 }
}

$new_entry = 'C:\Program Files\MySQL\MySQL Workbench 8.0\'

$old_path = [Environment]::GetEnvironmentVariable('path', 'machine');
$new_path = $old_path + ';' + $new_entry
[Environment]::SetEnvironmentVariable('path', $new_path,'Machine');