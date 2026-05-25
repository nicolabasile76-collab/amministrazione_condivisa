---
name: relazione-tecnica
description: |
  Usa questa skill quando l'utente chiede di redigere una RELAZIONE TECNICA su un progetto, un avviso, una convenzione, o una scelta procedurale nell'ambito dell'amministrazione condivisa — con focus su SOSTENIBILITÀ delle scelte (economica, organizzativa, sociale, ambientale) e ANALISI DEI RISCHI. Trigger: "relazione tecnica", "relazione di sostenibilità", "analisi dei rischi", "valutazione di impatto", "relazione istruttoria", "motivazione tecnica della scelta". È documento di accompagnamento di delibere, determine, avvisi.
version: 1.0.0
---

# Skill — Relazione tecnica di sostenibilità e analisi dei rischi

## Obiettivo

Produrre una relazione tecnica strutturata che **motiva** una scelta procedurale o progettuale, ne analizza la **sostenibilità** sotto più profili, e mappa i **rischi** con misure di mitigazione. Documento di accompagnamento di delibere/determine, utile a:

- motivare la scelta del modulo collaborativo vs competitivo
- dimostrare sostenibilità economico-organizzativa
- presidiare i rischi (anche giuridici, di riqualificazione, di contenzioso)
- supportare la trasparenza e l'accountability

## Quando attivarsi

- "Relazione tecnica sul progetto X"
- "Motivazione tecnica della scelta di coprogettazione"
- "Analisi rischi della convenzione"
- "Relazione istruttoria"
- "Valutazione di sostenibilità"

## Input necessari

1. **Oggetto** della relazione (progetto, avviso, convenzione, scelta procedurale).
2. **Ente** procedente e ufficio.
3. **Contesto** di policy e atti presupposti.
4. **Modulo scelto** (coprogrammazione / coprogettazione / convenzione 56 / appalto / ...) — o, se da motivare, **alternative considerate**.
5. **Risorse** previste.
6. **Stakeholder** coinvolti.
7. **Orizzonte temporale**.
8. **Dati di contesto** (popolazione target, bisogni rilevati, esperienze pregresse).

## Workflow

### Step 1 — Inquadramento

Identifica chiaramente l'oggetto e lo scopo della relazione:
- Relazione **ex ante** (motiva la scelta prima dell'atto)?
- Relazione **in itinere** (monitoraggio)?
- Relazione **ex post** (valutazione finale)?

### Step 2 — Carica template
Apri `templates/relazione-tecnica.md`.

### Step 3 — Struttura

1. **Sintesi esecutiva** (mezza pagina): cosa si propone, perché, con quali risorse, quali rischi principali, conclusione.

2. **Inquadramento normativo**
   - Quadro costituzionale (art. 118 c. 4)
   - CTS art. 4, 5, 55, 56 secondo il caso
   - DM 72/2021
   - Sent. Corte Cost. 131/2020
   - Eventuali norme settoriali (servizi sociali, sanità, cultura, ecc.)
   - Atti dell'ente (delibere, indirizzi)

3. **Contesto e bisogni**
   - Quadro territoriale
   - Bisogni rilevati (dati, esiti coprogrammazione se presenti, audit)
   - Stakeholder e mappa dei portatori di interesse
   - Esperienze pregresse e lezioni apprese

4. **Obiettivi e risultati attesi**
   - Obiettivo generale
   - Obiettivi specifici (SMART)
   - Indicatori di output e di outcome
   - Beneficiari diretti e indiretti

5. **Alternative considerate e scelta del modulo**
   - Tabella comparativa tra alternative (es. appalto vs coprogettazione vs convenzione)
   - Per ciascuna: pro, contro, presupposti, applicabilità al caso
   - **Motivazione della scelta**: perché il modulo proposto è preferibile, fondato su quali norme, principi (sussidiarietà orizzontale), evidenze

6. **Sostenibilità economica**
   - Costi previsti (analitici, per voce)
   - Fonti di finanziamento
   - Eventuali cofinanziamenti / risorse mobilitate dagli ETS
   - Modalità di erogazione (acconti, rendiconto)
   - Rapporto costi/risultati attesi
   - Eventuali confronti con costi di mercato (per art. 56: dimostrare condizioni più favorevoli)

7. **Sostenibilità organizzativa**
   - Personale PA coinvolto (FTE)
   - Personale e volontari ETS attesi
   - Strumentazione e beni
   - Tempi di implementazione
   - Capacità organizzativa del partner ETS (esperienze, struttura)
   - Sostenibilità nel tempo (cosa succede oltre la durata?)

8. **Sostenibilità sociale e di impatto**
   - Effetti attesi sulla popolazione target
   - Coesione sociale, partecipazione, capacitazione
   - Rischi di disuguaglianza / esclusione e contromisure
   - Coinvolgimento di volontari e cittadinanza attiva

9. **Sostenibilità ambientale** (se rilevante)
   - Eventuali impatti ambientali del servizio/intervento
   - Coerenza con criteri ambientali minimi se applicabili

10. **Analisi dei rischi** (sezione critica)

    Costruisci una **matrice di rischio** + **visualizzazione spaziale (P × I)**.

    ### A — Matrice tabellare:

    | # | Rischio | Categoria | Probabilità (1-5) | Impatto (1-5) | Punteggio | Mitigazione | Responsabile |
    |---|--------|-----------|------------------|---------------|-----------|-------------|--------------|
    | 1 | ... | Giuridico/Finanziario/Operativo/Reputazionale | ... | ... | PxI | ... | ... |

    Categorie tipiche da considerare:

    **Giuridici**
    - Riqualificazione in appalto e impugnazione (es. ricorsi di operatori economici esclusi)
    - Vizi procedurali (pubblicità, termini, criteri)
    - Conflitti di interesse
    - Trattamento dati personali

    **Finanziari**
    - Sovrastima dei costi rimborsabili
    - Sottocopertura del fabbisogno
    - Ritardi nei pagamenti
    - Disallineamento tra rendicontazione attesa e capacità ETS

    **Operativi**
    - Inadeguatezza partner ETS (capacità organizzativa)
    - Turnover personale / volontari
    - Eventi imprevisti che bloccano il servizio
    - Coordinamento PA-ETS inefficace

    **Reputazionali**
    - Percezione di favoritismo
    - Conflitti con operatori esclusi
    - Mancato raggiungimento risultati visibili

    **Di sostenibilità di lungo periodo**
    - Dipendenza del servizio dal singolo ETS
    - Mancanza di exit strategy

    ### B — Visualizzazione spaziale (grafico P × I):

    Al termine della costruzione della matrice tabellare, **genera SEMPRE** il grafico scatter probabilità × impatto eseguendo:

    1. Estrai i dati della matrice in un file JSON `output/relazioni/_risk_<slug>.json`:
       ```json
       {
         "title": "Matrice rischi — <progetto>",
         "subtitle": "Probabilità × Impatto (scala 1-5) — <breve descrizione>",
         "risks": [
           {"id": "R1", "name": "<nome breve max 50 caratteri>", "p": <1-5>, "i": <1-5>},
           ...
         ]
       }
       ```
    2. Esegui lo script PowerShell:
       ```powershell
       python scripts/generate-risk-matrix.py output/relazioni/_risk_<slug>.json output/relazioni/risk-matrix-<slug>.png
       ```
    3. **Embedda l'immagine** nel markdown della relazione subito dopo la matrice tabellare:
       ```markdown
       ![Matrice rischi — Probabilità × Impatto](risk-matrix-<slug>.png)
       ```
    4. Quando converti il markdown in Word con pandoc, **usa `--resource-path=`** sulla cartella `output/relazioni/` per includere automaticamente l'immagine nel `.docx`.

    Il grafico mostra:
    - assi P (probabilità 1-5) × I (impatto 1-5)
    - sfondo a 3 colori (verde basso 1-5, giallo medio 6-12, rosso alto 13-25)
    - punti scatter dimensionati per P×I, etichettati con ID rischio
    - legenda zone + tabella laterale rischi ordinati per punteggio

11. **Misure di mitigazione e governance**
    - Misure procedurali (es. pubblicità qualificata, commissione indipendente)
    - Clausole contrattuali (penali ragionevoli, recesso, risoluzione)
    - Strumenti di monitoraggio
    - Tavoli di verifica
    - Riserva di rivedere il modulo in caso di mutamento di contesto

12. **Cronoprogramma**
    Tabella: fase → tempi → output → responsabile.

13. **Conclusioni**
    - Sintesi della motivazione
    - Conferma di sostenibilità complessiva
    - Eventuali condizioni residue

14. **Allegati**
    - Atti richiamati
    - Documentazione di supporto
    - Eventuale matrice di rischio in foglio Excel separato

### Step 4 — Stile

- Linguaggio tecnico-amministrativo.
- Affermazioni motivate, mai gratuite.
- Numeri dove possibile.
- Tabelle per confronti e matrici.
- Riferimenti normativi puntuali.

### Step 5 — Verifica conclusiva

- [ ] Sintesi esecutiva sotto 1 pagina
- [ ] Alternative confrontate in tabella
- [ ] Sostenibilità coperta sui 4 assi (economico, organizzativo, sociale, ambientale ove rilevante)
- [ ] Matrice rischi con almeno una voce per ciascuna categoria
- [ ] Mitigazioni associate a ogni rischio significativo
- [ ] Conclusione motivata

## Riferimenti

- `templates/relazione-tecnica.md`
- `agents/ac-expert.md`
- `wiki/40-Procedure/` — eventuale nota su metodologia di risk assessment
- `normativa/secondarie/decreti-ministeriali/` — DM 72/2021 per riferimenti procedurali
