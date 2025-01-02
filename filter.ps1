#!/snap/bin/pwsh
param(
  [string] $file,
  [string] $base
)
$stage = 0
$instructions = Get-Content "instructions.txt"
foreach ($line in $instructions) {
  Write-Output $line
}
$lines = Get-Content $file
$other = Get-Content $base
foreach ($line in $lines) {
  if ($line -match "new entry") {
    $stage = 1
    continue
  }
  if ($line -match "^</s>") { break }
  if ($stage -eq 0) { continue }
  if ($line -match "Please let me know") { break }
  if ($line -match "Changes made") { break }
  $skip = $false
  foreach ($row in $other) {
    if ($row.contains($line)) { $skip = $true }
  }
  foreach ($row in $instructions) {
    if ($row.contains($line)) { $skip = $true }
  }
  if ($skip) { continue }
  if ($line -match "Name:") { Write-Output "" }
  Write-Output $line
}
