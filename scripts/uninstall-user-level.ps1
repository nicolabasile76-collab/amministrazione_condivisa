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

# Skill
$skillsRemoved = 0
Get-ChildItem (Join-Path $u "skills") -Directory -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -match "^ac-(analizza|redigi|relazione)" } |
    ForEach-Object {
        Remove-Item $_.FullName -Recurse -Force
        Write-Host ("  - rimossa skill: " + $_.Name) -ForegroundColor Yellow
        $skillsRemoved++
    }

# Agente
$agentPath = Join-Path $u "agents\ac-expert.md"
if (Test-Path $agentPath) {
    Remove-Item $agentPath -Force
    Write-Host "  - rimosso agente: ac-expert.md" -ForegroundColor Yellow
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
