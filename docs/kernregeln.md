# Kernregeln

## Feste Regeln

- Buchungen mit Betrag `0` sind nicht erlaubt.
- Wenn keine Kategorie gewählt wird, wird eine Default-Kategorie vergeben.
- Zukunftsbuchungen dürfen nicht angelegt werden.
- Kategorien dürfen nicht gelöscht werden, wenn Buchungen darauf verweisen.
- Beträge sollen in der Ansicht im deutschen Dezimalformat dargestellt werden.
- Das Buchungsdatum ist Pflicht.
- Das Konto ist Pflicht.
- Der Benutzer ist Pflicht.
- Mehrfach-Kategorien müssen fachlich berücksichtigt werden.

## Geplante, aber noch nicht final spezifizierte Regeln

- Für den Import ist eine Dublettenprüfung vorgesehen.
- Die konkrete Regel für Erkennung, Vergleich und Behandlung von Dubletten ist noch nicht final spezifiziert.

## Offene fachliche Prüfung

- Negative Beträge sind aktuell erlaubt, müssen aber fachlich noch geprüft werden.
- Es ist noch zu klären, wie negative Beträge mit `entry_type` zusammenwirken.
- Es ist noch zu klären, wie Mehrfach-Kategorien in Auswertungen und Summen fachlich berücksichtigt werden.
