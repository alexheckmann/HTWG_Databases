/************************************************************************/
/* ORACLE 12c                                                           */
/*                                                                      */
/* Insert initial data                                                  */
/*                                                                      */
/* Authors: Philip Schächinger, Alexander Aichholz, Alexander Heckmann  */
/* Tandem: 21                                                           */
/************************************************************************/

-- Set the used date format for the session
ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY';

-- DDL statement to disable constraint containing foreign key reference to be able to insert data
ALTER TABLE Ort DISABLE CONSTRAINT FK_Ort_Flughafen;

-- DML statement to insert data into table "Zusatzausstattung"
INSERT INTO
    Zusatzausstattung(AusstattungsID, Name)	
    VALUES (1, 'Schwimmbad');
INSERT INTO	
    Zusatzausstattung(AusstattungsID, Name) 
    VALUES (2, 'Sauna')	;
INSERT INTO	
    Zusatzausstattung(AusstattungsID, Name)	
    VALUES (3,	'Autoabstellplatz');
INSERT INTO	
    Zusatzausstattung(AusstattungsID, Name)	
    VALUES (4, 'Aufzug');
INSERT INTO	
    Zusatzausstattung(AusstattungsID, Name)	
    VALUES (5, 'Kinderbetreuung');
INSERT INTO	
    Zusatzausstattung(AusstattungsID, Name)	
    VALUES (6, 'Sat-TV');
INSERT INTO	
    Zusatzausstattung(AusstattungsID, Name)	
    VALUES (7, 'Reinigung');
INSERT INTO	
    Zusatzausstattung(AusstattungsID, Name)	
    VALUES (8, 'Dachterasse');
INSERT INTO	
    Zusatzausstattung(AusstattungsID, Name)	
    VALUES (9, 'Garage');

-- DML statement to insert data into table "Land"
INSERT INTO	
    Land(ISO, Name) 
    VALUES ('DE', 'Deutschland');
INSERT INTO	
    Land(ISO, Name)	
    VALUES ('CH', 'Schweiz');
INSERT INTO	
    Land(ISO, Name)	
    VALUES ('TR', 'Türkei');
INSERT INTO	
    Land(ISO, Name)	
    VALUES ('FR', 'Frankreich');
INSERT INTO	
    Land(ISO, Name)	
    VALUES ('ES', 'Spanien');
INSERT INTO	
    Land(ISO, Name)	
    VALUES ('GL', 'Grönland');

INSERT INTO	
    Fluggesellschaft(GesellschaftsID, Name,	Qualitaetskennzahl) 
    VALUES (1, 'Lufthansa', 1);
INSERT INTO	
    Fluggesellschaft(GesellschaftsID, Name,	Qualitaetskennzahl) 
    VALUES (2, 'German Wings', 4);
INSERT INTO	
    Fluggesellschaft(GesellschaftsID, Name,	Qualitaetskennzahl) 
    VALUES (3, 'Thomas Cook', 8);
INSERT INTO	
    Fluggesellschaft(GesellschaftsID, Name,	Qualitaetskennzahl) 
    VALUES (4, 'Hapag Lloyd', 9);
INSERT INTO	
    Fluggesellschaft(GesellschaftsID, Name, Qualitaetskennzahl) 
    VALUES (5, 'Swiss', 8);

-- DML statement to insert data into table "Bankverbindung"
INSERT INTO 
    Bankverbindung(IBAN, BIC, BLZ, KontoNr) 
    VALUES ('DE53692717237823212', 'AHJALGE0040', 69271723, 7823212);
INSERT INTO 
    Bankverbindung(IBAN, BIC, BLZ, KontoNr) 
    VALUES ('DE53327939688929368', 'PSJAFUA2040', 32793968, 8929368);
INSERT INTO 
    Bankverbindung(IBAN, BIC, BLZ, KontoNr) 
    VALUES ('DE53692717231347291', 'AHJALGE0040', 69271723, 1347291);
INSERT INTO 
    Bankverbindung(IBAN, BIC, BLZ, KontoNr) 
    VALUES ('CH31297884318792978', 'KGGKOS6040', 29788431, 8792978);
INSERT INTO 
    Bankverbindung(IBAN, BIC, BLZ, KontoNr) 
    VALUES ('CH31878902719082780', 'WIGJEI8040', 87890271, 9082780);
INSERT INTO 
    Bankverbindung(IBAN, BIC, BLZ, KontoNr) 
    VALUES ('DE53692717237322890', 'AHJALGE0040', 69271723, 7322890);

-- DML statement to insert data into table "Ort"
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Konstanz', 'DE', 'FRA');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Stuttgart', 'DE', 'FRA');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Heidelberg', 'DE', 'FRA');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Rust', 'DE', 'FRA');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Frankfurt', 'DE', 'FRA');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Bern', 'CH', 'ZRH');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Zürich', 'CH', 'ZRH');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Chur', 'CH', 'ZRH');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Flims-Laax', 'CH', 'ZRH');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Istanbul', 'TR', 'SAW');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Oeludeniz', 'TR', 'SAW');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Antalya', 'TR', 'SAW');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Bordeaux', 'FR', 'CDG');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Paris', 'FR', 'CDG');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Disneyland', 'FR', 'CDG');
INSERT INTO
    Ort(Name, Land, Flughafen)
    VALUES ('Barcelona', 'ES', 'BCN');

-- DML statement to insert data into table "istEntfernt"
INSERT INTO
    istEntfernt(von, nach, Entfernung)
    VALUES ('Konstanz', 'Rust', 180);
INSERT INTO
    istEntfernt(von, nach, Entfernung)
    VALUES ('Chur', 'Zürich', 120);
INSERT INTO
    istEntfernt(von, nach, Entfernung)
    VALUES ('Chur', 'Flims-Laax', 40);
INSERT INTO
    istEntfernt(von, nach, Entfernung)
    VALUES ('Bordeaux', 'Disneyland', 420);
INSERT INTO
    istEntfernt(von, nach, Entfernung)
    VALUES ('Paris', 'Disneyland', 30);

-- DML statement to insert data into table "Adresse"
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (1, 'Zur Piste', '189', '2234', 'Chur');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (2, 'Strandweg', '91', '2321', 'Antalya');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (3, 'Strandweg', '90', '2321', 'Antalya');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (4, 'Strandweg', '45', '2321', 'Antalya');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (5, 'Seeweg', '23', '8001', 'Zürich');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (6, 'Seestr.', '12', '78463', 'Konstanz');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (7, 'Schlossstr.', '54', '70173', 'Stuttgart');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (8, 'Rue Monsieur', '980', '8234', 'Bordeaux');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (9, 'Rue Liberte', '78', '8732', 'Paris');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (10, 'Rue de la Maison Blanche', '32', '8792', 'Paris');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (11, 'Rue de Gaulle', '22', '8787', 'Disneyland');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (12, 'Rue de Gaulle', '10', '8787', 'Disneyland');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (13, 'Rheingutstr.', '14', '78462', 'Konstanz');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (14, 'Reutestr.', '104', '78467', 'Konstanz');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (15, 'Markgrafenstr.', '33', '78461', 'Konstanz');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (16, 'Highway', '5', '2349', 'Oeludeniz');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (17, 'Hauptstr.', '12', '69115', 'Heidelberg');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (18, 'GreenOne', '29', '1352', 'Zürich');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (19, 'Europapark', '1', '78231', 'Rust');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (20, 'Calle del Torro', '821', '5221', 'Barcelona');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (21, 'Bergweg', '78', '2371', 'Flims-Laax');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (22, 'Alpenstr.', '11', '3001', 'Bern');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (23, 'Am Flughafen', '2', '60541', 'Frankfurt');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (24, 'Sabiha Gökcen', '1', '1452', 'Istanbul');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (25, 'Flughafen-Allee', '100', '5098', 'Zürich');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (26, 'Charles de Gaulle', '1', '8792', 'Paris');
INSERT INTO
    Adresse(AdressID, Strasse, HausNr, PLZ, Ort)
    VALUES (27, 'Aeropuerto de Barcelona', '10', '8820', 'Barcelona');

-- DML statement to insert data into table "Flughafen"
INSERT INTO
    Flughafen(Flughafenkuerzel, Name, Adresse)
    VALUES ('FRA', 'Flughafen Frankfurt am Main', 23);
INSERT INTO
    Flughafen(Flughafenkuerzel, Name, Adresse)
    VALUES ('ZRH', 'Flughafen Zürich', 25);
INSERT INTO
    Flughafen(Flughafenkuerzel, Name, Adresse)
    VALUES ('SAW', 'Flughafen Istanbul-Sabiha Gökcen', 24);
INSERT INTO
    Flughafen(Flughafenkuerzel, Name, Adresse)
    VALUES ('CDG', 'Flughafen Paris-Charles-de-Gaulle', 26);
INSERT INTO
    Flughafen(Flughafenkuerzel, Name, Adresse)
    VALUES ('BCN', 'Flughafen Barcelona-El Prat', 27);

ALTER TABLE Ort ENABLE CONSTRAINT FK_Ort_Flughafen;

-- DML statement to insert data into table "Touristenattraktion"
INSERT INTO
    Touristenattraktion(AttraktionID, Name, Beschreibung, Adresse)
    VALUES (1, 'Hörnle', 'Bodensee-Strandbad', 19);
INSERT INTO
    Touristenattraktion(AttraktionID, Name, Beschreibung, Adresse)
    VALUES (2, 'Europapark', 'Deutschlands Nr. 1', 6);
INSERT INTO
    Touristenattraktion(AttraktionID, Name, Beschreibung, Adresse)
    VALUES (3, 'Flims-Laax Arena', 'Skispaß', 21);
INSERT INTO
    Touristenattraktion(AttraktionID, Name, Beschreibung, Adresse)
    VALUES (4, 'Disneyland', 'für Klein und Groß', 12);

-- DML statement to insert data into table "Ferienwohnung"
INSERT INTO
    Ferienwohnung(WohnungsID, Beschreibung, Zimmerzahl, Groesse, Adresse, Preis)
    VALUES (1, 'Finka', 6, 200, 16, 349.00);
INSERT INTO
    Ferienwohnung(WohnungsID, Beschreibung, Zimmerzahl, Groesse, Adresse, Preis)
    VALUES (2, 'Ferienwohnung mit Seeblick', 2, 45, 15, 120.00);
INSERT INTO
    Ferienwohnung(WohnungsID, Beschreibung, Zimmerzahl, Groesse, Adresse, Preis)
    VALUES (3, 'im Schnee', 3, 150, 1, 249.00);
INSERT INTO
    Ferienwohnung(WohnungsID, Beschreibung, Zimmerzahl, Groesse, Adresse, Preis)
    VALUES (4, 'direkt am Meer', 4, 100, 8, 249.00);
INSERT INTO
    Ferienwohnung(WohnungsID, Beschreibung, Zimmerzahl, Groesse, Adresse, Preis)
    VALUES (5, 'direkt am Park', 3, 110, 11, 289.00);
INSERT INTO
    Ferienwohnung(WohnungsID, Beschreibung, Zimmerzahl, Groesse, Adresse, Preis)
    VALUES (6, 'mit Blick auf Eiffelturm', 2, 70, 10, 549.00);
INSERT INTO
    Ferienwohnung(WohnungsID, Beschreibung, Zimmerzahl, Groesse, Adresse, Preis)
    VALUES (7, 'Dachterassenwohnung zentral', 6, 110, 9, 159.00);
INSERT INTO
    Ferienwohnung(WohnungsID, Beschreibung, Zimmerzahl, Groesse, Adresse, Preis)
    VALUES (8, 'zweigeschoessiges Haus', 12, 200, 3, 240.00);
INSERT INTO
    Ferienwohnung(WohnungsID, Beschreibung, Zimmerzahl, Groesse, Adresse, Preis)
    VALUES (9, 'Topvilla am Strand', 5, 111, 2, 159.00);
INSERT INTO
    Ferienwohnung(WohnungsID, Beschreibung, Zimmerzahl, Groesse, Adresse, Preis)
    VALUES (10, 'Ferienhaus am Strand', 4, 100, 20, 299.00);
INSERT INTO
    Ferienwohnung(WohnungsID, Beschreibung, Zimmerzahl, Groesse, Adresse, Preis)
    VALUES (11, 'Strandbungalow', 4, 100, 4, 150.00);

-- DML statement to insert data into table "Kunde"
INSERT INTO
    Kunde(UserID, Name, Vorname, Email, Geburtsdatum, TelefonNr, Adresse, IBAN)
    VALUES (1, 'Napf', 'Karl', 'knapf@gmx.de', '01.01.1960', '07531-123456', 14, 'DE53692717237823212');
INSERT INTO
    Kunde(UserID, Name, Vorname, Email, Geburtsdatum, TelefonNr, Adresse, IBAN)
    VALUES (2, 'Meier', 'Hans', 'meiers.hans@t-online.de', '02.01.1975', '06221-999888', 17, 'DE53327939688929368');
INSERT INTO
    Kunde(UserID, Name, Vorname, Email, Geburtsdatum, TelefonNr, Adresse, IBAN)
    VALUES (3, 'Huber', 'Franz', 'huber@t-online.de', '03.01.1980', '0711-554673', 7, 'DE53692717231347291');
INSERT INTO
    Kunde(UserID, Name, Vorname, Email, Geburtsdatum, TelefonNr, Adresse, IBAN)
    VALUES (4, 'Eber', 'Klaus', 'eber@bluewin.ch', '04.01.1985', '+41-171-9864785', 22, 'CH31297884318792978');
INSERT INTO
    Kunde(UserID, Name, Vorname, Email, Geburtsdatum, TelefonNr, Adresse, IBAN)
    VALUES (5, 'Meier', 'Egon', 'meier@gmail.com', '05.01.1990', '+41-171-9864785', 5, 'CH31878902719082780');
INSERT INTO
    Kunde(UserID, Name, Vorname, Email, Geburtsdatum, TelefonNr, Adresse, IBAN)
    VALUES (6, 'Knopf', 'Jim', 'jim.knopf@gmx.net', '06.01.1995', '07531-123456', 13, 'DE53692717237322890');

-- DML statement to insert data into table "Bild"
INSERT INTO
    Bild(BildID, Beschreibung, Dateipfad, Ferienwohnung)
    VALUES (1, 'Außenansicht', '1_1.jpg', 1);
INSERT INTO
    Bild(BildID, Beschreibung, Dateipfad, Ferienwohnung)
    VALUES (2, 'Innenansicht', '1_2.jpg', 1);
INSERT INTO
    Bild(BildID, Beschreibung, Dateipfad, Ferienwohnung)
    VALUES (3, 'Außenansicht', '2_1.jpg', 2);
INSERT INTO
    Bild(BildID, Beschreibung, Dateipfad, Ferienwohnung)
    VALUES (4, 'Innenansicht', '2_2.jpg', 2);
INSERT INTO
    Bild(BildID, Beschreibung, Dateipfad, Ferienwohnung)
    VALUES (5, 'Garage', '5_1.gif', 5);
INSERT INTO
    Bild(BildID, Beschreibung, Dateipfad, Ferienwohnung)
    VALUES (6, 'Dachterasse', '8.jpg', 8);

-- DML statement to insert data into table "istAusgestattet"
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (1, 1);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (1, 2);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (2, 3);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (2, 4);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (3, 2);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (5, 5);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (5, 1);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (6, 1);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (7, 1);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (8, 6);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (8, 7);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (8, 8);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (9, 9);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (9, 1);
INSERT INTO
    istAusgestattet(WohnungsID, AusstattungsID)
    VALUES (11, 1);

-- DML statement to insert data into table "Belegung"
INSERT INTO
    Belegung(BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Status, Startdatum, Enddatum)
    VALUES (1, '12.02.2016', 2, 4, 'gebucht', '11.03.2016', '13.03.2016');
INSERT INTO
    Belegung(BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Status, Startdatum, Enddatum)
    VALUES (2, '13.03.2016', 2, 5, 'reserviert', '11.05.2016', '17.05.2016');
INSERT INTO
    Belegung(BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Status, Startdatum, Enddatum)
    VALUES (3, '10.02.2016', 3, 5, 'reserviert', '03.04.2016', '23.04.2016');
INSERT INTO
    Belegung(BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Status, Startdatum, Enddatum)
    VALUES (4, '09.02.2016', 4, 6, 'gebucht', '04.07.2016', '05.07.2016');
INSERT INTO
    Belegung(BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Status, Startdatum, Enddatum)
    VALUES (5, '14.02.2016', 2, 10, 'reserviert', '28.04.2016', '02.05.2016');
INSERT INTO
    Belegung(BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Status, Startdatum, Enddatum)
    VALUES (6, '18.02.2016', 3, 8, 'gebucht', '04.05.2016', '22.05.2016');
INSERT INTO
    Belegung(BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Status, Startdatum, Enddatum)
    VALUES (7, '01.02.2016', 1, 2, 'gebucht', '07.05.2016', '08.05.2016');
INSERT INTO
    Belegung(BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Status, Startdatum, Enddatum)
    VALUES (8, '11.02.2016', 5, 9, 'gebucht', '22.05.2016', '28.05.2016');
INSERT INTO
    Belegung(BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Status, Startdatum, Enddatum)
    VALUES (9, '07.02.2016', 5, 10, 'gebucht', '03.07.2016', '08.07.2016');
INSERT INTO
    Belegung(BuchungsNr, Belegungsdatum, UserID, Ferienwohnung, Status, Startdatum, Enddatum)
    VALUES (10, '10.02.2016', 4, 1, 'reserviert', '01.05.2016', '24.05.2016');

-- DML statement to insert data into table "fliegen"
INSERT INTO
    fliegen(startet, landet, GesellschaftsID)
    VALUES ('FRA', 'BCN', 1);
INSERT INTO
    fliegen(startet, landet, GesellschaftsID)
    VALUES ('FRA', 'SAW', 2);
INSERT INTO
    fliegen(startet, landet, GesellschaftsID)
    VALUES ('FRA', 'CDG', 2);
INSERT INTO
    fliegen(startet, landet, GesellschaftsID)
    VALUES ('FRA', 'CDG', 1);
INSERT INTO
    fliegen(startet, landet, GesellschaftsID)
    VALUES ('FRA', 'CDG', 3);
INSERT INTO
    fliegen(startet, landet, GesellschaftsID)
    VALUES ('SAW', 'BCN', 3);
INSERT INTO
    fliegen(startet, landet, GesellschaftsID)
    VALUES ('CDG', 'BCN', 4);
INSERT INTO
    fliegen(startet, landet, GesellschaftsID)
    VALUES ('CDG', 'ZRH', 2);

-- DML statement to insert data into table "Rechnung"
INSERT INTO
    Rechnung(RechnungsNr, Rechnungsdatum, BuchungsNr, Betrag, Zahlungseingang)
    VALUES (1, '15.03.2016', 1, 498.00, '18.03.2016');
INSERT INTO
    Rechnung(RechnungsNr, Rechnungsdatum, BuchungsNr, Betrag)
    VALUES (2, '26.02.2016', 4, 549.50);

-- DDL statement to reenable constraint containing foreign key reference
ALTER TABLE Ort ENABLE CONSTRAINT FK_Ort_Flughafen;
    
COMMIT;