# Finance Tracker Dokumentation

## Ziel des Projekts

Finance Tracker ist eine Ruby-on-Rails-Anwendung zur Erfassung und Auswertung privater Einnahmen und Ausgaben. Die Dokumentation bildet die erste Planungsbasis für einen privaten Start mit möglicher späterer Erweiterung für einen sicheren öffentlichen Betrieb.

## MVP

- Einnahmen und Ausgaben erfassen
- Buchungen auflisten
- Monatsübersicht mit Filter
- Dashboard mit Summen und Auswertungen
- Kategorien anlegen
- CSV-Import als MVP vormerken
- Login nur auf hoher Ebene vormerken

## Nicht-MVP

- Bank-Schnittstellen
- PDF-Export
- komplexe Budgets
- Mandantenfähigkeit
- Mobile App
- OCR von Belegen
- detaillierte Registrierung
- Passwort-Reset
- 2FA
- erweiterte Sicherheitsfunktionen im Login

## Technischer Stack

- Ruby
- Ruby on Rails
- PostgreSQL

## Dateien im `docs`-Ordner

- `scope.md`: Projektumfang und Abgrenzung
- `user-stories.md`: MVP-orientierte User Stories mit Akzeptanzkriterien
- `data-model.md`: vorläufiges fachliches Datenmodell
- `kernregeln.md`: zentrale Geschäftsregeln und Prüfregeln
- `open-questions.md`: fachliche und strategische offene Punkte
- `dashboard.md`: MVP-Zuschnitt des Dashboards
- `import-notes.md`: aktueller Planungsstand zum CSV-Import
- `entscheidungen.md`: bisher festgelegte Entscheidungen

## Offene Punkte

- Umgang mit negativen Beträgen bei gleichzeitiger Nutzung von `entry_type`
- fachliche Auswertung von Buchungen mit mehreren Kategorien
- Modellierung von Umbuchungen
- zukünftige Regel für CSV-Dubletten
- spätere Login-Ausgestaltung
- Sicherheitsanforderungen für möglichen Public-Betrieb
