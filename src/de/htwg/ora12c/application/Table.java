package de.htwg.ora12c.application;

/**
 * @author Tandem 21; Philip Schächinger, Alexander Aichholz, Alexander Heckmann
 */
public enum Table {

    CUSTOMER("SELECT K.UserID, K.Name, K.Vorname, K.Email " +
            "FROM Kunde K " +
            "ORDER BY K.UserID"),

    CITY("SELECT O.Name Ortsname, L.Name Land " +
            "FROM Ort O, Land L " +
            "WHERE O.Land = L.ISO " +
            "ORDER BY L.Name, O.Name"),

    OCCUPANCY("SELECT B.* " +
            "FROM Belegung B " +
            "ORDER BY B.BuchungsNr"),

    FLAT("SELECT F.WohnungsID, F.Beschreibung, Zimmerzahl, F.Groesse, F.Preis, O.Name, L.Name " +
            "FROM Ferienwohnung F, Adresse A, Ort O, Land L " +
            "WHERE F.Adresse = A.AdressID AND " +
            "A.Ort = O.Name AND " +
            "O.Land = L.ISO " +
            "ORDER BY F.WohnungsID");

    private final String QUERY;

    Table(String QUERY) {
        this.QUERY = QUERY;
    }

    public String getQUERY() {
        return QUERY;
    }

}
