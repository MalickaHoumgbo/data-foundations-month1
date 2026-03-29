# Mois 1 — Fondations Data

Premier mois d'un parcours de reconversion vers les métiers de la data.
Objectif : maîtriser les fondamentaux de la manipulation et du nettoyage
de données avec Python et Pandas.

---

## Compétences acquises

- Chargement et exploration de datasets (pd.read_csv, head, info, describe)
- Lecture et interprétation des statistiques descriptives
- Diagnostic et traitement des valeurs manquantes (fillna, dropna)
- Détection et suppression des doublons (drop_duplicates)
- Correction des types de colonnes (astype, to_datetime)
- Suppression de colonnes inutiles (drop)
- Export de datasets nettoyés (to_csv)

---

## Datasets utilisés

| Dataset | Source | Lignes | Thème |
|---|---|---|---|
| Coffee Sales | Kaggle | 3 636 | Ventes e-commerce |
| Transilien | data.gouv.fr | 7 328 | Transport public |
| TMDB Movies | Kaggle | 17 640 → 8 820 | Films |

---

## Structure du repo
```
data-foundations-month1/
│
├── datasets/
│   ├── fichiers originaux (.csv)
│   └── fichiers nettoyés (_clean.csv)
│
├── notebooks/
│   ├── 01_transilien_exploration_cleaning.ipynb
│   ├── 02_ecommerce_exploration_cleaning.ipynb
│   └── 03_tmdb_exploration_cleaning.ipynb
│
└── notes/
    ├── exercices et bilans semaines 1 et 2 (.docx)
```

---

## Outils

Python · Pandas · Jupyter · Anaconda

---

## Progression

Ce repo fait partie d'un parcours de 5 mois :

- **Mois 1** — Fondations (exploration + nettoyage) ← ici
- Mois 2 — Premier Projet Data Analyst (e-commerce)
- Mois 3 — Deuxième Projet Data Analyst (banque / finance)
- Mois 4 — Troisième Projet Data Analyst ( Marché de l'emploi IT)+ introduction Data Engineering
- Mois 5 — Projet Data Engineering