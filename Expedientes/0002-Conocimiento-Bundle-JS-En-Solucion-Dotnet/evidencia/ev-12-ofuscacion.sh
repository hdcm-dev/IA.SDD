#!/usr/bin/env bash
# Método: dos barridos con grep -rIiE sobre todo archivo del expediente salvo los manifiestos, este guion y su salida. (1) Rutas y usuario del host, en cualquier codificación: debe dar 0. (2) Recuento de los marcadores que reemplazaron al producto privado F1: debe ser mayor que 0. Los términos de origen no figuran en este guion —figurarían en un repositorio público—; su ausencia se comprobó con la lista de R-N2-03 (folio 004) antes de redactar esa lista, y quedó asentada en el folio 016.
# Base: árbol de trabajo del expediente 0002 el 2026-09-13, antes de su primer commit; IA.SDD main 01aa830 (13.18).
# Quién: presidente de mesa, a pedido del Product Owner (ESC-001, opción B).
set -euo pipefail
cd "$(dirname "$0")/.."
EXCL=(--exclude=SHA256SUMS --exclude=ev-12-ofuscacion.sh --exclude=ev-12-ofuscacion.out)

HOST="(/|-)home[/-][a-z0-9_]+|/Users/[A-Za-z]|C:\\\\Users|workspace-dev|$(id -un)"
n=$( (grep -rIiE "$HOST" "${EXCL[@]}" . || true) | wc -l)
echo "barrido 1 (host): $n ocurrencias"
grep -rIinE "$HOST" "${EXCL[@]}" . || true

for m in '<F1>' '<repo-privado-F1>' '<Componente>' '<componente>' '<workspace>' '<scratchpad>'; do
  c=$( (grep -rIoF "$m" "${EXCL[@]}" . || true) | wc -l)
  echo "barrido 2 (marcador $m): $c ocurrencias"
done
