CREATE TABLE coffee_sales ( 
    date        DATE, 
    datetime    TIMESTAMP, 
    cash_type   VARCHAR(20), 
    card        VARCHAR(50), 
    money       NUMERIC(10, 2), 
    coffee_name VARCHAR(100) 
);

SELECT COUNT(*) FROM coffee_sales;

select * from coffee_sales limit 5;

------------------------------------------------
-- BLOC 1 : SELECT - WHERE - ORDER BY -LIMIT


-- =============================================
-- Exercice 1.1 — explorons coffee sales
-- =============================================

-- Aperçu général 
SELECT * FROM coffee_sales LIMIT 10; 
select * from coffee_sales limit 25;

  -- Quels types de paiement existent ? 
SELECT DISTINCT cash_type FROM coffee_sales; 

  -- Quels cafés sont vendus ? 
SELECT DISTINCT coffee_name FROM coffee_sales; 


-- =============================================
-- Exercice 1.2 — Filtrer avec WHERE
-- =============================================

-- Ventes en carte uniquement 
select * from coffee_sales 
where cash_type = 'card' 
limit 25;

-- Produits ayant rapporté plus de 50€ en une transaction 
SELECT coffee_name, money FROM coffee_sales 
WHERE money > 50; 

  -- Produits avec un prix entre 30 et 40€ 
SELECT coffee_name, money FROM coffee_sales 
WHERE money BETWEEN 30 AND 40; 


-- =============================================
-- Exercice 1.3 — Trier et Isoler les top N
-- =============================================

-- Les 10 transactions les plus élevées 
SELECT coffee_name, money FROM coffee_sales 
ORDER BY money DESC 
LIMIT 10; 


------------------------------------------------
-- BLOC 2 : GROUP BY et agrégat

-- ==================================================
-- Exercice 2.1 — Top produits par chiffre d'affaires
-- ==================================================

SELECT 
    coffee_name, 
    ROUND(SUM(money), 2)        AS chiffre_affaires, 
    COUNT(*)                    AS nb_ventes, 
    ROUND(AVG(money), 2)        AS prix_moyen 
FROM coffee_sales 
GROUP BY coffee_name 
ORDER BY chiffre_affaires DESC;

-- ==========================================================
-- Exercice 2.2 — Filtrer les  produits > 100 ventes : HAVING
-- ==========================================================

SELECT 
    coffee_name, 
    COUNT(*)                    AS nb_ventes, 
    ROUND(SUM(money), 2)        AS chiffre_affaires 
FROM coffee_sales 
GROUP BY coffee_name 
HAVING COUNT(*) > 100 
ORDER BY nb_ventes DESC; 


-- ==========================================================
-- Exercice 2.3 — Chiffre d'affaires par mois
-- ==========================================================

SELECT 
    EXTRACT(MONTH FROM date)    AS mois, 
    ROUND(SUM(money), 2)        AS chiffre_affaires, 
    COUNT(*)                    AS nb_ventes 
FROM coffee_sales 
GROUP BY EXTRACT(MONTH FROM date) 
ORDER BY mois; 


------------------------------------------------
-- BLOC 3 : Jointures

-- ============================================================================
-- Exercice pratique
 -- Création d'une table catalogue artificielle pour mettre en pratique le JOIN
-- ============================================================================

CREATE TABLE coffee_catalogue ( 
    coffee_name     VARCHAR(100), 
    categorie       VARCHAR(50), 
    prix_catalogue  NUMERIC(10, 2) 
); 
  
INSERT INTO coffee_catalogue VALUES 
    ('Latte', 'Lait', 38.00), 
    ('Americano with Milk', 'Americano', 32.00), 
    ('Cappuccino', 'Lait', 35.00), 
    ('Cortado', 'Espresso', 28.00), 
    ('Hot Chocolate', 'Special', 30.00),
    ('Cocoa', 'Spécial', 42.00), 
    ('Espresso', 'Espresso', 22.00);


select * from coffee_catalogue cc ;


-- Joindre avec les ventes réelles 
SELECT 
    cs.coffee_name, 
    cc.categorie, 
    cc.prix_catalogue, 
    ROUND(AVG(cs.money), 2)     AS prix_moyen_reel, 
    COUNT(*)                    AS nb_ventes 
FROM coffee_sales AS cs 
JOIN coffee_catalogue as cc on cs.coffee_name = cc.coffee_name 
GROUP BY cs.coffee_name, cc.categorie, cc.prix_catalogue 
ORDER BY nb_ventes DESC;


------------------------------------------------
-- Mini projet final


-- ====================================================
-- Question 1: Quels produits sont les plus rentables ? 
-- ====================================================

SELECT 
    coffee_name, 
    COUNT(*)                            AS nb_ventes, 
    ROUND(SUM(money), 2)                AS chiffre_affaires, 
    ROUND(AVG(money), 2)                AS prix_moyen, 
    ROUND(SUM(money) * 100.0 
          / SUM(SUM(money)) OVER (), 1) AS part_ca_pct 
FROM coffee_sales 
GROUP BY coffee_name 
ORDER BY chiffre_affaires DESC;


-- =======================================================
-- Question 2: Comment évoluent les ventes dans le temps ?
-- =======================================================

SELECT 
    EXTRACT(YEAR FROM date)     AS annee, 
    EXTRACT(MONTH FROM date)    AS mois, 
    TO_CHAR(date, 'Month')      AS nom_mois, 
    COUNT(*)                    AS nb_ventes, 
    ROUND(SUM(money), 2)        AS chiffre_affaires 
FROM coffee_sales 
GROUP BY 
    EXTRACT(YEAR FROM date), 
    EXTRACT(MONTH FROM date), 
    TO_CHAR(date, 'Month') 
ORDER BY annee, mois; 


-- ==============================================================
-- Question 3: Quel est le profil de la clientèle selon le jour ?
-- ==============================================================

SELECT 
    TO_CHAR(date, 'Day')        AS jour_semaine, 
    EXTRACT(DOW FROM date)      AS num_jour, 
    COUNT(*)                    AS nb_ventes, 
    ROUND(SUM(money), 2)        AS chiffre_affaires, 
    ROUND(AVG(money), 2)        AS panier_moyen 
FROM coffee_sales 
GROUP BY TO_CHAR(date, 'Day'), EXTRACT(DOW FROM date) 
ORDER BY num_jour; 

-- Vue d'ensemble : produit × mois 
SELECT 
    coffee_name, 
    EXTRACT(MONTH FROM date)    AS mois, 
    COUNT(*)                    AS nb_ventes, 
    ROUND(SUM(money), 2)        AS ca_mensuel 
FROM coffee_sales 
GROUP BY coffee_name, EXTRACT(MONTH FROM date) 
ORDER BY coffee_name, mois;



