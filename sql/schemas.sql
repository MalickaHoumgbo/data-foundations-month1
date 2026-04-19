-- =============================================
-- Schema — Mois 1 Data Foundations
-- Base : mois1_data
-- =============================================


-- Table 1 — Coffee Sales
-- =============================================
CREATE TABLE coffee_sales (
    date        DATE,
    datetime    TIMESTAMP,
    cash_type   VARCHAR(20),
    card        VARCHAR(50),
    money       NUMERIC(10, 2),
    coffee_name VARCHAR(100)
);


-- Table 2 — Transilien
-- =============================================
CREATE TABLE transilien (
    "Nom Gare"          VARCHAR(100),
    "Code Gare"         INTEGER,
    "Type jour"         VARCHAR(5),
    "Date"              DATE,
    "Annee"             INTEGER,
    "Ligne"             VARCHAR(10),
    "Axe"               VARCHAR(10),
    "Tranche horaire"   VARCHAR(30),
    "Somme de Montants" INTEGER,
    mois                INTEGER,
    jour_semaine        VARCHAR(20)
);


-- Table 3 — TMDB Movies
-- =============================================
CREATE TABLE tmdb_movies (
    id                  INTEGER,
    title               VARCHAR(255),
    overview            TEXT,
    genre_ids           TEXT,
    original_language   VARCHAR(10),
    popularity          NUMERIC(10, 4),
    release_date        DATE,
    vote_average        NUMERIC(4, 2),
    vote_count          INTEGER,
    annee               INTEGER,
    mois                INTEGER,
    jour_semaine        VARCHAR(20)
);