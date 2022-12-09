$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent
$file_data = Get-Content "$($Script_base_path)\input" -ErrorAction Stop -Encoding UTF8
# Final String Variable
$output = "4711"
# Multydimensional Array
$multyArr = @()
# counter
$i = 0

# read input "Cargo" -> see adventofcode day 5
foreach($line in $file_data){
    if($line.Contains("[")){
        #$line
        $multyArr += $line
    }
    $i++
    if($line -match 1){
        break
    }
}

# reverse readed input
[array]::Reverse($multyArr)

# reset counter
$i = 0
foreach($string in $multyArr){
    # split each string at the 4th Position and write the array back to the Multydimensional Array
    $multyArr[$i] = $string -split '(.{4})' -ne ''
    $i++
}

# Visualisation Start
## it ist only to print out what happend
$str = ""
$i2 = 0
$i3 = 0
while($i2 -lt $multyArr.Length){
    while($i3 -lt $multyArr[$i2].Length){
        $str = $str + $multyArr[$i2][$i3]
        $i3++
    }
    $str
    $str = ""
    $i3 = 0
    $i2++
}
# Visualtisation End