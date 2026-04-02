# Scope

## Ziel der Anwendung

Finance Tracker ist eine Ruby-on-Rails-Anwendung zur Erfassung und Auswertung privater Einnahmen und Ausgaben. Die Anwendung soll eine belastbare Grundlage schaffen, um Buchungen strukturiert zu verwalten und die wichtigsten Finanzinformationen direkt im Dashboard sichtbar zu machen.

## Startkontext

- Die Anwendung startet zunächst für die private Nutzung.
- Die erste Planung soll jedoch so angelegt werden, dass eine spätere Erweiterung für einen sicheren öffentlichen Betrieb möglich bleibt.
- Mehrere Benutzer sind perspektivisch vorgesehen, auch wenn anfangs private Einzelnutzung im Vordergrund steht.

## MVP

Zum MVP gehören ausschließlich die folgenden fachlichen Punkte:

- Einnahmen und Ausgaben erfassen
- Buchungen auflisten
- Monatsübersicht mit Filter
- Dashboard mit Summen und Auswertungen
- Kategorien anlegen
- CSV-Import als vorgemerkter Bestandteil des MVP
- Login nur auf hoher Ebene vormerken, ohne Detailplanung

## Nicht im MVP

Die folgenden Punkte sind bewusst nicht Teil des MVP:

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

## CSV-Import

- CSV-Import gehört zum MVP.
- Die Detailplanung des Imports erfolgt später.
- Die relevanten Spalten sollen sich fachlich an den Buchungsdaten orientieren.
- Die Dublettenprüfung ist ausdrücklich als Pflicht- und Planungspunkt vorgemerkt.

## Annahmen

- Die Währung ist zunächst durchgehend EUR.
- Datums- und Zahlenformat orientieren sich an deutschen Konventionen.
- Anfangs wird häufig nur ein Konto pro Benutzer genutzt, fachlich sind aber mehrere Konten pro Benutzer vorgesehen.

## Offene Fragen

- Wie soll die spätere öffentliche Nutzung sicherheitstechnisch konkret abgesichert werden?
- Wie weit soll die Login-Funktion im MVP wirklich vorbereitet werden, wenn noch keine Detailplanung erfolgen soll?
