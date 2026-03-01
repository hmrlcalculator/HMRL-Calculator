do {
    $d = 0
    do {
        $level = Read-Host "What level are you grinding (1-5)"
        switch ($level) {
            "1" { $d = 0.44693 }
            "2" { $d = 0.21164 }
            "3" { $d = 0.13158 }
            "4" { $d = 0.11494 }
            "5" { $d = 0.07491 }
        }
    } until ($d -ne 0)

    $b = 0
    do {
        $server = (Read-Host "Enter server type (vip, small public, big public)").ToLower()
        if ($server -match "vip" -or $server -match "small") { $b = 66.66666 }
        elseif ($server -match "big") { $b = 100 }
    } until ($b -ne 0)

    $c = -1
    do {
        $inputC = Read-Host "Enter your pity progress (0-$b)"
        if (-not [string]::IsNullOrWhiteSpace($inputC) -and $inputC -as [double] -ne $null) {
            $tempC = [double]$inputC
            if ($tempC -ge 0 -and $tempC -le $b) { $c = $tempC }
        }
    } until ($c -ne -1)

    $a = [Math]::Ceiling(($b - $c) / $d)
    
    Write-Host -NoNewline "Robberies left: "
    Write-Host $a -ForegroundColor Green

    $again = ""
    do {
        $again = (Read-Host "Calculate again (yes/no)").ToLower()
    } until ($again -eq "yes" -or $again -eq "no")
} while ($again -eq "yes")