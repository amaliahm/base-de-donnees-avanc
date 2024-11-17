SELECT 
    p.nom_produit,
    m.region,
    SUM(f.qte_vendue) AS total_quantities,
    RANK() OVER (PARTITION BY p.nom_produit ORDER BY SUM(f.qte_vendue) DESC) AS rank_per_product,
    RANK() OVER (ORDER BY SUM(f.qte_vendue) DESC) AS global_rank
FROM 
    vente f
    NATURAL JOIN dim_temps t 
    NATURAL JOIN dim_produit p 
    NATURAL JOIN dim_magasin m
WHERE 
    t.annee = 2018
GROUP BY 
    p.nom_produit, 
    m.region
ORDER BY 
    global_rank;