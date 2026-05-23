# Guida per i collaboratori invitati

Benvenuto/a. Hai ricevuto un invito a collaborare al plugin **Amministrazione Condivisa** sviluppato da **Nicolò Basile / POST Società Benefit**.

Questo documento spiega in 6 passi come **installare** e usare il plugin sulla tua macchina.

> ⚠️ Tutto il contenuto del plugin è **riservato** (repo privato). Non condividere link, screenshot o materiali con terzi senza autorizzazione esplicita.

---

## Cosa otterrai

Una volta installato, in **qualunque** sessione Claude Code (anche fuori dalla cartella del progetto) avrai disponibili:

| Componente | Cosa fa |
|------------|---------|
| Agente **`ac-expert`** | Esperto di Amministrazione Condivisa ex art. 55-57 CTS. Si richiama via Task tool o automaticamente per analisi/redazione. |
| 6 **skill** | Analizza avviso, analizza convenzione, redigi avviso coprogrammazione/coprogettazione, redigi convenzione, relazione tecnica |
| 3 **slash command** | `/ac-analizza`, `/ac-redigi`, `/ac-relazione` |
| 4 **template** documentali | Bozze pronte da personalizzare per ogni caso |
| Corpus normativo + Wiki Obsidian | Visibili solo se cloni il repo localmente |

---

## Prerequisiti (una tantum)

Da installare se non li hai già:

### 1. Claude Code
[claude.com/code](https://claude.com/code) — segui le istruzioni di installazione per la tua piattaforma.

### 2. Git
- **Windows**: [git-scm.com](https://git-scm.com/download/win)
- **macOS**: `brew install git` oppure scarica da git-scm.com
- **Linux**: `sudo apt install git` o equivalente

### 3. GitHub CLI (`gh`)
- **Windows**: `winget install GitHub.cli` oppure scarica da [cli.github.com](https://cli.github.com)
- **macOS**: `brew install gh`
- **Linux**: vedi istruzioni su cli.github.com

### 4. Account GitHub
Se non ce l'hai, registrati gratis su [github.com](https://github.com). Il tuo username GitHub serve per essere invitato come collaboratore al repo privato.

---

## Step 1 — Comunica al maintainer il tuo username GitHub

**Invia a Nicolò Basile** il tuo **username GitHub**.

Lui ti inviterà come collaboratore al repo `nicolabasile76-collab/amministrazione_condivisa` (riceverai notifica email da GitHub).

**Accetta l'invito** cliccando il link nell'email (o da github.com/notifications).

---

## Step 2 — Autentica `gh` sulla tua macchina

Apri il terminale (PowerShell su Windows, Terminal su macOS/Linux) e lancia:

```bash
gh auth login
```

Rispondi alle domande:

| Prompt | Risposta |
|--------|----------|
| *Where do you use GitHub?* | `GitHub.com` |
| *Preferred protocol?* | `HTTPS` |
| *Authenticate Git?* | `Yes` |
| *How to authenticate?* | `Login with a web browser` |
| Codice one-time | copia il codice |
| Browser si apre | incolla il codice, autorizza |

Alla fine vedrai `✓ Logged in as <tuo-username>`.

---

## Step 3 — Aggiungi il marketplace in Claude Code

Apri **Claude Code** in qualunque cartella (anche vuota va bene). Nel prompt scrivi:

```
/plugin marketplace add nicolabasile76-collab/amministrazione_condivisa
```

Claude Code clonerà il marketplace e ti chiederà conferma. Risposta attesa: *"Marketplace aggiunto: amministrazione-condivisa"*.

---

## Step 4 — Installa il plugin

Sempre nel prompt Claude Code:

```
/plugin install amministrazione-condivisa@amministrazione-condivisa
```

Risposta attesa: *"Plugin installato"* con elenco componenti caricati (1 agente, 6 skill, 3 command).

---

## Step 5 — Test rapido

Verifica che l'agente sia attivo:

```
Hey ac-expert, sei attivo? Dimmi cosa sai fare in 5 righe.
```

Risposta attesa: una sintesi delle competenze (artt. 55-57 CTS, skill disponibili, ecc.).

---

## Step 6 — (Opzionale) Clona il repo localmente per accedere a normativa + wiki

Il marketplace installa **solo** il framework (agente + skill + commands + templates). Se vuoi anche accedere al **corpus normativo** (PDF) e alla **wiki Obsidian**, clona il repo:

```bash
git clone https://github.com/nicolabasile76-collab/amministrazione_condivisa.git
cd amministrazione_condivisa
```

Poi:
- Apri **`wiki/`** in Obsidian come vault → naviga 50+ note giuridiche
- Sfoglia **`normativa/`** per consultare i PDF
- Apri Claude Code in questa cartella → l'agente vede direttamente il corpus

---

## Aggiornamento del plugin

Quando il maintainer pubblica una nuova versione (ti arriverà di norma comunicazione), nel prompt Claude Code:

```
/plugin update amministrazione-condivisa
```

E se hai clonato il repo:

```bash
git pull
```

---

## Comandi utili

| Comando | Cosa fa |
|---------|---------|
| `/plugin` | Mostra plugin installati, marketplace configurati |
| `/plugin update amministrazione-condivisa` | Aggiorna alla versione più recente |
| `/plugin uninstall amministrazione-condivisa@amministrazione-condivisa` | Rimuovi il plugin |
| `/plugin marketplace remove amministrazione-condivisa` | Rimuovi il marketplace |

---

## Esempi di uso

### Analizzare un avviso esistente
```
/ac-analizza ./bozza-avviso-comune-x.pdf
```

### Redigere una bozza di convenzione
```
/ac-redigi convenzione
```
L'agente farà un'intervista per raccogliere i dati e produrrà la bozza in `output/bozze/`.

### Domanda dottrinale all'agente
```
Sei ac-expert? Una PA può fare coprogettazione senza atto programmatorio presupposto?
Cita la sentenza pertinente del nostro corpus.
```

### Produrre una relazione tecnica
```
/ac-relazione "Coprogettazione politiche giovanili comune di X"
```

---

## Risoluzione problemi

### Errore: `gh: not authenticated`
Esegui `gh auth login` e segui i passaggi (Step 2).

### Errore: `marketplace not found` o `permission denied`
- Verifica di avere accettato l'invito al repo (vai su github.com/nicolabasile76-collab/amministrazione_condivisa → dovresti vederlo)
- Verifica di essere autenticato con il giusto account: `gh auth status`

### L'agente non risponde / sembra non installato
- Esegui `/plugin` per verificare installazione
- Riavvia Claude Code (in alcuni casi serve restart per caricare nuovi plugin)

### Problemi con caratteri accentati nei file estratti
- I file `.txt` in `normativa/_estratti-txt/` sono auto-rigenerati. Se hai problemi di encoding, segnalalo al maintainer.

---

## Riservatezza e uso

- **Non condividere** il link al repo, screenshot dei contenuti, o materiali ricevuti, con persone non autorizzate.
- Le **note wiki** rappresentano elaborazioni originali di POST Società Benefit / Nicolò Basile, soggette a licenza MIT (riusabili nel rispetto dell'attribuzione).
- I **PDF normativi** in `normativa/` sono fonti di terze parti: usabili per uso interno/studio, non redistribuibili pubblicamente.
- I **materiali clienti** eventualmente presenti (es. avvisi/convenzioni di PA specifiche) sono **strettamente riservati** — non condividere ad alcun titolo.

---

## Contatti

**Maintainer**: Nicolò Basile — POST Società Benefit

Per dubbi, segnalazioni bug, richieste di nuovi materiali normativi, suggerimenti di miglioramento: scrivimi direttamente.

Buon lavoro!
