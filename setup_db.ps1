# Pharma B2B - Initialisation de la base de donnees
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  Pharma B2B - Initialisation DB" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

Set-Location -LiteralPath "$PSScriptRoot\backend"

# Supprimer l'ancienne DB
if (Test-Path "db.sqlite3") {
    Write-Host "[1/4] Suppression de l'ancienne base..." -ForegroundColor Yellow
    Remove-Item "db.sqlite3" -Force
}

# Migrations
Write-Host "[2/4] Migrations..." -ForegroundColor Yellow
python manage.py makemigrations accounts products orders deliveries visits notifications payments dashboard
python manage.py migrate

# Superuser
Write-Host "[3/4] Creation superuser (admin / admin123)..." -ForegroundColor Yellow
$env:DJANGO_SUPERUSER_PASSWORD = "admin123"
python manage.py createsuperuser --noinput --username admin --email admin@pharmab2b.com 2>$null

# Seed data
Write-Host "[4/4] Donnees de test..." -ForegroundColor Yellow
python seed.py

Write-Host ""
Write-Host "Base de donnees initialisee avec succes !" -ForegroundColor Green
Write-Host "  - Utilisateurs de test crees" -ForegroundColor Green
Write-Host "  - Categories et produits ajoutes" -ForegroundColor Green
Write-Host "  - Panier et abonnement configures" -ForegroundColor Green
Write-Host ""
Write-Host "Comptes disponibles :" -ForegroundColor Cyan
Write-Host "  admin / admin123 (Administrateur)" -ForegroundColor White
Write-Host "  labo1 / labo123 (Laboratoire PharmaPlus)" -ForegroundColor White
Write-Host "  pharmacie1 / pharma123 (Pharmacie Centrale)" -ForegroundColor White
Write-Host "  delegue1 / delegue123 (Delegue Medical)" -ForegroundColor White
Write-Host "  livreur1 / livreur123 (Livreur)" -ForegroundColor White
