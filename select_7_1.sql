@output.sql;

SELECT DISTINCT F.*, B.Status
FROM Belegung B RIGHT OUTER JOIN Ferienwohnung F
        on B.Ferienwohnung = F.WohnungsID,
     istausgestattet iA, Zusatzausstattung Z, Adresse A, Ort O, Land L
WHERE (
    F.WohnungsID = iA.WohnungsID AND
    iA.AusstattungsID = Z.Ausstattungsid AND
    Z.Name = 'Schwimmbad' AND
    F.Adresse = A.AdressID AND
    A.ORT = O.NAME AND
    O.Land = L.ISO AND
    L.Name = 'Frankreich' AND
    (B.Status <> 'reserviert'
             OR B.Ferienwohnung IS NULL)
    )
;