/************************************************************************/
/* ORACLE 12c                                                           */
/*                                                                      */
/* Delete all data                                                      */
/*                                                                      */
/* Authors: Philip Schächinger, Alexander Aichholz, Alexander Heckmann  */
/* Tandem: 21                                                           */
/************************************************************************/

-- Empty Oracle's recycle bin and disable the recycle bin for the session
PURGE recyclebin;
ALTER SESSION SET recyclebin = OFF;

-- DML statements to remove data from tables

DELETE FROM Rechnung;

DELETE FROM fliegen;

DELETE FROM Belegung;

DELETE FROM istAusgestattet;

DELETE FROM Bild;

DELETE FROM Kunde;

DELETE FROM Ferienwohnung;

DELETE FROM Touristenattraktion;

DELETE FROM Flughafen;

DELETE FROM Adresse;

DELETE FROM istEntfernt;

DELETE FROM Ort;

DELETE FROM Bankverbindung;

DELETE FROM Fluggesellschaft;

DELETE FROM Land;

DELETE FROM Zusatzausstattung;

COMMIT;