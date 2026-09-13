#!/usr/bin/env bash
# ev-01 — Base de la corrida: repositorios, ramas, commits y carpetas Expedientes existentes
W=/
date -Iseconds
for r in IA/SDD/IA.SDD IA/SDD/IA.SDD.Documentacion; do
  echo "== $r"; git -C $W/$r rev-parse main; git -C $W/$r worktree list
done
echo "== Lab-Geometria main (sólo lectura)"; git -C $W/PROG2/Geometria/Lab-Geometria rev-parse main
echo "== RPI.VideoControl HEAD (sólo lectura)"; git -C $W/Repos-RPIs/RPI.VideoControl rev-parse HEAD
echo "== carpetas Expedientes en el workspace (profundidad 6)"
find $W -maxdepth 6 -type d -name Expedientes -not -path '*/node_modules/*' 2>/dev/null | sort | while read d; do echo "$d  entradas=$(ls -A "$d" | wc -l)"; done
