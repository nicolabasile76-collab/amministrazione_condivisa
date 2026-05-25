---
description: Monitoring periodico novità giurisprudenza/prassi/normativa/dottrina CTS
argument-hint: "[periodo: 7d|14d|30d|90d, default 30d] [focus: giurisprudenza|prassi|normativa|dottrina|tutti]"
---

# /ac-monitor

Lancia il monitoraggio periodico delle novità in materia di **Amministrazione Condivisa** (artt. 55-57 D.Lgs. 117/2017). Scandaglia fonti istituzionali e accademiche italiane, applica triage di rilevanza, produce report con candidate da valutare per ingestione nel corpus.

## Argomenti

- **$1** — periodo di scansione: `7d`, `14d`, **`30d` (default)**, `90d`. Determina la finestra temporale a ritroso da oggi.
- **$2** — focus (opzionale): `giurisprudenza`, `prassi`, `normativa`, `dottrina`, `tutti` (default). Limita le skill attivate.

> 💡 **Perché 30 giorni come default?** Il primo test del 25/05/2026 ha mostrato che le fonti italiane (giustizia-amministrativa, ANAC, MLPS, Normattiva) hanno indicizzazione lenta e filtraggio per data poco affidabile: finestra a 7 giorni produceva risultati di fatto su 30-35 giorni. Default `30d` allinea aspettative a comportamento reale.

## Comportamento

1. Attiva l'agente `ac-monitor`
2. L'agente orchestra in parallelo le skill specializzate (in base al focus):
   - `ac-monitor-giurisprudenza` → TAR/CDS/Corte Cost./Cassazione
   - `ac-monitor-prassi` → ANAC/MLPS/Conferenza Unificata/AdE
   - `ac-monitor-normativa` → Normattiva/Gazzetta Ufficiale
   - `ac-monitor-dottrina` → Terzjus/Cantiere TS/Welforum/Labsus/Forum TS
3. Triage di rilevanza con scoring 0-100 (soglia inclusione ≥40)
4. Duplicate check vs corpus esistente (`normativa/INDEX.md`)
5. **Report markdown** salvato in `output/monitoring/YYYY-MM-DD-monitor.md`
6. Sintesi esecutiva mostrata in chat
7. Attesa decisioni utente per ingestion dei candidate selezionati

## Esempi d'uso

```
/ac-monitor
```
→ Scansione completa degli ultimi **30 giorni** (default) su tutte le 4 categorie.

```
/ac-monitor 7d giurisprudenza
```
→ Solo nuove sentenze degli ultimi 7 giorni (focus stretto).

```
/ac-monitor 30d prassi
```
→ Solo nuovi atti ANAC/MLPS/Stato-Regioni degli ultimi 30 giorni.

```
/ac-monitor 90d dottrina
```
→ Solo contributi dottrinali degli ultimi 3 mesi (su Terzjus, Cantiere TS, Welforum, Labsus).

## Output

Il report contiene:
- Numero totale candidate per categoria
- Top 15 candidate per categoria (sopra soglia, ordinate per score)
- Per ogni candidate: organo/ente, riferimenti, oggetto, URL, score, leading-case flag, eventuali note critiche
- Lista esclusi (sotto soglia o duplicati)
- Statistiche di esecuzione (tempo, fonti consultate, errori)

## Workflow ingestion successivo

Dopo aver visto il report, indichi quali candidate ingerire:

```
Ingerisci G1 e G3.
Solo INDEX per P2.
Ignora il resto.
```

L'agente esegue automaticamente per gli item selezionati:
- Download del PDF originale
- Estrazione testo con pdftotext
- Smistamento nella sottocartella corretta di `normativa/`
- Creazione nota wiki dal template appropriato
- Aggiornamento `normativa/INDEX.md`
- (Opzionale) commit git

## Note operative

- **Costo**: ogni esecuzione fa 3-12 WebSearch + 5-20 WebFetch. Tempo medio: 30-90 secondi.
- **Frequenza consigliata**: **mensile** (default `30d`) per tutte le categorie. La granularità settimanale (7d) è poco utile per le fonti italiane (vedi nota sopra).
- **Limiti**: l'agente NON ingerisce automaticamente senza tua approvazione. Il triage è strumento di supporto, non sostituto della valutazione professionale.
- **Affidabilità**: alcune fonti italiane (Normattiva, Giustizia Amministrativa) hanno restrizioni anti-scraping. In caso di mancato accesso, l'agente lo segnala esplicitamente.

## Schedulazione (futura, fuori MVP)

In futuro si potrà schedulare l'esecuzione con un PowerShell scheduled task:
```powershell
schtasks /create /tn "AC-Monitor settimanale" /tr "powershell -File scripts/run-monitor.ps1" /sc weekly /d MON /st 09:00
```

E inviare notifiche via webhook Discord/email POST quando ci sono leading case candidati.
