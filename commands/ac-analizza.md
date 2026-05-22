---
description: Analisi critica di un avviso o convenzione di amministrazione condivisa
argument-hint: "<percorso-file> [avviso|convenzione]"
---

# /ac-analizza

Esegue critical review di un avviso pubblico o di una convenzione/accordo nell'ambito dell'amministrazione condivisa ex art. 55-56 CTS.

## Argomenti

- **$1** — percorso al file da analizzare (PDF, DOCX, TXT, MD). Obbligatorio.
- **$2** — tipologia: `avviso` o `convenzione`. Opzionale; se non specificato, l'agente la deduce dal contenuto.

## Comportamento

1. Leggi il file `$1`.
2. Determina la tipologia (se non specificata in `$2`):
   - **Avviso** → attiva la skill `analizza-avviso`
   - **Convenzione/accordo** → attiva la skill `analizza-convenzione`
3. Se è ambiguo, chiedi conferma all'utente prima di procedere.
4. Esegui l'analisi seguendo il workflow della skill scelta.
5. Restituisci il rapporto strutturato (vedi formato definito nella skill).
6. Al termine, proponi azioni di follow-up (es. riscrittura, redazione di una nota di osservazioni, aggiornamento wiki).

## Esempi d'uso

```
/ac-analizza ./bozza-avviso-coprog.pdf
/ac-analizza ./convenzione-aps.docx convenzione
/ac-analizza ./normativa/modelli-pa/avvisi/comune-x-2024.md avviso
```

## Note

- L'analisi cita sempre le fonti dalla cartella `normativa/`.
- Se il file da analizzare contiene riferimenti normativi non presenti nel corpus, lo segnala.
- Il rapporto è una bozza di lavoro: la responsabilità giuridica resta del RUP / Avvocatura dell'ente.
