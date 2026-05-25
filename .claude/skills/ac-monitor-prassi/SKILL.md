---
name: ac-monitor-prassi
description: |
  Usa questa skill quando l'utente vuole monitorare nuovi ATTI DI PRASSI AMMINISTRATIVA (ANAC, MLPS, Conferenza Stato-Regioni, Agenzia Entrate) su Amministrazione Condivisa ex artt. 55-57 D.Lgs. 117/2017. Si attiva con "novità ANAC", "circolari MLPS terzo settore", "delibere ANAC coprogettazione", "intese stato regioni terzo settore". Chiamata in batch da ac-monitor ma invocabile autonomamente.
version: 1.0.0
---

# Skill — Monitoring prassi amministrativa CTS

## Obiettivo

Cercare in modo strutturato nuovi atti di prassi italiana (ANAC, MLPS, Conferenza Stato-Regioni, Agenzia Entrate per profili fiscali ETS) sulla materia dell'amministrazione condivisa, in un dato periodo, e restituire candidate triagiate.

## Input

- **Periodo**: `7d`, `14d`, `30d`, `90d` (default: 7d)
- **Focus**: ANAC, MLPS, Stato-Regioni, AdE — default: tutti

## Workflow

### Step 1 — Calcola data di partenza
Come `ac-monitor-giurisprudenza`.

### Step 2 — WebSearch mirate

**ANAC**:
```
"Terzo Settore" OR "art. 55" OR "co-progettazione" site:anticorruzione.it
delibera "D.Lgs. 117/2017" site:anticorruzione.it
```

**MLPS**:
```
"Terzo Settore" circolare OR decreto OR comunicato site:lavoro.gov.it
"art. 55" OR "DM 72" site:lavoro.gov.it
```

**Conferenza Stato-Regioni**:
```
"Terzo Settore" intesa site:statoregioni.it
```

**Agenzia delle Entrate** (per profili fiscali ETS):
```
"Terzo Settore" interpello OR risposta OR risoluzione site:agenziaentrate.gov.it
```

### Step 3 — Estrai metadati

Per ogni risultato:
- **Ente** (ANAC / MLPS / Conferenza Unificata / AdE)
- **Tipologia atto** (delibera / determina / comunicato / atto di segnalazione / FAQ / circolare / interpello / intesa)
- **ID** (numero / repertorio / risposta n.)
- **Data**
- **Oggetto** (1 frase)
- **URL fonte**
- **URL PDF** (se disponibile)

### Step 4 — Scoring

| Criterio | Punti |
|----------|-------|
| Snippet contiene "co-progettazione", "coprogrammazione", "art. 55", "art. 56", "amministrazione condivisa" | +30 |
| Ente: ANAC | +15 |
| Ente: MLPS | +10 |
| Ente: Conferenza Unificata | +10 |
| Ente: AdE (interpello) | +10 |
| Cita Corte Cost. 131/2020 | +10 |
| Cita DM 72/2021 | +10 |
| Novità interpretativa | +20 |
| Aggiornamento di atto esistente (es. nuova FAQ aggiornata) | +15 |
| Data ≤ 7 giorni | +10 |

### Step 5 — Duplicate check

Confronta con INDEX corpus (sezioni `prassi-anac/`, `prassi-mlps/`, `fiscalita-ets/`, `secondarie/regolamenti/`).

### Step 6 — Restituisci

Output strutturato analogo a `ac-monitor-giurisprudenza` ma con campi `ente`, `tipo_atto`, `id`.

## Limiti

- Max 3 query WebSearch
- Max 5 WebFetch
- Max 10 candidate

## Riferimenti

- `agents/ac-monitor.md`
- `normativa/INDEX.md`
- `wiki/35-Prassi-ANAC/`, `wiki/36-Prassi-MLPS/`, `wiki/47-Fiscalita/`
