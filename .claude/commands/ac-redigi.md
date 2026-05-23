---
description: Redazione di una bozza di avviso o convenzione per amministrazione condivisa
argument-hint: "<coprogrammazione|coprogettazione|convenzione> [brief.md]"
---

# /ac-redigi

Produce una bozza di atto (avviso o convenzione) per i procedimenti di amministrazione condivisa, a partire da un brief.

## Argomenti

- **$1** — tipologia di atto. Obbligatorio. Valori ammessi:
  - `coprogrammazione` — avviso di coprogrammazione ex art. 55 c. 2 CTS
  - `coprogettazione` — avviso di coprogettazione ex art. 55 c. 3 CTS
  - `convenzione` — convenzione/accordo art. 56 CTS o esito coprogettazione

- **$2** — percorso a un file di **brief** (markdown o testo) con i dati del caso. Opzionale; se assente, l'agente conduce un breve intervista.

## Comportamento

1. Identifica la tipologia da `$1`. Se valore non riconosciuto, chiedi chiarimento.
2. Mappa sulla skill corrispondente:
   - `coprogrammazione` → `redigi-avviso-coprogrammazione`
   - `coprogettazione` → `redigi-avviso-coprogettazione`
   - `convenzione` → `redigi-convenzione`
3. Se `$2` è specificato: leggilo, estrai i dati input richiesti dalla skill.
4. Se `$2` è assente: conduci una breve intervista (5-10 domande mirate) per raccogliere gli input necessari (vedi sezione "Input necessari" della skill).
5. Carica il template corrispondente da `templates/`.
6. Redigi seguendo il workflow della skill.
7. Salva la bozza in `./output/bozze/` con nome `YYYYMMDD-<tipo>-<slug>.md` (crea la cartella se non esiste).
8. Restituisci all'utente: percorso del file salvato + sintesi delle scelte fatte + checklist di verifica pre-pubblicazione + lista allegati da preparare.

## Esempi d'uso

```
/ac-redigi coprogettazione ./brief-progetto-anziani.md
/ac-redigi convenzione
/ac-redigi coprogrammazione ./brief-politiche-giovanili-2026.md
```

## Note

- L'output è una **bozza di lavoro**. Va revisionato da RUP e Avvocatura dell'ente.
- Ogni clausola critica include un commento `<!-- nota: rif. ... -->` con riferimento normativo.
- Il documento finale include checklist e disclaimer.
