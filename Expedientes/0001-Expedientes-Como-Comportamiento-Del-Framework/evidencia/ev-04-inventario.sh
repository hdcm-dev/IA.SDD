#!/usr/bin/env bash
# ev-04 — Inventario de lo ya escrito que un tratamiento retroactivo alcanzaría
W=/home/fernando/workspaces/workspace-dev
echo "== Lab-Geometria main: SDD/Docs/Audit"; git -C $W/PROG2/Geometria/Lab-Geometria ls-tree -r --name-only main SDD/Docs/Audit | wc -l
echo "-- por prefijo (hasta el primer guion o dígito)"
git -C $W/PROG2/Geometria/Lab-Geometria ls-tree -r --name-only main SDD/Docs/Audit | sed 's#SDD/Docs/Audit/##' | sed -E 's/^([A-Za-z]+).*/\1/' | sort | uniq -c | sort -rn
echo "-- registros de mesa"; git -C $W/PROG2/Geometria/Lab-Geometria ls-tree -r --name-only main SDD/Docs/Audit | grep -c '/Mesa-'
echo "-- carpetas _legacy bajo SDD/Docs (política de archivado del destino)"; git -C $W/PROG2/Geometria/Lab-Geometria ls-tree -d -r --name-only main SDD/Docs | grep -c '/_legacy$'
echo "== RPI.VideoControl HEAD: SDD/Docs/Audit"; git -C $W/Repos-RPIs/RPI.VideoControl ls-tree -r --name-only HEAD SDD/Docs/Audit | wc -l
echo "== Documentacion: carpetas OUTPUTs de intervenciones"
for d in $W/IA/SDD/IA.SDD.Documentacion/PROMPTs/Fixs/*/OUTPUTs; do echo "$(echo $d | sed "s#$W/IA/SDD/IA.SDD.Documentacion/##")  archivos=$(find $d -type f | wc -l)"; done
echo "-- expediente de mesa con forma de carpeta"; ls $W/IA/SDD/IA.SDD.Documentacion/PROMPTs/Fixs/05-Fix-Reporte-27/OUTPUTs/Mesa-2026-09-12-Colision-Lexica
