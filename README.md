# Mois 1 — Fondations Data

Premier mois d'un parcours de reconversion vers les métiers de la data.
Objectif : maîtriser les fondamentaux de la manipulation et du nettoyage, de l'analyse et de la visualisation de données avec Python et Pandas.


---

## Compétences acquises

### Semaines 1 & 2 — Exploration et nettoyage
- Chargement et exploration de datasets (pd.read_csv, head, info, describe)
- Lecture et interprétation des statistiques descriptives
- Diagnostic et traitement des valeurs manquantes (fillna, dropna)
- Détection et suppression des doublons (drop_duplicates)
- Correction des types de colonnes (astype, to_datetime)
- Suppression de colonnes inutiles (drop)
- Export de datasets nettoyés (to_csv)

### Semaine 3 — Analyse et visualisation
- Agrégations groupby() : CA, volume, prix moyen par catégorie
- Analyse temporelle : tendances par mois et jour de la semaine
- Top N et filtrage : nlargest(), value_counts(), filtres conditionnels
- Visualisation : bar chart, line chart, histogramme, boxplot, scatter plot
- Exportation des graphiques dans visuals/

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
│   ├── 03_tmdb_exploration_cleaning.ipynb
│   ├── 04_ecommerce_analyse.ipynb
│   ├── 05_transilien_analyse.ipynb
│   └── 06_tmdb_analyse.ipynb
│
├── visuals/
│   └── graphiques exportés (.png)
│
└── notes/
└── bilans semaines 1, 2 et 3 (.pdf)
```

---

## Outils

Python · Pandas · Matplotlib · Seaborn · Jupyter · Anaconda

---

## Progression

Ce repo fait partie d'un parcours de 5 mois :

- **Mois 1** — Fondations (exploration + nettoyage) ← ici
- Mois 2 — Premier Projet Data Analyst (commerce/e-commerce)
- Mois 3 — Deuxième Projet Data Analyst (banque / finance)
- Mois 4 — Troisième Projet Data Analyst ( Marché de l'emploi IT)+ introduction Data Engineering
- Mois 5 — Projet Data Engineering
