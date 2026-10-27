#!/usr/bin/env python3
"""Control Verificar del repositorio.

Alcance: los .md versionados fuera de _legacy/.

1. Enlaces relativos: todo enlace Markdown relativo de un .md versionado resuelve a un archivo o carpeta
   del árbol (se ignoran bloques de código, URLs, anclas solas y marcadores con <...>).
2. Publicación (S2 mínimo): ningún .md versionado contiene una ruta absoluta de un directorio personal
   (/home/<usuario>/ o C:\\Users\\<usuario>\\) ni una dirección IPv4 de red privada.

Los enlaces ilustrativos declarados en verificar-excepciones.txt no cuentan como falla.
Sale con 1 y lista cada falla con archivo:línea. Corre con python3 -I, sin dependencias.
"""
import re, subprocess, sys
from urllib.parse import unquote
from pathlib import Path

raiz = Path(subprocess.check_output(["git", "rev-parse", "--show-toplevel"], text=True).strip())
# _legacy/ son instantáneas congeladas de versiones anteriores: no se reescriben, así que no se verifican.
archivos = [raiz / p for p in subprocess.check_output(["git", "ls-files", "-z", "*.md"], cwd=raiz, text=True).split("\0")
            if p and not p.startswith("_legacy/")]

enlace = re.compile(r"\]\(([^)\s]+)(?:\s+\"[^\"]*\")?\)")
ruta_personal = re.compile(r"(/home/[A-Za-z0-9._-]+/|[A-Za-z]:\\\\?Users\\\\?[A-Za-z0-9._-]+)")
ip_privada = re.compile(r"\b(10\.\d{1,3}|192\.168|172\.(1[6-9]|2\d|3[01]))\.\d{1,3}\.\d{1,3}\b")
excepciones = {l.strip() for l in (Path(__file__).with_name("verificar-excepciones.txt")).read_text(encoding="utf-8").splitlines()
               if l.strip() and not l.startswith("#")}
fallas = []
for f in archivos:
    if not f.is_file():
        continue
    en_codigo = False
    for n, linea in enumerate(f.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
        if linea.lstrip().startswith(("```", "~~~")):
            en_codigo = not en_codigo
            continue
        rel = f.relative_to(raiz)
        for m in ruta_personal.finditer(linea):
            fallas.append(f"{rel}:{n}: ruta de directorio personal")
        for m in ip_privada.finditer(linea):
            fallas.append(f"{rel}:{n}: dirección IPv4 privada")
        if en_codigo:
            continue
        sin_codigo = re.sub(r"`[^`]*`", "", linea)
        for m in enlace.finditer(sin_codigo):
            destino = m.group(1)
            if re.match(r"^[a-z][a-z0-9+.-]*:", destino, re.I) or destino.startswith(("#", "<")) or "<" in destino or "{" in destino:
                continue
            camino = destino.split("#", 1)[0].split("?", 1)[0]
            if not camino:
                continue
            objetivo = (raiz / camino.lstrip("/")) if camino.startswith("/") else (f.parent / unquote(camino))
            if not objetivo.exists() and f"{rel} -> {destino}" not in excepciones:
                fallas.append(f"{rel}:{n}: enlace roto -> {destino}")

for x in fallas:
    print(x)
print(f"Verificar: {len(archivos)} archivos .md, {len(fallas)} fallas")
sys.exit(1 if fallas else 0)
