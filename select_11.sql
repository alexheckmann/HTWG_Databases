SELECT
    F.WohnungsID AS Wohnung,
    COUNT(R.Status)  AS Reservierungen,
    COUNT(B.Status) AS Buchungen
FROM
    Ferienwohnung F LEFT OUTER JOIN Belegung B
        ON B.Ferienwohnung = F.Wohnungsid AND
           B.Status = 'gebucht'
    LEFT OUTER JOIN Belegung R
        ON R.Ferienwohnung = F.Wohnungsid AND
        R.Status = 'reserviert'
GROUP BY
    F.WohnungsID, B.Status, R.Status
ORDER BY F.WohnungsID;