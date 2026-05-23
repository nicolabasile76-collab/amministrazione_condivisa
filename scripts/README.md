# Scripts utility

Cartella con script di utility per il plugin Amministrazione Condivisa.

---

## `install-user-level.ps1`

**Cosa fa**: installa il plugin a **livello user-level** di Claude Code (`~/.claude/agents/`, `~/.claude/skills/`, `~/.claude/commands/`) usando il prefisso `ac-` per evitare collisioni con altre skill.

**Quando usarlo**:
- Quando il comando `/plugin marketplace add` di Claude Code **non è disponibile** nel tuo ambiente (es. FleetView, PAI custom, integrazioni specifiche)
- Quando vuoi avere agente/skill/commands disponibili in **OGNI sessione** Claude Code, non solo aprendo questa cartella

**Cosa installa**:

| Categoria | Nomi installati |
|-----------|-----------------|
| Agenti | `ac-expert` |
| Skill | `ac-analizza-avviso`, `ac-analizza-convenzione`, `ac-redigi-avviso-coprogrammazione`, `ac-redigi-avviso-coprogettazione`, `ac-redigi-convenzione`, `ac-relazione-tecnica` |
| Commands | `ac-analizza`, `ac-redigi`, `ac-relazione` |

**Uso**:

```powershell
cd "C:\percorso\al\plugin\Amministrazione Condivisa"
PowerShell -ExecutionPolicy Bypass -File scripts\install-user-level.ps1
```

Da rilanciare **dopo ogni `git pull`** per aggiornare le versioni user-level alle ultime modifiche del repo.

**Cosa fa internamente**:
- Copia i file in `~/.claude/{agents,skills,commands}/`
- Rinomina le 6 skill con prefisso `ac-` (per evitare collisioni con altre skill PAI/community)
- Aggiorna il campo `name:` nel frontmatter YAML di ciascuna skill al nuovo nome
- Sostituisce i **path relativi** (es. `normativa/...`, `wiki/...`, `templates/...`) con **path assoluti** della tua cartella di progetto, così le skill funzionano anche quando le invochi da una sessione Claude Code aperta in qualsiasi altra cartella

---

## `uninstall-user-level.ps1`

**Cosa fa**: rimuove dal livello user-level di Claude Code agente, skill e commands installati con `install-user-level.ps1`.

**Uso**:

```powershell
PowerShell -ExecutionPolicy Bypass -File scripts\uninstall-user-level.ps1
```

Rimuove solo i componenti con prefisso `ac-` — non tocca altri file in `~/.claude/`.

---

## Note

- **Riavvio Claude Code** richiesto dopo install/uninstall per applicare le modifiche.
- **Path assoluti**: se sposti la cartella del plugin, devi rilanciare `install-user-level.ps1` per aggiornare i path nelle skill.
- **Modalità alternative**: per chi può usare `/plugin marketplace add` standard di Claude Code, basta `gh auth login` + i due comandi `/plugin marketplace add ...` e `/plugin install ...` come da [README principale](../README.md).
