-- select all

SELECT 
    m.nom_magasin AS magasin,
    t.annee,
    t.mois,
    SUM(f.montantvente) AS montant_total
FROM 
    vente f
    NATURAL JOIN dim_magasin m
    NATURAL JOIN dim_temps t 
GROUP BY 
    m.nom_magasin, t.annee, t.mois;

/* 1-2-3-4 */
WITH MonthlySales AS (
    SELECT 
        t.annee, 
        t.mois, 
        SUM(f.montantvente) AS montant_mensuel
    FROM 
        vente f
        JOIN dim_temps t ON f.id_temps = t.id_temps
    GROUP BY 
        t.annee, t.mois
),
Sliding8Months AS (
    SELECT 
        t.annee, 
        t.mois, 
        SUM(f.montantvente) AS montant_8_mois_glissants
    FROM 
        vente f
        JOIN dim_temps t ON f.id_temps = t.id_temps
    WHERE 
        t.annee = EXTRACT(year FROM SYSDATE)
        AND t.mois BETWEEN EXTRACT(month FROM SYSDATE) - 4 AND EXTRACT(month FROM SYSDATE) + 4
    GROUP BY 
        t.annee, t.mois
),
AnnualSales AS (
    SELECT 
        t.annee, 
        SUM(f.montantvente) AS montant_annuel
    FROM 
        vente f
        JOIN dim_temps t ON f.id_temps = t.id_temps
    GROUP BY 
        t.annee
)
SELECT
    (
        SELECT 
            MAX(montant_mensuel) 
        FROM 
            MonthlySales 
        WHERE 
            mois BETWEEN EXTRACT(month FROM SYSDATE) - 3 AND EXTRACT(month FROM SYSDATE)
    ) AS montant_maximal_recent,
    (
        SELECT 
            MAX(montant_annuel) 
        FROM 
            AnnualSales 
        WHERE 
            annee = EXTRACT(year FROM SYSDATE)
    ) AS montant_maximal_annuel,
    (
        SELECT 
            MAX(montant_8_mois_glissants) 
        FROM 
            Sliding8Months
    ) AS montant_maximal_8_mois_glissants,
    (
        SELECT 
            MAX(montant_mensuel) 
        FROM 
            MonthlySales 
        WHERE 
            annee = EXTRACT(year FROM SYSDATE) - 1 AND mois >= EXTRACT(month FROM SYSDATE)
    ) AS montant_maximal_annee_precedente
FROM dual;

