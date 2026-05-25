# =============================================================================
# install-user-level.ps1
#
# Installa il plugin Amministrazione Condivisa a livello USER-level di Claude Code
# (~/.claude/agents/, ~/.claude/skills/, ~/.claude/commands/) con prefisso "ac-"
# per evitare collisioni con altre skill.
#
# Utile in ambienti dove `/plugin marketplace add` non è disponibile (es. PAI,
# FleetView, alcune integrazioni custom) e si vuole avere il plugin attivo in
# OGNI sessione Claude Code, non solo aprendo questa cartella.
#
# USO:
#   PowerShell -ExecutionPolicy Bypass -File scripts\install-user-level.ps1
#
# Da rilanciare dopo ogni `git pull` per aggiornare le versioni user-level.
#
# Per disinstallare: scripts\uninstall-user-level.ps1
# =============================================================================

param(
    [string]$PluginRoot = $PSScriptRoot + "\.."
)

$ErrorActionPreference = "Stop"
$base = (Resolve-Path $PluginRoot).Path
$u = "$env:USERPROFILE\.claude"
$baseFwd = $base -replace "\\","/"

Write-Host ""
Write-Host "=== Installazione user-level del plugin Amministrazione Condivisa ===" -ForegroundColor Cyan
Write-Host "Source : $base"
Write-Host "Target : $u"
Write-Host ""

# Verifica cartelle target
foreach ($d in @("agents", "skills", "commands")) {
    $p = Join-Path $u $d
    if (-not (Test-Path $p)) {
        New-Item -ItemType Directory -Force -Path $p | Out-Null
        Write-Host "  + creata ~/.claude/$d/"
    }
}

# Mappa skill (dir progetto -> dir user-level con prefisso ac-)
$skillMap = @{
    "analizza-avviso"                  = "ac-analizza-avviso"
    "analizza-convenzione"             = "ac-analizza-convenzione"
    "redigi-avviso-coprogrammazione"   = "ac-redigi-avviso-coprogrammazione"
    "redigi-avviso-coprogettazione"    = "ac-redigi-avviso-coprogettazione"
    "redigi-convenzione"               = "ac-redigi-convenzione"
    "relazione-tecnica"                = "ac-relazione-tecnica"
    # Skill ac-monitor-* (gia' con prefisso ac-, nome immutato)
    "ac-monitor-giurisprudenza"        = "ac-monitor-giurisprudenza"
    "ac-monitor-prassi"                = "ac-monitor-prassi"
    "ac-monitor-normativa"             = "ac-monitor-normativa"
    "ac-monitor-dottrina"              = "ac-monitor-dottrina"
}

# Rimuovi vecchie versioni (senza prefisso) se esistono
Write-Host ""
Write-Host "1) Rimuovo eventuali vecchie installazioni senza prefisso..." -ForegroundColor Yellow
foreach ($old in $skillMap.Keys) {
    $p = Join-Path $u "skills\$old"
    if (Test-Path $p) {
        Remove-Item $p -Recurse -Force
        Write-Host "   - rimossa: ~/.claude/skills/$old"
    }
}

# Installa skill con prefisso + sostituisce path relativi con assoluti
Write-Host ""
Write-Host "2) Installo skill con prefisso ac- e path assoluti..." -ForegroundColor Yellow
foreach ($old in $skillMap.Keys) {
    $new = $skillMap[$old]
    $src = Join-Path $base "skills\$old"
    $dst = Join-Path $u "skills\$new"

    if (Test-Path $dst) { Remove-Item $dst -Recurse -Force }
    Copy-Item -Path $src -Destination $dst -Recurse -Force

    $skillFile = Join-Path $dst "SKILL.md"
    $c = Get-Content $skillFile -Raw -Encoding utf8

    # Aggiorna name: nel frontmatter al nuovo nome con prefisso
    $c = $c -replace "(?m)^name:\s+$old\s*$", "name: $new"

    # Path relativi -> path assoluti del progetto
    $c = $c -replace "agents/ac-expert\.md", "$baseFwd/agents/ac-expert.md"
    $c = $c -replace "templates/avviso-coprogettazione\.md",   "$baseFwd/templates/avviso-coprogettazione.md"
    $c = $c -replace "templates/avviso-coprogrammazione\.md",  "$baseFwd/templates/avviso-coprogrammazione.md"
    $c = $c -replace "templates/convenzione\.md",              "$baseFwd/templates/convenzione.md"
    $c = $c -replace "templates/relazione-tecnica\.md",        "$baseFwd/templates/relazione-tecnica.md"
    $c = $c -replace "normativa/(?=[a-z])", "$baseFwd/normativa/"
    $c = $c -replace "wiki/(?=[0-9_a-zA-Z])", "$baseFwd/wiki/"

    Set-Content -Path $skillFile -Value $c -Encoding utf8 -NoNewline
    Write-Host "   + installata: ~/.claude/skills/$new"
}

# Installa agenti (tutti i file ac-*.md in agents/)
Write-Host ""
Write-Host "3) Installo agenti ac-* ..." -ForegroundColor Yellow
Get-ChildItem (Join-Path $base "agents") -Filter "ac-*.md" -File | ForEach-Object {
    $agentDst = Join-Path $u "agents\$($_.Name)"
    $c = Get-Content $_.FullName -Raw -Encoding utf8
    $c = $c -replace "(?<![A-Za-z/])normativa/", "$baseFwd/normativa/"
    $c = $c -replace "(?<![A-Za-z/])wiki/", "$baseFwd/wiki/"
    $c = $c -replace "(?<![A-Za-z/])templates/", "$baseFwd/templates/"
    Set-Content -Path $agentDst -Value $c -Encoding utf8 -NoNewline
    Write-Host ("   + installato: ~/.claude/agents/" + $_.Name)
}

# Installa commands (mantieni nomi con prefisso ac-)
Write-Host ""
Write-Host "4) Installo commands..." -ForegroundColor Yellow
Get-ChildItem (Join-Path $base "commands\*.md") | ForEach-Object {
    Copy-Item $_.FullName (Join-Path $u "commands\") -Force
    Write-Host ("   + installato: ~/.claude/commands/" + $_.Name)
}

# Riepilogo
Write-Host ""
Write-Host "=== Installazione completata ===" -ForegroundColor Green
Write-Host ""
Write-Host "Componenti installati a livello user-level:"
Write-Host ""
Write-Host "Agenti:" -ForegroundColor Cyan
Get-ChildItem (Join-Path $u "agents") | Where-Object { $_.Name -match "^ac-" } | ForEach-Object { Write-Host ("  - " + $_.Name) }
Write-Host ""
Write-Host "Skill:" -ForegroundColor Cyan
Get-ChildItem (Join-Path $u "skills") -Directory | Where-Object { $_.Name -match "^ac-" } | ForEach-Object { Write-Host ("  - " + $_.Name) }
Write-Host ""
Write-Host "Commands:" -ForegroundColor Cyan
Get-ChildItem (Join-Path $u "commands") | Where-Object { $_.Name -match "^ac-" } | ForEach-Object { Write-Host ("  - " + $_.Name) }
Write-Host ""
Write-Host "⚠️  Riavvia Claude Code per caricare i nuovi componenti." -ForegroundColor Yellow
Write-Host ""
Write-Host "Per disinstallare: scripts\uninstall-user-level.ps1" -ForegroundColor DarkGray
Write-Host ""
