@output.sql;

SELECT B.*
FROM Belegung B, Ferienwohnung F
WHERE(
    B.Ferienwohnung = F.WohnungsID AND
    B.Ferienwohnung = &WohnungsID)
;