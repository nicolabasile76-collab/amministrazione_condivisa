---
name: redigi-avviso-coprogettazione
description: |
  Usa questa skill quando l'utente chiede di REDIGERE, SCRIVERE, PREPARARE una bozza di AVVISO PUBBLICO DI COPROGETTAZIONE ex art. 55 c. 3 D.Lgs. 117/2017 — la fase di co-design e realizzazione di interventi specifici con ETS selezionati. Trigger: "redigi un avviso di coprogettazione", "bozza avviso art. 55 c. 3", "avviso per partner ETS su servizio X", "selezione ETS per coprogettare servizio Y". NON usare per la fase di programmazione (usa redigi-avviso-coprogrammazione) né per la convenzione finale (usa redigi-convenzione).
version: 1.0.0
---

# Skill — Redazione di un avviso di coprogettazione

## Obiettivo

Produrre una bozza di avviso pubblico per la selezione di uno o più ETS con cui **codefinire e realizzare** progetti di servizio o di intervento, in attuazione di programmi già individuati (eventualmente esito di coprogrammazione), ai sensi dell'**art. 55 c. 3 D.Lgs. 117/2017**.

## Distinzione fondamentale

L'avviso di coprogettazione **NON è una gara d'appalto**. È procedura ad evidenza pubblica con criteri *non* di mercato, finalizzata a selezionare partner con cui collaborare alla pari nella definizione e realizzazione del progetto.

Per evitare riqualificazione in appalto, la procedura deve:
- non assumere il *prezzo* come criterio prevalente
- prevedere un **tavolo di coprogettazione** effettivo successivo alla selezione
- avere come esito un **accordo/convenzione di collaborazione**, non un contratto di appalto
- garantire che i selezionati **partecipino effettivamente** alla definizione del progetto, non eseguano un progetto già completamente definito dalla PA

## Input necessari

Prima di scrivere, raccogli (e se mancano, **chiedi**):

1. **Ente procedente** e ufficio responsabile.
2. **Atti di programmazione presupposti** (es. esito di coprogrammazione, piano di zona, deliberazione, linee di indirizzo).
3. **Oggetto del progetto**: ambito, popolazione target, finalità.
4. **Ambito territoriale**.
5. **Durata del progetto** (es. 24 mesi + eventuale rinnovo motivato).
6. **Risorse** stanziate o stanziabili (con causali: rimborso costi, contributi, beni in uso, personale).
7. **Numero ETS** da selezionare (uno solo? coalizione? plurale?).
8. **Requisiti minimi** dei partecipanti (iscrizione RUNTS, esperienze pregresse, radicamento territoriale).
9. **Criteri di valutazione** desiderati (capacità progettuale, esperienza, ecc.).
10. **Composizione commissione** prevista.
11. **Durata del tavolo di coprogettazione** dopo la selezione.

## Workflow

### Step 1 — Verifica presupposti

- Esiste atto di programmazione presupposto? Se no, l'avviso è esposto a impugnazioni.
- L'attività rientra in art. 5 CTS?
- L'oggetto giustifica la procedura ex art. 55 c. 3 e non un appalto (es. servizio standardizzabile e a prezzo di mercato → appalto)? L'agente segnala il caso e chiede conferma all'utente.

### Step 2 — Carica template
Apri `templates/avviso-coprogettazione.md`.

### Step 3 — Struttura

1. **Premesse e riferimenti normativi**
   - Art. 118 c. 4 Cost.
   - Art. 5, 55 c. 1, 3-4 CTS
   - DM 72/2021
   - Sent. Corte Cost. 131/2020 (citazione esplicita del modulo collaborativo)
   - Atti di programmazione presupposti

2. **Definizioni** (ETS, coprogettazione, tavolo di coprogettazione, RUNTS)

3. **Oggetto e finalità**
   - Ambito, target, output attesi
   - Esplicitazione: trattasi di selezione per partenariato collaborativo, non per appalto

4. **Risorse e modalità di erogazione**
   - Tipologia (rimborso costi, contributo, beni)
   - Importi indicativi (anche range)
   - Modalità (tranche, rendiconto)
   - Esclusione del profitto

5. **Soggetti ammessi**
   - ETS iscritti al RUNTS
   - Eventuali requisiti specifici (es. categorie particolari di ETS, esperienze)
   - Raggruppamenti / reti / coalizioni (modalità)

6. **Requisiti di partecipazione**
   - Generali (capacità giuridica, assenza cause di esclusione mutuate dal codice contratti *solo in quanto principi generali di moralità pubblica*, no rimandi al D.Lgs. 36)
   - Speciali (esperienza, radicamento, personale, eventuali certificazioni)
   - **Attenzione**: requisiti non discriminatori, non "fotografia" di un soggetto specifico

7. **Modalità e termini di presentazione**
   - Documenti richiesti
   - Forma di presentazione (PEC, portale)
   - Termine (≥ 30 giorni)

8. **Documenti tecnici da presentare**
   - **Proposta progettuale** preliminare (struttura, esperienze, idea)
   - **Curriculum** dell'ETS
   - **Composizione del gruppo di lavoro**
   - **Rete di partner e territorio**
   - Eventuale bozza di piano economico-organizzativo

9. **Criteri di valutazione** (cuore dell'avviso)

   I criteri devono valorizzare:
   - Capacità progettuale e qualità della proposta
   - Esperienza nel settore e nel territorio
   - Radicamento territoriale e rete
   - Innovazione metodologica
   - Sostenibilità organizzativa
   - Eventualmente: capacità di mobilitare risorse aggiuntive

   **No "prezzo più basso"**. **No OEPV competitiva** che premi la riduzione del corrispettivo.

   Pubblica i punteggi/pesi con motivazione.

10. **Commissione di valutazione**
    - Composizione (numero, profili, indipendenza)
    - Tempi di lavoro

11. **Procedimento dopo la valutazione**
    - Soggetti ammessi al tavolo di coprogettazione
    - Modalità di lavoro del tavolo (cadenza, verbali, durata)
    - **Effettiva partecipazione** degli ETS alla definizione del progetto: la PA NON arriva con il progetto già fatto
    - Output: progetto definitivo coprogettato

12. **Convenzione / accordo di collaborazione**
    - Esito formale: stipula di accordo (vedi `templates/convenzione.md`)
    - Contenuto essenziale dell'accordo

13. **Monitoraggio e valutazione**
    - Indicatori di processo e risultato
    - Verifica partecipata
    - Reportistica

14. **Profili trasversali**
    - Sicurezza sul lavoro
    - Privacy / GDPR
    - Copertura assicurativa volontari
    - Trattamento subappalto / collaboratori (se rilevante)

15. **Trasparenza, pubblicità e accesso**

16. **Disposizioni finali**
    - RUP
    - Contatti
    - Foro
    - Allegati

### Step 4 — Linguaggio

- Italiano amministrativo asciutto.
- **Vietato** "appaltatore", "stazione appaltante", "aggiudicatario", "ribasso", "OEPV".
- Ammesso: "soggetto selezionato", "partner", "ETS partecipante al tavolo".

### Step 5 — Annotazioni inline

Ogni clausola critica include `<!-- nota: ... -->` con riferimento normativo.

### Step 6 — Output

Produci il documento + sezione finale fuori-atto con:

- **Checklist di verifica pre-pubblicazione**
- **Allegati da preparare** (modulo, informativa privacy, scheda progettuale, ecc.)
- **Rischi e cautele** (es. attenzione a non scrivere requisiti che fotografano un ETS)
- **Disclaimer** sulla natura di bozza

## Riferimenti

- `templates/avviso-coprogettazione.md`
- `normativa/primarie/codice-terzo-settore/` — art. 55 c. 3-4
- `normativa/secondarie/decreti-ministeriali/` — DM 72/2021
- `normativa/giurisprudenza/corte-costituzionale/131-2020*`
- `normativa/modelli-pa/avvisi/` — benchmark
- `wiki/10-Concetti/Coprogettazione.md`
- `wiki/20-Articoli/art-55-CTS.md`
- `wiki/30-Sentenze/corte-costituzionale/131-2020.md`
