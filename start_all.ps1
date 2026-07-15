# Pharma B2B - Demarrage complet
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  Pharma B2B - Plateforme Complete" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# Demarrage backend
Write-Host ">>> Demarrage du backend..." -ForegroundColor Yellow
$backendJob = Start-Job -ScriptBlock {
    Set-Location -LiteralPath "$using:PSScriptRoot\backend"
    python manage.py runserver 0.0.0.0:8000
}

Start-Sleep -Seconds 3

# Demarrage frontend
Write-Host ">>> Demarrage du frontend..." -ForegroundColor Yellow
$frontendJob = Start-Job -ScriptBlock {
    Set-Location -LiteralPath "$using:PSScriptRoot\frontend\pharma-frontend"
    npx vite --host 0.0.0.0 --port 3000
}

Write-Host ""
Write-Host "  Backend:    http://localhost:8000/api/" -ForegroundColor Green
Write-Host "  Admin:      http://localhost:8000/admin/" -ForegroundColor Green
Write-Host "  Frontend:   http://localhost:3000/" -ForegroundColor Green
Write-Host "  Login:      admin / admin123" -ForegroundColor Green
Write-Host ""
Write-Host "Appuyez sur Ctrl+C pour arreter" -ForegroundColor Yellow

while ($true) {
    Start-Sleep -Seconds 10
    Receive-Job $backendJob -ErrorAction SilentlyContinue
    Receive-Job $frontendJob -ErrorAction SilentlyContinue
}
