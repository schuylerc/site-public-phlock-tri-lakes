$basePath = 'c:\Users\tntjt\OneDrive\Documents\GitHub\site-public-phlock-tri-lakes\public\pics\gallery'
$jsPath = 'c:\Users\tntjt\OneDrive\Documents\GitHub\site-public-phlock-tri-lakes\public\js\gallery-data.js'

$co = (Get-ChildItem -Path (Join-Path $basePath 'Community Outreach') -File | Sort-Object LastWriteTime, @{Expression={ if ($_.Name -match '^\d+') { [int64]$matches[0] } else { 0 } }}, Name).Name
$ph2026 = (Get-ChildItem -Path (Join-Path $basePath '2026 Phlock Photos') -File | Sort-Object LastWriteTime, @{Expression={ if ($_.Name -match '^\d+') { [int64]$matches[0] } else { 0 } }}, Name).Name
$ph2025 = (Get-ChildItem -Path (Join-Path $basePath '2025 Phlock Photos') -File | Sort-Object LastWriteTime, @{Expression={ if ($_.Name -match '^\d+') { [int64]$matches[0] } else { 0 } }}, Name).Name

$content = Get-Content $jsPath -Raw

# Replace for Community Outreach
$arrStr = ($co | ForEach-Object { "        `"$_`"" }) -join ",`r`n"
$content = $content -replace '(?s)("Community Outreach"\s*:\s*\[).*?(\])', "`${1}`r`n$arrStr`r`n    `${2}"

# Replace for 2026
$arrStr = ($ph2026 | ForEach-Object { "        `"$_`"" }) -join ",`r`n"
$content = $content -replace '(?s)("2026 Phlock Photos"\s*:\s*\[).*?(\])', "`${1}`r`n$arrStr`r`n    `${2}"

# Replace for 2025
$arrStr = ($ph2025 | ForEach-Object { "        `"$_`"" }) -join ",`r`n"
$content = $content -replace '(?s)("2025 Phlock Photos"\s*:\s*\[).*?(\])', "`${1}`r`n$arrStr`r`n    `${2}"

Set-Content -Path $jsPath -Value $content -Encoding UTF8
Write-Host "Replaced arrays. New 2025 length: $($ph2025.Count)"
