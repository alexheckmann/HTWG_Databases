@output.sql;
SELECT DISTINCT F.*
FROM istAusgestattet iA, Ferienwohnung F, Adresse A, Ort O, Land L, Zusatzausstattung Z, Belegung B
WHERE (
    iA.WohnungsID = F.WohnungsID AND
    F.Adresse = A.AdressID AND
    A.Ort = O.Name AND
    O.Land = L.ISO AND
    L.Name = 'Frankreich' AND
    Z.Name = 'Schwimmbad' AND
    B.Ferienwohnung = F.WohnungsID AND
    B.Status = 'gebucht'
)
ORDER BY F.WohnungsID;