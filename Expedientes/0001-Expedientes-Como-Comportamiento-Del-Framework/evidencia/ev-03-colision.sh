#!/usr/bin/env bash
# ev-03 — Colisión del prefijo EXP- y del término «expediente» (Vocabulario-Rules.md §9.2 y §9.4; Mesa-Rules.md §6.1)
W=/home/fernando/workspaces/workspace-dev
echo "== EXP- como token, framework sin _legacy"; grep -rnoE '\bEXP-[A-Za-z0-9]+' $W/IA/SDD/IA.SDD --include=*.md --exclude-dir=_legacy | wc -l
echo "== EXP- en _legacy"; grep -rnoE '\bEXP-[A-Za-z0-9]+' $W/IA/SDD/IA.SDD/_legacy --include=*.md | wc -l
echo "== EXP- Documentacion"; grep -rnoE '\bEXP-[A-Za-z0-9]+' $W/IA/SDD/IA.SDD.Documentacion --include=*.md | wc -l
echo "== EXP- Lab-Geometria main"; git -C $W/PROG2/Geometria/Lab-Geometria grep -nE '\bEXP-' main -- . | wc -l
echo "== EXP- RPI.VideoControl HEAD"; git -C $W/Repos-RPIs/RPI.VideoControl grep -nE '\bEXP-' HEAD -- . | wc -l
echo "== familias alcanzadas y excluidas de Root-Rules.md §9.2 (líneas)"
grep -n "Del producto: \`NB\`" $W/IA/SDD/IA.SDD/SDD/Devs/Rules/Root-Rules.md
echo "== «expediente» en el conjunto normativo (sin _legacy), con su línea"
grep -rn -i "expediente" $W/IA/SDD/IA.SDD --include=*.md --exclude-dir=_legacy
echo "== «expediente» en Documentacion: archivos"; grep -rli "expediente" $W/IA/SDD/IA.SDD.Documentacion --include=*.md | sed "s#$W/##"
echo "== «expediente» en Lab-Geometria main: ocurrencias"; git -C $W/PROG2/Geometria/Lab-Geometria grep -i -c "expediente" main -- . | head
