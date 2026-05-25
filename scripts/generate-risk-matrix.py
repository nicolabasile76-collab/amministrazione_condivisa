# =============================================================================
# generate-risk-matrix.py
#
# Genera un grafico "matrice di rischio" (P × I) a partire da un JSON di rischi
# con colori coerenti con brand POST (teal + accent gialli/rossi).
#
# USO:
#   python scripts/generate-risk-matrix.py <input.json> <output.png>
#
# FORMATO INPUT JSON:
#   {
#     "title": "Matrice rischi — <progetto>",
#     "subtitle": "Probabilità × Impatto (scala 1-5)",
#     "risks": [
#       {"id": "R1", "name": "Nome breve", "p": 5, "i": 2, "cat": "Giuridico"},
#       ...
#     ]
#   }
#
# Output: PNG ~1600x1200 px, ready per embedding in Markdown/Word.
# =============================================================================

import sys
import json
import os
import matplotlib
matplotlib.use('Agg')  # backend non interattivo
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.patches import Rectangle
import numpy as np
from collections import defaultdict

# === Brand POST ===
TEAL_PRIMARIO = "#2B7A8C"
TEAL_CHIARO   = "#5BA3B4"
TEAL_SCURO    = "#1A4E5C"
GRIGIO_SCURO  = "#2D3748"

# Colori zone rischio (heat)
COLOR_LOW    = "#D4EDDA"   # verde chiaro
COLOR_MED    = "#FFF3CD"   # giallo chiaro
COLOR_HIGH   = "#F8D7DA"   # rosso chiaro

# Colori punti per zona
DOT_LOW      = "#28A745"   # verde
DOT_MED      = "#FFC107"   # giallo/oro
DOT_HIGH     = "#DC3545"   # rosso


def risk_color(p, i):
    score = p * i
    if score <= 5:
        return DOT_LOW
    elif score <= 12:
        return DOT_MED
    else:
        return DOT_HIGH


def background_color(p, i):
    score = p * i
    if score <= 5:
        return COLOR_LOW
    elif score <= 12:
        return COLOR_MED
    else:
        return COLOR_HIGH


def generate(input_json, output_png):
    with open(input_json, 'r', encoding='utf-8') as f:
        data = json.load(f)

    title = data.get('title', 'Matrice dei rischi')
    subtitle = data.get('subtitle', 'Probabilità × Impatto (scala 1-5)')
    risks = data['risks']

    fig, ax = plt.subplots(figsize=(14, 10), dpi=120)

    # === Sfondo heat map ===
    for p in range(1, 6):
        for i in range(1, 6):
            color = background_color(p, i)
            rect = Rectangle((p - 0.5, i - 0.5), 1, 1,
                             facecolor=color, edgecolor='white',
                             linewidth=1.5, zorder=1)
            ax.add_patch(rect)
            # Etichetta punteggio nel centro della cella
            ax.text(p, i - 0.42, f'{p*i}',
                    ha='center', va='bottom',
                    fontsize=8, color='#999',
                    zorder=2, alpha=0.6)

    # === Raggruppa rischi che cadono nella stessa cella per offset ===
    cell_risks = defaultdict(list)
    for r in risks:
        cell_risks[(r['p'], r['i'])].append(r)

    # === Disegna i punti rischio ===
    for (p, i), rs in cell_risks.items():
        n = len(rs)
        if n == 1:
            offsets = [(0, 0)]
        elif n == 2:
            offsets = [(-0.15, 0), (0.15, 0)]
        elif n == 3:
            offsets = [(-0.2, 0.15), (0.2, 0.15), (0, -0.18)]
        elif n == 4:
            offsets = [(-0.2, 0.15), (0.2, 0.15), (-0.2, -0.15), (0.2, -0.15)]
        else:
            # > 4: posiziona in cerchio
            import math
            offsets = [(0.22 * math.cos(2 * math.pi * k / n),
                        0.22 * math.sin(2 * math.pi * k / n)) for k in range(n)]

        for idx, r in enumerate(rs):
            dx, dy = offsets[idx]
            xpt = p + dx
            ypt = i + dy
            color = risk_color(r['p'], r['i'])
            score = r['p'] * r['i']
            # marker size proporzionale al punteggio
            size = 250 + score * 18

            ax.scatter(xpt, ypt, s=size,
                       facecolor=color, edgecolor='white',
                       linewidth=2.5, zorder=5, alpha=0.92)
            # label ID rischio sopra il punto
            ax.annotate(r['id'],
                        xy=(xpt, ypt),
                        ha='center', va='center',
                        fontsize=9, color='white', weight='bold',
                        zorder=6)

    # === Assi ===
    ax.set_xlim(0.4, 5.6)
    ax.set_ylim(0.4, 5.6)
    ax.set_xticks(range(1, 6))
    ax.set_yticks(range(1, 6))
    ax.set_xticklabels(['1\nRara', '2\nImprobabile', '3\nPossibile', '4\nProbabile', '5\nQuasi certa'],
                       fontsize=10)
    ax.set_yticklabels(['1\nTrascurabile', '2\nBasso', '3\nMedio', '4\nAlto', '5\nCritico'],
                       fontsize=10)
    ax.set_xlabel('PROBABILITÀ', fontsize=12, weight='bold', color=TEAL_PRIMARIO, labelpad=12)
    ax.set_ylabel('IMPATTO', fontsize=12, weight='bold', color=TEAL_PRIMARIO, labelpad=12)
    ax.set_aspect('equal')
    ax.grid(False)
    for spine in ax.spines.values():
        spine.set_edgecolor(TEAL_PRIMARIO)
        spine.set_linewidth(1.5)
    ax.tick_params(axis='both', length=0)

    # === Titoli ===
    fig.suptitle(title, fontsize=15, weight='bold', color=TEAL_PRIMARIO, y=0.97)
    ax.set_title(subtitle, fontsize=10, color=GRIGIO_SCURO, pad=10)

    # === Legenda zone ===
    legend_items = [
        mpatches.Patch(facecolor=DOT_LOW, edgecolor='white', label='Basso (1-5)'),
        mpatches.Patch(facecolor=DOT_MED, edgecolor='white', label='Medio (6-12)'),
        mpatches.Patch(facecolor=DOT_HIGH, edgecolor='white', label='Alto (13-25)')
    ]
    legend = ax.legend(handles=legend_items, loc='upper left',
                       bbox_to_anchor=(1.02, 1.0),
                       fontsize=10, frameon=True, title='Punteggio P×I',
                       title_fontsize=11)
    legend.get_frame().set_edgecolor(TEAL_CHIARO)
    legend.get_title().set_color(TEAL_PRIMARIO)
    legend.get_title().set_weight('bold')

    # === Tabella legenda rischi (a destra) ===
    risk_text_lines = []
    for r in sorted(risks, key=lambda x: -(x['p'] * x['i'])):
        score = r['p'] * r['i']
        risk_text_lines.append(f"{r['id']:<4} ({score:>2}) {r['name'][:50]}")

    text_legend = "\n".join(risk_text_lines)
    fig.text(0.78, 0.05, text_legend,
             fontsize=7, family='monospace',
             color=GRIGIO_SCURO, verticalalignment='bottom',
             bbox=dict(boxstyle='round,pad=0.6', facecolor='white',
                       edgecolor=TEAL_CHIARO, linewidth=1))

    # === Footer ===
    fig.text(0.5, 0.01,
             'Generato da ac-expert · plugin Amministrazione Condivisa · POST Società Benefit',
             fontsize=7, ha='center', color='#999', style='italic')

    plt.subplots_adjust(left=0.08, right=0.75, top=0.92, bottom=0.10)
    plt.savefig(output_png, dpi=120, bbox_inches='tight',
                facecolor='white', edgecolor='none')
    plt.close()
    print(f"OK -> {output_png} ({os.path.getsize(output_png)/1024:.1f} KB)")


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Uso: python generate-risk-matrix.py <input.json> <output.png>")
        sys.exit(1)
    generate(sys.argv[1], sys.argv[2])
