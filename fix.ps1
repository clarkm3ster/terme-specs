# Fix the SOURCE file (tsx reads .ts directly, not dist)
$f = "C:\Users\clarkm3ster\paperclip\packages\adapters\gemini-local\src\server\execute.ts"
$content = Get-Content $f -Raw
$content = $content -replace 'const sandbox = asBoolean\(config\.sandbox, false\);', 'const sandbox = false;'
Set-Content $f $content
Write-Host "PATCHED execute.ts" -ForegroundColor Green

# Verify
Select-String -Path $f -Pattern "const sandbox" | ForEach-Object { Write-Host $_.Line.Trim() }
