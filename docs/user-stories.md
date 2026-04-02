# User Stories

## Buchung anlegen

Als Benutzer möchte ich eine Buchung anlegen, damit ich Einnahmen und Ausgaben nachvollziehbar erfassen kann.

### Akzeptanzkriterien

- Eine Buchung enthält mindestens Buchungsdatum, Betrag, Beschreibung, Benutzer und Konto.
- Einer Buchung können eine oder mehrere Kategorien zugeordnet werden.
- Das Buchungsdatum ist ein Pflichtfeld.
- Das Konto ist ein Pflichtfeld.
- Der Benutzer ist ein Pflichtfeld.
- Null-Beträge sind nicht erlaubt.
- Zukunftsbuchungen sind nicht erlaubt.
- Falls keine Kategorie gewählt wird, wird eine Default-Kategorie vergeben.

## Buchungsliste ansehen

Als Benutzer möchte ich alle Buchungen in einer Liste ansehen, damit ich meine erfassten Finanzbewegungen überprüfen kann.

### Akzeptanzkriterien

- Die Liste zeigt die vorhandenen Buchungen in einer nachvollziehbaren Form.
- Zu jeder Buchung sind mindestens Datum, Betrag, Beschreibung, Konto und Kategorien sichtbar.
- Die Darstellung von Zahlen erfolgt im deutschen Dezimalformat.

## Nach Monat filtern

Als Benutzer möchte ich Buchungen nach Monat filtern, damit ich einen bestimmten Zeitraum gezielt auswerten kann.

### Akzeptanzkriterien

- Die Buchungsliste kann nach einem Monat gefiltert werden.
- Das Dashboard kann anhand eines Monats betrachtet werden.
- Der gewählte Monat wirkt sich auf die angezeigten Summen und Listen aus.

## Nach Kategorien filtern

Als Benutzer möchte ich Buchungen nach Kategorien filtern, damit ich Ausgaben und Einnahmen thematisch auswerten kann.

### Akzeptanzkriterien

- Die Buchungsliste kann nach Kategorien gefiltert werden.
- Das Dashboard kann nach Kategorien gefiltert werden.
- Mehrfach-Kategorien müssen bei der Filterung berücksichtigt werden.

## Dashboard ansehen

Als Benutzer möchte ich ein Dashboard sehen, damit ich die wichtigsten Finanzinformationen sofort im Blick habe.

### Akzeptanzkriterien

- Das Dashboard zeigt die Einnahmen des Monats.
- Das Dashboard zeigt die Ausgaben des Monats.
- Das Dashboard zeigt den Saldo des Monats.
- Das Dashboard zeigt die 3 bis 5 größten Ausgabenkategorien.
- Das Dashboard zeigt die letzten 5 bis 10 Buchungen.
- Optional kann ein Kontostand pro Konto angezeigt werden.
- Filter sind im MVP nur nach Monat und Kategorien vorgesehen.

## Kategorien anlegen

Als Benutzer möchte ich Kategorien anlegen, damit ich Buchungen thematisch ordnen kann.

### Akzeptanzkriterien

- Kategorien enthalten mindestens Titel, optional Beschreibung und Farbe.
- Kategorien sind für die Auswahl bei Buchungen verfügbar.
- Mehrfach-Kategorien pro Buchung sind fachlich vorgesehen.

## Kategorien unter Bedingungen löschen

Als Benutzer möchte ich Kategorien löschen können, damit ich nicht mehr benötigte Kategorien bereinigen kann.

### Akzeptanzkriterien

- Kategorien dürfen nur gelöscht werden, wenn keine Buchungen darauf verweisen.
- Falls Verknüpfungen bestehen, muss die Löschung verhindert werden.
- Die Regel gilt auch bei Buchungen mit mehreren Kategorien.

## Konten auf hoher Ebene verwalten

Als Benutzer möchte ich Konten auf hoher Ebene verwalten, damit ich Buchungen einem passenden Konto zuordnen kann.

### Akzeptanzkriterien

- Pro Benutzer sind grundsätzlich mehrere Konten möglich.
- Ein Konto enthält mindestens IBAN, BIC, Anzeigename und Startsaldo.
- Konten orientieren sich an deutschen Bankdaten.
- Kontoauswahl ist beim Anlegen einer Buchung verpflichtend.

## CSV-Import vormerken

Als Benutzer möchte ich perspektivisch Buchungen per CSV importieren, damit ich vorhandene Daten nicht manuell vollständig neu erfassen muss.

### Akzeptanzkriterien

- CSV-Import ist als Bestandteil des MVP dokumentiert.
- Die genaue Importlogik ist noch nicht final geplant.
- Relevante CSV-Spalten orientieren sich an den Feldern der Buchung.
- Eine Dublettenprüfung ist vorgesehen und als offener Pflichtpunkt dokumentiert.

## Login auf hoher Ebene

Als Benutzer möchte ich mich später anmelden können, damit nur berechtigte Personen auf Finanzdaten zugreifen.

### Akzeptanzkriterien

- Login ist für die spätere Planung vorgemerkt.
- Detaillierte Registrierung ist nicht Teil des MVP.
- Passwort-Reset, 2FA und erweiterte Sicherheitsfunktionen sind nicht Teil des MVP.
- Mehrbenutzerfähigkeit bleibt als spätere Erweiterungsrichtung berücksichtigt.
