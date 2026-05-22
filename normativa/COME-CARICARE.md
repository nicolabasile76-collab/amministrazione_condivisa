# Come caricare nuova normativa

Guida operativa per popolare e mantenere la cartella `normativa/`.

---

## Principio

Il corpus normativo è la **base di conoscenza** dell'agente `ac-expert`. Più è organizzato e completo, più l'agente è preciso e affidabile.

Per ogni nuovo materiale caricato, segui questi 3 passi:

1. **Salva** il file nella sottocartella corretta seguendo le convenzioni di naming.
2. **Aggiorna** `normativa/INDEX.md` con una riga nella tabella appropriata (o chiedi all'agente di farlo).
3. **Crea** la nota wiki corrispondente in `wiki/` (o chiedi all'agente).

---

## Dove mettere cosa

| Tipo di materiale | Sottocartella |
|--------------------|---------------|
| Decreto legislativo, legge ordinaria, codice | `primarie/<area>/` |
| Decreto ministeriale, regolamento | `secondarie/decreti-ministeriali/` o `secondarie/regolamenti/` |
| Circolare ministeriale | `secondarie/circolari/` |
| Sentenza Corte Costituzionale | `giurisprudenza/corte-costituzionale/` |
| Sentenza Consiglio di Stato | `giurisprudenza/consiglio-stato/` |
| Sentenza TAR | `giurisprudenza/tar/` |
| Sentenza Cassazione | `giurisprudenza/cassazione/` |
| Atto di segnalazione / parere / FAQ ANAC | `prassi-anac/` |
| Nota / circolare MLPS | `prassi-mlps/` |
| Normativa sicurezza | `sicurezza/` |
| Normativa privacy / GDPR | `privacy/` |
| Fiscalità ETS | `fiscalita-ets/` |
| Avviso pubblico di un'altra PA (benchmark) | `modelli-pa/avvisi/` |
| Convenzione di un'altra PA (benchmark) | `modelli-pa/convenzioni/` |

---

## Convenzioni di naming dei file

### Norme primarie e secondarie

**Schema**: `<tipo>-<numero>-<anno>[-<descrizione-breve>].<estensione>`

Esempi:
- `dlgs-117-2017.pdf` — D.Lgs. 117/2017 (CTS)
- `dlgs-117-2017-aggiornato-2024.pdf` — versione coordinata
- `dm-72-2021.pdf` — DM 72/2021
- `legge-241-1990.pdf` — L. 241/1990
- `dlgs-81-2008-sicurezza.pdf` — D.Lgs. 81/2008
- `dlgs-36-2023-codice-contratti.pdf` — D.Lgs. 36/2023

### Giurisprudenza

**Schema**: `<numero>-<anno>[-<oggetto-sintetico>].<estensione>`

Esempi:
- `131-2020-amministrazione-condivisa.pdf`
- `72-2022-coprogettazione.pdf`
- `cons-stato-1234-2024.pdf` (Consiglio di Stato, num e anno)
- `tar-lazio-5678-2023.pdf` (TAR + sede + num + anno)

### Atti ANAC / MLPS

**Schema**: `<tipo>-<id>-<anno>[-<oggetto>].<estensione>`

Esempi:
- `parere-anac-1234-2023.pdf`
- `nota-mlps-12-2024-coprogrammazione.pdf`
- `faq-anac-2024.pdf`

### Modelli PA

**Schema**: `<ente>-<anno>-<tipologia>[-<descrizione>].<estensione>`

Esempi:
- `comune-bologna-2024-avviso-coprogettazione-anziani.pdf`
- `regione-toscana-2023-convenzione-aps-cultura.pdf`

---

## Formati consigliati

- **PDF** — formato preferito per documenti ufficiali (testo selezionabile, no scansioni).
- **MD / TXT** — per estratti, note, testi normativi puliti.
- **DOCX** — accettato ma preferire PDF/MD.

> **Importante**: se carichi un PDF "scansione", l'agente non può estrarne il testo. Convertilo prima (OCR) o aggiungi un `.md` di accompagnamento con il testo principale.

---

## Workflow consigliato per ogni nuovo caricamento

1. **Copia** il file nella sottocartella corretta con il nome convenzionato.
2. **Apri Claude Code** in questa cartella e scrivi all'agente:
   > "Ho caricato `normativa/<percorso>/<nome-file>`. Aggiorna `INDEX.md` con la riga corrispondente e crea la nota wiki in `wiki/<sezione>/` usando i template in `wiki/_templates/`."
3. L'agente:
   - legge il file (o ti chiede l'argomento se è scansione non OCR);
   - estrae metadati chiave;
   - aggiorna `INDEX.md`;
   - crea la nota wiki con backlink ai concetti correlati.
4. **Apri Obsidian** sulla wiki, verifica la nuova nota, eventualmente integra appunti tuoi.

---

## Frequenza di aggiornamento

- **Sentenze e prassi**: ogni volta che ne incontri una rilevante.
- **Norme primarie**: ogni volta che cambiano (es. aggiornamento CTS).
- **Modelli PA**: utili da accumulare nel tempo per benchmark.

L'agente, durante l'uso, ti segnalerà quando un punto giuridico richiederebbe materiale non presente nel corpus.

---

## Esempi di richiesta veloce all'agente

> "Ho caricato `normativa/giurisprudenza/corte-costituzionale/72-2022.pdf`. Indicizzalo."

> "Aggiungi al corpus la nota ANAC del 12/3/2024 su coprogettazione: l'ho salvata in `normativa/prassi-anac/`."

> "Verifica che il corpus copra il D.Lgs. 36/2023 nelle parti rilevanti per il confronto con art. 55 CTS. Se manca, dimmi cosa serve."
