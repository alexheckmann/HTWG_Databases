<h1>Oracle-SQL</h1>

Das Repository enthält den konzeptuellen und logischen Entwurf sowie die Implementierung einer relationalen OLTP-Datenbank, basierend auf *Oracle 12c*. Zudem enthält es den Entwurf und die Implementierung eines Data Warehouse mit Star Schema zur Verwendung als OLAP-System.

Die Datenbank basiert auf folgender Aufgabenstellung:
Eine Agentur, die Ferienwohnungen vermittelt, möchte das Angebot von Wohnungen im Internet zugänglich 
machen und Buchungen durch Interessenten online ermöglichen. Erforderlich hierzu ist eine Datenbank, in 
welcher die notwendigen Daten abgelegt und verwaltet werden können. 
Basis für den Datenbank-Entwurf ist folgendes Ergebnis der Anforderungsanalyse: 
- Ferienwohnungen befinden sich in einem bestimmten Ort und Land. 
- Die Information zu einer Ferienwohnung umfasst eine textuelle Beschreibung der Wohnung, die Adresse 
(bestehend aus Straße/Hausnummer, Ort, PLZ, Name und ISO-Code des Landes), die Anzahl der Zimmer, 
die Größe in qm und den Preis pro Tag. 
- Manche Ferienwohnungen haben Zusatzausstattungen, z.B. eine Sauna und/oder ein Schwimmbad. Es sol-
len aber auch beliebige viele andere Zusatzausstattungen verwaltet werden können. Weiterhin sollen bis zu 
vier Bilder (inkl. Bildbeschreibung und Dateipfad) von einer Ferienwohnung verwaltet werden können. 
- Touristenattraktionen (beispielsweise Freizeitparks, Badestrände, Sehenswürdigkeiten) werden für die je-
weiligen Länder inklusive ihrer Beschreibung und Adresse abgelegt.  
- Für jede Ferienwohnung soll die Entfernung (vom Ort) der Ferienwohnung zu (dem Ort) einer Touristenat-
traktionen im gleichen Land ermittelt werden können. Hierzu soll im System die Entfernung zwischen Or-
ten innerhalb eines Landes verwaltet werden können. Weiterhin soll gelten: 
- Die Entfernung zweier Orte soll maximal einmal in der Datenbank gespeichert werden. 
- Die Entfernung eines Ortes „von sich selbst“ soll nicht in der Datenbank gespeichert werden, sondern 
ist mit 0 km anzunehmen. 
- Ist die Entfernung zweier Orte nicht in der Datenbank gespeichert, so ist diese als „unbekannt“ zu inter-
pretieren. 
- Bevor Kunden Ferienwohnungen reservieren bzw. buchen können, müssen diese mit ihrem Namen und 
Vornamen und Geburtsdatum, sowie jeweils genau einer Adresse, einer Telefonnummer, einer Email-
Adresse und einer Bankverbindung registriert sein. 
- Im System verwaltete Adressdatensätze sollen entweder genau zu einem Kunden oder zu genau einer Feri-
enwohnung oder zu genau einer Touristenattraktion oder genau zu einem Flughafen in Beziehung stehen 
können.  
- Ein Bankverbindungsdatensatz besteht aus BLZ, Kontonummer, IBAN und BIC. 
- Im System verwaltete Bankverbindungsdatensätze sollen zu genau einem Kunden gehören. 
- Kunden können Ferienwohnungen belegen. Bei Belegungen soll durch ein Status-Flag zwischen einer (un-
verbindlichen) Reservierung und einer (verbindlichen) Buchung unterschieden werden. Bei einer Belegung 
müssen die Kunden eine Ferienwohnung auswählen und angeben, in welchem Zeitraum sie die Wohnung 
reservieren bzw. buchen wollen.  
- Bei einer Reservierung bzw. Buchung wird das Reservierungs- bzw. Buchungsdatum festgehalten. 
- Eine Reservierung kann in eine verbindliche Buchung gewandelt werden, aber nicht umgekehrt. 
- Für jede Buchung erhalten Kunden im Laufe einer Woche eine Rechnung mit Betrag, Buchungsnummer, 
Rechnungsnummer und Rechnungsdatum.  
- Nachdem die Rechnung bezahlt ist, ist die Buchung abgeschlossen und das Datum des Zahlungseingangs 
wird abgelegt. 
- Für Ferienwohnungen sollen alle Fluggesellschaften ermittelt werden können, mit denen man die Ferien-
wohnung von einem Flughafen aus erreichen kann:  
- Es soll zu allen Orten in der Datenbank jeweils ein zugeordneter Flughafen verwaltet werden. 
- Ein Flughafen selbst hat eine Adresse zugeordnet. 
- Es soll in der Datenbank gespeichert werden, welche Flugstrecken von welchen Fluggesellschaften be-
dient werden, d.h. mit welchen Fluggesellschaften man von einem bestimmten (Start-)Flughafen einen 
anderen (Ziel-)Flughafen erreichen kann. 
- Weiterhin soll ermittelt werden können, welche der Fluggesellschaften die beste Servicequalität bietet. 
Hierzu soll für jede Fluggesellschaft eine numerische Servicequalitätskennzahl (1-10) gespeichert werden.
