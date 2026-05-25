---
name: ac-monitor-normativa
description: |
  Usa questa skill quando l'utente vuole monitorare modifiche NORMATIVE (D.Lgs. 117/2017 CTS e norme collegate, nuovi decreti legislativi, leggi di delega o di settore) che impattano l'Amministrazione Condivisa. Si attiva con "modifiche al CTS", "novità normative terzo settore", "decreto correttivo CTS", "novità legislative coprogettazione". Chiamata da ac-monitor ma invocabile autonomamente.
version: 1.0.0
---

# Skill — Monitoring normativa primaria/secondaria CTS

## Obiettivo

Cercare modifiche normative italiane (leggi, decreti legislativi, decreti ministeriali, regolamenti) che impattano la disciplina degli artt. 55-57 D.Lgs. 117/2017 o norme collegate (L. 241/1990 art. 11-12, L. 328/2000, D.Lgs. 36/2023 art. 6, L. 136/2010, L. 124/2017 c. 125-129, ecc.) in un dato periodo.

## Input

- **Periodo**: `7d`, `14d`, `30d`, `90d` (default: 30d — le modifiche normative sono meno frequenti, periodo più ampio aiuta)

## Workflow

### Step 1 — Calcola data partenza

### Step 2 — WebSearch mirate

**Normattiva** (testi consolidati):
```
"D.Lgs. 117/2017" modifica site:normattiva.it
"Codice Terzo Settore" novella OR correttivo site:normattiva.it
```

**Gazzetta Ufficiale**:
```
"Terzo Settore" OR "D.Lgs. 117/2017" site:gazzettaufficiale.it
"art. 55" OR "art. 56" OR "art. 57" OR "DM 72/2021" site:gazzettaufficiale.it
```

**Iter parlamentare** (per modifiche in arrivo):
```
"riforma terzo settore" OR "correttivo CTS" site:camera.it OR site:senato.it
```

### Step 3 — Estrai metadati

- **Tipo norma** (Legge / Decreto Legislativo / Decreto Ministeriale / Regolamento / Decreto-Legge)
- **Numero e data**
- **Titolo / Oggetto**
- **Norme modificate** (es. "modifica art. 55 c. 3 D.Lgs. 117/2017")
- **Data entrata in vigore**
- **URL fonte**
- **URL PDF**

### Step 4 — Scoring

| Criterio | Punti |
|----------|-------|
| Modifica diretta a D.Lgs. 117/2017 | +50 |
| Modifica a DM 72/2021 | +30 |
| Nuovo decreto attuativo CTS | +30 |
| Modifica a norme collegate (L. 241/1990, L. 328/2000, D.Lgs. 36/2023 art. 6, L. 136/2010, L. 124/2017) | +20 |
| Riforma di sistema (es. nuovo correttivo CTS) | +40 |
| Cita art. 55 / 56 / 57 nel testo | +15 |
| Pubblicato in GU recentemente | +10 |

### Step 5 — Duplicate check

Confronta con `normativa/primarie/`, `normativa/secondarie/` e righe in `normativa/INDEX.md`.

### Step 6 — Restituisci

Output strutturato con i campi: `tipo_norma`, `numero`, `data`, `oggetto`, `norme_modificate`, `entrata_in_vigore`, `score`, `duplicate`.

## Limiti

- Max 3 query WebSearch
- Max 3 WebFetch
- Max 5 candidate (le modifiche normative significative sono rare)

## Note

Le modifiche normative sono **eventi rari ma di altissimo impatto**. Per ogni candidate sopra soglia 50, raccomanda alla raccomanda **valutazione manuale prioritaria** in nota.

## Riferimenti

- `agents/ac-monitor.md`
- `normativa/INDEX.md`
- `normativa/primarie/`, `normativa/secondarie/`
