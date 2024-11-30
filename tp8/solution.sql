-- connect as sysdba;

set linesize 9999 ;
show PARAMETERS db_block_size;
SET AUTOTRACE TRACEONLY EXPLAIN STATISTICS ;

-- 4
SELECT Min(idp), Max(idp) FROM amina.produit;

/*
Execution Plan
----------------------------------------------------------
Plan hash value: 3737878104

------------------------------------------------------------------------------
| Id  | Operation	   | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |	     |	   1 |	  13 |	 205   (1)| 00:00:01 |
|   1 |  SORT AGGREGATE    |	     |	   1 |	  13 |		  |	     |
|   2 |   TABLE ACCESS FULL| PRODUIT |	 196K|	2494K|	 205   (1)| 00:00:01 |
------------------------------------------------------------------------------

Note
-----
   - dynamic statistics used: dynamic sampling (level=2)


Statistics
----------------------------------------------------------
	  5  recursive calls
	  0  db block gets
	821  consistent gets
	  0  physical reads
	  0  redo size
	649  bytes sent via SQL*Net to client
	 52  bytes received via SQL*Net from client
	  2  SQL*Net roundtrips to/from client
	  0  sorts (memory)
	  0  sorts (disk)
	  1  rows processed

*/

SELECT * FROM amina.produit WHERE idp=1;

/*
Execution Plan
----------------------------------------------------------
Plan hash value: 3042593182

-----------------------------------------------------------------------------
| Id  | Operation	  | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
-----------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |	    |	  8 |	296 |	205   (1)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| PRODUIT |	  8 |	296 |	205   (1)| 00:00:01 |
-----------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - filter("IDP"=1)

Note
-----
   - dynamic statistics used: dynamic sampling (level=2)


Statistics
----------------------------------------------------------
	 14  recursive calls
	  8  db block gets
	827  consistent gets
	  0  physical reads
       1064  redo size
	721  bytes sent via SQL*Net to client
	 52  bytes received via SQL*Net from client
	  2  SQL*Net roundtrips to/from client
	  0  sorts (memory)
	  0  sorts (disk)
	  1  rows processed

*/

SELECT * FROM amina.produit WHERE idp!=200;

/*
199999 rows selected.


Execution Plan
----------------------------------------------------------
Plan hash value: 3042593182

-----------------------------------------------------------------------------
| Id  | Operation	  | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
-----------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |	    |	196K|  7099K|	205   (1)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| PRODUIT |	196K|  7099K|	205   (1)| 00:00:01 |
-----------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - filter("IDP"<>200)

Note
-----
   - dynamic statistics used: dynamic sampling (level=2)


Statistics
----------------------------------------------------------
	  5  recursive calls
	  0  db block gets
      14137  consistent gets
	  0  physical reads
	  0  redo size
    6984146  bytes sent via SQL*Net to client
     146715  bytes received via SQL*Net from client
      13335  SQL*Net roundtrips to/from client
	  0  sorts (memory)
	  0  sorts (disk)
     199999  rows processed

*/

SELECT count(*) FROM amina.produit WHERE idp!=200;

/*

Execution Plan
----------------------------------------------------------
Plan hash value: 3737878104

------------------------------------------------------------------------------
| Id  | Operation	   | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |	     |	   1 |	  13 |	 205   (1)| 00:00:01 |
|   1 |  SORT AGGREGATE    |	     |	   1 |	  13 |		  |	     |
|*  2 |   TABLE ACCESS FULL| PRODUIT |	 196K|	2494K|	 205   (1)| 00:00:01 |
------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   2 - filter("IDP"<>200)

Note
-----
   - dynamic statistics used: dynamic sampling (level=2)


Statistics
----------------------------------------------------------
	  4  recursive calls
	  0  db block gets
	754  consistent gets
	  0  physical reads
	  0  redo size
	570  bytes sent via SQL*Net to client
	 52  bytes received via SQL*Net from client
	  2  SQL*Net roundtrips to/from client
	  0  sorts (memory)
	  0  sorts (disk)
	  1  rows processed

*/

-- 5

ALTER TABLE amina.produit ADD PRIMARY KEY(idp);
CREATE INDEX amina.idx_type ON amina.produit(type);

ANALYZE TABLE amina.produit COMPUTE STATISTICS;

-- RBO

SELECT /*+ rule */ COUNT(*) FROM amina.produit WHERE idp != 200;

/*
Execution Plan
----------------------------------------------------------
Plan hash value: 3737878104

--------------------------------------
| Id  | Operation	   | Name    |
--------------------------------------
|   0 | SELECT STATEMENT   |	     |
|   1 |  SORT AGGREGATE    |	     |
|*  2 |   TABLE ACCESS FULL| PRODUIT |
--------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   2 - filter("IDP"<>200)

Note
-----
   - rule based optimizer used (consider using cbo)


Statistics
----------------------------------------------------------
	  1  recursive calls
	  0  db block gets
	753  consistent gets
	  0  physical reads
	  0  redo size
	570  bytes sent via SQL*Net to client
	 52  bytes received via SQL*Net from client
	  2  SQL*Net roundtrips to/from client
	  0  sorts (memory)
	  0  sorts (disk)
	  1  rows processed
*/

-- CBO

EXPLAIN PLAN FOR SELECT COUNT(*) FROM amina.produit WHERE idp != 200;
/* Explained. */
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

/*
18 rows selected.


Execution Plan
----------------------------------------------------------
Plan hash value: 2137789089

---------------------------------------------------------------------------------------------
| Id  | Operation			  | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
---------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT		  |	    |  8168 | 16336 |	 29   (0)| 00:00:01 |
|   1 |  COLLECTION ITERATOR PICKLER FETCH| DISPLAY |  8168 | 16336 |	 29   (0)| 00:00:01 |
---------------------------------------------------------------------------------------------


Statistics
----------------------------------------------------------
	 65  recursive calls
	  0  db block gets
	140  consistent gets
	  0  physical reads
	  0  redo size
       1402  bytes sent via SQL*Net to client
	 63  bytes received via SQL*Net from client
	  3  SQL*Net roundtrips to/from client
	  4  sorts (memory)
	  0  sorts (disk)
	 18  rows processed
*/

-- RBO

-- SELECT Min(idp), Max(idp) FROM amina.produit;

SELECT /*+ rule */ Min(idp), Max(idp) FROM amina.produit;
SELECT Min(idp), Max(idp) FROM amina.produit;

-- SELECT * FROM amina.produit WHERE idp=1;

SELECT /*+ rule */ * FROM amina.produit WHERE idp=1;
SELECT * FROM amina.produit WHERE idp=1;

-- SELECT * FROM amina.produit WHERE idp!=200;

SELECT /*+ rule */ * FROM amina.produit WHERE idp!=200;
SELECT * FROM amina.produit WHERE idp!=200;

-- SELECT count(*) FROM amina.produit WHERE idp!=200;

SELECT /*+ rule */ count(*) FROM amina.produit WHERE idp!=200;
SELECT count(*) FROM amina.produit WHERE idp!=200;

-- Select * from amina.produit where type = 'g';

SELECT /*+ rule */ * FROM amina.produit WHERE type = 'g';
Select * from amina.produit where type = 'g';

-- Select count(*) from amina.produit where type = 'g';

SELECT /*+ rule */ count(*) FROM amina.produit WHERE type = 'g';
Select count(*) from amina.produit where type = 'g';

-- d
-- make sure the index exists
/*
SELECT index_name, visibility FROM all_indexes WHERE table_name = 'PRODUIT' AND index_name = 'IDX_TYPE';
*/

-- g

-- Select count(*) from amina.produit p, amina.commande c where nom like 'produit100%' and p.idp=c.idp ;

-- Select count(*) from amina.produit p, amina.commande c where qte=1 and p.idp=c.idp ;


/*
create indexes:
     
CREATE INDEX idx_produit_idp ON amina.produit(idp);
CREATE INDEX idx_commande_idp ON amina.commande(idp);
CREATE INDEX idx_nom ON amina.produit(nom);
CREATE INDEX idx_qte ON amina.commande(qte);

use join:

SELECT count(*) FROM amina.produit p JOIN amina.commande c ON p.idp = c.idp WHERE nom LIKE 'produit100%';

use hash join:
*/

``` 
SELECT /*+ USE_HASH(p c) */ count(*) FROM amina.produit p JOIN amina.commande c ON p.idp = c.idp WHERE nom LIKE 'produit100%';
```

/*
filter before joining:

SELECT count(*) FROM (
  SELECT idp FROM amina.produit WHERE nom LIKE 'produit100%'
) p JOIN amina.commande c ON p.idp = c.idp;
*/









