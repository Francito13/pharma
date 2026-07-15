# Pharma B2B - Demarrage du Backend
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  Pharma B2B - Backend Django" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# Verifier l'installation
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "ERREUR: Python n'est pas installe" -ForegroundColor Red
    exit 1
}

# Installer les dependances
Write-Host "[1/3] Installation des dependances..." -ForegroundColor Yellow
python -m pip install django djangorestframework djangorestframework-simplejwt django-cors-headers django-filter Pillow -q

# Migrations
Write-Host "[2/3] Migrations..." -ForegroundColor Yellow
Set-Location -LiteralPath "$PSScriptRoot\backend"
python manage.py migrate

Write-Host "[3/3] Demarrage du serveur..." -ForegroundColor Green
Write-Host ""
Write-Host "  API:        http://localhost:8000/api/" -ForegroundColor Green
Write-Host "  Admin:      http://localhost:8000/admin/" -ForegroundColor Green
Write-Host "  Login:      admin / admin123" -ForegroundColor Green
Write-Host ""
python manage.py runserver 0.0.0.0:8000
