$f = "C:\Users\clarkm3ster\paperclip\packages\adapters\gemini-local\dist\server\execute.js"
(Get-Content $f -Raw) -replace 'const sandbox = asBoolean\(config\.sandbox, false\)', 'const sandbox = false' | Set-Content $f
Write-Host "PATCHED" -ForegroundColor Green
Get-Process -Name "node" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
taskkill /F /IM node.exe 2>$null
Start-Sleep 5
Start-Process -FilePath "cmd.exe" -ArgumentList "/c C:\Users\clarkm3ster\run-paperclip.bat" -WindowStyle Hidden
Write-Host "RESTARTED" -ForegroundColor Green
