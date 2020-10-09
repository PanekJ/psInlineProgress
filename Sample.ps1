$scriptName = $($MyInvocation.MyCommand.Name)
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

Import-Module $scriptPath\psInlineProgress.psm1 -Force

$Progress = @{
    ProgressChar     = "$(New-Text '◧' -ForegroundColor 'Orange')"
    ProgressFillChar = "$(New-Text '■' -ForegroundColor 'YellowGreen')"
    BarBracketStart  = "$(New-Text '[' -ForegroundColor 'DarkBlue')"
    BarBracketEnd    = "$(New-Text ']' -ForegroundColor 'DarkBlue')"
    ProgressFill     = "$(New-Text '□' -ForegroundColor 'DarkRed')"
    ErrorChar        = "$(New-Text '⊠' -ForegroundColor 'DarkRed')"
}

$TotalItems1 = 3
$TotalItems2 = 10
$TotalItems3 = 2
Write-Host "Start test" -ForegroundColor Yellow
for ($i1 = 0; $i1 -lt $TotalItems1; $i1++) {
    $percentComplete1 = ($i1 / $TotalItems1) * 100
    $Text = "First Bar - Step $i1"
    Write-InlineProgress -Activity "$(New-Text $Text -ForegroundColor 'Magenta')" -PercentComplete  $percentComplete1 -id 1 -ProgressCharacter $Progress.ProgressChar -ProgressFillCharacter $Progress.ProgressFillChar -BarBracketStart $Progress.BarBracketStart -BarBracketEnd $Progress.BarBracketEnd -ProgressFill $Progress.ProgressFill -ShowPercent
    Start-Sleep 1
    for ($i2 = 0; $i2 -lt $TotalItems2; $i2++) {
        $percentComplete2 = ($i2 / $TotalItems2) * 100
        $Text = " Second Bar - Step $i2"
        Write-InlineProgress -Activity "$(New-Text $Text -ForegroundColor 'Magenta')" -PercentComplete  $percentComplete2 -id 2 -ProgressCharacter $Progress.ProgressChar -ProgressFillCharacter $Progress.ProgressFillChar -BarBracketStart $Progress.BarBracketStart -BarBracketEnd $Progress.BarBracketEnd -ProgressFill $Progress.ProgressFill -ShowPercent
        #Start-Sleep 1
        for ($i3 = 0; $i3 -lt $TotalItems3; $i3++) {
            $percentComplete3 = ($i3 / $TotalItems3) * 100
            $Text = "   Third Bar - Step $i3"
            Write-InlineProgress -Activity "$(New-Text $Text -ForegroundColor 'Magenta')" -PercentComplete  $percentComplete3 -id 3 -ProgressCharacter $Progress.ProgressChar -ProgressFillCharacter $Progress.ProgressFillChar -BarBracketStart $Progress.BarBracketStart -BarBracketEnd $Progress.BarBracketEnd -ProgressFill $Progress.ProgressFill -ShowPercent
            Start-Sleep -Milliseconds 100
        }
        Write-InlineProgress -Activity "$(New-Text $Text -ForegroundColor 'Magenta')" -Completed -id 3 -ProgressCharacter $Progress.ProgressChar -ProgressFillCharacter $Progress.ProgressFillChar -BarBracketStart $Progress.BarBracketStart -BarBracketEnd $Progress.BarBracketEnd -ProgressFill $Progress.ProgressFill -ShowPercent
    }
    $Text = "  Second Bar #$i1 - Step $i2"
    Write-InlineProgress -Activity "$(New-Text $Text -ForegroundColor 'Magenta')" -Completed -id 2 -ProgressCharacter $Progress.ProgressChar -ProgressFillCharacter $Progress.ProgressFillChar -BarBracketStart $Progress.BarBracketStart -BarBracketEnd $Progress.BarBracketEnd -ProgressFill $Progress.ProgressFill -ShowPercent
}
$Text = "First Bar - Step $i1"
Write-InlineProgress -Activity "$(New-Text $Text -ForegroundColor 'Magenta')" -Completed -id 1 -ProgressCharacter $Progress.ProgressChar -ProgressFillCharacter $Progress.ProgressFillChar -BarBracketStart $Progress.BarBracketStart -BarBracketEnd $Progress.BarBracketEnd -ProgressFill $Progress.ProgressFill -ShowPercent
Write-Host "End test" -ForegroundColor Yellow
