#!/usr/bin/env python3
"""Generate island_news.svg matching the reference newspaper layout."""

import textwrap
from pathlib import Path

# Page in points (8.5 x 11 in @ 72pt/in)
W, H = 612, 792
MARGIN = 36

# Masthead geometry
SKY_TOP = 0
SKY_H = 120
WATER_H = 35
MAST_H = SKY_H + WATER_H  # 155
HORIZON_Y = SKY_H

# Sun
SUN_CX, SUN_CY, SUN_R = 95, 70, 62

# Columns
COL_W = 170
GUTTER = 15
COL_X = [MARGIN + i * (COL_W + GUTTER) for i in range(3)]
DIV_X = [COL_X[0] + COL_W + GUTTER / 2, COL_X[1] + COL_W + GUTTER / 2]

# Header bar
BYLINE_Y = 178
THICK_LINE_Y = 188
COL_HDR_Y = 210
BODY_START_Y = 226
BODY_END_Y = 770
LINE_H = 13
FONT_SIZE = 10.5

# Images
PALM_X, PALM_Y, PALM_W, PALM_H = COL_X[0], 296, COL_W, 140
MAP_W, MAP_H = 355, 180
MAP_X = COL_X[1] - 6   # slight bleed into gutter
MAP_Y = 470

# Filler sentence
SENTENCE = "Now is the time for all good men to vocme to he aid of their parties and all of that sort of thing."

# Line breaks tuned to ~32 chars per line at 10.5pt Georgia in a 170pt column
# Three lines per sentence, matching the reference image
PARA_LINES = [
    "Now is the time for all good men",
    "to vocme to he aid of their par-",
    "ties and all of that sort of thing.",
]


def build_paragraphs(count):
    """Return a list of (text, is_blank_after) for N repetitions of the sentence."""
    out = []
    for i in range(count):
        for line in PARA_LINES:
            out.append(line)
        out.append("")  # blank line between paragraphs
    return out


def text_block(x, y_top, y_bottom, lines):
    """Render text lines as individual <text> elements (Illustrator-friendly).

    Lines fit while y <= y_bottom.
    Returns SVG fragment + how many lines were consumed.
    """
    parts = []
    used = 0
    y = y_top
    for line in lines:
        if y > y_bottom:
            break
        if line != "":
            parts.append(
                f'<text x="{x}" y="{y:.2f}" font-family="Georgia" '
                f'font-size="{FONT_SIZE}" fill="#000">{escape(line)}</text>'
            )
        y += LINE_H
        used += 1
    return "\n".join(parts), used


def escape(s):
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


def main():
    # Build paragraphs - enough to fill columns
    big_pool = build_paragraphs(20)

    # Column 1: text above palm image, then text below palm image
    col1_top_lines = lines_that_fit(big_pool, BODY_START_Y, PALM_Y - 6)
    col1_remaining = big_pool[len(col1_top_lines):]
    col1_bot_lines = lines_that_fit(col1_remaining, PALM_Y + PALM_H + 8, BODY_END_Y)

    # Column 2: text above map, text below map
    col2_pool = build_paragraphs(20)
    col2_top_lines = lines_that_fit(col2_pool, BODY_START_Y, MAP_Y - 6)
    col2_remaining = col2_pool[len(col2_top_lines):]
    col2_bot_lines = lines_that_fit(col2_remaining, MAP_Y + MAP_H + 8, BODY_END_Y)

    # Column 3: text above map, text below map (same as col 2 layout)
    col3_pool = build_paragraphs(20)
    col3_top_lines = lines_that_fit(col3_pool, BODY_START_Y, MAP_Y - 6)
    col3_remaining = col3_pool[len(col3_top_lines):]
    col3_bot_lines = lines_that_fit(col3_remaining, MAP_Y + MAP_H + 8, BODY_END_Y)

    # Render
    parts = []
    parts.append(svg_header())
    parts.append(defs())
    parts.append(masthead())
    parts.append(below_masthead())
    parts.append(column_headers_and_dividers())

    # Column 1 text
    txt, _ = text_block(COL_X[0], BODY_START_Y, PALM_Y - 6, col1_top_lines)
    parts.append(txt)
    txt, _ = text_block(COL_X[0], PALM_Y + PALM_H + 18, BODY_END_Y, col1_bot_lines)
    parts.append(txt)

    # Column 2 text
    txt, _ = text_block(COL_X[1], BODY_START_Y, MAP_Y - 6, col2_top_lines)
    parts.append(txt)
    txt, _ = text_block(COL_X[1], MAP_Y + MAP_H + 18, BODY_END_Y, col2_bot_lines)
    parts.append(txt)

    # Column 3 text
    txt, _ = text_block(COL_X[2], BODY_START_Y, MAP_Y - 6, col3_top_lines)
    parts.append(txt)
    txt, _ = text_block(COL_X[2], MAP_Y + MAP_H + 18, BODY_END_Y, col3_bot_lines)
    parts.append(txt)

    # Images on top (with thick black borders)
    parts.append(image_placeholders())

    parts.append("</svg>\n")

    Path("/home/user/claude-code-toolkit/island_news.svg").write_text("\n".join(parts))
    print(f"Wrote island_news.svg")


def lines_that_fit(pool, y_top, y_bottom):
    """Return prefix of pool whose total height fits between y_top and y_bottom."""
    available = y_bottom - y_top
    max_lines = int(available // LINE_H) + 1
    return pool[:max_lines]


def svg_header():
    return (
        '<?xml version="1.0" encoding="UTF-8" standalone="no"?>\n'
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'xmlns:xlink="http://www.w3.org/1999/xlink" '
        f'version="1.1" '
        f'width="{W}" height="{H}" '
        f'viewBox="0 0 {W} {H}">\n'
    )


def defs():
    return """  <defs>
    <linearGradient id="skyGradient" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#87CEEB"/>
      <stop offset="100%" stop-color="#1E3A8A"/>
    </linearGradient>
    <linearGradient id="waterGradient" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#1E3A8A"/>
      <stop offset="100%" stop-color="#87CEEB"/>
    </linearGradient>
    <radialGradient id="sunGradient" cx="50%" cy="50%" r="50%">
      <stop offset="0%" stop-color="#FFEB3B"/>
      <stop offset="100%" stop-color="#FF6F00"/>
    </radialGradient>
  </defs>
"""


def masthead():
    return f"""  <!-- Masthead (sky + sun + water + horizon + title + subtitle) -->
  <rect x="0" y="0" width="{W}" height="{SKY_H}" fill="url(#skyGradient)"/>
  <circle cx="{SUN_CX}" cy="{SUN_CY}" r="{SUN_R}" fill="url(#sunGradient)"/>
  <rect x="0" y="{SKY_H}" width="{W}" height="{WATER_H}" fill="url(#waterGradient)"/>
  <line x1="0" y1="{HORIZON_Y}" x2="{W}" y2="{HORIZON_Y}" stroke="white" stroke-width="0.5"/>
  <!-- Title: stroked text below, filled text on top (no paint-order) -->
  <text x="{W/2}" y="102" text-anchor="middle"
        font-family="Impact" font-size="56" font-weight="bold"
        fill="none" stroke="black" stroke-width="6"
        stroke-linejoin="round">THE ISLAND NEWS</text>
  <text x="{W/2}" y="102" text-anchor="middle"
        font-family="Impact" font-size="56" font-weight="bold"
        fill="white">THE ISLAND NEWS</text>
  <text x="{W/2}" y="146" text-anchor="middle"
        font-family="Arial Black" font-size="22" font-weight="bold"
        font-style="italic" fill="#FFEB3B">All the news that prints to fit</text>
"""


def below_masthead():
    return f"""  <!-- Byline -->
  <text x="{MARGIN}" y="{BYLINE_Y}" font-family="Georgia"
        font-size="11" fill="#000">Today 27th 2026</text>
  <text x="{W - MARGIN}" y="{BYLINE_Y}" text-anchor="end"
        font-family="Georgia"
        font-size="11" fill="#000">Bob Smith</text>
  <!-- Thick line under masthead -->
  <line x1="{MARGIN}" y1="{THICK_LINE_Y}" x2="{W - MARGIN}" y2="{THICK_LINE_Y}"
        stroke="black" stroke-width="2"/>
"""


def column_headers_and_dividers():
    headers = ["Island Finance", "Island Elections", "Election Demographics"]
    out = ["  <!-- Column headers -->"]
    for i, title in enumerate(headers):
        cx = COL_X[i] + COL_W / 2
        out.append(
            f'  <text x="{cx}" y="{COL_HDR_Y}" text-anchor="middle" '
            f'font-family="Georgia" '
            f'font-size="12" font-weight="bold" fill="#000">{title}</text>'
        )
    out.append("  <!-- Vertical column dividers -->")
    for x in DIV_X:
        out.append(
            f'  <line x1="{x}" y1="{COL_HDR_Y - 14}" x2="{x}" y2="{BODY_END_Y + 4}" '
            f'stroke="#000" stroke-width="0.5"/>'
        )
    return "\n".join(out) + "\n"


def image_placeholders():
    out = []
    out.append("  <!-- Palm trees image placeholder (column 1) -->")
    out.append(
        f'  <rect x="{PALM_X}" y="{PALM_Y}" width="{PALM_W}" height="{PALM_H}" '
        f'fill="#E8F4F8" stroke="black" stroke-width="5"/>'
    )
    # decorative beach scene
    out.append(
        f'  <rect x="{PALM_X + 2.5}" y="{PALM_Y + PALM_H * 0.65}" '
        f'width="{PALM_W - 5}" height="{PALM_H * 0.35 - 2.5}" fill="#F4E4BC"/>'
    )
    out.append(
        f'  <rect x="{PALM_X + 2.5}" y="{PALM_Y + PALM_H * 0.45}" '
        f'width="{PALM_W - 5}" height="{PALM_H * 0.20}" fill="#5DADE2"/>'
    )
    # simple palm silhouettes
    for tx, th in [(40, 0.55), (75, 0.50), (105, 0.45), (140, 0.52)]:
        x0 = PALM_X + tx
        trunk_top = PALM_Y + PALM_H * (1 - th)
        trunk_bot = PALM_Y + PALM_H * 0.7
        out.append(
            f'  <path d="M {x0} {trunk_bot} Q {x0 + 3} {(trunk_top + trunk_bot)/2} '
            f'{x0 - 1} {trunk_top}" stroke="#3E2723" stroke-width="2.5" fill="none"/>'
        )
        # palm fronds
        for ang in (-60, -30, 0, 30, 60, 90, 120, 150, 180, 210):
            import math
            rad = math.radians(ang)
            fx = x0 - 1 + 14 * math.cos(rad)
            fy = trunk_top + 14 * math.sin(rad)
            out.append(
                f'  <line x1="{x0 - 1}" y1="{trunk_top}" x2="{fx:.1f}" y2="{fy:.1f}" '
                f'stroke="#2E7D32" stroke-width="1.8"/>'
            )
    out.append(
        f'  <text x="{PALM_X + PALM_W / 2}" y="{PALM_Y + PALM_H - 5}" '
        f'text-anchor="middle" font-family="Georgia" font-size="6.5" '
        f'fill="#444">[ palm trees on beach ]</text>'
    )

    out.append("  <!-- Island map image placeholder (spans cols 2-3) -->")
    out.append(
        f'  <rect x="{MAP_X}" y="{MAP_Y}" width="{MAP_W}" height="{MAP_H}" '
        f'fill="#FDFBF3" stroke="black" stroke-width="5"/>'
    )
    # Simple island outline
    cx = MAP_X + MAP_W / 2
    cy = MAP_Y + MAP_H / 2
    out.append(
        f'  <path d="M {cx - 130} {cy - 30} '
        f'C {cx - 145} {cy - 60}, {cx - 90} {cy - 75}, {cx - 40} {cy - 65} '
        f'S {cx + 60} {cy - 80}, {cx + 110} {cy - 50} '
        f'S {cx + 145} {cy + 10}, {cx + 120} {cy + 45} '
        f'S {cx + 30} {cy + 70}, {cx - 30} {cy + 55} '
        f'S {cx - 120} {cy + 55}, {cx - 130} {cy - 30} Z" '
        f'fill="#A8D5A2" stroke="#2C5F2D" stroke-width="1.5"/>'
    )
    # Mountains
    out.append(
        f'  <path d="M {cx - 60} {cy} L {cx - 40} {cy - 25} L {cx - 20} {cy} Z" '
        f'fill="#7BA77B"/>'
    )
    out.append(
        f'  <path d="M {cx - 20} {cy + 5} L {cx + 5} {cy - 20} L {cx + 30} {cy + 5} Z" '
        f'fill="#7BA77B"/>'
    )
    out.append(
        f'  <text x="{cx}" y="{cy + 30}" text-anchor="middle" '
        f'font-family="Georgia" font-size="14" font-weight="bold" '
        f'letter-spacing="3" fill="#2C5F2D">I S L A N D</text>'
    )
    out.append(
        f'  <text x="{cx}" y="{MAP_Y + MAP_H - 8}" text-anchor="middle" '
        f'font-family="Georgia" font-size="7" '
        f'fill="#666">[ map of the island ]</text>'
    )
    return "\n".join(out) + "\n"


if __name__ == "__main__":
    main()
