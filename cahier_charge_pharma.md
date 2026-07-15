# Cahier de Charge - Plateforme Pharmaceutique B2B

## Objectif

Créer une plateforme digitale reliant laboratoires, médecins et pharmacies pour la gestion des stocks, commandes et livraisons.

## Utilisateurs

- **Admin** (gestion globale)
- **Laboratoire** (gestion produits et stock)
- **Délégué médical** (visites et commandes)
- **Pharmacie / Médecin** (recherche et commande)
- **Livreur** (livraison)

## Fonctionnalités principales

1. Gestion des produits (ajout, stock, prix, expiration)
2. Recherche de médicaments
3. Système de commande
4. Gestion des livraisons
5. Dashboard laboratoire
6. Module délégué médical
7. Notifications

## Architecture

- **Frontend** : Web (React) + Mobile (Flutter)
- **Backend** : Node.js ou Django
- **Base de données** : PostgreSQL
- **Authentification** : JWT

## Flux

```
Laboratoire -> Plateforme -> Pharmacies/Médecins -> Commande -> Livraison
```

## Business Model

- Abonnement laboratoires
- Commission sur ventes
- Abonnement pharmacies
- Dashboard premium

## MVP

- Login utilisateurs
- Catalogue produits
- Stock
- Commande simple
- Dashboard basique
