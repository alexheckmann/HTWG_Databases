@output.sql;

SELECT F.WohnungsID, F.Beschreibung
FROM Belegung B, Ferienwohnung F, Adresse A, Ort O, Land L
WHERE (
    B.Ferienwohnung = F.WohnungsID AND
    F.Adresse = A.AdressID AND
    A.Ort = O.Name AND
    O.Land = L.ISO AND
    L.Name = 'Frankreich')
GROUP BY F.WohnungsID, F.Beschreibung
HAVING COUNT(B.BuchungsNr) > (SELECT COUNT(F.WohnungsID)
                             FROM Ferienwohnung F, Adresse A, Ort O, Land L
                             WHERE (
                                 F.Adresse = A.AdressID AND
                                 A.Ort = O.Name AND
                                 O.Land = L.ISO AND
                                 L.Name = 'Frankreich')
                            )
;