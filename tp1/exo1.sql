-- part 1

DECLARE
    CURSOR remplirePE IS SELECT * FROM PRODUIT;
    nbr INT;
BEGIN
    SELECT COUNT(*) INTO nbr FROM PRODUIT;
    IF nbr = 0 THEN
        INSERT INTO PRODUIT_Etranger VALUES (0, 'Pas de produit', NULL, NULL);
    ELSE
        FOR element IN remplirePE LOOP
            INSERT INTO PRODUIT_Etranger VALUES (
                element.IDP,
                UPPER(element.designation),
                NVL(element.prixunitaire , 0) * 0.05,
                element.IDCategorie
            );
        END LOOP;
    END IF;
    COMMIT;
END;

-- part 2

CREATE TABLE ProduitHistory (
  username VARCHAR(20),
  IDP number NOT NULL,
  operation_date DATE,
  operation_type VARCHAR(20),
  PRIMARY KEY (IDP)
);

COMMIT;

CREATE OR REPLACE TRIGGER remplirePH
AFTER INSERT OR DELETE OR UPDATE ON PRODUIT
FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO PRODUITHISTORY VALUES (
            user, :NEW.IDP, SYSDATE, 'INSERT'
        );
    ELSE IF deleting THEN
            INSERT INTO PRODUITHISTORY VALUES (
                user, :OLD.IDP, SYSDATE, 'DELETE'
            );
        ELSE
            INSERT INTO PRODUITHISTORY VALUES (
                user, :NEW.IDP, SYSDATE, 'UPDATE'
            );
        END IF;
    END IF;
END;

INSERT INTO PRODUIT VALUES (6, 'test', 1000, 1);
COMMIT;