#!/usr/bin/env python3
"""Rewrite the tool tables of README.md from tools.json, which scripts/dump-tools.st writes.

Each generated block sits between <!-- tools PACKAGE GROUP --> and <!-- /tools -->; everything
outside the markers is written by hand and left alone. Run from the repository directory."""
import json, re, sys
from pathlib import Path

root = Path(__file__).resolve().parent.parent
readme = root / 'README.md'
dump = json.load(open(root / 'tools.json'))

SCOPE = ('Where the sends to change are looked for: `class`, `hierarchy`, `category`, '
         '`hierarchyAndCategories` or `system` — see [Refactoring scope](#refactoring-scope). '
         'Defaults to `system`')

def cell(text):
    return text.replace('|', '\\|').replace('\n', ' ')

def item_rows(name, p):
    """One row per property of the items of an array parameter, named as name[].property."""
    items = p.get('items', {})
    item_required = items.get('required', [])
    return [f"| `{name}[].{item}` | {'required' if item in item_required else 'optional'} | "
            f"{cell(q['description'])} |"
            for item, q in items.get('properties', {}).items()]

def tool(definition):
    properties = definition['inputSchema'].get('properties', {})
    required = definition['inputSchema'].get('required', [])
    lines = [f"##### `{definition['name']}`", '', definition['description'], '']
    rows = [(name, p) for name, p in properties.items() if name != 'acceptedWarnings']
    if rows:
        lines += ['| Parameter | | |', '| --- | --- | --- |']
        for name, p in rows:
            scoped = name == 'scope' and p['description'].startswith('Where the sends to change')
            lines.append(f"| `{name}` | {'required' if name in required else 'optional'} | "
                         f"{SCOPE if scoped else cell(p['description'])} |")
            lines += item_rows(name, p)
        lines.append('')
    return '\n'.join(lines)

def block(package, group):
    definitions = sorted(dump['groups'][package][group], key=lambda d: d['name'])
    return '\n'.join(tool(d) for d in definitions)

text = readme.read_text()
pattern = re.compile(r'<!-- tools (\S+) (\S+) -->\n.*?<!-- /tools -->', re.S)
count = 0
def replace(match):
    global count
    count += 1
    return f'<!-- tools {match[1]} {match[2]} -->\n{block(match[1], match[2])}\n<!-- /tools -->'
readme.write_text(pattern.sub(replace, text))
print(f'{count} tool blocks rewritten')
