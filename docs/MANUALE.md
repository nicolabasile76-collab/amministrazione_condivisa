# Manuale del plugin Amministrazione Condivisa

**Versione**: v0.1.0 — maggio 2026
**Autore**: Nicolò Basile / POST Società Benefit
**Destinatari**: utilizzatori e gestori del plugin

---

## Indice

1. [Cos'è il plugin in 5 righe](#1-cosè-il-plugin-in-5-righe)
2. [Cosa puoi farci](#2-cosa-puoi-farci)
3. [Quick start in 5 minuti](#3-quick-start-in-5-minuti)
4. [I 4 slash command quotidiani](#4-i-4-slash-command-quotidiani)
5. [L'agente ac-expert: quando chiamarlo](#5-lagente-ac-expert-quando-chiamarlo)
6. [Il monitoring ac-monitor: scoprire novità](#6-il-monitoring-ac-monitor-scoprire-novità)
7. [Caricare nuovi materiali nel corpus](#7-caricare-nuovi-materiali-nel-corpus)
8. [Navigare la wiki Obsidian](#8-navigare-la-wiki-obsidian)
9. [Aggiornare il plugin](#9-aggiornare-il-plugin)
10. [Aggiungere collaboratori](#10-aggiungere-collaboratori)
11. [Risoluzione problemi comuni](#11-risoluzione-problemi-comuni)
12. [Glossario](#12-glossario)

---

## 1. Cos'è il plugin in 5 righe

È un **assistente specialistico** in materia di **Amministrazione Condivisa** (artt. 55-57 D.Lgs. 117/2017 — Codice del Terzo Settore).
Vive dentro **Claude Code**, dialoga in italiano, conosce **34 sentenze** + **norme** + **dottrina** del settore.
Ti aiuta a **analizzare** avvisi e convenzioni esistenti, **redigere** bozze nuove, **monitorare** novità giurisprudenziali.
Ha una **wiki Obsidian** integrata (62 note) per consultare i concetti chiave.
È installato a livello **utente** (`~/.claude/`) — funziona in **qualunque sessione Claude Code**.

---

## 2. Cosa puoi farci

| Vuoi… | Usa… |
|-------|------|
| Analizzare un avviso esistente di una PA | `/ac-analizza percorso/avviso.pdf` |
| Scrivere una bozza di avviso di coprogettazione | `/ac-redigi coprogettazione` |
| Scrivere una bozza di convenzione art. 56 | `/ac-redigi convenzione` |
| Fare una relazione tecnica con matrice rischi | `/ac-relazione "nome progetto"` |
| Cercare novità giurisprudenziali ultime 30gg | `/ac-monitor` |
| Chiedere un parere giuridico al volo | parla con **`ac-expert`** in chat |
| Consultare le note sui concetti chiave | apri la **wiki Obsidian** in `wiki/` |

---

## 3. Quick start in 5 minuti

### Prerequisiti

Devi avere già installato:

- **Claude Code** o FleetView
- Aver clonato il repo `amministrazione_condivisa` localmente (`git clone`)
- Aver eseguito una volta `scripts/install-user-level.ps1` per installare a livello utente

### Test che tutto funziona

Apri Claude Code in qualunque cartella, scrivi `/` e dovresti vedere nel menu autocomplete:

- `/ac-analizza`
- `/ac-monitor`
- `/ac-redigi`
- `/ac-relazione`

Se li vedi → tutto OK. Se non li vedi → vai al §11 (Risoluzione problemi).

### Primo test

Scrivi nel prompt:

```
ac-expert, dimmi in 3 righe la differenza tra coprogrammazione e coprogettazione.
```

Se ti risponde citando art. 55 c. 2 vs c. 3 CTS → il sistema è operativo.

---

## 4. I 4 slash command quotidiani

### `/ac-analizza` — Critical review

**Quando**: hai sotto mano un avviso pubblico o una convenzione di una PA e vuoi sapere se "regge".

```
/ac-analizza ./bozza-avviso.pdf
/ac-analizza ./convenzione.docx convenzione
```

**Cosa fa**: legge il file, lo classifica (avviso o convenzione), applica una checklist normativa (conformità a sent. 131/2020, DM 72/2021, criteri non di mercato, ecc.), cerca **red flag** (rischio appalto mascherato, requisiti "fotografia", ecc.) e produce un rapporto strutturato.

### `/ac-redigi` — Produzione bozze

**Quando**: devi scrivere un avviso o una convenzione da zero (o partendo da un brief).

```
/ac-redigi coprogrammazione         # avviso ex art. 55 c. 2
/ac-redigi coprogettazione          # avviso ex art. 55 c. 3
/ac-redigi convenzione              # convenzione/accordo
/ac-redigi coprogettazione brief.md # con brief
```

**Cosa fa**: ti fa un'intervista mirata (o legge il brief), carica il template corrispondente, redige la bozza con tutte le clausole essenziali (premesse normative, definizioni, oggetto, durata, risorse, modalità di erogazione, ecc.), include checklist di verifica + lista allegati + disclaimer di responsabilità.

**Output**: salvato in `output/bozze/YYYYMMDD-<tipo>-<slug>.md`.

### `/ac-relazione` — Relazione tecnica

**Quando**: serve un documento istruttorio che motivi una scelta procedurale (es. perché coprogettazione e non appalto), con analisi di sostenibilità + rischi.

```
/ac-relazione "Coprogettazione politiche giovanili Comune di X"
```

**Cosa fa**: produce una relazione su 4 assi (economico, organizzativo, sociale, ambientale), con **matrice rischi** P×I e — novità — **grafico scatter** generato automaticamente con `generate-risk-matrix.py`.

**Output**: `.md` + opzionalmente `.docx` con brand POST in `output/relazioni/`.

### `/ac-monitor` — Monitoraggio periodico

**Quando**: una volta al mese, per vedere se sono uscite novità giurisprudenziali, normative, di prassi, dottrinali da ingerire nel corpus.

```
/ac-monitor                # default: ultimi 30 giorni, tutte le fonti
/ac-monitor 90d dottrina   # ultimi 3 mesi, solo dottrina
```

**Cosa fa**: scandaglia 4 categorie di fonti (giurisprudenza · prassi · normativa · dottrina), applica triage di rilevanza (score 0-100), verifica duplicati col corpus, produce un report di candidate. Dopo decisione tua, esegue ingest automatico.

**Output**: `output/monitoring/YYYY-MM-DD-monitor.md`.

---

## 5. L'agente ac-expert: quando chiamarlo

Quando una domanda è **dottrinale**, **interpretativa**, o richiede **parere** — non un comando puntuale.

### Esempi tipici

```
ac-expert, una PA può fare coprogettazione senza atto programmatorio presupposto?

Ho un servizio già a budget, posso fare coprogettazione o devo fare gara?

Mi spieghi il dialogo tra TAR Toscana 840/2026 e TAR Lombardia 2533/2024?

Per un avviso in materia di assistenza scolastica disabili, quali rischi giuridici devo segnalare?

ac-expert, ti ho caricato un bando in cartella, dammi un'opinione veloce.
```

L'agente cita sempre fonti dal corpus (sentenze, articoli, dottrina) — niente "fonti inventate". Se non sa qualcosa, **te lo dice**.

---

## 6. Il monitoring ac-monitor: scoprire novità

### Come usarlo

**Una volta al mese**, in qualunque sessione Claude Code:

```
/ac-monitor
```

(default: 30 giorni, tutte le 4 categorie)

### Cosa succede dopo

1. L'agente ti restituisce un **report** con N candidate (sentenze, articoli, atti) ordinate per rilevanza.
2. Tu **decidi** quali vuoi ingerire:
   ```
   Ingerisci D1 e G1.
   Solo INDEX per D2.
   Ignora resto.
   ```
3. L'agente esegue la **pipeline di ingest automatica** per ciascun item selezionato:
   - Scarica il PDF (se disponibile)
   - Estrae il testo
   - Crea una **nota wiki** dettagliata
   - Aggiorna `normativa/INDEX.md`
   - Aggiunge cross-reference alle note correlate

### Quando il monitoring NON basta

Per sentenze/atti che richiedono lettura integrale (non solo metadati), può essere utile chiedere all'agente:

```
ac-expert, leggi integralmente il PDF [...] e fammi una nota wiki completa.
```

In tal caso l'agente fa un lavoro più approfondito (più tempo, più qualità).

---

## 7. Caricare nuovi materiali nel corpus

### Modalità 1 — Hai già il PDF/DOCX sul tuo PC

1. Mettilo nella cartella **`normativa/`** alla radice (non in sottocartelle) — l'agente penserà a smistarlo.
2. Apri Claude Code in quella cartella.
3. Scrivi:
   ```
   ac-expert, ho caricato un nuovo file in normativa/. Indicizzalo.
   ```
4. L'agente:
   - Legge il file
   - Lo sposta nella sottocartella corretta (es. `giurisprudenza/tar/`)
   - Lo rinomina secondo convenzione (es. `tar-toscana-sez4-840-2026.pdf`)
   - Aggiorna `normativa/INDEX.md`
   - Crea una **nota wiki** in `wiki/30-Sentenze/` o cartella appropriata

### Modalità 2 — Hai solo URL o citazione

```
ac-expert, scarica e indicizza la sentenza TAR Catania 124/2026 sull'accreditamento.
```

L'agente cerca, scarica, fa tutto il resto.

### Modalità 3 — Tramite monitor

`/ac-monitor` periodico → l'agente scopre da solo le novità.

### Cosa NON fare

- ❌ Non mettere PDF sensibili (atti riservati clienti) — il repo è privato ma comunque visibile ai collaboratori.
- ❌ Non rinominare i file caricati a mano se non sai la convenzione (l'agente lo fa meglio).

---

## 8. Navigare la wiki Obsidian

### Aprire il vault

1. Installa **Obsidian** da [obsidian.md](https://obsidian.md) (gratuito).
2. "Open folder as vault" → seleziona la cartella **`wiki/`** del progetto.
3. Si apre. Inizia dal MOC.

### Struttura della wiki

```
wiki/
├── 00-MOC/                 Map of Content principale
├── 10-Concetti/            Coprogrammazione, Coprogettazione, ETS, ...
├── 20-Articoli/            art. 55, 56, DM 72/2021, TUEL, L. 136/2010, ...
├── 30-Sentenze/
│   ├── corte-costituzionale/   131/2020 (cardine)
│   ├── consiglio-stato/        11 sentenze
│   └── tar/                    23 sentenze
├── 35-Prassi-ANAC/         Comunicato Cantone, FAQ tracciabilità
├── 36-Prassi-MLPS/         Intesa Stato-Regioni
├── 47-Fiscalita/           Interpello AdE 375/2021
├── 70-Dottrina/            Quaderno Terzjus, articoli 2026
└── _templates/             Template di nuove note
```

### Funzioni utili Obsidian

- **Graph view** (`Ctrl+G`): vedi la rete di collegamenti tra le 62 note
- **Backlink** (sidebar destra): per ogni nota, quali altre la citano
- **Search globale** (`Ctrl+Shift+F`): cerca testo in tutte le note
- **Tag pane**: filtra per `#leading-case`, `#post`, `#disabilita`, ecc.

### Quale nota leggere per prima

Apri `00-MOC/MOC-Amministrazione-Condivisa.md` — è l'hub con i link ai concetti principali.

---

## 9. Aggiornare il plugin

### Workflow tipico (settimanale o quando serve)

```powershell
# Apri PowerShell, vai nella cartella progetto
cd "C:\Users\nbasile\Documents\PARTITA IVA\POST\Ai_PRogettazione Sociale\Amministrazione Condivisa"

# Scarica gli aggiornamenti da GitHub
git pull

# Rilancia lo script di installazione user-level
PowerShell -ExecutionPolicy Bypass -File scripts\install-user-level.ps1
```

Lo script copia le ultime versioni di agenti/skill/commands in `~/.claude/` con prefisso `ac-`.

### Dopo l'aggiornamento

**Riavvia Claude Code** per caricare i nuovi componenti.

### Quando NON aggiornare a freddo

Se stai lavorando su un file del corpus in locale e non l'hai ancora committato, fai prima:

```powershell
git status        # vedi cosa hai modificato
git add .         # aggiungi le modifiche
git commit -m "Descrizione modifiche"
git push          # invia al repo
```

Poi puoi fare `git pull` per aggiornare altri eventuali cambiamenti.

---

## 10. Aggiungere collaboratori

### Step 1 — Tu inviti

**Via GitHub web** (più semplice):
1. https://github.com/nicolabasile76-collab/amministrazione_condivisa/settings/access
2. "Add people" → username GitHub del collaboratore → ruolo **Read**

**Via terminale**:
```powershell
gh api -X PUT repos/nicolabasile76-collab/amministrazione_condivisa/collaborators/<username> -f permission=read
```

### Step 2 — Manda al collaboratore questo link

> https://github.com/nicolabasile76-collab/amministrazione_condivisa/blob/main/docs/INVITO-COLLABORATORI.md

È una guida 6 step che lo porta a installare il plugin sulla sua macchina (15-20 minuti totali).

### Step 3 — Verifica

Quando il collaboratore ha completato il setup, può fare il test:

```
ac-expert, sei attivo? Dimmi cosa sai fare in 3 righe.
```

Se risponde correttamente → tutto OK.

### Gestione collaboratori esistenti

Tutte le procedure (cambio ruolo, revoca accesso, audit, migrazione a GitHub Organization) sono in:

> `docs/GUIDA-MAINTAINER-COLLABORATORI.md`

---

## 11. Risoluzione problemi comuni

### "Non vedo i comandi `/ac-*` quando scrivo `/`"

→ Apri PowerShell, esegui:
```powershell
cd "C:\Users\nbasile\Documents\PARTITA IVA\POST\Ai_PRogettazione Sociale\Amministrazione Condivisa"
PowerShell -ExecutionPolicy Bypass -File scripts\install-user-level.ps1
```
Riavvia Claude Code.

### "`/plugin` mi dice 'not available in this environment'"

→ Normale: in FleetView/PAI il comando `/plugin` non c'è. Il plugin funziona comunque tramite l'installazione user-level (vedi sopra). I tuoi comandi `/ac-*` ci sono, anche se la voce "plugin" non appare nei menu.

### "ac-expert non risponde / non viene chiamato"

→ Probabilmente non lo stai chiamando per nome. Scrivi esplicitamente `ac-expert, [tua domanda]`.

### "ac-monitor non trova nuove sentenze"

→ Normale se hai appena fatto un monitor. Le fonti italiane si aggiornano lentamente. Riprova dopo 2-4 settimane.

### "Ho aggiornato un file localmente ma non vedo le modifiche in Claude Code"

→ Per i file in `~/.claude/` devi rilanciare lo script install + riavviare Claude Code. Per i file in `.claude/` di progetto basta riaprire la sessione.

### "Errore 'file in uso' quando provo a spostare un DOCX"

→ Hai il file aperto in Word/LibreOffice. Chiudilo e riprova.

### "Il PDF è una scansione, l'agente non lo legge"

→ Serve l'OCR. Usa Adobe Acrobat Pro (Strumenti → Migliora scansioni → Riconosci testo) oppure servizio online di OCR. Poi sostituisci il PDF.

### "Voglio rimuovere completamente il plugin da ~/.claude/"

→ Esegui:
```powershell
PowerShell -ExecutionPolicy Bypass -File scripts\uninstall-user-level.ps1
```

---

## 12. Glossario

| Termine | Significato |
|---------|-------------|
| **CTS** | Codice del Terzo Settore — D.Lgs. 117/2017 |
| **ETS** | Ente del Terzo Settore (associazione, fondazione, cooperativa sociale, ...) |
| **Coprogrammazione** | Fase di programmazione partecipata PA-ETS ex art. 55 c. 2 |
| **Coprogettazione** | Fase di co-design di interventi specifici ex art. 55 c. 3 |
| **Convenzione art. 56** | Accordo PA con OdV/APS per attività di interesse generale a favore di terzi |
| **RUNTS** | Registro Unico Nazionale Terzo Settore |
| **OdV** | Organizzazione di Volontariato |
| **APS** | Associazione di Promozione Sociale |
| **PA** | Pubblica Amministrazione |
| **131/2020** | Sentenza Corte Costituzionale n. 131 del 26/6/2020 — leading case |
| **DM 72/2021** | Linee Guida MLPS sui rapporti PA-ETS |
| **Wiki** | La cartella `wiki/` apribile in Obsidian come "vault" di conoscenza |
| **Corpus normativo** | La cartella `normativa/` con PDF di leggi, sentenze, dottrina |
| **Plugin** | L'insieme degli agenti, skill, commands, template installati in Claude Code |
| **Agente** (`ac-expert`, `ac-monitor`) | Persona-virtuale AI con competenze specifiche, invocabile per nome |
| **Skill** | Comportamento specializzato che si attiva automaticamente su trigger testuale |
| **Slash command** (`/ac-*`) | Comando rapido da digitare nel prompt Claude Code |
| **Template** | Modello di documento riusabile in `templates/` |
| **Ingest** | Processo di "assorbimento" di un nuovo materiale nel corpus + wiki |

---

## Riferimenti

- **Repository**: https://github.com/nicolabasile76-collab/amministrazione_condivisa
- **README**: link rapido a installazione e overview
- **Guida collaboratori**: `docs/INVITO-COLLABORATORI.md`
- **Guida maintainer**: `docs/GUIDA-MAINTAINER-COLLABORATORI.md`
- **Scripts utility**: `scripts/README.md`

---

## Versione

| Versione | Data | Note |
|----------|------|------|
| **v0.1.0** | 25/05/2026 | Prima versione del manuale — copre framework v0.1.0 |

---

**Maintainer**: Nicolò Basile — POST Società Benefit
Per dubbi, segnalazioni, miglioramenti: scrivimi direttamente o apri un issue sul repo.

🗣️ Buon lavoro!
