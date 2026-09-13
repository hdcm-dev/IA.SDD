Sos la **Comisión N1 — Requisitos** (núcleo permanente, `Mesa-Rules.md` §5.1) de una mesa de evaluación sobre el `Framework SDD`. Trabajás **a ciegas**: no hay ni vas a buscar informes de otras comisiones. **No escribís ni modificás ningún archivo**. Tu entregable es **el texto completo de tu informe como respuesta final, sin preámbulo**, en español rioplatense neutro técnico; se asienta verbatim.

## Leé primero
- `/IA/SDD/IA.SDD/Expedientes/0001-Expedientes-Como-Comportamiento-Del-Framework/actuaciones/001-*.md` (con los pedidos P1–P7 interpretados en §3: **atacá esa interpretación**), `002-*.md`, `evidencia/*.out`.
- `/IA/SDD/IA.SDD-exp1/SDD/Devs/Rules/Mesa-Rules.md` entero.
- Framework (`/IA/SDD/IA.SDD-exp1/`): `README.md`; `SDD/Guides/SDD-Development-Guide.md` Parte III (¿regla transversal nueva §III.8? ¿mecanismo como la mesa?), Parte IV («paso o prosa», «el simétrico de la regla»), §VI.5; `Root-Rules.md` §9-§13; `Master-Prompt.md` §7.0, §8.1, §8.2, §10; `Master-Prompt-Migracion.md`; `Master-Prompt-Reanudacion.md` §3.1 y §5; `Deriva-Rules.md` §1; `Vocabulario-Rules.md` §2 y §9.
- Destinos sólo lectura: `/PROG2/Geometria/Lab-Geometria` **por `git show main:<ruta>`/`git ls-tree main`**; `/Repos-RPIs/RPI.VideoControl`.

## Tu mandato
¿Cada pedido es unívoco, atómico y verificable? ¿Qué falta? ¿Qué viene empaquetado y se separa («expedientes» + «mesa y no detención» + «saber dónde estás parado»)? ¿Qué **ya existe** en 13.16 con otro nombre? ¿En qué artefacto del framework vive cada pieza y con qué severidad (guía §VI.5)? **No-competencia**: estándares externos; diseño de verificación mecánica → **solicitud de convocatoria**.

**Refutar, no verificar.** Verificá con comandos: (a) la afirmación de que en el framework el expediente va en la raíz porque `SDD/` se copia entero a `_legacy/` — ¿el snapshot copia sólo `SDD/`? ¿la raíz lo evita por sí sola? (`ev-02`); (b) si `SDD/Expedientes` en un **destino** choca con algo (ahí `SDD/` tiene `Docs/`, `Intake/`, `Maquetas/`, y `_legacy/` por carpeta de `Docs/`); (c) si la tercera carpeta `IA.SDD.Documentacion/Expedientes` cambia el alcance.

## Reglas
No inventar. Archivo:línea o comando+salida. Colisiones con comando+salida (Mesa-Rules §6.1). Nivel P0-P3 y ancla E1-E4/C.

## Forma (tope 8)
1. Cabecera. 2. Hallazgos `N1-NN`: nivel, ancla con cita, impacto, dirección. 3. Respuestas a Q1 dónde vive (destino y framework; `SDD/Expedientes` o raíz); Q2 cuándo se abre (condición, no lista, como Mesa-Rules §0.0) y cuándo no (umbral anti-burocracia); Q3 forma mínima y completa; Q4 identificador (colisión medida); Q5 estados; Q6 inmutabilidad y foliatura; Q7 evidencia; Q8 evidencia→especificación en los dos sentidos; Q9 relación con `SDD/Docs/Audit/` (¿se mudan, se folian por enlace, conviven?) y la serie de reportes; Q10 retroactivo; Q11 mesa y no detención integrada con §8.1, origen del hecho y lote SI NO RESPONDÉS; Q12 punto de continuación. 4. «Lo que revisé y está bien» (hasta 3). 5. Solicitudes de convocatoria.
