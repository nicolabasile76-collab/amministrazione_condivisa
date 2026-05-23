# Amministrazione Condivisa — Plugin Claude Code

Plugin specialistico per l'**analisi** e la **produzione** di atti dell'amministrazione condivisa ex art. 55 e 56 del D.Lgs. 117/2017 (Codice del Terzo Settore):

- avvisi di **coprogrammazione**
- avvisi di **coprogettazione**
- **convenzioni** e accordi di collaborazione con ETS
- **relazioni tecniche** di sostenibilità e analisi rischi
- review critico di avvisi e convenzioni esistenti

Tutto è ancorato a un **corpus normativo** che carichi tu nella cartella `normativa/` e a una **wiki Obsidian** in `wiki/` che cresce con te.

---

## Struttura

```
Amministrazione Condivisa/
├── .claude-plugin/plugin.json      Manifest del plugin
├── agents/ac-expert.md             Agente esperto Amm. Condivisa
├── skills/                         Sei skill specialistiche
├── commands/                       Tre slash command
├── templates/                      Modelli di atto riusabili
├── normativa/                      Corpus normativo (tu lo carichi)
│   ├── primarie/   secondarie/   giurisprudenza/
│   ├── prassi-anac/   prassi-mlps/
│   ├── sicurezza/  privacy/  fiscalita-ets/
│   ├── modelli-pa/                 Avvisi/convenzioni benchmark
│   ├── INDEX.md                    Indice navigabile
│   └── COME-CARICARE.md            Convenzioni di naming
└── wiki/                           Vault Obsidian del progetto
    ├── 00-MOC/                     Map of Content (hub)
    ├── 10-Concetti/                Coprogrammazione, ETS, ...
    ├── 20-Articoli/                Art. 55, 56, ...
    ├── 30-Sentenze/                Corte Cost., Cons. Stato, TAR
    ├── 35-Prassi-ANAC/  36-Prassi-MLPS/
    ├── 40-Procedure/               Step procedurali ragionati
    ├── 45-Sicurezza/  46-Privacy/  47-Fiscalita/
    ├── 50-Modelli/   60-Casi/
    └── _templates/                 Template di nota Obsidian
```

---

## Flusso d'uso

### 1. Carica la normativa
Metti i materiali nelle sottocartelle di `normativa/` rispettando le convenzioni in [normativa/COME-CARICARE.md](normativa/COME-CARICARE.md). Aggiorna l'[INDEX](normativa/INDEX.md) (o chiedi all'agente di farlo).

### 2. Apri la wiki in Obsidian
Apri la cartella `wiki/` come **vault** in Obsidian. Parti dal [MOC principale](wiki/00-MOC/MOC-Amministrazione-Condivisa.md). Da qui navighi tutti i concetti, articoli e sentenze.

### 3. Usa i comandi
- `/ac-analizza <percorso-file>` — review critico di un avviso o convenzione
- `/ac-redigi coprogrammazione|coprogettazione|convenzione` — produzione bozza
- `/ac-relazione <progetto>` — relazione tecnica di sostenibilità + rischi

### 4. Interroga l'agente direttamente
In qualsiasi conversazione Claude Code in questo progetto puoi richiamare `ac-expert` per domande, pareri, redazione assistita. L'agente conosce art. 55-56 CTS, sentenza Corte Cost. 131/2020, DM 72/2021, e consulta i file in `normativa/` e `wiki/`.

---

## Filosofia

1. **Conoscenza tracciabile**: ogni affermazione dell'agente è ancorabile a un file in `normativa/` o a una nota in `wiki/`. Niente "fonti inventate".
2. **Distinzione rigorosa** tra istituti:
   - **Coprogrammazione** (art. 55 c. 2) — programmazione condivisa ex ante.
   - **Coprogettazione** (art. 55 c. 3-4) — co-design di interventi specifici.
   - **Convenzione art. 56** — affidamento diretto a OdV/APS per attività di interesse generale.
   - **Codice contratti** (D.Lgs. 36/2023) — procedura competitiva di mercato (zona di confine).
3. **Sussidiarietà orizzontale** (art. 118 Cost. c. 4) come principio guida, secondo l'interpretazione della Corte Costituzionale (sent. 131/2020).
4. **Wiki Obsidian autonoma** — versionabile con git, replicabile per altri progetti, sfogliabile a colpo d'occhio.

---

## Aggiornamento normativa

Quando carichi materiali nuovi (es. una sentenza, una nota ANAC), chiedi all'agente:

> "Ho caricato `normativa/giurisprudenza/corte-costituzionale/72-2022.pdf`. Aggiorna `normativa/INDEX.md` e crea la nota corrispondente in `wiki/30-Sentenze/corte-costituzionale/`."

L'agente legge il file, lo indicizza, e crea la nota wiki con backlink ai concetti correlati.

---

## Installazione (Claude Code)

> ⚠️ Questo è un **plugin a distribuzione privata**. Il repo è privato; l'accesso si ottiene solo su invito del maintainer.
>
> 📖 **Per i collaboratori invitati**: leggi prima [`docs/INVITO-COLLABORATORI.md`](docs/INVITO-COLLABORATORI.md) — guida step-by-step in 6 passi.

In sintesi, dopo aver accettato l'invito GitHub e fatto `gh auth login`:

```bash
# Una sola volta — aggiungi il marketplace
/plugin marketplace add nicolabasile76-collab/amministrazione_condivisa

# Installa il plugin
/plugin install amministrazione-condivisa@amministrazione-condivisa
```

Dopo l'installazione, in qualunque progetto Claude Code sarà disponibile:

- l'agente `ac-expert` (Task tool)
- le 6 skill (analizza-avviso, analizza-convenzione, redigi-avviso-coprogrammazione/coprogettazione, redigi-convenzione, relazione-tecnica)
- i 3 slash command (`/ac-analizza`, `/ac-redigi`, `/ac-relazione`)

> **Nota**: il corpus normativo (`normativa/`) e la wiki Obsidian (`wiki/`) restano legati al progetto specifico in cui sono caricati. Il plugin installato globalmente porta solo agente, skill, commands e template.

## Aggiornare il plugin

```bash
/plugin update amministrazione-condivisa
```

## Licenza

MIT — vedi [LICENSE](LICENSE).

I PDF normativi inclusi in `normativa/` sono fonti di terze parti soggette ai rispettivi regimi di diritto d'autore. La wiki Obsidian è elaborazione originale degli autori.

## Versione

`0.1.0` — scaffolding iniziale + corpus iniziale (47 PDF, 46 note wiki). Il corpus normativo viene popolato progressivamente.
