DROP TABLE produit  CASCADE CONSTRAINTS;
DROP TABLE commande CASCADE CONSTRAINTS;
DROP TABLE commande_partitionne CASCADE CONSTRAINTS;

create table produit ( idp int, nom varchar(20), type varchar(20));
create table commande(idp int, qte int);

create table commande_partitionne(idp int, qte int) PARTITION BY HASH(qte)(
  PARTITION p1,
  PARTITION p2,
  PARTITION p3,
  PARTITION p4,
  PARTITION p5,
  PARTITION p6,
  PARTITION p7,
  PARTITION p8,
  PARTITION p9,
  PARTITION p10
);

ALTER SESSION SET NLS_LANGUAGE="FRENCH";
ALTER SESSION SET NLS_TERRITORY="FRANCE";

BEGIN
FOR i IN 1..200000 LOOP

INSERT INTO  produit VALUES (i, 'produit'||i, dbms_random.string('L', 1));


INSERT INTO commande VALUES(i,  trunc(dbms_random.value(1,11)));
INSERT INTO commande VALUES(i,  trunc(dbms_random.value(1,11)));
INSERT INTO commande VALUES(i, trunc(dbms_random.value(1,11)));
INSERT INTO commande VALUES(i, trunc(dbms_random.value(1,11)));

INSERT INTO commande_partitionne VALUES(i,  trunc(dbms_random.value(1,11)));
INSERT INTO commande_partitionne VALUES(i,  trunc(dbms_random.value(1,11)));
INSERT INTO commande_partitionne VALUES(i, trunc(dbms_random.value(1,11)));
INSERT INTO commande_partitionne VALUES(i, trunc(dbms_random.value(1,11)));

IF(mod(i, 5000)=0) THEN COMMIT; END IF;
END LOOP;
END;
/

UPDATE produit SET type=NULL WHERE mod(idp, 7700)=0;
commit;


