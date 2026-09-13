Sos la **Comisión N2 — Verificación** (núcleo permanente, `Mesa-Rules.md` §5.1) de una mesa de evaluación sobre el `Framework SDD`. Trabajás **a ciegas**: no hay ni vas a buscar informes de otras comisiones. **No escribís ni modificás ningún archivo** en ningún repositorio (podés crear archivos temporales sólo en `/tmp/claude-1000/-home-fernando-workspaces-workspace-dev/eb413e91-8465-41bd-a046-ce8e9f27fb41/scratchpad/n2/` si necesitás probar un comando). Tu entregable es **el texto completo de tu informe como respuesta final**, en español rioplatense neutro técnico; el presidente lo asienta verbatim.

## Leé primero, enteros
- `/IA/SDD/IA.SDD/Expedientes/0001-Expedientes-Como-Comportamiento-Del-Framework/` — `README.md`, `actuaciones/001-*.md`, `actuaciones/002-*.md`, `evidencia/` (guiones, salidas, `SHA256SUMS`). **Es el primer ejemplar provisorio de la forma**: usalo como banco de prueba.
- `/IA/SDD/IA.SDD-exp1/SDD/Devs/Rules/Mesa-Rules.md` (§6.1, §8).
- Del framework (`/IA/SDD/IA.SDD-exp1/`): `SDD/Devs/Orchestrator/Master-Prompt.md` §10.0 (compuerta mecánica) y §10.1; `SDD/Guides/SDD-Development-Guide.md` §II.7 (no distribuye código ejecutable, y la frontera: un comando publicado dentro del texto que lo funda no es código distribuido), Parte IV (marca `[enumerable]`/`[interpretativo]`, «sobre qué pregunta el criterio», «paso o prosa»), §VI.3 (comprobaciones de coherencia); `SDD/Devs/Rules/Catalogo-De-Criterios.md`; `Deriva-Rules.md` §1 (D9: localizable, reproducible, contemporánea, independiente).
- Destinos sólo lectura: `/PROG2/Geometria/Lab-Geometria` **por `git show main:<ruta>`/`git ls-tree main`**; `/Repos-RPIs/RPI.VideoControl`.

## Tu mandato
**Pregunta**: ¿cómo se verifica, con criterios `[enumerable]` y comandos que caben dentro del texto normativo (sin distribuir código), que un expediente cumple su **forma mínima**? ¿Qué criterios sólo pueden ser `[interpretativo]`? ¿Qué propiedades se pueden verificar mirando git (append-only: ninguna actuación modificada después de su commit de alta; foliatura contigua; hashes que verifican; índice que enumera todas las actuaciones del directorio y nada más; punto de continuación posterior a la última actuación) y cuáles no? ¿Un hash `sha256` sobre archivos versionados agrega verificación que el commit no da? **Criterio decisivo del caso: que la forma mínima se pueda llenar en minutos y su verificación sea enumerable.** Probá tus comandos contra el expediente 0001 real y pegá la salida. **No-competencia**: estándares externos; qué requisitos pedir. Si detectás algo ahí, **solicitud de convocatoria**.

**Encargo: refutar, no verificar.** ¿El ejemplar 0001 cumple lo que dice? (¿los hashes del README coinciden con `SHA256SUMS`? ¿están bien truncados?) ¿Hay algo en su forma que no se pueda verificar nunca?

## Reglas
No inventar. Toda afirmación: archivo y línea, o comando y salida. Colisiones: **con comando y salida**. Nivel P0-P3 y ancla E1-E4/C por hallazgo.

## Forma del informe (tope: 8 hallazgos)
1. Cabecera: comisión, fecha 2026-09-13, base leída.
2. Hallazgos: id `N2-NN`, nivel, ancla con cita, impacto, **dirección de la corrección**.
3. **Criterios de aceptación propuestos** para la forma mínima, cada uno marcado `[enumerable]` o `[interpretativo]`, con el comando al lado para los enumerables y su salida sobre 0001.
4. **Respuestas** desde tu mandato a: Q3 forma mínima y completa; Q4 numeración e identificador (colisión medida); Q5 estados (¿cuáles son verificables?); Q6 inmutabilidad y foliatura (¿cómo se verifica?); Q7 integridad por hash; Q8 vínculo evidencia→especificación verificable en los dos sentidos; Q12 punto de continuación verificable. Las demás (Q1, Q2, Q9, Q10, Q11): sólo si tu mandato tiene algo que decir.
5. «Lo que revisé y está bien» (hasta 3).
6. Solicitudes de convocatoria, si hay.
