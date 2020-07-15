INSERT INTO Kunden (Userid, Alter, Plz, Ort, Land, Bic, Blz)
SELECT K.Userid,
       (CURRENT_DATE - K.Geburtsdatum),
       A.Plz,
       O.Name,
       L.Name,
       Bv.Bic,
       Bv.Blz
    FROM Kunde K,
         Adresse A,
         Ort O,
         Land L,
         Bankverbindung Bv
    WHERE K.Adresse = A.Adressid AND
          A.Ort = O.Name AND
          O.Land = L.Iso AND
          K.Iban = Bv.Iban
;

INSERT INTO Ferienwohnungen (Wohnungsid, Zimmerzahl, Groesse, Preis, Plz, Ort, Land)
SELECT F.Wohnungsid,
       F.Zimmerzahl,
       F.Groesse,
       F.Preis,
       A.Plz,
       O.Name,
       L.Name
    FROM Ferienwohnung F,
         Adresse A,
         Ort O,
         Land L
    WHERE F.Adresse = A.Adressid AND
          A.Ort = O.Name AND
          O.Land = L.Iso
;

INSERT INTO Zeitraeume (Startdatum, Enddatum, Dauer, Status)
SELECT DISTINCT B.Startdatum, B.Enddatum, (B.Enddatum - B.Startdatum), B.Status
    FROM Belegung B
;

INSERT INTO Belegungen (Userid, Wohnungsid, Startdatum, Enddatum)
SELECT B.Userid, B.Ferienwohnung, B.Startdatum, B.Enddatum
    FROM Belegung B;
