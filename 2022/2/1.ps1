$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent
$file_data = Get-Content "$($Script_base_path)\Zweite_Aufgabe.txt" -ErrorAction Stop -Encoding UTF8
$score = 0
foreach($line in $file_data) {
    if($line -like "*A*" -and $line -like "*X*"){
        $score = $score + 4
    }
    if($line -like "*B*" -and $line -like "*Y*"){
        $score = $score + 5
    }
    if($line -like "*C*" -and $line -like "*Z*"){
        $score = $score + 6
    }
    if($line -like "*A*" -and $line -like "*Y*"){
        $score = $score + 8
    }
    if($line -like "*B*" -and $line -like "*Z*"){
        $score = $score + 9
    }
    if($line -like "*C*" -and $line -like "*X*"){
        $score = $score + 7
    }
    if($line -like "*A*" -and $line -like "*Z*"){
        $score = $score + 3
    }
        if($line -like "*B*" -and $line -like "*X*"){
        $score = $score + 1
    }
        if($line -like "*C*" -and $line -like "*Y*"){
        $score = $score + 2
    }
}
$score