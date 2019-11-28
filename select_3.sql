@output.sql;

SELECT COUNT(BuchungsNr) AS Buchungen
FROM Belegung B
WHERE (
    B.UserID = &userID AND
    B.Status = 'gebucht')
;