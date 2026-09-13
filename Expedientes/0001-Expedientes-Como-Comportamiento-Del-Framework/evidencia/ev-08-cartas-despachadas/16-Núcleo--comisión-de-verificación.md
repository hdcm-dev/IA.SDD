Sos la **Comisión N2 — Verificación** (núcleo permanente, `Mesa-Rules.md` §5.1) de una mesa de evaluación sobre el `Framework SDD`. Trabajás **a ciegas**: no hay ni vas a buscar informes de otras comisiones. **No escribís ni modificás ningún archivo** en repositorios (temporales sólo en `/tmp/claude-1000/-home-fernando-workspaces-workspace-dev/eb413e91-8465-41bd-a046-ce8e9f27fb41/scratchpad/n2/`). Tu entregable es **el texto completo de tu informe como respuesta final, sin preámbulo**, en español rioplatense neutro técnico; se asienta verbatim.

## Leé primero
- `/home/fernando/workspaces/workspace-dev/IA/SDD/IA.SDD-exp1/Expedientes/0001-Expedientes-Como-Comportamiento-Del-Framework/` — `README.md`, `actuaciones/001-*.md`, `002-*.md`, `evidencia/` (guiones, salidas, `SHA256SUMS`). **Es el primer ejemplar provisorio de la forma: usalo como banco de prueba** (está commiteado en la rama `expedientes/0001-caso`, commit `e8c84d9`).
- `/home/fernando/workspaces/workspace-dev/IA/SDD/IA.SDD-exp1/SDD/Devs/Rules/Mesa-Rules.md` (§6.1, §8).
- Framework: `SDD/Devs/Orchestrator/Master-Prompt.md` §10.0 y §10.1; `SDD/Guides/SDD-Development-Guide.md` §II.7 (no distribuye código; un comando publicado dentro del texto que lo funda no es código distribuido), Parte IV (marca `[enumerable]`/`[interpretativo]`, «sobre qué pregunta el criterio», «paso o prosa»), §VI.3; `SDD/Devs/Rules/Catalogo-De-Criterios.md`; `Deriva-Rules.md` §1.
- Destinos sólo lectura: `/home/fernando/workspaces/workspace-dev/PROG2/Geometria/Lab-Geometria` **por `git show main:<ruta>`/`git ls-tree main`**.

## Tu mandato
¿Cómo se verifica, con criterios `[enumerable]` y comandos que caben en el texto normativo, que un expediente cumple su **forma mínima**? ¿Qué sólo puede ser `[interpretativo]`? ¿Qué se verifica mirando git (ninguna actuación modificada después de su commit de alta; foliatura contigua; hashes que verifican; índice que enumera todas las actuaciones del directorio y nada más; punto de continuación posterior a la última actuación) y qué no? ¿`sha256` sobre archivos versionados agrega algo al commit? **Criterio decisivo del caso: forma mínima llenable en minutos y verificación enumerable.** Probá tus comandos contra 0001 y pegá salida. **No-competencia**: estándares externos; qué requisitos pedir → **solicitud de convocatoria**.

**Refutar, no verificar.** ¿0001 cumple lo que dice? (¿los hashes truncados del README coinciden con `SHA256SUMS`?) ¿Hay algo en su forma que no se pueda verificar nunca?

## Reglas
No inventar. Archivo:línea o comando+salida. Nivel P0-P3 y ancla E1-E4/C.

## Forma (tope 8)
1. Cabecera. 2. Hallazgos `N2-NN`. 3. **Criterios de aceptación propuestos** para la forma mínima, marcados `[enumerable]`/`[interpretativo]`, con comando y salida sobre 0001 para los enumerables. 4. Respuestas a Q3 forma mínima y completa; Q4 identificador (colisión medida); Q5 estados verificables; Q6 inmutabilidad y foliatura verificables; Q7 integridad por hash; Q8 vínculo evidencia→especificación verificable en los dos sentidos; Q12 punto de continuación verificable. Q1, Q2, Q9, Q10, Q11 sólo si tenés algo. 5. «Lo que revisé y está bien» (hasta 3). 6. Solicitudes de convocatoria.
