@output.sql;

SELECT F.*
FROM Zusatzausstattung Z, istAusgestattet iA,
     Ferienwohnung F LEFT OUTER JOIN Belegung B ON F.WohnungsID = B.Ferienwohnung,
     Adresse A, Ort O, Land L
WHERE (
    Z.Name = 'Schwimmbad' AND
    Z.AusstattungsID = iA.AusstattungsID AND
    iA.WohnungsID = F.WohnungsID AND
    F.Adresse = A.AdressID AND
    A.Ort = O.Name AND
    O.Land = L.ISO AND
    L.Name = 'Türkei' AND
    (
        B.Status IS NULL OR
        B.Startdatum > '21.05.2016' OR
        B.Enddatum < '01.05.2016'
    )
)
ORDER BY F.WohnungsID;