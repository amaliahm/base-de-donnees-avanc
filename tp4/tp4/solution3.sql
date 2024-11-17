SELECT 
    DECODE(GROUPING(m.region), 1, 'toutes les régions', m.region) AS region,
    DECODE(GROUPING(t.annee), 1, 'toutes les années', t.annee) AS annee,
    DECODE(GROUPING(t.mois), 1, 'tous les mois', t.mois) AS mois,
    SUM(f.qte_vendue) AS total_quantities,
    TRUNC(AVG(f.montantVente)) AS average_amount
FROM 
    vente f
    NATURAL JOIN dim_temps t 
    NATURAL JOIN dim_magasin m
WHERE 
    t.mois BETWEEN 1 AND 3
GROUP BY 
    CUBE(m.region, t.annee, t.mois)
ORDER BY 
    m.region, t.annee, t.mois;
