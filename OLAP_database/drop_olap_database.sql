/************************************************************************/
/* ORACLE 12c                                                           */
/*                                                                      */
/* Drop OLAP database schema                                            */
/*                                                                      */
/* Authors: Alexander Heckmann                                          */
/*                                                                      */
/************************************************************************/

-- Empty Oracle's recycle bin and disable the recycle bin for the session
PURGE RECYCLEBIN;
ALTER SESSION SET RECYCLEBIN = Off;

DROP TABLE Belegungen;

DROP TABLE Zeitraeume;

DROP TABLE Ferienwohnungen;

DROP TABLE Kunden;