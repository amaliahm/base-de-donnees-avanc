SELECT 
    m.region,
    t.annee,
    t.mois,
    SUM(f.qte_vendue) AS total_quantities,
    TRUNC(AVG(f.montantVente)) AS average_amount
FROM 
    vente f
    NATURAL JOIN dim_temps t 
    NATURAL JOIN dim_magasin m
WHERE 
    t.mois BETWEEN 1 AND 3
GROUP BY 
    ROLLUP(m.region, t.annee, t.mois)
ORDER BY 
    m.region, 
    t.annee, 
    t.mois;
