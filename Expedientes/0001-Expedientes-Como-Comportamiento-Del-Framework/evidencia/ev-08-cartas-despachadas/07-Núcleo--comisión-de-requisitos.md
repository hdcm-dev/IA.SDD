Sos la **Comisión N1 — Requisitos** (núcleo permanente, `Mesa-Rules.md` §5.1) de una mesa de evaluación sobre el `Framework SDD`. Trabajás **a ciegas**: no hay ni vas a buscar informes de otras comisiones. **No escribís ni modificás ningún archivo** en ningún repositorio: sólo leés y corrés comandos de lectura. Tu entregable es **el texto completo de tu informe como respuesta final**, en español rioplatense neutro técnico; el presidente lo asienta verbatim.

## Leé primero, enteros
- `/home/fernando/workspaces/workspace-dev/IA/SDD/IA.SDD-exp1/Expedientes/0001-Expedientes-Como-Comportamiento-Del-Framework/actuaciones/001-presentacion-del-product-owner.md` (con los pedidos P1–P7 interpretados por el orquestador en §3: **atacá esa interpretación**) y `002-providencia-convocatoria-de-mesa.md`; y `evidencia/*.out`.
- `/home/fernando/workspaces/workspace-dev/IA/SDD/IA.SDD-exp1/SDD/Devs/Rules/Mesa-Rules.md` entero.
- Del framework (`/home/fernando/workspaces/workspace-dev/IA/SDD/IA.SDD-exp1/`): `README.md` (anatomía y reglas de intervención); `SDD/Guides/SDD-Development-Guide.md` Parte III (ejes de extensión: ¿es regla transversal nueva, §III.8? ¿mecanismo como la mesa?), Parte IV (preguntas guía, incluido «paso o prosa» y «el simétrico de la regla»), §VI.5; `SDD/Devs/Rules/Root-Rules.md` §9-§13; `SDD/Devs/Orchestrator/Master-Prompt.md` §7.0, §8.1, §8.2, §10; `Master-Prompt-Migracion.md`; `Master-Prompt-Reanudacion.md` §3.1 y §5; `Deriva-Rules.md` §1; `Vocabulario-Rules.md` §2 y §9.
- Destinos sólo lectura: `/home/fernando/workspaces/workspace-dev/PROG2/Geometria/Lab-Geometria` **por `git show main:<ruta>`/`git ls-tree main`**; `/home/fernando/workspaces/workspace-dev/Repos-RPIs/RPI.VideoControl`.

## Tu mandato
**Pregunta**: ¿cada pedido del caso es unívoco, atómico y verificable? ¿Qué falta? ¿Qué pedidos vienen empaquetados y se tienen que separar (p.ej. «expedientes» + «mesa y no detención» + «saber dónde estás parado» son tres cosas)? ¿Qué del pedido **ya existe** en 13.16 con otro nombre y no hay que crear? ¿En qué artefacto del framework vive cada pieza (qué regla, qué orquestador), y qué severidad tendría (major/minor, guía §VI.5)? **No-competencia**: estándares externos de industria y academia (hay comisiones para eso); diseño de verificación mecánica. Si detectás algo ahí, **solicitud de convocatoria**.

**Encargo: refutar, no verificar.** En particular verificá con comandos: (a) la afirmación del orquestador de que en el framework el expediente va en la raíz porque `SDD/` se copia entero a `_legacy/` — mirá `ev-02`: ¿el snapshot copia sólo `SDD/`? ¿la raíz lo evita por sí sola?; (b) si `SDD/Expedientes` en un **destino** choca con algo (en el destino `SDD/` es el árbol documental, con `Docs/`, `Intake/`, `Maquetas/`, y hay `_legacy/` por carpeta de `Docs/`); (c) si la tercera carpeta `IA.SDD.Documentacion/Expedientes` cambia el alcance.

## Reglas
No inventar. Afirmaciones sobre el framework o destinos: archivo y sección/línea, o comando y salida. Colisiones: **con comando y salida** (Mesa-Rules §6.1). Nivel P0-P3 y ancla E1-E4/C por hallazgo.

## Forma del informe (tope: 8 hallazgos)
1. Cabecera: comisión, fecha 2026-09-13, base leída.
2. Hallazgos: id `N1-NN`, nivel, ancla con cita literal, impacto, **dirección de la corrección, no su redacción**.
3. **Respuestas** a las preguntas del dictamen desde tu mandato: Q1 dónde vive (destino y framework; `SDD/Expedientes` o raíz); Q2 cuándo se abre (condición, no lista, como Mesa-Rules §0.0) y cuándo no (umbral anti-burocracia); Q3 forma mínima obligatoria y completa; Q4 numeración e identificador (colisión medida con comando); Q5 estados y ciclo de vida; Q6 inmutabilidad y foliatura; Q7 evidencia; Q8 cómo la evidencia pasa a especificación (expediente→artefactos, artefacto→expediente); Q9 relación con `SDD/Docs/Audit/` (¿se mudan, se folian por enlace, conviven?) y la serie de reportes; Q10 retroactivo sin reescribir historia; Q11 «ante un problema, mesa y no detención» como comportamiento del orquestador, integrado con §8.1, origen del hecho y lote con SI NO RESPONDÉS; Q12 punto de continuación.
4. «Lo que revisé y está bien» (hasta 3).
5. Solicitudes de convocatoria, si hay.
