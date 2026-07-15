# Pharma B2B - Demarrage du Frontend
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  Pharma B2B - Frontend React" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "ERREUR: Node.js n'est pas installe" -ForegroundColor Red
    exit 1
}

Write-Host "[1/2] Installation des dependances..." -ForegroundColor Yellow
Set-Location -LiteralPath "$PSScriptRoot\frontend\pharma-frontend"
npm install

Write-Host "[2/2] Demarrage du serveur de dev..." -ForegroundColor Green
Write-Host ""
Write-Host "  Frontend:   http://localhost:3000/" -ForegroundColor Green
Write-Host ""
npx vite --host 0.0.0.0 --port 3000
