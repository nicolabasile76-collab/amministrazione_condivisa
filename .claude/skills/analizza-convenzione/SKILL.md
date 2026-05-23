---
name: analizza-convenzione
description: |
  Usa questa skill quando l'utente chiede di analizzare, rivedere o valutare una CONVENZIONE o ACCORDO DI COLLABORAZIONE tra PA ed ETS — sia ex art. 56 D.Lgs. 117/2017 (convenzioni con OdV/APS), sia esito di coprogettazione ex art. 55 c. 4. Si attiva su richieste tipo "analizza questa convenzione", "rivedi l'accordo con la cooperativa", "questa convenzione è regolare?", "è un appalto mascherato?". NON usare per avvisi (usa analizza-avviso) né per redazione (usa redigi-convenzione).
version: 1.0.0
---

# Skill — Analisi di una convenzione / accordo di collaborazione

## Obiettivo

Critical review di un atto convenzionale tra PA ed ETS, valutando legittimità, qualità sostanziale, rischi di riqualificazione (es. in appalto), tenuta rispetto a sent. Corte Cost. 131/2020.

## Quando attivarsi

L'utente ha caricato/richiama una convenzione e chiede valutazione. Trigger tipici:
- "Rivedi questa convenzione"
- "È un art. 56 o è altro?"
- "Questa cosa è dissimulazione di appalto?"
- "L'accordo regge?"

## Workflow

### Step 1 — Lettura integrale
Leggi tutto il documento con Read. Anche allegati se segnalati.

### Step 2 — Qualificazione

Determina:
- È convenzione ex **art. 56 CTS** (con OdV o APS, attività di interesse generale a favore di terzi)?
- È accordo di collaborazione **esito di coprogettazione** (art. 55 c. 3-4)?
- È un **appalto** travestito? Una **concessione**? Una **sovvenzione** (art. 12 L. 241/1990)?

Indicatori per la qualificazione:

| Indicatore | Convenzione 56 / Coprog. | Appalto |
|------------|--------------------------|---------|
| Causa | Comune interesse generale, sussidiarietà | Scambio prestazione-corrispettivo |
| Selezione | Avviso non competitivo / iscrizione RUNTS | Gara con criteri di mercato |
| Rapporto | Collaborazione, fiducia | Prestatore vs committente |
| Corrispettivo | Rimborso costi documentati | Prezzo di mercato (margine incluso) |
| Soggetto | ETS / OdV-APS (ex art. 56) | Operatore economico |
| Profitto | Escluso | Lecito |

### Step 3 — Verifiche di base (art. 56 specifico)

Se l'atto si dichiara come convenzione art. 56:

- [ ] Soggetto è **OdV** o **APS** (no altri ETS)?
- [ ] Iscrizione al RUNTS da almeno **6 mesi**?
- [ ] Attività rientra in art. 5 CTS (interesse generale)?
- [ ] Attività favorisce **terzi** (non soci propri)?
- [ ] Condizioni più favorevoli rispetto al mercato (motivate)?
- [ ] Rimborso costi documentati (no corrispettivo)?
- [ ] Procedura di scelta tra più OdV/APS interessate (motivata)?
- [ ] Coperture assicurative per volontari (art. 18 CTS)?

### Step 4 — Checklist di qualità del testo

**Identificazione parti**
- [ ] Dati ETS completi (denominazione, sede, codice fiscale, iscrizione RUNTS)?
- [ ] Legale rappresentante e poteri verificati?

**Oggetto**
- [ ] Oggetto chiaro, circoscritto, descritto operativamente?
- [ ] Distinto da attività che richiedono procedure competitive?

**Durata**
- [ ] Termine certo o evento risolutivo definito?
- [ ] Eventuale rinnovo motivato e con verifica?

**Obblighi delle parti**
- [ ] Obblighi ETS dettagliati (cosa fa, come, con chi, dove)?
- [ ] Obblighi PA dettagliati (cosa fornisce, in che tempi)?
- [ ] Reciprocità nella collaborazione (non solo prestatore unilaterale)?

**Economia**
- [ ] Importo determinato o determinabile?
- [ ] Causale chiara: rimborso costi / contributo / corrispettivo?
- [ ] Modalità di erogazione (tranche, acconti, saldo a rendiconto)?
- [ ] Documentazione richiesta per il rimborso?

**Personale e volontari**
- [ ] Distinzione tra dipendenti ETS e volontari?
- [ ] Copertura assicurativa volontari?
- [ ] No subordinazione tra volontari e PA?

**Sicurezza**
- [ ] DUVRI o documento equipollente se rilevante?
- [ ] Adempimenti D.Lgs. 81/2008 presidiati?

**Privacy**
- [ ] Trattamento dati personali disciplinato (titolare, responsabile, finalità)?
- [ ] Atto di nomina/contratto art. 28 GDPR se ETS tratta dati per conto PA?

**Beni e strumentazione**
- [ ] Beni messi a disposizione dalla PA descritti?
- [ ] Restituzione/manutenzione disciplinata?

**Monitoraggio e valutazione**
- [ ] Reporting periodico previsto?
- [ ] Indicatori di risultato?
- [ ] Verifica partecipata?

**Risoluzione e recesso**
- [ ] Cause di risoluzione chiare?
- [ ] Recesso disciplinato?
- [ ] Effetti su attività in corso?

**Foro e norme di rinvio**
- [ ] Riferimento normativo corretto (NO codice contratti per art. 55-56)?
- [ ] Foro competente?

### Step 5 — Red flag

1. **Linguaggio da appalto** (es. "appaltatore", "stazione appaltante", "offerta vincolante", "garanzia definitiva ex codice contratti").
2. **Corrispettivo a prestazione** invece di rimborso costi.
3. **Penali da appalto** sproporzionate.
4. **Subordinazione** dei volontari alla PA.
5. **Margine di profitto** riconosciuto all'ETS.
6. **Durata indeterminata** o esageratamente lunga senza verifica.
7. **Mancanza di rendicontazione documentata**.
8. **Selezione del partner non tracciabile** (per art. 56: assenza di confronto tra più soggetti potenzialmente interessati).
9. **Sovrapposizione con servizi essenziali** che dovrebbero passare da appalto.

### Step 6 — Output

```markdown
# Analisi convenzione — [titolo]

**Parti:** ...
**Qualificazione formale:** ...
**Qualificazione sostanziale (mia):** ...
**Oggetto:** ...
**Durata:** ...
**Valore:** ...

## Sintesi del giudizio
[2-3 frasi]

## Rischio di riqualificazione
[Basso / Medio / Alto] — [motivazione]

## Punti di forza
- ...

## Criticità

| # | Criticità | Riferimento | Gravità | Raccomandazione |
|---|-----------|------------|---------|-----------------|
| ... | ... | ... | ... | ... |

## Red flag
- ...

## Checklist art. 56 (se applicabile)
[copia compilata dello step 3]

## Checklist qualità del testo
[copia compilata dello step 4]

## Raccomandazioni operative
1. ...

## Note di rischio residuo
- ...
```

## Riferimenti

- `normativa/primarie/codice-terzo-settore/` — art. 56 CTS
- `normativa/secondarie/decreti-ministeriali/` — DM 72/2021
- `normativa/giurisprudenza/corte-costituzionale/131-2020*` — principi
- `normativa/giurisprudenza/consiglio-stato/` — eventuali pronunce su riqualificazione
- `wiki/20-Articoli/art-56-CTS.md` — nota su art. 56
- `templates/convenzione.md` — modello di riferimento
