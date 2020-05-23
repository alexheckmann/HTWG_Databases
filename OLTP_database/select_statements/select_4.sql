@output.sql;

SELECT K.UserID, K.Name, K.Vorname, COUNT(B.BuchungsNr) AS Buchungen
FROM Belegung B, Kunde K
WHERE (
    K.Name = '&name' AND
    B.UserID = K.UserID)
GROUP BY K.UserID, K.Name, K.Vorname
ORDER BY K.UserID
;