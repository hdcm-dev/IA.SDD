#!/usr/bin/env bash
# ev-02 — ¿Qué copia el snapshot _legacy/<N>/? Raíz del repositorio contra snapshots
cd /home/fernando/workspaces/workspace-dev/IA/SDD/IA.SDD
echo "== raíz en main"; git ls-tree --name-only 8c55a1e | tr '\n' ' '; echo
for v in 9.6 13.0 13.15; do echo "== _legacy/$v"; git ls-tree --name-only 8c55a1e _legacy/$v/ | sed "s#_legacy/$v/##" | tr '\n' ' '; echo; done
echo "== exclusiones declaradas (SDD-Development-Guide.md §VI.5)"
grep -n "Quedan fuera del snapshot" SDD/Guides/SDD-Development-Guide.md
echo "== criterio de inclusión citado"
grep -n "sólo se excluye lo que no condiciona" SDD/Guides/SDD-Development-Guide.md SDD/Devs/Rules/Rules-Base-Conocimiento.md
echo "== archivos versionados bajo _legacy/"; git ls-files _legacy | wc -l
