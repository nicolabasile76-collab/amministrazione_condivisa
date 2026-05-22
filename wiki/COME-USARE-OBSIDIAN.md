# Come usare questa wiki

Guida pratica all'uso del vault Obsidian del plugin "Amministrazione Condivisa".

---

## Aprire il vault

1. Scarica e installa **Obsidian** da [obsidian.md](https://obsidian.md) (gratuito).
2. All'avvio scegli "**Open folder as vault**".
3. Seleziona la cartella `wiki/` di questo progetto.
4. Obsidian crea il file di configurazione `.obsidian/` (già predisposto). Confermalo.

> Puoi avere più vault aperti contemporaneamente in Obsidian (es. vault POST aziendale e questo). Switcha dal selettore vault in basso a sinistra.

---

## Punto d'ingresso

Apri sempre per primo il file `00-MOC/MOC-Amministrazione-Condivisa.md`. È la **mappa**.

Da lì puoi navigare via:
- **link cliccabili** `[[...]]`
- **graph view** (Ctrl+G / Cmd+G) per vedere la rete di connessioni
- **search globale** (Ctrl+Shift+F / Cmd+Shift+F)
- **tag pane** (clicca su un tag per vedere tutte le note con quel tag)

---

## Struttura delle cartelle

| Cartella | Cosa contiene |
|----------|---------------|
| `00-MOC/` | Maps of Content — hub di navigazione |
| `10-Concetti/` | Note concettuali su istituti, principi, definizioni |
| `20-Articoli/` | Una nota per ogni articolo di legge rilevante |
| `30-Sentenze/` | Pronunce giurisprudenziali, organizzate per organo |
| `35-Prassi-ANAC/` | Atti dell'ANAC |
| `36-Prassi-MLPS/` | Atti del MLPS |
| `40-Procedure/` | Procedure operative ragionate (workflow, checklist) |
| `45-Sicurezza/` | Note su D.Lgs. 81/2008 |
| `46-Privacy/` | Note su GDPR e Codice Privacy |
| `47-Fiscalita/` | Profili fiscali ETS |
| `50-Modelli/` | Note ragionate su modelli di altre PA (benchmark) |
| `60-Casi/` | Casi studio concreti (progetti POST) |
| `_templates/` | Template di note da riutilizzare |

> La numerazione mantiene l'ordine in sidebar. `_templates` con underscore resta in fondo.

---

## Creare una nota nuova

### Manualmente

1. Click destro sulla cartella appropriata → "New note".
2. Apri uno dei template in `_templates/` e copia/incolla la struttura.
3. Compila i campi frontmatter (tags, type, ecc.).
4. Inserisci almeno **3 backlink** ad altre note rilevanti.

### Via plugin Obsidian "Templates"

Configurato in `.obsidian/` (se attivo):
- Imposta `_templates/` come cartella dei template.
- Da nuova nota: `Ctrl+P` → "Templates: insert template" → scegli quello giusto.

### Via agente Claude Code

Scrivi all'agente:
> "Crea una nota wiki per [argomento] usando il template [Articolo-Normativo/Sentenza/Concetto/Atto-ANAC-MLPS]."

L'agente compila i campi e linka le note correlate.

---

## Convenzioni

### Frontmatter obbligatorio

```yaml
---
tags: [post, amministrazione-condivisa, <sub-tag>]
type: <concetto|articolo-normativo|sentenza|atto-prassi|...>
last-review: <YYYY-MM-DD>
---
```

### Tag

- `#post` — sempre (ponte verso vault aziendale POST)
- `#amministrazione-condivisa` — sempre
- Tag specifici: `#coprogettazione`, `#coprogrammazione`, `#leading-case`, `#corte-costituzionale`, `#sicurezza`, `#privacy`, ecc.

### Wikilink

Usa `[[Nome-Nota]]` per linkare. Obsidian risolve automaticamente. Non importa la cartella, basta il nome.

Se il nome contiene caratteri speciali, usa la versione senza: es. `[[ETS-Enti-Terzo-Settore]]` non `[[ETS — Enti del Terzo Settore]]`.

### Naming dei file

- **Concetti**: PascalCase con trattini, es. `Coprogettazione.md`, `Sussidiarieta-Orizzontale.md`
- **Articoli**: `art-<numero>-<sigla>.md`, es. `art-55-CTS.md`
- **Sentenze**: `<numero>-<anno>.md`, es. `131-2020.md`
- **Atti ANAC/MLPS**: `<tipo>-<id>-<anno>.md`

### Una nota = un concetto

Una nota wiki tratta **un solo concetto/oggetto**. Se cresce troppo, splitta.

### Link bidirezionali

Quando crei la nota A e linki la nota B, controlla che B abbia un backlink a A nella sezione "Backlink" (Obsidian fornisce automaticamente "Linked mentions" ma è bene esplicitarli).

---

## Sincronizzazione con la cartella `normativa/`

Le note wiki **non** contengono il testo integrale delle norme/sentenze: contengono **commento ragionato + link** al file in `../normativa/`.

Quando aggiungi un file in `normativa/`:
1. Aggiorna `normativa/INDEX.md`.
2. Crea la nota wiki corrispondente (manualmente o via agente).
3. Linka nella nota wiki il file di `normativa/` tramite percorso relativo.

---

## Graph view

`Ctrl+G` / `Cmd+G` apre la vista grafo. Utile per:
- vedere quali concetti sono nodi centrali (molti backlink) → indica importanza
- individuare note isolate (senza backlink) → vanno collegate
- visualizzare cluster tematici

Filtra per tag per vedere solo sotto-domini (es. `#privacy`).

---

## Backup e versionamento

La cartella `wiki/` è **versionata con git** insieme al resto del plugin. Ogni modifica è tracciabile.

Se usi Obsidian Sync o iCloud, attenzione a conflitti: meglio committare regolarmente.

---

## Aggiornamento normativo

La wiki **invecchia**. Ogni nota ha un campo `last-review`. Programma una review periodica:

- **Concetti e principi**: ogni 12 mesi.
- **Articoli**: a ogni modifica della norma.
- **Sentenze e prassi**: man mano che ne emergono di nuove con impatto sull'argomento.

Chiedi all'agente:
> "Quali note in `wiki/` hanno `last-review` più vecchio di [data]?"

---

## Integrazione con vault POST aziendale

Se POST ha un vault aziendale, ci sono tre modi per integrarli:

1. **Vault separati**: questo come vault dedicato; switch dal selettore Obsidian. Modalità raccomandata di default.
2. **Workspace multi-vault** (Obsidian permette workspace con più vault aperti).
3. **Symlink**: dentro il vault POST puoi creare un symlink che punta a questa cartella `wiki/`. Funziona ma attenzione ai conflitti di nomi-nota.

Il tag `#post` mantiene il ponte cercabile in ogni caso.

---

## Plugin Obsidian consigliati (opzionale)

Da Settings → Community plugins:

- **Templater** — template avanzati con variabili dinamiche.
- **Dataview** — query in stile SQL sulle note (es. "tutte le sentenze degli ultimi 2 anni").
- **Tag Wrangler** — gestione tag.
- **Calendar** — vista calendario.
- **Git** — commit da Obsidian.

---

## Domande all'agente utili

- "Quali concetti in `wiki/10-Concetti/` non hanno ancora backlink al MOC principale?"
- "Crea una nota per [concetto/sentenza/atto] usando il template [...]."
- "Aggiungi un sotto-paragrafo a [[nome-nota]] con quanto stiamo discutendo."
- "Verifica che tutti gli articoli citati nel `templates/avviso-coprogettazione.md` abbiano una nota wiki corrispondente."
