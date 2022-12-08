$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent
$file_data = Get-Content "$($Script_base_path)\3.txt" -ErrorAction Stop -Encoding UTF8
$csv = Import-Csv  "$($Script_base_path)\1.CSV" -ErrorAction Stop -Delimiter ';' -Encoding UTF8
$summ = 0
$triCount = 0
$counter= 0
$secondcounter = 0
$stringArr = @("4744", "4744", "4744")

foreach($line in $file_data) {
    $stringArr[$triCount] = $line
    $triCount++
    
    if($triCount -eq 3){
        #work here
        foreach($char in $stringArr[0].ToCharArray()){
            if($stringArr[1].ToCharArray() -cmatch $char -and $stringArr[2].ToCharArray() -cmatch $char){
                foreach($entry in $csv){
                    if($char -cmatch $entry.Value){
                        $summ += $entry.Priority
                        $secondcounter++
                        break
                    }
                }
                break
            }
        }
        #var reset
        $stringArr = @("4744", "4744", "4744")
        $triCount = 0
    }
    $counter++
}
if($counter -ne $secondcounter * 3){
    "Error!!"
    $secondcounter
    $counter
    break
}
$summ