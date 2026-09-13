#!/usr/bin/env bash
# ev-05 — Líneas de la norma 13.16 que el caso cita (IA.SDD main 8c55a1e)
# Nota: la primera corrida usó grep sin -F y dos patrones con ** no encontraron nada; se corrigió antes de citar (ver actuación 002, §6).
cd /home/fernando/workspaces/workspace-dev/IA/SDD/IA.SDD
g(){ echo "== $1 :: $2"; grep -nF -- "$2" "$1" | head -3; }
g SDD/Devs/Rules/Mesa-Rules.md '**Carpeta target:**'
g SDD/Devs/Rules/Mesa-Rules.md '| Registro de mesa |'
g SDD/Devs/Rules/Mesa-Rules.md 'La mesa se convoca cuando se cumplen las tres'
g SDD/Devs/Rules/Mesa-Rules.md 'SI NO RESPONDÉS'
g SDD/Devs/Orchestrator/Master-Prompt-Migracion.md 'Informe-Migracion-<origen>-a-<vigente>.md`, con la estructura'
g SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md 'SDD/Docs/Audit/Estado-Del-Destino-<AAAA-MM-DD>.md'
g SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md '| **Punto de continuación** |'
g SDD/Devs/Rules/Deriva-Rules.md 'Tipos de evidencia admitidos'
g SDD/Devs/Rules/Deriva-Rules.md 'una captura de una conversación'
g SDD/Devs/Rules/Root-Rules.md 'Familias alcanzadas.'
g SDD/Devs/Rules/Root-Rules.md '### 12.2 Ítem diferido'
g SDD/Devs/Orchestrator/Master-Prompt.md '## §8.2 Ciclo de origen de los huecos'
g SDD/Devs/Orchestrator/Master-Prompt.md '> **Origen del hecho.**'
g SDD/Devs/Orchestrator/Master-Prompt.md 'SDD/Docs/Producto/Decisiones-Pendientes.md'
g SDD/Devs/Rules/Root-Rules.md 'un procedimiento que crece deja de leerse'
g SDD/Guides/SDD-Development-Guide.md '**Intocabilidad.**'
g SDD/Guides/SDD-Development-Guide.md '### II.7 El framework no distribuye código ejecutable'
g SDD/Devs/Rules/Migracion-Rules.md 'expediente de la intervención'
g README.md '## Reglas de intervención sobre el framework'
