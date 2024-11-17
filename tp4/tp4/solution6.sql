SELECT *
FROM (
    SELECT 
        p.categorie, 
        t.annee, 
        p.nom_produit, 
        SUM(f.qte_vendue) AS total,
        RANK() OVER (PARTITION BY p.categorie, t.annee ORDER BY SUM(f.qte_vendue) DESC) AS rang
    FROM 
        vente f 
    NATURAL JOIN 
        dim_temps t 
    NATURAL JOIN 
        dim_produit p 
    NATURAL JOIN 
        dim_magasin m
    WHERE 
        m.region = 'ouest'
    GROUP BY 
        p.categorie, 
        t.annee, 
        p.nom_produit
) 
WHERE 
    rang <= 2;