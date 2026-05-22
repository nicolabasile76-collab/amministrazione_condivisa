---
description: Relazione tecnica di sostenibilità e analisi rischi
argument-hint: "<progetto-o-atto> [brief.md]"
---

# /ac-relazione

Produce una relazione tecnica strutturata che motiva una scelta procedurale o progettuale, ne analizza la sostenibilità (economica, organizzativa, sociale, ambientale) e mappa i rischi con misure di mitigazione.

## Argomenti

- **$1** — oggetto della relazione (titolo breve del progetto/atto). Obbligatorio.
- **$2** — percorso a un file di brief con dati del caso. Opzionale; se assente, l'agente conduce un'intervista.

## Comportamento

1. Attiva la skill `relazione-tecnica`.
2. Se `$2` è specificato: leggi il brief.
3. Se assente o incompleto: intervista mirata su oggetto, contesto, modulo scelto/da motivare, risorse, stakeholder, orizzonte temporale.
4. Carica il template `templates/relazione-tecnica.md`.
5. Costruisci la relazione completa:
   - sintesi esecutiva
   - inquadramento normativo
   - contesto e bisogni
   - obiettivi e risultati attesi
   - alternative considerate
   - sostenibilità (4 assi)
   - matrice dei rischi
   - misure di mitigazione
   - cronoprogramma
   - conclusioni
6. Salva in `./output/relazioni/` con nome `YYYYMMDD-relazione-<slug>.md`.
7. Restituisci: percorso del file + sintesi esecutiva + matrice rischi riassuntiva.

## Esempi d'uso

```
/ac-relazione "Coprogettazione servizio centro anziani"
/ac-relazione "Avviso politiche giovanili 2026" ./brief.md
```

## Note

- La relazione è documento istruttorio di accompagnamento di delibere/determine.
- La matrice dei rischi può essere esportata anche come tabella separata per gestione dinamica.
- Disclaimer di responsabilità incluso in calce.
