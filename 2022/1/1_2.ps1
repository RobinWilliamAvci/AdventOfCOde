$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent
$file_data = Get-Content "$($Script_base_path)\Erste_Aufgabe.txt" -ErrorAction Stop -Encoding UTF8
$arr = 1..254    #Array
$counter = 0
$summ = 0
$max = 0
foreach($line in $file_data) {
    $summ = $summ + [int]$line
    if($line -NotMatch "^\d+$"){
        # Work here
        #$file_data[$line]
        $arr[$counter] = $summ 
        $counter = $counter +1
        $summ = 0
    }
}
"Erste Aufgabe: "
$arr | sort -Descending | select -First 1
"Zweite Aufgabe: "
$arr| sort -Descending | select -First 3 | Measure-Object -Sum
#$counter