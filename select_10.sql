@output.sql;

SELECT L.Name, COUNT(B.Status) AS Belegungen
FROM
    Land L LEFT OUTER JOIN Ort O
        ON L.ISO = O.Land
    LEFT OUTER JOIN Adresse A
        ON O.Name = A.Ort
    LEFT OUTER JOIN Ferienwohnung F
        ON F.Adresse = A.AdressID
    LEFT OUTER JOIN Belegung B
        ON B.Ferienwohnung = F.WohnungsID
GROUP BY L.Name
ORDER BY COUNT(B.Status) DESC, L.Name;