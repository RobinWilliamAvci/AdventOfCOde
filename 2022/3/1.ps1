$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent
$file_data = Get-Content "$($Script_base_path)\3.txt" -ErrorAction Stop -Encoding UTF8
$csv = Import-Csv  "$($Script_base_path)\1.CSV" -ErrorAction Stop -Delimiter ';' -Encoding UTF8
$summ = 0
$counter= 0
$secondcounter = 0
foreach($line in $file_data) {
    $counter++
    $comp1 = $line.Substring(0,[int]$line.Length / 2)
    $comp2 = $line.Substring($line.Length / 2)
    foreach($char in $line.ToCharArray()){
    #$char
        if($comp2.Contains($char)){
            foreach($entry in $csv){
                #$entry.Value
                if($entry.Value -cmatch $char){
                    $secondcounter++
                    #$entry.Priority
                    $summ = $summ + $entry.Priority
                    break
                }
            }
        break
        }
    }
}
$counter
$secondcounter
$summ