# Comando: python3 -I ev-04-comprobacion-o2-prima.py <raíz de la copia sin historia> [--estricto] <doc.md> ...   (se asienta como texto: no es ejecutable)
# Base: la copia de IA.SDD que arma el paso 1 de la resolución (folio 013, §7); el guion parte del prototipo del folio 009, §3, con lo que pidieron 011 y 012
# Quién: redactor designado
"""Comprobación mecánica de O2' (folio 013, §7, pasos 2 a 4 y 7).

Por cada documento, relativo a la raíz de la copia:
  paso 2  rutas *.md (con directorio, sin él o con «…»), «Archivo.md §n» (y sus cadenas «§a, §b y §c»),
          «Archivo.md:a-b» (y los «`:c-d`» que siguen en la misma línea), alias entre acentos graves contra la
          columna Alias del índice, e identificadores Kn, An, Dn y XC-n contra el archivo que los define;
  paso 3  nombres de las dependencias del destino, K<n> y hashes entre acentos graves;
  paso 4  la tabla «Dependencias» del §9 de un documento de Conocimiento/ nombra cada archivo que el paso 2
          resolvió fuera del propio documento;
  paso 7  líneas, prosa de más de 110 columnas fuera de tablas, código y campos de cabecera.
Con --estricto, una ruta que resuelve sólo dentro de _legacy/ o Expedientes/ se informa aparte.
Falsos positivos declarados: los de FP, las plantillas (NNN-, <…>, {{…}}) y lo que está dentro de un bloque
de código (esqueletos de §5). Sale con 1 si hay alguna falla.
"""
import os, re, sys, glob

args = sys.argv[1:]
estricto = '--estricto' in args
args = [a for a in args if a != '--estricto']
root = os.path.realpath(args[0]); docs = args[1:]
if os.path.exists(os.path.join(root, '.git')):
    sys.exit('la copia tiene .git: no es una copia sin historia')

FP = {  # falsos positivos declarados uno por uno: (archivo, texto)
    ('*', 'README.md'),                    # «el README.md» suelto nombra la carátula de un caso o la carpeta vecina
    ('SDD/Devs/Rules/Rules-Base-Conocimiento.md', 'Index-Modelos-UX-UI.md §6.1'),    # fila 2.0: «§6.1» es de esta regla
    ('SDD/Devs/Rules/Rules-Base-Conocimiento.md', 'Clean-Architecture-Simplificada'),  # ejemplo de alias honesto
    ('SDD/Devs/Rules/Rules-Base-Conocimiento.md', 'Panel-Operativo-Denso'),            # ejemplo de nombre agnóstico
    ('SDD/Devs/Rules/Rules-Base-Conocimiento.md', 'Panel-Cliente-Acme'),               # contraejemplo
    ('SDD/Devs/Rules/Rules-Base-Conocimiento.md', 'Knowledge-Bundle-JS'),              # no aparece; previsto
}

allmd = {}
for dp, dn, fn in os.walk(root):
    for f in fn:
        if f.endswith('.md'):
            allmd.setdefault(f, []).append(os.path.relpath(os.path.join(dp, f), root))

def dentro(p):
    return os.path.realpath(p).startswith(root + os.sep)

def resolver(ref, docdir):
    ref = ref.strip('`')
    if '…' in ref:
        for base in (root, docdir):
            hits = [h for h in glob.glob(os.path.join(base, ref.replace('…', '*'))) if dentro(h)]
            if hits:
                return os.path.relpath(hits[0], root)
        return None
    for base in (root, docdir):
        p = os.path.join(base, ref)
        if os.path.exists(p) and dentro(p):
            return os.path.relpath(p, root)
    if '/' not in ref:
        hits = [h for h in allmd.get(ref, []) if not h.startswith(('_legacy/', 'Expedientes/'))]
        if len(hits) == 1:
            return hits[0]
        if len(hits) > 1:
            return 'AMBIGUA:' + ','.join(hits)
    return None

def encabezados(path):
    hs = set()
    for line in open(os.path.join(root, path), encoding='utf-8'):
        m = re.match(r'#{1,6}\s+§?(\d+(?:\.\d+)*)[ .]', line)
        if m:
            hs.add(m.group(1))
    return hs

def nlineas(path):
    return sum(1 for _ in open(os.path.join(root, path), encoding='utf-8'))

def alias_del_indice():
    al = set()
    for line in open(os.path.join(root, 'Conocimiento/Index-Knowledge.md'), encoding='utf-8'):
        c = line.split('|')
        if line.startswith('| `Knowledge-') and len(c) > 3:
            al.add(c[2].strip().strip('`'))
    return al

ALIAS = alias_del_indice()
DENY = [r'_convenciones_comunes', r'_reglas_base', r'\bPrompts/', r'`Context/`', r'\bdocs/expedientes/', r'\bK\d+\b']
MD = re.compile(r'`?([A-Za-z0-9_.\-/…<>{}]+\.md)`?')
SEC = re.compile(r'([A-Za-z0-9_\-]+\.md)`?(?: \d+(?:\.\d+)*)?(?: \(\d+(?:\.\d+)*\))? §(\d+(?:\.\d+)*)((?:(?:, | y | a | e |, y )§\d+(?:\.\d+)*)*)')
LIN = re.compile(r'([A-Za-z0-9_\-]+\.md):(\d+)(?:-(\d+))?')
LIN2 = re.compile(r'`:(\d+)(?:-(\d+))?`')
HASH = re.compile(r'`([0-9a-f]{7,40})`')
ALI = re.compile(r'`([A-Z][a-z]+(?:-[A-Z0-9][A-Za-z0-9.]*){2,})`')
IDS = [(re.compile(r'\bA(\d{1,2})\b'), 'SDD/Devs/Rules/Expediente-Rules.md', r'# A{n} ·'),
       (re.compile(r'\bD(\d)\b'), 'README.md', r'\*\*D{n}\*\*'),
       (re.compile(r'\bXC-(\d+)\b'), 'Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md', r'XC-\{\{n\}\}')]

fallas = 0; filas = []; fuera = {}
def anota(d, i, clase, ref, res, ok):
    global fallas
    filas.append((d, i, clase, ref, res, ok)); fallas += (not ok)

for d in docs:
    dpath = os.path.join(root, d); ddir = os.path.dirname(dpath); codigo = False
    texto = open(dpath, encoding='utf-8').read().splitlines()
    fuera[d] = set()
    for i, line in enumerate(texto, 1):
        if line.startswith('```'):
            codigo = not codigo; continue
        if codigo:
            continue
        for m in MD.finditer(line):
            ref = m.group(1)
            if '<' in ref or '{' in ref or ref.startswith('NNN') or (d, ref) in FP or ('*', ref) in FP:
                continue
            r = resolver(ref, ddir)
            ok = r is not None and not str(r).startswith('AMBIGUA')
            if ok and estricto and r.startswith(('_legacy/', 'Expedientes/')):
                anota(d, i, 'ruta en Expedientes/ o _legacy/ (estricto)', ref, r, True)
            else:
                anota(d, i, 'ruta', ref, r or 'NO RESUELVE', ok)
            if ok and r != d:
                fuera[d].add(r)
        for m in re.finditer(r'`(Expedientes/[0-9]{4}-[A-Za-z0-9.-]+)/?`', line):
            ok = os.path.isdir(os.path.join(root, m.group(1)))
            anota(d, i, 'carpeta de expediente', m.group(1), 'ok' if ok else 'NO RESUELVE', ok)
            if ok: fuera[d].add(m.group(1))
        for m in SEC.finditer(line):
            f = m.group(1); secs = [m.group(2)] + re.findall(r'§(\d+(?:\.\d+)*)', m.group(3) or '')
            r = resolver(f, ddir)
            if r and not r.startswith('AMBIGUA'):
                hs = encabezados(r)
                for s in secs:
                    if (d, f'{f} §{s}') in FP:
                        continue
                    anota(d, i, '§', f'{f} §{s}', 'ok' if s in hs else 'SECCIÓN AUSENTE', s in hs)
        ultimo = None
        for m in LIN.finditer(line):
            f, a, b = m.group(1), int(m.group(2)), int(m.group(3) or m.group(2))
            r = resolver(f, ddir); ultimo = r
            if r and not r.startswith('AMBIGUA'):
                ok = b <= nlineas(r)
                anota(d, i, 'líneas', f'{f}:{a}-{b}', 'ok' if ok else 'FUERA DE RANGO', ok)
        if ultimo:
            for m in LIN2.finditer(line):
                a, b = int(m.group(1)), int(m.group(2) or m.group(1))
                ok = b <= nlineas(ultimo)
                anota(d, i, 'líneas', f'{os.path.basename(ultimo)}:{a}-{b}', 'ok' if ok else 'FUERA DE RANGO', ok)
        for m in HASH.finditer(line):
            anota(d, i, 'commit', m.group(1), 'NO ESTÁ EN UNA COPIA SIN HISTORIA', False)
        for m in ALI.finditer(line):
            a = m.group(1)
            if a.endswith('.md') or (d, a) in FP:
                continue
            anota(d, i, 'alias', a, 'ok' if a in ALIAS else 'SIN FILA EN EL ÍNDICE', a in ALIAS)
        for rx, archivo, defi in IDS:
            for m in rx.finditer(line):
                n = m.group(1)
                ok = re.search(defi.replace('{n}', n), open(os.path.join(root, archivo), encoding='utf-8').read()) is not None
                anota(d, i, 'identificador', m.group(0), 'ok' if ok else 'NO DEFINIDO EN ' + archivo, ok)
        for p in DENY:
            if re.search(p, line):
                anota(d, i, 'del destino', p, 'APUNTA AFUERA', False)

# paso 4: la tabla «Dependencias» nombra cada archivo resuelto fuera del documento
for d in docs:
    if not d.startswith('Conocimiento/Knowledge-'):
        continue
    t = open(os.path.join(root, d), encoding='utf-8').read()
    i = t.find('## 9.'); j = t.find('## 10.')
    tabla = t[i:j]
    for r in sorted(fuera[d]):
        if r in ('Conocimiento/Index-Knowledge.md',):
            continue
        ok = os.path.basename(r.rstrip('/')) in tabla or r in tabla
        anota(d, 0, 'tabla Dependencias', r, 'ok' if ok else 'FALTA SU FILA', ok)

# paso 7: forma
for d in docs:
    L = open(os.path.join(root, d), encoding='utf-8').read().split('\n'); codigo = False; largas = 0
    for k, l in enumerate(L, 1):
        if l.startswith('```'):
            codigo = not codigo; continue
        if codigo or l.startswith('|') or re.match(r'^\*\*[^*]+:\*\* ', l) and k <= 16:
            continue
        if len(l) > 110:
            largas += 1; anota(d, k, 'prosa > 110 columnas', str(len(l)), 'LARGA', False)
    print(f'# forma\t{d}\tlíneas={len(L) - (1 if L[-1] == "" else 0)}\tKB={os.path.getsize(os.path.join(root, d))/1024:.1f}\tprosa>110={largas}')

for f in filas:
    if not f[5] or 'estricto' in f[2]:
        print('\t'.join(map(str, f[:5])))
res = {}
for f in filas:
    k = (f[2], 'ok' if f[5] else 'falla'); res[k] = res.get(k, 0) + 1
print('# resumen:', ', '.join(f'{k[0]} {k[1]}={v}' for k, v in sorted(res.items())))
print('# fallas:', fallas)
sys.exit(1 if fallas else 0)
