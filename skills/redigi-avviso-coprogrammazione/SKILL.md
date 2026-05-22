---
name: redigi-avviso-coprogrammazione
description: |
  Usa questa skill quando l'utente chiede di REDIGERE, SCRIVERE, PREPARARE una bozza di AVVISO PUBBLICO DI COPROGRAMMAZIONE ex art. 55 c. 2 D.Lgs. 117/2017 — la fase di individuazione condivisa, con ETS, dei bisogni e degli interventi prima della coprogettazione. Trigger: "fammi un avviso di coprogrammazione", "redigi avviso ex art. 55 c. 2", "bozza per la programmazione partecipata", "manifestazione di interesse per coprogrammare". NON usare per la fase di realizzazione progetti (usa redigi-avviso-coprogettazione).
version: 1.0.0
---

# Skill — Redazione di un avviso di coprogrammazione

## Obiettivo

Produrre una bozza di avviso pubblico per l'individuazione, con uno o più ETS, dei bisogni da soddisfare, degli interventi necessari, delle modalità di realizzazione e delle risorse disponibili, ai sensi dell'**art. 55 c. 2 D.Lgs. 117/2017**.

## Distinzione fondamentale

**Coprogrammazione (c. 2)** — fase **ex ante**, di programmazione condivisa. Output: documento di programmazione partecipata che orienta successivi atti (eventuale coprogettazione, convenzioni, programmazioni di bilancio).

**Coprogettazione (c. 3)** — fase **operativa**, di co-design di interventi. Output: progetti specifici realizzati in partenariato.

L'avviso di coprogrammazione NON serve a selezionare un partner per realizzare un servizio. Serve a **ascoltare e programmare** insieme.

## Input necessari

Prima di scrivere, raccogli (e se mancano, **chiedi**):

1. **Ente procedente**: denominazione, sede, ufficio responsabile.
2. **Ambito tematico**: es. "politiche per l'inclusione sociale", "politiche giovanili", "contrasto povertà".
3. **Area territoriale** di riferimento.
4. **Orizzonte temporale** della programmazione (es. triennio 2026-2028).
5. **Esistenza di atti di indirizzo politico** già adottati (es. linee programmatiche, piani di zona, deliberazioni).
6. **Risorse indicative** disponibili o programmabili (anche non quantificate puntualmente, ma con range).
7. **Modalità di partecipazione previste**: solo tavoli? Anche questionari? Eventi pubblici?
8. **Durata del processo** di coprogrammazione (es. 60-90 giorni).
9. **Termine** per presentare istanza di partecipazione.

## Workflow

### Step 1 — Verifica preliminare di coerenza
- L'ente ha **atto di indirizzo politico** che prevede l'amministrazione condivisa per questo ambito? Se no, suggerisci di acquisirlo prima dell'avviso.
- L'attività rientra nelle aree di interesse generale ex art. 5 CTS?
- C'è coerenza con strumenti programmatori sovraordinati (piani di zona, regionali)?

### Step 2 — Carica template
Apri `templates/avviso-coprogrammazione.md`. Usalo come base.

### Step 3 — Adatta sezione per sezione

Struttura tipica:

1. **Premesse e riferimenti normativi**
   - Art. 118 c. 4 Cost.
   - Art. 55 c. 1-2 D.Lgs. 117/2017
   - Art. 5 CTS (attività di interesse generale)
   - DM 72/2021 Linee Guida
   - Sent. Corte Cost. 131/2020
   - Atti di indirizzo dell'ente
   - Altri riferimenti pertinenti

2. **Definizioni**
   - ETS, OdV, APS, RUNTS
   - Coprogrammazione vs coprogettazione

3. **Oggetto dell'avviso**
   - Ambito tematico
   - Finalità: individuazione bisogni, interventi, modalità, risorse
   - Cosa NON è oggetto: selezione di partner per servizi specifici

4. **Soggetti ammessi**
   - ETS iscritti al RUNTS (o iscrizione in corso ex art. 101 CTS)
   - Eventuali raggruppamenti, reti, coalizioni
   - Anche soggetti non ETS interessati possono partecipare (es. cittadini, associazioni informali)? L'ente decide.

5. **Modalità di partecipazione**
   - Iscrizione (PEC, portale)
   - Documenti richiesti (manifestazione di interesse, proposta tematica, esperienze in materia)
   - Termine di presentazione
   - Modalità dei tavoli di lavoro (cadenza, sede, verbali)

6. **Procedimento di coprogrammazione**
   - Fasi: avvio → istruttoria → tavoli → documento di programmazione condivisa → approvazione
   - Durata complessiva indicativa
   - Responsabile del procedimento
   - Soggetti istituzionali coinvolti (assessorati, uffici)

7. **Esiti**
   - Documento di programmazione partecipata
   - Possibili sviluppi: avviso di coprogettazione, convenzioni, programmazione di bilancio
   - Trasparenza degli esiti: pubblicazione

8. **Trasparenza e pubblicità**
   - Albo pretorio
   - Sezione amministrazione trasparente
   - Eventuale sito dedicato

9. **Trattamento dati personali**
   - Riferimento GDPR, informativa allegata o linkata

10. **Disposizioni finali e foro**
    - Responsabile del procedimento (RUP)
    - Contatti
    - Allegati (modulo di manifestazione di interesse, informativa privacy)

### Step 4 — Linguaggio e tono

- **Italiano amministrativo chiaro**, evita ridondanze.
- **No riferimenti al codice contratti** D.Lgs. 36/2023.
- **No linguaggio competitivo** (no "graduatoria", "aggiudicazione", "punteggi" qui — la coprogrammazione non graduatorizza).
- Tono **invitante e collaborativo**: l'avviso comunica apertura, non selezione.

### Step 5 — Note tecniche inline

Ogni clausola critica include un commento `<!-- nota: rif. ... -->` che cita la fonte normativa, per facilitare la review interna dell'ente.

### Step 6 — Output finale

Produci il documento + una sezione finale **non parte dell'atto** con:

- **Checklist di verifica**: cosa l'ufficio deve completare prima di pubblicare.
- **Lista allegati da preparare**: modulo, informativa privacy, eventuali atti richiamati.
- **Disclaimer**: "Bozza generata con l'assistenza dell'agente ac-expert. La responsabilità del procedimento resta in capo al RUP. Si raccomanda revisione da parte dell'Avvocatura/Segreteria dell'Ente."

## Riferimenti

- `templates/avviso-coprogrammazione.md`
- `normativa/primarie/codice-terzo-settore/` — art. 55 c. 2
- `normativa/secondarie/decreti-ministeriali/` — DM 72/2021
- `normativa/modelli-pa/avvisi/` — benchmark
- `wiki/10-Concetti/Coprogrammazione.md`
- `wiki/20-Articoli/art-55-CTS.md`
