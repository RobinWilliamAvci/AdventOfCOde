$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent
$file_data = Get-Content "$($Script_base_path)\4.txt" -ErrorAction Stop -Encoding UTF8
$summ = 0
foreach($element in $file_data){
    $firstElve = $element.Split(",")[0]
    $secondElve = $element.Split(",")[1]

    if([int]$firstElve.Split("-")[0] -le [int]$secondElve.Split("-")[0] -and [int]$firstElve.Split("-")[1] -ge [int]$secondElve.Split("-")[0]){
        $summ += 1
    }
    elseif([int]$secondElve.Split("-")[0] -le [int]$firstElve.Split("-")[0] -and [int]$secondElve.Split("-")[1] -ge [int]$firstElve.Split("-")[0]){
        $summ +=1
    }
}
$summ