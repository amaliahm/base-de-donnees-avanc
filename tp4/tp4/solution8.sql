SELECT 
    'Par Ville' AS type_classement,
    m.ville AS nom,
    SUM(f.qte_vendue) AS quantite_vendue,
    NTILE(4) OVER (ORDER BY SUM(f.qte_vendue) DESC) AS quartile
FROM 
    vente f
    NATURAL JOIN dim_magasin m 
    NATURAL JOIN dim_temps t
WHERE 
    t.annee = 2018
GROUP BY 
    m.ville
UNION ALL
SELECT 
    'Par Produit' AS type_classement,
    p.nom_produit AS nom,
    SUM(f.qte_vendue) AS quantite_vendue,
    NTILE(4) OVER (ORDER BY SUM(f.qte_vendue) DESC) AS quartile
FROM 
    vente f
    NATURAL JOIN dim_produit p
    NATURAL JOIN dim_temps t
WHERE 
    t.annee = 2018
GROUP BY 
    p.nom_produit;














WITH MonthlySales AS (
    SELECT 
        m.region,
        t.annee,
        t.mois,
        SUM(f.montantvente) AS montant_mensuel
    FROM 
        vente f
        JOIN dim_magasin m ON f.id_magasin = m.id_magasin  
        JOIN dim_temps t ON f.id_temps = t.id_temps 
    GROUP BY 
        m.region, t.annee, t.mois
),
CumulativeRegionSales AS (
    SELECT 
        region,
        annee,
        mois,
        montant_mensuel,
        SUM(montant_mensuel) OVER (PARTITION BY region ORDER BY annee, mois) AS montant_cumulatif_region
    FROM 
        MonthlySales
),
CumulativeYearlySales AS (
    SELECT 
        region,
        annee,
        mois,
        montant_mensuel,
        SUM(montant_mensuel) OVER (PARTITION BY annee ORDER BY region, mois) AS montant_cumulatif_annee
    FROM 
        MonthlySales
),
RegionalYearlyRatio AS (
    SELECT 
        m.region,
        t.annee,
        ROUND((SUM(f.montantvente) / total_annee.montant_total_annee) * 100, 2) AS ratio_region_annee
    FROM 
        vente f
        JOIN dim_magasin m ON f.id_magasin = m.id_magasin
        JOIN dim_temps t ON f.id_temps = t.id_temps
        JOIN (
            SELECT 
                t.annee,
                SUM(f.montantvente) AS montant_total_annee
            FROM 
                vente f
                JOIN dim_temps t ON f.id_temps = t.id_temps
            GROUP BY 
                t.annee
        ) total_annee ON t.annee = total_annee.annee
    GROUP BY 
        m.region, t.annee, total_annee.montant_total_annee
)
SELECT 
    region,
    annee,
    mois,
    montant_mensuel,
    montant_cumulatif_region,
    NULL AS montant_cumulatif_annee,
    NULL AS ratio_region_annee
FROM 
    CumulativeRegionSales
UNION ALL
SELECT 
    region,
    annee,
    mois,
    montant_mensuel,
    NULL AS montant_cumulatif_region,
    montant_cumulatif_annee,
    NULL AS ratio_region_annee
FROM 
    CumulativeYearlySales
UNION ALL
SELECT 
    region,
    annee,
    NULL AS mois,
    NULL AS montant_mensuel,
    NULL AS montant_cumulatif_region,
    NULL AS montant_cumulatif_annee,
    ratio_region_annee
FROM 
    RegionalYearlyRatio;