/************************************************************************/
/* ORACLE 12c                                                           */
/*                                                                      */
/* Create database schema                                               */
/*                                                                      */
/* Authors: Philip Schächinger, Alexander Aichholz, Alexander Heckmann  */
/* Tandem: 21                                                           */
/************************************************************************/

-- Set the used date format for the session
ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY'; 

-- Empty Oracle's recycle bin and disable the recycle bin for the session
PURGE recyclebin;
ALTER SESSION SET recyclebin = OFF;

-- DDL statement to create table "Zusatzausstattung"
CREATE TABLE Zusatzausstattung (
    AusstattungsID NUMERIC 
        CONSTRAINT PK_Zusatzausstattungen 
        PRIMARY KEY,
    Name VARCHAR2(64) NOT NULL
        CONSTRAINT AK1_Zusatzausstattungen
        UNIQUE 
);

-- DDL statement to create table "Land"
CREATE TABLE Land (
    ISO VARCHAR2(4) 
        CONSTRAINT PK_Land PRIMARY KEY,
    Name VARCHAR2(64) NOT NULL
        CONSTRAINT AK_Land
        UNIQUE 
);

-- DDL statement to create table "Bankverbindung"
CREATE TABLE Bankverbindung (
    IBAN VARCHAR2(34) 
        CONSTRAINT PK_Bankverbindung PRIMARY KEY,
    BIC CHAR(11) NOT NULL,
    BLZ NUMERIC NOT NULL,
    KontoNr NUMERIC NOT NULL,
    CONSTRAINT AK1_Bankverbindung
        UNIQUE (BIC, KontoNr),
    CONSTRAINT AK2_Bankverbindung
        UNIQUE (BLZ, KontoNr)
);

-- DDL statement to create table "Fluggesellschaft"
CREATE TABLE Fluggesellschaft (
    GesellschaftsID NUMERIC
        CONSTRAINT PK_FLugesellschaft PRIMARY KEY,
    Name VARCHAR2(256) NOT NULL
        CONSTRAINT AK_Fluggesellschaft
        UNIQUE,
    Qualitaetskennzahl NUMERIC NOT NULL
        CONSTRAINT RANGE_Kennzahl
        CHECK (Qualitaetskennzahl >=1 AND Qualitaetskennzahl <= 10)
);

-- DDL statement to create table "Ort"
CREATE TABLE Ort (
    Name VARCHAR2(256) 
        CONSTRAINT PK_Ort 
        PRIMARY KEY,
    Land VARCHAR2(4) NOT NULL,
        CONSTRAINT FK_Ort_Land
        FOREIGN KEY (Land) REFERENCES Land(ISO),
    Flughafen CHAR(3)
);

-- DDL statement to create table "istEntfernt"
CREATE TABLE istEntfernt (
    von VARCHAR(256),
    nach VARCHAR(256),
    Entfernung NUMERIC NOT NULL
        CONSTRAINT RANGE_Entfernung
        CHECK (Entfernung >= 0),
    CONSTRAINT PK_istEntfernt
        PRIMARY KEY (von, nach),
    CONSTRAINT RANGE_Orte
        CHECK (von <> nach),
    CONSTRAINT FK_istEntfernt_Ort1
        FOREIGN KEY (von) REFERENCES Ort(Name),
    CONSTRAINT FK_istEntfernt_Ort2
        FOREIGN KEY (nach) REFERENCES Ort(Name)
);

-- DDL statement to create table "Adresse"
CREATE TABLE Adresse (
    AdressID NUMERIC 
        CONSTRAINT PK_Adresse
        PRIMARY KEY,
    Strasse VARCHAR2(256) NOT NULL,
    HausNr VARCHAR2(8),
    PLZ VARCHAR2(8) NOT NULL,
    Ort VARCHAR2(256) NOT NULL,
    CONSTRAINT FK_Adresse_Ort
        FOREIGN KEY (Ort) REFERENCES Ort(Name)
);

-- DDL statement to create table "Flughafen"
CREATE TABLE Flughafen (
    Flughafenkuerzel CHAR(3) 
        CONSTRAINT PK_Flughafen
        PRIMARY KEY,
    Name VARCHAR2(64) NOT NULL
        CONSTRAINT AK1_Flughafen
        UNIQUE,
    Adresse NUMERIC NOT NULL
        CONSTRAINT AK2_Flughafen
        UNIQUE,
    CONSTRAINT FK_Flughafen_Adresse
        FOREIGN KEY (Adresse) REFERENCES Adresse(AdressID)
);

-- DDL statement to add constraint containing foreign key reference to table "Ort"
ALTER TABLE Ort ADD CONSTRAINT FK_Ort_Flughafen FOREIGN KEY (Flughafen) REFERENCES Flughafen(Flughafenkuerzel);

-- DDL statement to create table "Touristenattraktion"
CREATE TABLE Touristenattraktion (
    AttraktionID NUMERIC
        CONSTRAINT PK_Touristenattraktion
        PRIMARY KEY,
    Name VARCHAR2(64) NOT NULL
        CONSTRAINT AK1_Touristenattraktion
        UNIQUE,
    Beschreibung VARCHAR2(256) NOT NULL,
    Adresse NUMERIC NOT NULL
        CONSTRAINT AK2_Touristenattraktion
        UNIQUE,
    CONSTRAINT FK_Touristenattraktion_Adresse
        FOREIGN KEY (Adresse) REFERENCES Adresse(AdressID)
);

-- DDL statement to create table "Ferienwohnung"
CREATE TABLE Ferienwohnung (
    WohnungsID NUMERIC
        CONSTRAINT PK_Ferienwohnung
        PRIMARY KEY,
    Beschreibung VARCHAR2(256) NOT NULL,
    Zimmerzahl NUMERIC NOT NULL
        CONSTRAINT RANGE_Zimmerzahl
        CHECK (Zimmerzahl >= 1),
    Groesse NUMBER(*, 2) NOT NULL
        CONSTRAINT RANGE_Groesse
        CHECK (Groesse > 0),
    Preis NUMBER(*, 2) NOT NULL
        CONSTRAINT RANGE_Preis
        CHECK (Preis >= 0),
    Adresse NUMERIC NOT NULL
        CONSTRAINT AK1_Ferienwohnung
        UNIQUE,
    CONSTRAINT FK_Ferienwohnung_Adresse
        FOREIGN KEY (Adresse) REFERENCES Adresse(AdressID)
);

-- DDL statement to create table "Kunde"
CREATE TABLE Kunde (
    UserID NUMERIC
        CONSTRAINT PK_Kunde
        PRIMARY KEY,
    Name VARCHAR2(64) NOT NULL,
    Vorname VARCHAR2(64) NOT NULL,
    Email VARCHAR2(256) NOT NULL
        CONSTRAINT AK1_Kunde
        UNIQUE,
    Geburtsdatum DATE NOT NULL,
    TelefonNr VARCHAR2(16) NOT NULL,
    Adresse NUMERIC NOT NULL
        CONSTRAINT AK2_Kunde
        UNIQUE,
    IBAN VARCHAR(34) NOT NULL
        CONSTRAINT AK3_Kunde
        UNIQUE,
    CONSTRAINT FK_Kunde_Bankverbindung
        FOREIGN KEY (IBAN) REFERENCES Bankverbindung(IBAN),
    CONSTRAINT FK_Kunde_Adresse
        FOREIGN KEY (Adresse) REFERENCES Adresse(AdressID)
);

-- DDL statement to create view "MidAgeKunden" containing all customers between the ages of 30 to 40
CREATE VIEW MidAgeKunden(UserID, Name, Vorname, Email, Geburtsdatum, TelefonNr, Adresse, IBAN, Lebensalter) AS
    (SELECT K.*, Floor((Months_Between(Current_Date, K.Geburtsdatum)/12))
    FROM Kunde K
    WHERE FLOOR((MONTHS_BETWEEN(Current_Date, Geburtsdatum) / 12)) BETWEEN 30 AND 40
    )
;

-- DDL statement to create table "Bild"
CREATE TABLE Bild (
    BildID NUMERIC
        CONSTRAINT PK_Bild
        PRIMARY KEY,
    Beschreibung VARCHAR2(256) NOT NULL,
    Dateipfad VARCHAR(256) NOT NULL
        CONSTRAINT AK1_Bild
        UNIQUE,
    Ferienwohnung NUMERIC NOT NULL,
    CONSTRAINT FK_Bild_Ferienwohnung
        FOREIGN KEY (Ferienwohnung) REFERENCES Ferienwohnung(WohnungsID)
);

-- DDL statement to create table "istAusgestattet"
CREATE TABLE istAusgestattet (
    WohnungsID NUMERIC,
    AusstattungsID NUMERIC,
    CONSTRAINT PK_istAusgestattet
       PRIMARY KEY (WohnungsID, AusstattungsID),
    CONSTRAINT FK_iA_Ferienwohnung
        FOREIGN KEY (WohnungsID) REFERENCES Ferienwohnung(WohnungsID),
    CONSTRAINT FK_iA_Zusatzausstattung
        FOREIGN KEY (AusstattungsID) REFERENCES Zusatzausstattung(AusstattungsID)
);

-- DDL statement to create table "Belegung"
CREATE TABLE Belegung (
    BuchungsNr NUMERIC
        CONSTRAINT PK_Belegung
        PRIMARY KEY,
    Belegungsdatum DATE NOT NULL,
    UserID NUMERIC NOT NULL,
    Ferienwohnung NOT NULL,
    Status VARCHAR2(64)
        CONSTRAINT RANGE_Status
        CHECK (Status IN ('reserviert','gebucht')),
    Startdatum DATE NOT NULL,
    Enddatum DATE NOT NULL,
    CONSTRAINT FK_Belegung_Kunde
        FOREIGN KEY (UserID) REFERENCES Kunde(UserID),
    CONSTRAINT FK_Belegung_Ferienwohnung
        FOREIGN KEY (Ferienwohnung) REFERENCES Ferienwohnung(WohnungsID),
    CONSTRAINT RANGE_Datum
        CHECK (Startdatum < Enddatum)
);

-- DDL statement to create view "Buchung" representing a specialization of "Belegung"
-- containing all booked flats
CREATE VIEW Buchung (BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Startdatum, Enddatum) AS
    (SELECT B.BuchungsNr, B.Belegungsdatum, B.UserID, B.Ferienwohnung, B.Startdatum, B.Enddatum
    FROM Belegung B
    WHERE B.Status = 'gebucht'
    )
;

-- DDL statement to create view "Reservierung" representing a specialization of "Belegung"
-- containing all reserved flats
CREATE VIEW Reservierung (BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Startdatum, Enddatum) AS
    (SELECT B.BuchungsNr, B.Belegungsdatum, B.UserID, B.Ferienwohnung, B.Startdatum, B.Enddatum
    FROM Belegung B
    WHERE B.Status = 'reserviert'
    )
;

-- DDL statement to create view "UebersichtKunden" containing all relevant customer information
CREATE VIEW UebersichtKunden (
    UserID, Name, Vorname, Email, Geburtsdatum, TelefonNr,
    Strasse, Hausnummer, PLZ, Ort, Land,
    IBAN, BIC, BLZ, KontoNr,
    Status, Startdatum, Enddatum, Belegungsdatum,
    Ferienwohnung, Beschreibung) AS
    (
    SELECT K.UserID, K.Name, K.Vorname, K.Email, K.Geburtsdatum, K.TelefonNr,
           A.Strasse, A.HausNr, A.PLZ, O.Name, L.Name,
           BV.*,
           BE.Status, BE.Startdatum, BE.Enddatum, BE.Belegungsdatum,
           F.WohnungsID, F.Beschreibung
    FROM Kunde K FULL OUTER JOIN Belegung BE
        ON K.UserID = BE.UserID
        FULL OUTER JOIN Ferienwohnung F
         ON BE.Ferienwohnung = F.WohnungsID,
        Adresse A, Ort O, Land L, Bankverbindung BV
    WHERE (
        K.Adresse = A.AdressID AND
        A.Ort = O.Name AND
        O.Land = L.ISO AND
        K.IBAN = BV.IBAN
        )
    )
;

-- DDL statement to create table "fliegen"
CREATE TABLE fliegen (
    startet CHAR(3),
    landet CHAR(3),
    GesellschaftsID NUMERIC,
    CONSTRAINT PK_fliegen
        PRIMARY KEY (startet, landet, GesellschaftsID),
    CONSTRAINT FK_fliegen_Flughafen1
        FOREIGN KEY (startet) REFERENCES Flughafen(Flughafenkuerzel),
    CONSTRAINT FK_fliegen_Flughafen2
        FOREIGN KEY (landet) REFERENCES Flughafen(Flughafenkuerzel),
    CONSTRAINT FK_fliegen_Fluggesellschaft
        FOREIGN KEY (GesellschaftsID) REFERENCES Fluggesellschaft(GesellschaftsID)
);

-- DDL statement to create table "Rechnung"
CREATE TABLE Rechnung (
    RechnungsNr NUMERIC
        CONSTRAINT PK_Rechnung
        PRIMARY KEY,
    Rechnungsdatum DATE NOT NULL,
    BuchungsNr NUMERIC NOT NULL
        CONSTRAINT AK1_Rechnung
        UNIQUE,
    Betrag NUMBER(*, 2) NOT NULL
        CONSTRAINT RANGE_Betrag
        CHECK (Betrag >= 0),
    Zahlungseingang DATE,
    CONSTRAINT FK_Rechnung_Belegung
        FOREIGN KEY (BuchungsNr) REFERENCES Belegung(BuchungsNr)
);

-- DDL statement to create view "Zahlungsstatus" containing all relevant information regarding booked flats
-- and whether they're already paid for
CREATE VIEW Zahlungsstatus(
    Ferienwohnung, Beschreibung,
    UserID, Name, Vorname,
    RechnungsNr, Rechnungsdatum, Betrag, Status, Zahlungsdatum) AS
    (SELECT
        F.WohnungsID, F.Beschreibung,
        K.UserID, K.Name, K.Vorname,
        R.RechnungsNr, R.Rechnungsdatum, R.Betrag, NVL2(R.Zahlungseingang,'bezahlt','offen') AS Status, R.Zahlungseingang
    FROM Ferienwohnung F, Kunde K, Rechnung R, Belegung B
    WHERE (
        F.WohnungsID = B.Ferienwohnung AND
        K.UserID = B.UserID AND
        B.Status = 'gebucht' AND
        B.BuchungsNr = R.BuchungsNr)
    )
;
