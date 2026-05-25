# =============================================================================
# uninstall-user-level.ps1
#
# Disinstalla il plugin Amministrazione Condivisa dal livello USER-level di
# Claude Code. Rimuove agente, skill e commands con prefisso "ac-".
#
# USO:
#   PowerShell -ExecutionPolicy Bypass -File scripts\uninstall-user-level.ps1
# =============================================================================

$u = "$env:USERPROFILE\.claude"

Write-Host ""
Write-Host "=== Disinstallazione user-level del plugin Amministrazione Condivisa ===" -ForegroundColor Cyan
Write-Host ""

# Skill (tutte le ac-* nella cartella skills)
$skillsRemoved = 0
Get-ChildItem (Join-Path $u "skills") -Directory -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -match "^ac-(analizza|redigi|relazione|monitor)" } |
    ForEach-Object {
        Remove-Item $_.FullName -Recurse -Force
        Write-Host ("  - rimossa skill: " + $_.Name) -ForegroundColor Yellow
        $skillsRemoved++
    }

# Agenti (tutti gli ac-*.md)
Get-ChildItem (Join-Path $u "agents\ac-*.md") -ErrorAction SilentlyContinue | ForEach-Object {
    Remove-Item $_.FullName -Force
    Write-Host ("  - rimosso agente: " + $_.Name) -ForegroundColor Yellow
}

# Commands
$cmdsRemoved = 0
Get-ChildItem (Join-Path $u "commands\ac-*.md") -ErrorAction SilentlyContinue |
    ForEach-Object {
        Remove-Item $_.FullName -Force
        Write-Host ("  - rimosso command: " + $_.Name) -ForegroundColor Yellow
        $cmdsRemoved++
    }

Write-Host ""
Write-Host "=== Disinstallazione completata ===" -ForegroundColor Green
Write-Host ""
Write-Host "Riavvia Claude Code per applicare le modifiche." -ForegroundColor Yellow
Write-Host ""
