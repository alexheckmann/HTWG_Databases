SELECT DISTINCT F.*
from istAusgestattet iA, Ferienwohnung F, Adresse A, Ort O, Land L, Zusatzausstattung Z, Belegung B
WHERE (
    F.WohnungsID = iA.WohnungsID AND
    iA.AusstattungsID = Z.AusstattungsID AND
    Z.name = 'Schwimmbad' AND
    F.Adresse = A.AdressID AND
    A.Ort = O.Name AND
    O.Land = L.ISO AND
    L.Name = 'Türkei' AND
    B.Ferienwohnung = F.WohnungsID AND
    ((B.startdatum <= '01.05.2016' AND B.enddatum >= '21.05.2016') OR
    (B.startdatum < '01.05.2016' AND B.enddatum >= '01.05.2016') OR
    (B.startdatum < '21.05.2016' AND B.enddatum > '21.05.2016') OR
    (B.startdatum >= '01.05.2016' AND B.enddatum <= '21.05.2016'))
    )
;