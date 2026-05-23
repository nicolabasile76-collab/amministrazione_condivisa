---
name: redigi-convenzione
description: |
  Usa questa skill quando l'utente chiede di REDIGERE, SCRIVERE, PREPARARE una bozza di CONVENZIONE o ACCORDO DI COLLABORAZIONE tra PA ed ETS — sia ex art. 56 D.Lgs. 117/2017 (con OdV/APS), sia come esito di coprogettazione ex art. 55 c. 4. Trigger: "redigi convenzione art. 56", "bozza accordo di collaborazione", "convenzione con OdV per servizio X", "accordo esito coprogettazione". NON usare per l'avviso (usa redigi-avviso-*) né per analisi (usa analizza-convenzione).
version: 1.0.0
---

# Skill — Redazione di convenzione / accordo di collaborazione

## Obiettivo

Produrre una bozza di atto convenzionale tra PA ed ETS adeguata al caso d'uso:

- **Convenzione art. 56 CTS** — con OdV o APS, per attività di interesse generale a favore di terzi, a condizioni più favorevoli del mercato.
- **Accordo di collaborazione esito di coprogettazione** — formalizzazione del partenariato definito al tavolo.
- Possibili varianti: accordo tra PA (art. 15 L. 241/1990) con coinvolgimento ETS, sovvenzione (art. 12 L. 241/1990) con accordo accessorio.

## Distinzione preliminare obbligatoria

Prima di scrivere, **identifica la natura** dell'atto:

| Caso | Norma | Soggetto | Causa |
|------|-------|----------|-------|
| Convenzione art. 56 | art. 56 CTS | OdV o APS iscritte ≥6m al RUNTS | Attività interesse generale a favore di terzi |
| Accordo coprogettazione | art. 55 c. 3-4 CTS | Qualsiasi ETS | Realizzazione condivisa di progetto già coprogettato |
| Accordo PA-PA | art. 15 L. 241/1990 | Tra PA | Esercizio coordinato di funzioni |
| Sovvenzione | art. 12 L. 241/1990 | Vari | Contributo unilaterale per attività di interesse pubblico |
| Appalto | D.Lgs. 36/2023 | Operatore economico | Prestazione vs corrispettivo di mercato |

**Se l'utente non chiarisce o sceglie la casella sbagliata, chiedi.**

## Input necessari

1. **Tipologia** di accordo (vedi sopra).
2. **PA contraente** — denominazione, sede, ufficio, legale rappresentante.
3. **ETS contraente** — denominazione, sede, codice fiscale, iscrizione RUNTS (numero, data, sezione), legale rappresentante.
4. **Eventuale procedura presupposta** (avviso, esito coprogettazione, scelta diretta motivata art. 56).
5. **Oggetto** dettagliato del rapporto.
6. **Durata** e modalità di rinnovo.
7. **Risorse**: importo, causale (rimborso costi / contributo / no contributo), modalità erogazione.
8. **Beni e personale** messi a disposizione dalla PA.
9. **Personale ETS coinvolto**: dipendenti, collaboratori, volontari, numero e ruoli.
10. **Profili sicurezza** rilevanti.
11. **Trattamento dati personali**: chi tratta cosa.
12. **Indicatori di monitoraggio** desiderati.

## Workflow

### Step 1 — Verifica presupposti

- Per **art. 56**: verifica iscrizione RUNTS ≥6m del soggetto. Conferma con utente.
- Per **coprogettazione**: verifica che esista avviso pubblicato e verbali del tavolo.
- Per tutti: l'attività rientra in art. 5 CTS?

### Step 2 — Carica template
Apri `templates/convenzione.md`.

### Step 3 — Struttura tipica

1. **Intestazione e identificazione parti**
   - Denominazione, sede, dati legale rappresentante PA
   - Denominazione, sede, codice fiscale, iscrizione RUNTS, dati legale rappresentante ETS

2. **Premesse**
   - Quadro normativo: art. 118 Cost., art. 4-5, 55/56 CTS, DM 72/2021, sent. 131/2020
   - Atti presupposti (delibere, determine, esito avviso/tavolo)
   - Iscrizione RUNTS verificata e citata
   - Esperienza ETS nel settore
   - Reciproco interesse e finalità condivise

3. **Oggetto**
   - Descrizione operativa del rapporto
   - Output attesi
   - Esclusione natura di appalto (clausola esplicita)

4. **Modalità di svolgimento**
   - Attività dell'ETS: cosa, come, dove, con chi
   - Standard qualitativi richiesti
   - Eventuale piano di lavoro allegato

5. **Durata**
   - Termine certo
   - Eventuale rinnovo (motivato, non automatico)
   - Verifiche intermedie

6. **Risorse economiche**
   - Importo complessivo
   - **Causale corretta**: per art. 56 e coprogettazione, "rimborso delle spese effettivamente sostenute e documentate"; non "corrispettivo"
   - Modalità di erogazione (acconti, saldo a rendiconto)
   - Documentazione richiesta per il rendiconto (giustificativi, tracciabilità)
   - Eventuale anticipo motivato

7. **Personale e volontari**
   - Elenco/categoria personale dipendente ETS
   - Volontari: copertura assicurativa ex art. 18 CTS (obbligatoria)
   - Esclusione di subordinazione tra personale ETS e PA
   - Eventuali requisiti formativi

8. **Beni e strumentazione**
   - Beni messi a disposizione dalla PA (elenco)
   - Modalità di uso, custodia, manutenzione, restituzione
   - Eventuali utenze a carico

9. **Sede di svolgimento**

10. **Sicurezza sul lavoro**
    - Adempimenti D.Lgs. 81/2008
    - DUVRI o documento equipollente se richiesto
    - Responsabilità tra PA ed ETS

11. **Trattamento dati personali**
    - Titolare e responsabile del trattamento
    - Finalità
    - Eventuale nomina ex art. 28 GDPR se l'ETS tratta dati per conto della PA
    - Informativa agli interessati

12. **Responsabilità e coperture assicurative**
    - Responsabilità civile verso terzi (RCT)
    - Eventuale RCO
    - Assicurazione volontari (art. 18 CTS)
    - Manleva / esclusioni

13. **Monitoraggio, valutazione e reporting**
    - Indicatori di processo e risultato
    - Cadenza dei report
    - Tavolo di verifica partecipata
    - Documentazione richiesta

14. **Comunicazione e immagine**
    - Loghi, autorizzazioni, riservatezza

15. **Modifiche, sospensione, risoluzione, recesso**
    - Modifiche per accordo scritto
    - Cause di risoluzione
    - Recesso (preavviso, effetti)
    - Gestione attività in corso

16. **Controversie e foro**
    - Tentativo di conciliazione
    - Foro competente

17. **Disposizioni finali**
    - Imposta di bollo (se dovuta)
    - Registrazione (se dovuta)
    - Norma di rinvio: D.Lgs. 117/2017, DM 72/2021, e principi generali del diritto amministrativo. **MAI** rinvio al codice contratti.

18. **Allegati** (piano di lavoro, informativa privacy, ecc.)

### Step 4 — Linguaggio

- Italiano contrattuale italiano.
- Mai "appalto", "appaltatore", "stazione appaltante", "corrispettivo a misura/a corpo", "garanzia definitiva ex codice contratti".
- Usa: "Ente", "ETS partner", "rimborso", "accordo di collaborazione".

### Step 5 — Annotazioni inline

Ogni clausola critica ha `<!-- nota: rif. ... -->`.

### Step 6 — Output

Produci il documento + sezione fuori-atto con:

- Checklist di verifica.
- Lista allegati da predisporre.
- Note di rischio residuo (es. attenzione a sproporzione importo, attenzione a sovrapposizione con appalti).
- Disclaimer.

## Riferimenti

- `templates/convenzione.md`
- `normativa/primarie/codice-terzo-settore/` — art. 55-56
- `normativa/secondarie/decreti-ministeriali/` — DM 72/2021
- `normativa/sicurezza/` — D.Lgs. 81/2008
- `normativa/privacy/` — GDPR
- `wiki/20-Articoli/art-56-CTS.md`
