@output.sql;

SELECT  DISTINCT FG.*
FROM Ferienwohnung FW,Adresse A1,Adresse A2,Ort O1,Ort O2,
     Flughafen FH,fliegen FL,Fluggesellschaft FG
WHERE (
    FW.WohnungsID = &WohnungsID AND
    FW.Adresse = A1.AdressID AND
    A1.Ort = O1.Name AND
    A2.Ort = O2.Name AND
    O2.Land <> O1.Land AND
    FL.startet = O2.Flughafen AND
    FL.landet = O1.Flughafen AND
    FL.GesellschaftsID = FG.GesellschaftsID AND
    FG.Qualitaetskennzahl = (
            SELECT MAX(FG.Qualitaetskennzahl)
            FROM Ferienwohnung FW,Adresse A1,Adresse A2,Ort O1,Ort O2,
            Flughafen FH,fliegen FL,Fluggesellschaft FG
            WHERE (
                FW.WohnungsID = WohnungsID AND
                FW.Adresse = A1.AdressID AND
                A1.Ort = O1.Name AND
                A2.Ort = O2.Name AND
                O2.Land <> O1.Land AND
                FL.startet = O2.Flughafen AND
                FL.landet = O1.Flughafen AND
                FL.GesellschaftsID = FG.GesellschaftsID))
    )
;