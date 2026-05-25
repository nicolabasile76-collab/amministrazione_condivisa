---
name: ac-monitor-dottrina
description: |
  Usa questa skill quando l'utente vuole monitorare nuovi contributi DOTTRINALI, articoli, quaderni, commenti pubblicati su riviste e portali specializzati di Terzo Settore (Terzjus, Cantiere Terzo Settore, Welforum, Forum Nazionale Terzo Settore, Labsus) in materia di Amministrazione Condivisa. Si attiva con "novità dottrinali CTS", "articoli terzo settore coprogettazione", "quaderni Terzjus", "novità Cantiere Terzo Settore", "monitoraggio dottrina amministrazione condivisa". Chiamata da ac-monitor ma invocabile autonomamente.
version: 1.0.0
---

# Skill — Monitoring dottrina CTS

## Obiettivo

Cercare nuovi contributi dottrinali italiani su Amministrazione Condivisa, in un dato periodo, presso le **principali riviste/portali specializzati** del Terzo Settore.

## Input

- **Periodo**: `7d`, `14d`, `30d`, `90d` (default: 30d — la dottrina si pubblica con cadenza meno fitta della giurisprudenza)

## Workflow

### Step 1 — Calcola data partenza

### Step 2 — WebSearch mirate

**Terzjus** (Fondazione Terzjus, dottrina più autorevole):
```
"co-progettazione" OR "coprogettazione" OR "amministrazione condivisa" site:terzjus.it
quaderno OR articolo OR working paper site:terzjus.it
```

**Cantiere Terzo Settore** (Forum Nazionale):
```
"co-progettazione" OR "art. 55 CTS" site:cantiereterzosettore.it
```

**Welforum** (IRS, politiche sociali):
```
"Codice Terzo Settore" OR "amministrazione condivisa" site:welforum.it
```

**Forum Nazionale Terzo Settore**:
```
"co-progettazione" OR "CTS" site:forumterzosettore.it
```

**Labsus** (Laboratorio Sussidiarietà):
```
"amministrazione condivisa" OR "co-progettazione" site:labsus.org
```

### Step 3 — Estrai metadati

- **Titolo contributo**
- **Autore/i**
- **Tipologia** (articolo / quaderno / working paper / news / commento)
- **Rivista/portale**
- **Data pubblicazione**
- **URL**
- **URL PDF/full text** (se disponibile)
- **Abstract o prime righe** (per valutazione rilevanza)

### Step 4 — Scoring

| Criterio | Punti |
|----------|-------|
| Tema centrale: coprogettazione / coprogrammazione / artt. 55-57 CTS | +30 |
| Pubblicato su Terzjus (autorevolezza accademica) | +20 |
| Pubblicato su Cantiere TS / Welforum (autorevolezza pratica) | +15 |
| Pubblicato su Labsus / Forum Terzo Settore | +10 |
| Cita sentenze di leading case (131/2020, 5217/2023, 4540/2024, 840/2026, ecc.) | +10 |
| Cita DM 72/2021 | +5 |
| Analisi di nuove sentenze / novità normative | +15 |
| Caso di studio operativo | +10 |
| Data ≤ 14 giorni | +10 |

### Step 5 — Duplicate check

Confronta con corpus `normativa/dottrina/` e righe in `normativa/INDEX.md` (sezione Dottrina).

### Step 6 — Restituisci

Output strutturato con: `titolo`, `autori`, `tipologia`, `fonte`, `data`, `url`, `abstract`, `score`, `duplicate`.

## Limiti

- Max 3 query WebSearch
- Max 5 WebFetch
- Max 10 candidate

## Note

I contributi dottrinali sono **meno urgenti** delle sentenze (non hanno effetti vincolanti) ma **molto utili** per:
- arricchire la nota wiki delle sentenze recenti con commenti dottrinali
- preparare formazioni interne POST
- citarli nelle relazioni tecniche per consolidare la motivazione

## Riferimenti

- `agents/ac-monitor.md`
- `normativa/INDEX.md`
- `normativa/dottrina/`
- `wiki/70-Dottrina/`
