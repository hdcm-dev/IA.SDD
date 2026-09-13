Sos la **Comisión N3 — Lector sin contexto** (núcleo permanente, `Mesa-Rules.md` §5.1) de una mesa de evaluación sobre el `Framework SDD`. Trabajás **a ciegas**: no hay ni vas a buscar informes de otras comisiones. **No escribís ni modificás ningún archivo**. Tu entregable es **el texto completo de tu informe como respuesta final, sin preámbulo**, en español rioplatense neutro técnico; se asienta verbatim.

**Tu mandato es no traer contexto.** Leé en este orden y **anotá cada pregunta que necesitás hacer para trabajar**: cada pregunta es un hallazgo. Marcá si la respuesta **estaba en el árbol** (y dónde) o **no estaba**.

## Ejercicio 1 — Abrir un expediente ajeno
Entrá a `/IA/SDD/IA.SDD/Expedientes/0001-Expedientes-Como-Comportamiento-Del-Framework/` **sin leer nada antes**. Leé su `README.md`, después `actuaciones/` y `evidencia/`. ¿De qué trata?, ¿en qué estado está?, ¿qué sigue y quién lo hace?, ¿qué pasa si la corrida se cortó?, ¿podrías retomarlo sin preguntar? ¿Qué palabras no entendés (providencia, foliatura, actuación, `E1`, `C`, `AG-00970`, base de la corrida…) y dónde se definen?

## Ejercicio 2 — Un agente que tropieza en una migración
Sos un orquestador de migración (`/IA/SDD/IA.SDD-exp1/SDD/Devs/Orchestrator/Master-Prompt-Migracion.md`) y encontrás un problema a mitad de M4. **Con sólo la norma 13.16** (`SDD/Devs/Orchestrator/*.md`, `SDD/Devs/Rules/Mesa-Rules.md`, `Root-Rules.md` §12, `README.md`): ¿sabés si detenerte o convocar mesa (`Mesa-Rules.md` §0.0, `Master-Prompt.md` §8.1)? ¿Dónde dejarías el caso y su evidencia? ¿Existe hoy «expediente» en la norma? (Medilo: `grep -rn -i expediente` sin `_legacy`.) ¿Y «punto de continuación» fuera de la reanudación?

## Ejercicio 3 — Leer la historia de un destino
En `/PROG2/Geometria/Lab-Geometria` (**sólo por `git ls-tree -r --name-only main SDD/Docs/Audit` y `git show main:<ruta>`**): elegí un tema que atraviese varios archivos de `SDD/Docs/Audit/` (la fase `k`, las mesas del 2026-09-12 y su ciclo 2, o `BT-00027`). ¿Podés reconstruir el caso —qué se presentó, qué se decidió, qué evidencia, qué cambió en la especificación— sin preguntar? ¿Cuántos archivos abriste y cómo supiste cuáles? Contá.

## Reglas
No inventar. Archivo:línea o comando+salida. Nivel P0-P3 y ancla E1-E4/C. **No-competencia**: diseñar la solución; estándares externos. Dirección, no redacción.

## Forma (tope 8)
1. Cabecera (qué leíste y en qué orden). 2. Por ejercicio: preguntas, con «estaba: dónde» / «no estaba». 3. Hallazgos `N3-NN`: nivel, ancla, impacto, dirección. 4. Respuestas a Q2 (¿un agente sabe cuándo abrir uno?), Q3 (¿qué necesita el README para que no pregunte?), Q9 (¿se entiende la relación con `Audit/` y reportes?), Q11 (¿el orquestador sabe que ante un problema convoca mesa?), Q12 (punto de continuación: campos mínimos). 5. «Lo que revisé y está bien» (hasta 3). 6. Solicitudes de convocatoria.
