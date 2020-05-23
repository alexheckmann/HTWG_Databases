/************************************************************************/
/* ORACLE 12c                                                           */
/*                                                                      */
/* Delete database schema                                               */
/*                                                                      */
/* Authors: Philip Schächinger, Alexander Aichholz, Alexander Heckmann  */
/* Tandem: 21                                                           */
/************************************************************************/

-- Empty Oracle's recycle bin and disable the recycle bin for the session
PURGE recyclebin;
ALTER SESSION SET recyclebin = OFF;

-- DDL statements to drop tables from DBS21

DROP TRIGGER BuchungLoeschen;

DROP TABLE stornierteBuchungen;

DROP FUNCTION preis;

DROP SEQUENCE Stornierungsnummer;

DROP TABLE Rechnung;

DROP TABLE fliegen;

DROP TABLE Belegung;

DROP TABLE istAusgestattet;

DROP TABLE Bild;

DROP TABLE Kunde;

DROP TABLE Ferienwohnung;

DROP TABLE Touristenattraktion;

-- DDL statement to drop constraint containing foreign key reference to be able to drop table
ALTER TABLE Ort DROP CONSTRAINT FK_Ort_Flughafen;

DROP TABLE Flughafen;

DROP TABLE Adresse;

DROP TABLE istEntfernt;

DROP TABLE Ort;

DROP TABLE Fluggesellschaft;

DROP TABLE Bankverbindung;

DROP TABLE Land;

DROP TABLE Zusatzausstattung;
