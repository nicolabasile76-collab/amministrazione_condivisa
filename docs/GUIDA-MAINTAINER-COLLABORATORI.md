# Guida maintainer — Gestione collaboratori

Procedure operative per **te** (Nicolò) per invitare, gestire e rimuovere collaboratori al repo privato `amministrazione_condivisa`.

---

## Invitare un nuovo collaboratore

### Via GitHub web (più semplice)

1. Vai su https://github.com/nicolabasile76-collab/amministrazione_condivisa/settings/access
2. Clicca **"Add people"** in alto a destra
3. Inserisci lo **username GitHub** del collaboratore (es. `nome-cognome`)
4. Scegli il ruolo:
   - **Read** — può clonare/installare, NON può modificare. Adatto per la maggior parte dei casi.
   - **Triage** — può anche gestire issues e PR. Per chi contribuisce attivamente.
   - **Write** — può anche fare push. Per co-maintainer.
   - **Maintain / Admin** — accesso completo. Solo per co-titolari del plugin.
5. Clicca **"Add"**.

GitHub manderà email di invito al collaboratore. Lui dovrà accettare cliccando il link.

### Via `gh` CLI (più veloce se hai username)

```bash
gh api -X PUT repos/nicolabasile76-collab/amministrazione_condivisa/collaborators/<username> -f permission=read
```

Sostituisci `<username>` e cambia `permission` se serve diverso ruolo.

### Cosa mandare al collaboratore

Email/messaggio tipo:

> Ciao [nome],
>
> Ti ho appena invitato come collaboratore al repo privato del plugin Claude Code che ho sviluppato sull'Amministrazione Condivisa (artt. 55-57 CTS). Riceverai una email da GitHub: accetta l'invito.
>
> Per installare e iniziare a usarlo, segui la guida in 6 passi:
> https://github.com/nicolabasile76-collab/amministrazione_condivisa/blob/main/docs/INVITO-COLLABORATORI.md
>
> Tempo stimato setup: 15-20 minuti (la maggior parte è installazione di prerequisiti se non li hai già: Claude Code, git, gh).
>
> Quando sei a posto, fai un test con:
> ```
> Hey ac-expert, sei attivo? Dimmi cosa sai fare in 5 righe.
> ```
>
> Se hai problemi, scrivimi.
>
> Buon lavoro,
> Nicolò

---

## Verificare chi ha accesso

### Via GitHub web
https://github.com/nicolabasile76-collab/amministrazione_condivisa/settings/access

### Via `gh` CLI
```bash
gh api repos/nicolabasile76-collab/amministrazione_condivisa/collaborators
```

Restituisce JSON con tutti i collaboratori e i loro permessi.

---

## Cambiare il ruolo di un collaboratore esistente

Web: stessa pagina Access → clicca sul ruolo accanto al nome → cambia.

CLI:
```bash
gh api -X PUT repos/nicolabasile76-collab/amministrazione_condivisa/collaborators/<username> -f permission=triage
```

---

## Rimuovere un collaboratore

Web: stessa pagina Access → clicca **X** accanto al nome → conferma.

CLI:
```bash
gh api -X DELETE repos/nicolabasile76-collab/amministrazione_condivisa/collaborators/<username>
```

⚠️ **Importante**: la rimozione **revoca l'accesso al repo** (clone, install, update). I plugin già installati restano installati ma non si aggiornano più. Per forzare disinstallazione lato loro non c'è meccanismo automatico: dovresti comunicarlo.

---

## Pubblicare un aggiornamento del plugin

Workflow standard:

```bash
# 1. Lavora sui file
# (modifica agents/, skills/, commands/, templates/, normativa/, wiki/, ecc.)

# 2. Verifica modifiche
git status

# 3. Stage + commit
git add .
git commit -m "Descrizione modifiche significative"

# 4. Push
git push
```

I collaboratori, per ricevere l'aggiornamento:

```
# Su Claude Code
/plugin update amministrazione-condivisa
```

E (se hanno clonato il repo localmente):
```bash
git pull
```

### Aggiornamenti che richiedono comunicazione esplicita

Per modifiche che cambiano **come si usa** il plugin (es. nuovi command, nuova versione del template), mandare comunicazione ai collaboratori con changelog.

Suggerimento: tieni un file `CHANGELOG.md` aggiornato.

---

## Strategia futura: passaggio a Organizzazione GitHub

Quando i collaboratori saranno più di 5-7, conviene passare a **GitHub Organization**:

1. Crea organizzazione `post-societa-benefit` (o simile) su github.com/organizations/new
2. Trasferisci il repo all'organizzazione (Settings → Transfer ownership)
3. Aggiungi membri all'organizzazione una volta sola
4. Tutti i repo dell'org (presenti e futuri) sono accessibili automaticamente

Vantaggi: gestione centralizzata, repo multipli sotto un brand POST, team con permessi gerarchici, eventuale piano Pro per features avanzate (private CI/CD, ecc.).

---

## Backup e recupero

Il repo GitHub è **già backup di per sé**. Se vuoi backup aggiuntivo:

```bash
# Backup completo offline
cd "$env:USERPROFILE\Documents\BACKUP-PLUGINS"
git clone --bare https://github.com/nicolabasile76-collab/amministrazione_condivisa.git amministrazione_condivisa-bare.git
```

Ripeti periodicamente (es. mensilmente).

---

## Audit dell'uso

GitHub mostra le **statistiche di traffico** del repo (anche privato):

https://github.com/nicolabasile76-collab/amministrazione_condivisa/graphs/traffic

Puoi vedere:
- visite uniche / pagine viste
- referrer
- cloni del repo (utile per stimare quanti collaboratori l'hanno installato)

---

## Considerazioni di sicurezza

1. **Mai mettere in chiaro nel repo**: chiavi API, password, token, dati personali identificabili di clienti.
2. **`.gitignore` aggiornato**: i pattern attuali escludono già lock Office, output runtime, file di sistema.
3. **Materiali clienti**: se nel corpus ci sono atti di clienti POST specifici, valutare se anonimizzare (oscurare nomi/CF) prima di committare.
4. **Revoca tempestiva**: se un collaboratore lascia POST o cambia incarico, rimuovi subito l'accesso.

---

## In sintesi: workflow operativo

| Quando | Cosa fare |
|--------|-----------|
| **Nuovo collaboratore richiede accesso** | Settings → Access → Add people → ruolo Read (default) → invia messaggio tipo |
| **Voglio sapere chi accede** | Settings → Access (lista visiva) |
| **Pubblico aggiornamenti normativi / wiki / template** | `git add . && git commit && git push` → comunica ai collaboratori se serve |
| **Collaboratore non è più autorizzato** | Settings → Access → rimuovi |
| **Crescita oltre 5-7 collaboratori** | Valuta migrazione a GitHub Organization |

---

Buona gestione!
