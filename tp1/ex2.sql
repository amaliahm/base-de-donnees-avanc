-- part 1

DECLARE
    CURSOR cyclist_cursor IS
        SELECT R.IdCycliste, SUM(R.temps) AS totalTemps
        FROM Resultat R
        INNER JOIN Etape E ON R.IdEtape = E.IdEtape
        GROUP BY R.IdCycliste
        HAVING COUNT(DISTINCT R.IdEtape) = (SELECT COUNT(*) FROM Etape);

    v_IdCycliste Resultat.IdCycliste%TYPE;
    v_totalTemps Resultat.temps%TYPE;
BEGIN
    FOR element IN cyclist_cursor LOOP
        INSERT INTO ResultatFinal VALUES (element.IdCycliste, element.totalTemps);
    END LOOP;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('ResultatFinal table populated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

-- part 2

CREATE TRIGGER trg_update_nbCycliste
BEFORE INSERT OR UPDATE OR DELETE ON Cycliste
FOR EACH ROW
DECLARE
    v_nbCycliste NUMBER; 
BEGIN
    IF DELETING THEN
        SELECT nbCycliste INTO v_nbCycliste
        FROM Equipe
        WHERE IdEquipe = :OLD.IdEquipe;
        
        IF v_nbCycliste - 1 < 4 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Le nombre de cyclistes par équipe doit être au moins 4.');
        END IF;
        
        UPDATE Equipe
        SET nbCycliste = nbCycliste - 1
        WHERE IdEquipe = :OLD.IdEquipe;
    END IF;

    IF INSERTING THEN
        SELECT nbCycliste INTO v_nbCycliste
        FROM Equipe
        WHERE IdEquipe = :NEW.IdEquipe;
        
        IF v_nbCycliste + 1 > 6 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Le nombre de cyclistes par équipe ne peut pas dépasser 6.');
        END IF;
        
        UPDATE Equipe
        SET nbCycliste = nbCycliste + 1
        WHERE IdEquipe = :NEW.IdEquipe;
    END IF;

    IF UPDATING THEN
        IF :OLD.IdEquipe != :NEW.IdEquipe THEN
            SELECT nbCycliste INTO v_nbCycliste
            FROM Equipe
            WHERE IdEquipe = :OLD.IdEquipe;

            IF v_nbCycliste - 1 < 4 THEN
                RAISE_APPLICATION_ERROR(-20003, 'Le nombre de cyclistes dans l''ancienne équipe doit être au moins 4.');
            END IF;

            UPDATE Equipe
            SET nbCycliste = nbCycliste - 1
            WHERE IdEquipe = :OLD.IdEquipe;

            SELECT nbCycliste INTO v_nbCycliste
            FROM Equipe
            WHERE IdEquipe = :NEW.IdEquipe;

            IF v_nbCycliste + 1 > 6 THEN
                RAISE_APPLICATION_ERROR(-20004, 'Le nombre de cyclistes dans la nouvelle équipe ne peut pas dépasser 6.');
            END IF;

            UPDATE Equipe
            SET nbCycliste = nbCycliste + 1
            WHERE IdEquipe = :NEW.IdEquipe;
        END IF;
    END IF;
END;
