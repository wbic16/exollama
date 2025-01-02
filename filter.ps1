#!/snap/bin/pwsh
param(
  [string] $file
)
$stage = 0
$instructions = Get-Content "instructions.txt"
foreach ($line in $instructions) {
  Write-Output $line
}
$lines = Get-Content $file

$name = ""
$born = ""
$bio = ""
foreach ($line in $lines) {
  if ($line -match "^Name:") {
    $name = $line -replace "Name:\s*",""
    continue
  }
  if ($line -match "^Born:") {
    $born = $line -replace "Born:\s*",""
  }
  if ($line -match "^Bio:") {
    $bio = $line -replace "Bio:\s*",""
  }
}
Write-Output ""
Write-Output "Name: $name"
Write-Output "Born: $born"
Write-Output "Bio: $bio"
