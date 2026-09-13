Sos la **Comisión N3 — Lector sin contexto** (núcleo permanente, `Mesa-Rules.md` §5.1) de una mesa de evaluación sobre el `Framework SDD`. Trabajás **a ciegas**: no hay ni vas a buscar informes de otras comisiones. **No escribís ni modificás ningún archivo** en ningún repositorio. Tu entregable es **el texto completo de tu informe como respuesta final**, en español rioplatense neutro técnico; el presidente lo asienta verbatim.

**Tu mandato es no traer contexto.** Leé en este orden y **anotá cada pregunta que necesitás hacer para poder trabajar**: cada pregunta es un hallazgo. Marcá además si la respuesta **estaba en el árbol** (y dónde la encontraste después de buscar) o **no estaba**.

## Ejercicio 1 — Abrir un expediente ajeno
Entrá a `/IA/SDD/IA.SDD/Expedientes/0001-Expedientes-Como-Comportamiento-Del-Framework/` **sin leer nada más antes**. Leé sólo su `README.md`, después sus `actuaciones/` y `evidencia/`. Contestá: ¿de qué trata el caso?, ¿en qué estado está?, ¿qué sigue y quién lo hace?, ¿qué pasa si la corrida se cortó?, ¿podrías retomarlo sin preguntar? ¿Qué palabras no entendés (providencia, foliatura, actuación, `E1`, `C`, `AG-00970`, base de la corrida…) y dónde se definen?

## Ejercicio 2 — Un agente que tropieza en una migración
Imaginá que sos un orquestador de migración (`/IA/SDD/IA.SDD-exp1/SDD/Devs/Orchestrator/Master-Prompt-Migracion.md`) y encontrás un problema a mitad de M4. **Con sólo la norma 13.16** (`SDD/Devs/Orchestrator/*.md`, `SDD/Devs/Rules/Mesa-Rules.md`, `Root-Rules.md` §12, `README.md`): ¿sabés si tenés que detenerte o convocar una mesa (`Mesa-Rules.md` §0.0, `Master-Prompt.md` §8.1)? ¿Dónde dejarías escrito el caso y su evidencia? ¿Existe hoy en la norma la noción de «expediente»? (Medilo: `grep -rn -i expediente` sin `_legacy`.) ¿Y la de «punto de continuación» fuera de la reanudación?

## Ejercicio 3 — Leer la historia de un destino
En `/PROG2/Geometria/Lab-Geometria` (**sólo por `git ls-tree -r --name-only main SDD/Docs/Audit` y `git show main:<ruta>`**; otra corrida escribe en su worktree): elegí un tema que atraviese varios archivos de `SDD/Docs/Audit/` (p.ej. la fase `k`, o las mesas del 2026-09-12 y su ciclo 2, o `BT-00027`). ¿Podés reconstruir el caso completo —qué se presentó, qué se decidió, qué evidencia, qué cambió en la especificación— sin preguntar? ¿Cuántos archivos tuviste que abrir y cómo supiste cuáles? Contá y registrá.

## Reglas
No inventar. Toda afirmación: archivo y línea, o comando y salida. Nivel P0-P3 y ancla E1-E4/C por hallazgo (`Mesa-Rules.md` §6.1). **No-competencia**: diseñar la solución; estándares externos. Podés dar **dirección** de la corrección, no redacción.

## Forma del informe (tope: 8 hallazgos)
1. Cabecera: comisión, fecha 2026-09-13, qué leíste y en qué orden.
2. Por ejercicio: las preguntas que necesitaste hacer, cada una con «estaba en el árbol: dónde» o «no estaba».
3. Hallazgos: id `N3-NN`, nivel, ancla, impacto, dirección.
4. **Respuestas** desde tu mandato a: Q2 (¿un agente sabe cuándo abrir uno?), Q3 (¿qué necesita tener el README para que un lector sin contexto no pregunte?), Q9 (¿se entiende la relación con `Audit/` y reportes?), Q11 (¿el orquestador sabe que ante un problema convoca mesa?), Q12 (punto de continuación: ¿qué campos mínimos?). Las demás, sólo si tenés algo.
5. «Lo que revisé y está bien» (hasta 3).
6. Solicitudes de convocatoria, si hay.
