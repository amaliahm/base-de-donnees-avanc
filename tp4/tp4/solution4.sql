SELECT 
    p.nom_produit, m.ville , p.categorie, m.region,
    max(f.qte_vendue) AS qte_maximale
FROM 
    vente f 
    NATURAL JOIN dim_temps t 
    NATURAL JOIN dim_produit p 
    NATURAL JOIN dim_magasin m
WHERE 
    t.trimestre = 2 AND t.annee = 2019
GROUP BY 
    GROUPING sets
      ((p.nom_produit,m.ville), (p.categorie, m.region))
ORDER BY
    p.nom_produit,m.ville ,p.categorie,m.region;
