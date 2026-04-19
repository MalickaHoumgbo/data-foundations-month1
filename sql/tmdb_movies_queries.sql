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

select count(*) from tmdb_movies tm ;

select * from tmdb_movies limit 25;

------------------------------------------------
-- BLOC 1 : SELECT - WHERE - ORDER BY -LIMIT

-- Quelles langues originales existent ?
SELECT DISTINCT original_language FROM tmdb_movies
ORDER BY original_language;

-- Films en français uniquement
SELECT title, release_date, vote_average
FROM tmdb_movies
WHERE original_language = 'fr'
ORDER BY vote_average DESC
LIMIT 20;

-- Films sortis après 2010 avec note > 8
SELECT title, annee, vote_average, vote_count
FROM tmdb_movies
WHERE annee > 2010
AND vote_average > 8
AND vote_count > 2000
ORDER BY vote_average DESC;


-- =============================================
-- Exercice 1.3 — Trier et Isoler les top N
-- =============================================


-- Films TMDB les mieux notés (avec minimum de votes) 
SELECT title, vote_average, vote_count FROM tmdb_movies 
WHERE vote_count > 1000 
ORDER BY vote_average DESC 
LIMIT 10; 


------------------------------------------------
-- BLOC 2 : GROUP BY et agrégat

-- Nombre de films par année
SELECT
    annee,
    COUNT(*) AS nb_films
FROM tmdb_movies
GROUP BY annee
ORDER BY annee;

-- Années les plus productives
SELECT
    annee,
    COUNT(*) AS nb_films
FROM tmdb_movies
GROUP BY annee
ORDER BY nb_films DESC
LIMIT 10;

-- Note moyenne par langue originale (min 20 films)
SELECT
    original_language,
    COUNT(*)                    AS nb_films,
    ROUND(AVG(vote_average), 2) AS note_moyenne,
    ROUND(AVG(popularity), 2)   AS popularite_moyenne
FROM tmdb_movies
GROUP BY original_language
HAVING COUNT(*) > 20
ORDER BY note_moyenne DESC;

-- Films les plus populaires par année
SELECT
    annee,
    title,
    ROUND(popularity, 2) AS popularite,
    vote_average
FROM tmdb_movies
ORDER BY annee, popularite DESC
LIMIT 20;