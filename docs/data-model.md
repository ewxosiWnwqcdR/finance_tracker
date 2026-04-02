# Vorläufiges Datenmodell

## Categories

- `id`: integer
- `title`: string
- `description`: string
- `color`: string

## Users

- `id`: integer
- `username`: string
- `firstname`: string
- `lastname`: string

## Accounts

- `id`: integer
- `iban`: string
- `bic`: string
- `display_name`: string
- `bank_name`: string
- `opening_balance`: decimal
- `user_id`: integer

## Transactions

- `id`: integer
- `user_id`: integer
- `account_id`: integer
- `amount`: decimal
- `entry_type`: enum/income|expense
- `description`: string
- `payment-reference`: text
- `posting_date`: date
- `counterparty`: String
- `currency`: String 
- `transactkion_ref`: String 

## Transaction_Categories

- `id`: integer
- `buchung_id`: integer
- `kategorie_id`: integer

## Modellierungsentscheidungen

- Eine Buchung kann mehreren Kategorien zugeordnet werden.
- Der Spaltenname `entry_type` wird bewusst statt `type` verwendet, um Konflikte mit Rails-STI zu vermeiden.
- Konten sind einem Benutzer zugeordnet.
- Mehrere Konten pro Benutzer sind fachlich möglich, auch wenn anfangs häufig nur ein Konto genutzt wird.

## Offene fachliche Fragen

- Die fachliche Verteilung und Auswertung bei mehreren Kategorien ist noch offen.
- Für Umbuchungen zwischen eigenen Konten ist später voraussichtlich eine Erweiterung des Modells nötig.
- `income/expense` reicht für spätere Umbuchungen möglicherweise nicht aus und ist daher als offene Modellierungsfrage zu behandeln.
- Es ist fachlich noch offen, wie negative Beträge zusammen mit `entry_type` behandelt werden sollen.
