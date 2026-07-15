# Pharma B2B - Plateforme Pharmaceutique

## Architecture

```
G:\B2B\
├── backend/        # API Django REST Framework
│   ├── accounts/   # Auth JWT, utilisateurs, roles
│   ├── products/   # Produits, stocks, categories
│   ├── orders/     # Commandes, panier
│   ├── deliveries/ # Livraisons, suivi GPS
│   ├── visits/     # Visites delegues medicaux
│   ├── notifications/ # Notifications push/email
│   ├── payments/   # Paiements, abonnements
│   └── dashboard/  # KPIs et statistiques
├── frontend/
│   └── pharma-frontend/  # React + Vite
└── mobile/
    └── pharma_mobile/    # Flutter
```

## Demarrage rapide

### 1. Backend (Django)

```powershell
cd backend
python -m pip install -r requirements.txt   # ou installer depuis start_backend.ps1
python manage.py migrate
python manage.py createsuperuser
python seed.py  # donnees de test
python manage.py runserver 0.0.0.0:8000
```

### 2. Frontend (React)

```powershell
cd frontend/pharma-frontend
npm install
npm run dev
```

### 3. Mobile (Flutter)

```powershell
cd mobile/pharma_mobile
flutter pub get
flutter run
```

### Scripts automatises

```powershell
.\setup_db.ps1        # Initialise la base de donnees
.\start_backend.ps1   # Demarre le backend
.\start_frontend.ps1  # Demarre le frontend
.\start_all.ps1       # Demarre tout
```

## API Endpoints

| Groupe | Endpoints | Description |
|--------|-----------|-------------|
| Auth | `/api/auth/login/`, `/api/auth/register/`, `/api/auth/me/` | Authentification JWT |
| Produits | `/api/products/`, `/api/products/categories/` | CRUD produits + stock |
| Commandes | `/api/orders/orders/`, `/api/orders/cart/` | Panier et commandes |
| Livraisons | `/api/deliveries/` | Gestion livraisons |
| Visites | `/api/visits/` | Module delegue medical |
| Notifications | `/api/notifications/` | Notifications |
| Dashboard | `/api/dashboard/laboratoire/`, `/api/dashboard/admin/` | KPIs |
| Paiements | `/api/payments/`, `/api/payments/subscriptions/` | Abonnements |

## Modeles de donnees

- **User** - 6 roles: ADMIN, LABORATOIRE, DELEGUE_MEDICAL, PHARMACIE, MEDECIN, LIVREUR
- **Product** - Medicaments, parapharmacie, materiel medical
- **Stock** - Lien 1-1 avec Product, seuils, lots, peremption
- **Order** - Statuts: PENDING -> CONFIRMED -> PREPARING -> READY -> SHIPPED -> DELIVERED
- **Cart** - Panier client avec CartItems
- **Delivery** - Livraison avec suivi GPS et statuts
- **Visit** - Visite terrain du delegue medical
- **Notification** - Notifications multi-canaux
- **Subscription** - Abonnements laboratoires/pharmacies

## Comptes de test

| Login | Mot de passe | Role |
|-------|-------------|------|
| admin | admin123 | Administrateur |
| labo1 | labo123 | Laboratoire PharmaPlus |
| labo2 | labo123 | Laboratoire MedTech |
| pharmacie1 | pharma123 | Pharmacie Centrale |
| medecin1 | medecin123 | Medecin |
| delegue1 | delegue123 | Delegue Medical |
| livreur1 | livreur123 | Livreur |
