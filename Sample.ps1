$scriptName = $($MyInvocation.MyCommand.Name)
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

Import-Module $scriptPath\psInlineProgress.psm1 -Force

$TotalItems1 = 3
$TotalItems2 = 10
$TotalItems3 = 2
write-host "Start test" -ForegroundColor Yellow
for ($i1 = 0; $i1 -lt $TotalItems1; $i1++) {
    $percentComplete1 = ($i1 / $TotalItems1) * 100
    Write-InlineProgress -Activity "First Bar - Step $i1" -PercentComplete  $percentComplete1 -id 1
    Start-Sleep 1
    for ($i2 = 0; $i2 -lt $TotalItems2; $i2++) {
        $percentComplete2 = ($i2 / $TotalItems2) * 100
        Write-InlineProgress -Activity " Second Bar - Step $i2" -PercentComplete  $percentComplete2 -id 2
        #Start-Sleep 1
        for ($i3 = 0; $i3 -lt $TotalItems3; $i3++) {
            $percentComplete3 = ($i3 / $TotalItems3) * 100
            Write-InlineProgress -Activity "   Third Bar - Step $i3" -PercentComplete  $percentComplete3 -id 3
            Start-Sleep -Milliseconds 100
        }
        Write-InlineProgress -Activity "   Third Bar - Step $i3" -Completed -id 3
    }
    Write-InlineProgress -Activity "  Second Bar #$i1 - Step $i2" -Completed -id 2
}
Write-InlineProgress -Activity "First Bar - Step $i1" -Completed -id 1
write-host "End test" -ForegroundColor Yellow
