#!/bin/sh
# Método: comandos de git sobre los tres repositorios que el caso toca. Base: 2026-09-13. Quién: presidente de mesa (orquestador de la corrida).
W=<workspace>
for r in IA/SDD/IA.SDD IA/SDD/IA.SDD.Documentacion <repo-privado-F1>; do
  printf '%s  %s  %s  sucios=%s\n' "$r" "$(git -C $W/$r rev-parse --short HEAD)" "$(git -C $W/$r branch --show-current)" "$(git -C $W/$r status --short | wc -l)"
done
printf 'framework vigente: %s\n' "$(grep -m1 '^## \[' $W/IA/SDD/IA.SDD/CHANGELOG.md)"
printf 'ultimo snapshot: %s\n' "$(ls $W/IA/SDD/IA.SDD/_legacy | grep -v README | sort -V | tail -1)"
