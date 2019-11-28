@output.sql;

SELECT DISTINCT K.*
FROM Kunde K, Belegung B
WHERE (
      B.UserID = K.UserID AND
      B.Ferienwohnung = &WohnungsID AND
      B.Status = 'reserviert')
;