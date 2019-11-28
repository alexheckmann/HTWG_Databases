@output.sql;

SELECT DISTINCT F.*, B.Status
FROM Belegung B RIGHT OUTER JOIN Ferienwohnung F
        ON B.Ferienwohnung = F.WohnungsID,
     istAusgestattet iA, Zusatzausstattung Z, Adresse A, Ort O, Land L
WHERE (
    F.WohnungsID = iA.WohnungsID AND
    iA.AusstattungsID = Z.AusstattungsID AND
    Z.Name = 'Schwimmbad' AND
    F.Adresse = A.AdressID AND
    A.Ort = O.Name AND
    O.Land = L.ISO AND
    L.Name = 'Frankreich' AND
    (B.Status <> 'gebucht' OR
         B.Ferienwohnung IS NULL)
    )
;