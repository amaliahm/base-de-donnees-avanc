SELECT 
    region, annee, ville, total_ventes, ville_rank
FROM (
    SELECT 
        m.region,
        m.ville, 
        t.annee, 
        SUM(f.qte_vendue) AS total_ventes,
        ROW_NUMBER() OVER (PARTITION BY m.region, t.annee ORDER BY SUM(f.qte_vendue) ASC) AS ville_rank
    FROM 
        vente f 
    NATURAL JOIN 
        dim_temps t 
    NATURAL JOIN 
        dim_produit p 
    NATURAL JOIN 
        dim_magasin m
    WHERE 
        p.categorie = 'laitier'
    GROUP BY 
        m.region, 
        t.annee, 
        m.ville
    ) 
WHERE 
    ville_rank <= 2;
