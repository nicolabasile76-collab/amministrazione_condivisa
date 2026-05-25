---
name: ac-monitor-giurisprudenza
description: |
  Usa questa skill quando l'utente vuole cercare nuove SENTENZE su Amministrazione Condivisa (Corte Costituzionale, Consiglio di Stato, TAR, Cassazione) su coprogrammazione, coprogettazione, convenzioni ex artt. 55-56 D.Lgs. 117/2017. Si attiva con "cerca sentenze nuove", "novità giurisprudenziali CTS", "ricerca giurisprudenza terzo settore", "monitoraggio TAR/CDS coprogettazione". È chiamata in batch dall'agente ac-monitor ma può essere invocata anche autonomamente.
version: 1.0.0
---

# Skill — Monitoring giurisprudenza CTS

## Obiettivo

Cercare in modo strutturato nuove sentenze italiane (Corte Costituzionale, Consiglio di Stato, TAR, Cassazione) sulla materia dell'amministrazione condivisa ex artt. 55-57 D.Lgs. 117/2017, in un dato periodo, e restituire una lista di candidate triagiate per rilevanza.

## Input

- **Periodo** di scansione: `7d`, `14d`, `30d`, `90d` (default: 7d)
- **Focus opzionale**: organo specifico (TAR, CDS, Corte Cost, Cassazione) — default: tutti

## Workflow

### Step 1 — Calcola data di partenza

Da oggi sottrai il periodo richiesto. Es. oggi è 25/05/2026, periodo 7d → data di partenza 18/05/2026.

### Step 2 — Esegui WebSearch mirate

**Query per Corte Costituzionale**:
```
"Codice Terzo Settore" OR "D.Lgs. 117/2017" sentenza site:cortecostituzionale.it
```

**Query per Consiglio di Stato e TAR**:
```
"co-progettazione" OR "coprogettazione" OR "art. 55 CTS" site:giustizia-amministrativa.it
"convenzione" "art. 56" "Terzo Settore" site:giustizia-amministrativa.it
"amministrazione condivisa" sentenza site:giustizia-amministrativa.it
```

**Query per Cassazione** (raro ma possibile):
```
"Terzo Settore" "art. 55" cassazione
```

Usa `WebSearch` per ciascuna query. Filtra per **data** quando possibile.

### Step 3 — Estrai metadati da ogni risultato

Per ogni URL trovato, estrai:
- **Organo emittente** (Corte Cost. / CDS Sez. X / TAR Regione / Cassazione)
- **Numero e anno** sentenza (es. 840/2026)
- **Data pubblicazione**
- **Parti** (sintesi: ricorrente vs resistente)
- **Oggetto** (1 frase: di cosa tratta)
- **URL fonte**
- **URL PDF** (se disponibile)

Se serve approfondire, usa `WebFetch` per scaricare la pagina e leggerne le prime righe.

### Step 4 — Calcola score di rilevanza

Per ogni candidate applica lo scoring definito nell'agente `ac-monitor`:

| Criterio | Punti |
|----------|-------|
| Titolo/snippet contiene "coprogettazione", "coprogrammazione", "art. 55", "art. 56", "amministrazione condivisa" | +30 |
| Cita Corte Cost. 131/2020 | +10 |
| Cita DM 72/2021 | +10 |
| Organo: Corte Cost. | +25 |
| Organo: CDS | +20 |
| Organo: TAR | +15 |
| Organo: Cassazione | +20 |
| Novità interpretativa segnalata (leading case potenziale) | +20 |
| Data ≤ 7 giorni | +10 |
| Tema POST (politiche giovanili, disabilità, anziani, migranti, educativi) | +10 |

### Step 5 — Verifica duplicati

Per ogni candidate confronta organo + numero + anno con l'INDEX esistente:
- Leggi `normativa/INDEX.md`
- Cerca pattern `<organo> <numero>/<anno>` nelle righe
- Se trovato → flag `duplicate: true`, escludi dal report

### Step 6 — Restituisci lista strutturata

Output JSON-like (o markdown sezione):

```yaml
- id: G1
  organo: TAR Toscana
  sezione: IV
  numero: 840
  anno: 2026
  data: 2026-04-30
  parti: F.A.S.T. coop vs Provincia di Livorno
  oggetto: Annullamento coprogettazione assistenza disabili scolastica per mancanza coprogrammazione presupposta
  url_fonte: https://...
  url_pdf: https://...
  score: 90
  leading_case_candidato: true
  duplicate: false
  note: Conferma orientamento CDS 5217/2023, dialogo critico con TAR Lombardia 2533/2024
```

## Limiti operativi

- **Max 3 query** WebSearch per evitare costi eccessivi
- **Max 5 WebFetch** per approfondimento
- **Max 15 candidate** restituite (top per score)
- Se una fonte è inaccessibile, **segnalalo** nell'output

## Output

Restituisci una **lista di candidate** in formato strutturato (YAML o JSON o tabella markdown), pronta per essere integrata nel report finale di `ac-monitor`.

## Riferimenti

- Agente principale: `agents/ac-monitor.md`
- Corpus esistente: `normativa/INDEX.md`
- Note wiki esistenti: `wiki/30-Sentenze/`
