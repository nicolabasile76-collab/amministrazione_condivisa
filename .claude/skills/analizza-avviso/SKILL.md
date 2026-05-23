---
name: analizza-avviso
description: |
  Usa questa skill quando l'utente chiede di analizzare, rivedere, fare critical review, valutare la legittimità o la qualità di un AVVISO PUBBLICO di coprogrammazione o coprogettazione ex art. 55 D.Lgs. 117/2017. Si attiva su richieste come "analizza questo avviso", "rivedi questa procedura", "è conforme alla 131/2020?", "trova le criticità in questo avviso di coprogettazione". NON usare per convenzioni firmate (usa analizza-convenzione) né per redazione (usa redigi-avviso-*).
version: 1.0.0
---

# Skill — Analisi di un avviso di coprogrammazione / coprogettazione

## Obiettivo

Fare critical review approfondito di un avviso pubblico ex art. 55 CTS, individuandone punti di forza, criticità, red flag, e fornendo raccomandazioni operative ancorate a fonti.

## Quando attivarsi

L'utente ha caricato (o richiama via percorso) un avviso pubblico e chiede una valutazione. Tipici trigger:

- "Mi rivedi questo avviso?"
- "È conforme all'amministrazione condivisa?"
- "Critical review di questo bando"
- "Questo avviso regge davanti al TAR?"

## Workflow

### Step 1 — Lettura integrale
Leggi l'intero documento con il tool Read. Non basarti su estratti.

### Step 2 — Classificazione
Determina:
- È coprogrammazione (art. 55 c. 2) o coprogettazione (art. 55 c. 3)?
- Oggetto: programmazione o realizzazione di interventi?
- Ente procedente, durata, ambito territoriale, risorse stanziate.
- Procedura di selezione adottata e criteri di valutazione.

### Step 3 — Checklist obbligatoria

Verifica ognuno di questi punti, segnando ✓/✗/dubbio:

**Inquadramento giuridico**
- [ ] L'avviso richiama l'art. 55 c. 2 (coprogrammazione) o c. 3 (coprogettazione) CTS?
- [ ] Richiama la sentenza Corte Cost. 131/2020 e i suoi principi?
- [ ] Richiama il DM 72/2021 (Linee Guida)?
- [ ] L'attività rientra nell'art. 5 CTS (interesse generale)?

**Soggetti destinatari**
- [ ] L'avviso è rivolto a ETS iscritti al RUNTS?
- [ ] Eventuali restrizioni (es. solo OdV/APS) sono motivate?
- [ ] Sono ammessi raggruppamenti? Reti? Sono chiare le modalità?

**Procedura**
- [ ] Pubblicazione su albo pretorio?
- [ ] Pubblicazione su sezione "amministrazione trasparente"?
- [ ] Termini congrui per la presentazione (almeno 30 giorni di norma)?
- [ ] Modalità di presentazione chiare (PEC, portale, ecc.)?

**Criteri di valutazione (punto critico)**
- [ ] I criteri premiano capacità progettuale, esperienza, radicamento, qualità della proposta?
- [ ] È evitato il criterio "prezzo più basso"?
- [ ] È evitata l'offerta economicamente più vantaggiosa in chiave di mercato?
- [ ] La componente "economica" (se presente) è giustificata e marginale?
- [ ] I criteri sono trasparenti, oggettivi, motivati?

**Commissione**
- [ ] Composizione della commissione di valutazione definita?
- [ ] Indipendenza/incompatibilità presidiate?

**Fase di coprogettazione successiva**
- [ ] Sono descritti i tavoli di coprogettazione (modalità, durata, verbalizzazione)?
- [ ] È garantita la partecipazione effettiva degli ETS selezionati?
- [ ] L'esito è formalizzato in una convenzione/accordo?

**Risorse e rendicontazione**
- [ ] Le risorse messe a disposizione sono chiare (entità, modalità erogazione)?
- [ ] È previsto rimborso di costi documentati (non corrispettivo di mercato)?
- [ ] È esclusa la dinamica del profitto?

**Monitoraggio**
- [ ] Sono previsti indicatori di risultato?
- [ ] È prevista valutazione partecipata?

**Profili trasversali**
- [ ] Sicurezza sul lavoro presidiata (D.Lgs. 81/2008) se rilevante?
- [ ] Trattamento dati personali presidiato (GDPR) se rilevante?
- [ ] Copertura assicurativa volontari (art. 18 CTS) se applicabile?

### Step 4 — Red flag

Cerca attivamente:

1. **Avviso "mascherato"**: linguaggio da appalto, riferimenti al D.Lgs. 36/2023, criterio prezzo prevalente, clausole tipiche d'appalto (penali, garanzie definitive in stile contrattualistico).
2. **Soggetti destinatari errati**: imprese profit, cooperative non ETS senza giustificazione.
3. **Procedura compressa**: termini sotto 30 giorni senza ragione documentata.
4. **Commissione non definita o opaca**.
5. **Coprogettazione "fantasma"**: nessun tavolo, nessun verbale, nessuna partecipazione reale degli ETS.
6. **Risorse "in nero"**: importi non quantificati o non motivati.
7. **Riconducibilità a un solo soggetto**: requisiti tarati su un ETS specifico (cd. "bando fotografia").

### Step 5 — Confronto con sent. Corte Cost. 131/2020

Verifica esplicitamente i principi cardine:
- L'avviso è impostato come *modulo collaborativo* o come *modulo competitivo di mercato*?
- È riconoscibile la *condivisione di obiettivi pubblici*?
- È presente la dimensione di *fiducia e leale collaborazione*?
- La selezione è funzionale alla *partecipazione*, non alla *competizione per il prezzo*?

### Step 6 — Output

Produci un rapporto strutturato secondo questo formato:

```markdown
# Analisi avviso — [titolo]

**Ente procedente:** ...
**Tipologia:** Coprogrammazione / Coprogettazione (art. 55 c. ...)
**Oggetto:** ...
**Durata:** ...
**Valore complessivo:** ...

## Sintesi del giudizio
[2-3 frasi: l'avviso è sostenibile / presenta criticità rilevanti / è da riscrivere]

## Punti di forza
- ...

## Criticità

| # | Criticità | Riferimento | Gravità | Raccomandazione |
|---|-----------|------------|---------|-----------------|
| 1 | ... | art. 55 c. 3 CTS | Alta/Media/Bassa | ... |

## Red flag rilevati
- ...

## Conformità a sent. Corte Cost. 131/2020
- ✓ / ✗ Modulo collaborativo
- ✓ / ✗ Condivisione obiettivi
- ✓ / ✗ Selezione non competitiva di mercato
- ✓ / ✗ Fiducia e leale collaborazione

## Checklist
[copia compilata dello step 3]

## Raccomandazioni operative
1. ...
2. ...
3. ...

## Note di rischio residuo
- ...
```

## Riferimenti

- `agents/ac-expert.md` — agente con conoscenza estesa
- `normativa/primarie/codice-terzo-settore/` — D.Lgs. 117/2017
- `normativa/secondarie/decreti-ministeriali/` — DM 72/2021
- `normativa/giurisprudenza/corte-costituzionale/` — sent. 131/2020
- `wiki/40-Procedure/` — procedure ragionate
- `templates/avviso-coprogettazione.md` — modello di riferimento
