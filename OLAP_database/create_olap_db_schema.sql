/************************************************************************/
/* ORACLE 12c                                                           */
/*                                                                      */
/* Create OLAP database schema                                          */
/*                                                                      */
/* Author: Alexander Heckmann                                           */
/*                                                                      */
/************************************************************************/

-- Set the used date format for the session
ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY';

-- Empty Oracle's recycle bin and disable the recycle bin for the session
PURGE RECYCLEBIN;
ALTER SESSION SET RECYCLEBIN = Off;

CREATE TABLE Kunden (
    Userid NUMERIC
        CONSTRAINT Pk_Kunden
            PRIMARY KEY,
    Alter DATE NOT NULL,
    Plz VARCHAR2(8) NOT NULL,
    Ort VARCHAR2(256) NOT NULL,
    Land VARCHAR2(64) NOT NULL,
    Bic CHAR(11) NOT NULL,
    Blz NUMERIC NOT NULL
);

CREATE TABLE Ferienwohnungen (
    Wohnungsid NUMERIC
        CONSTRAINT Pk_Ferienwohnungen
            PRIMARY KEY,
    Zimmerzahl NUMERIC NOT NULL,
    Groesse NUMBER(*, 2) NOT NULL,
    Preis NUMBER(*, 2) NOT NULL,
    Plz VARCHAR2(8) NOT NULL,
    Ort VARCHAR2(256) NOT NULL,
    Land VARCHAR2(64) NOT NULL
);

CREATE TABLE Zeitraeume (
    Startdatum DATE NOT NULL,
    Enddatum DATE NOT NULL,
    Dauer NUMERIC NOT NULL
        CONSTRAINT Range_Zeitraeume CHECK (Dauer > 0),
    Status VARCHAR2(64) NOT NULL
        CONSTRAINT Range_Status
            CHECK (Status IN ('reserviert', 'gebucht')),
    CONSTRAINT Pk_Zeitraeume PRIMARY KEY (Startdatum, Enddatum)
);

CREATE TABLE Belegungen (
    Userid NUMERIC,
    Wohnungsid NUMERIC,
    Startdatum DATE,
    Enddatum DATE,
    CONSTRAINT Pk_Belegungen PRIMARY KEY (Userid, Wohnungsid, Startdatum, Enddatum),
    CONSTRAINT Fk_Belegungen_Kunden FOREIGN KEY (Userid)
        REFERENCES Kunden (Userid),
    CONSTRAINT Fk_Belegungen_Ferienwohnungen FOREIGN KEY (Wohnungsid)
        REFERENCES Ferienwohnungen (Wohnungsid),
    CONSTRAINT Fk_Belegungen_Zeitraeume FOREIGN KEY (Startdatum, Enddatum)
        REFERENCES Zeitraeume (Startdatum, Enddatum)
);
