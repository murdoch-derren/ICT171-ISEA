$user_input = Read-Host -Prompt "Enter the folder to calculate"
$total_used = (Get-PSDrive C | Select-Object Used).Used
$folder = (Get-ChildItem -Recurse $user_input -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum

$percentage = $folder / $total_used * 100

Write-Host "Percentage usage for ${user_input}: $([math]::round($percentage, 2))%"
