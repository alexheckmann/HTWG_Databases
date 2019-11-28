@output.sql;

SELECT DISTINCT F.*
FROM Ferienwohnung F, Adresse A1, Adresse A2, Ort O1, Ort O2, Land L, istEntfernt ie, Touristenattraktion T
WHERE (
    F.Adresse = A1.AdressID AND
    A1.Ort = O1.Name AND
    O1.Land = L.ISO AND
    L.Name = 'Frankreich' AND
    A2.Ort = O2.Name AND
    T.Name = 'Disneyland' AND
    T.Adresse = A2.AdressID AND
    (ie.von = A1.Ort AND
    ie.nach = O2.Name AND
    ie.Entfernung <= 100 OR
    ie.von = O2.Name AND
    ie.nach = A1.Ort AND
    ie.Entfernung <= 100 OR
    A1.Ort = O2.Name)
)
ORDER BY F.WohnungsID;