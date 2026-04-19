
-- Structure définie dans schema.sql
-- CREATE TABLE transilien ( ... )

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

---------------------------------------------------------
-- BLOC 1 : SELECT - WHERE - ORDER BY - LIMIT

-- Aperçu général
SELECT * FROM transilien LIMIT 10;

-- Quels types de jour existent ?
SELECT DISTINCT "Type jour" FROM transilien;

-- Quelles lignes existent ?
SELECT DISTINCT "Ligne" FROM transilien;

-- Gares avec plus de 500 voyageurs sur une tranche
SELECT "Nom Gare", "Tranche horaire", "Somme de Montants"
FROM transilien
WHERE "Somme de Montants" > 500
ORDER BY "Somme de Montants" DESC
LIMIT 20;


------------------------------------------------
-- BLOC 2 : GROUP BY et agrégat

-- ==================================================
-- Exercice 2.4 — Traffic transilien par gare
-- ==================================================

SELECT 
    "Nom Gare" , 
    SUM("Somme de Montants" )              AS total_voyageurs, 
    COUNT(*)                    AS nb_tranches, 
    ROUND(AVG("Somme de Montants" ), 0)    AS moyenne_par_tranche 
FROM transilien 
GROUP BY "Nom Gare" 
ORDER BY total_voyageurs DESC 
LIMIT 10; 


-- ==================================================
-- Exercice 2.5 — Traffic transilien par type de jour
-- ==================================================

SELECT 
    "Type jour"  ,
    SUM("Somme de Montants" )              AS total_voyageurs, 
    ROUND(AVG("Somme de Montants" ), 0)    AS moyenne, 
    MAX("Somme de Montants" )              AS pic_max 
FROM transilien 
GROUP BY "Type jour"  
ORDER BY total_voyageurs DESC;




