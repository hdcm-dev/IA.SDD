# Nota de coherencia — Toda detención lleva análisis y propuesta

**Framework:** SDD
**Documento:** Coherencia-Detencion-Con-Propuesta.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-17
**Versión del conjunto resultante:** SDD 9.8
**Origen:** el Product Owner — «vos me hacés una pregunta, súper resumida, sin contexto, sin nada, y se pone difícil darte una decisión»
**Emitida:** con retraso, en la 9.9. Ver §8.

---

## 1. Alcance

`Master-Prompt.md` §8.1, nueva, y la adopción de su forma por las cuatro familias de detención del
método.

## 2. El defecto, medido

| Familia | ¿Llevaba con qué decidir? |
| --- | --- |
| **1 · Confirmación de un plan** | **Sí**, por construcción: presenta el plan entero |
| **2 · Falta de dato** (§9) | **No.** Ocho campos, y el central es «pregunta concreta» |
| **3 · Arbitraje** (§7.0) | **No**, y era el peor: **no declaraba formato alguno** |
| **4 · Traspaso** (§12.1 T4) | **Sí**: su bloque de entrega lo declara |

**Las dos que presentan llevaban contexto; las dos que preguntan, no.**

## 3. El error de categoría que estaba abajo

§7.0 declara, con razón, que el agente **no tiene autoridad** para arbitrar. Y de ahí sacaba una
conclusión que no se sigue: que tampoco aportara su **análisis**.

**Son cosas distintas.** No tener autoridad es una afirmación sobre **quién firma**. No tener capacidad
sería sobre **quién puede analizar**. Tratarlas como una sola produce el peor de los dos mundos: **el
agente no decide, y encima el humano decide con menos información de la que el agente tenía.**

**La consecuencia que lo vuelve importante: la propuesta es auditable y la pregunta no.** Si el agente
propone con fundamento y el humano decide distinto, **el desacuerdo queda visible y registrado**. Si el
agente sólo pregunta, no hay contra qué disentir, y más adelante no se puede distinguir una decisión
informada de una tomada sin base — que es lo mismo que la 9.5 escribió para la reanudación.

**Y el modo de falla que hay que vigilar: la propuesta que arrastra.** Si el agente siempre propone y
el humano siempre acepta, **la autoridad migra de hecho** aunque el reglamento diga otra cosa, y no se
nota porque cada caso individual parecía razonable. Las dos defensas están en §8.1: **F3**, la
alternativa obligatoria, que muestra que había otro camino; y que el fundamento sea **falsable**. Una
propuesta que no se puede refutar no es una propuesta: es una decisión disfrazada.

## 4. Las cuatro reglas y de dónde sale cada una

| | Regla | Caso real |
| --- | --- | --- |
| **F1** | El avance se cuantifica, no se adjetiva | No se puede aprobar el cierre de una categoría sin saber si lo que falta es el 5 % accesorio o el 40 % que la sostiene |
| **F2** | Cada opción declara qué se conserva de lo hecho | Una maqueta que dejó de reflejar el intake: **modificar** o **replantear** se decide por eso, y lo sabe quien abrió la maqueta, no quien aprueba |
| **F3** | La propuesta lleva su alternativa | Una recomendación sin segunda opción se lee como un único camino y deja de leerse |
| **F4** | Se pide una decisión, no una opinión | Responder tiene que ser elegir, no redactar |

## 5. Inventario

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.3 → **8.4** | **§8.1** nueva; §9 suma propuesta, alternativa y qué queda bloqueado; §7.0 declara con qué se presenta un arbitraje |
| `SDD/Devs/Orchestrator/Master-Prompt-Migracion.md` | 2.6 → **2.7** | Sus detenciones llevan **avance cuantificado** |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.5 → **1.6** | §4.0 se declara **caso particular** de §8.1 |
| `SDD/Devs/Rules/Maqueta-Rules.md` | 4.1 → **4.2** | El paso 5 suma el caso de la maqueta desactualizada |

## 6. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D5** | Conforme | Los cuatro archivos subieron versión y registraron su fila |
| **D6** Trazabilidad | Conforme | Los tres artefactos que la adoptan **citan** §8.1 |
| **D7** Neutralidad | Conforme | Ningún destino nombrado |
| **D8** | Conforme | No se toca |
| **D9** Evidencia | **Conforme, y es el punto** | Las cuatro familias se abrieron una por una para ver qué declaraba cada una |

## 7. Lo que deja anotado, y un pendiente reencuadrado

**El inventario de detenciones sigue sin mirarse completo**, pero el pendiente estaba **mal
planteado**. Lo anoté como un problema de **cantidad** —«hay más de quince»— y no lo es:

> **El costo de una detención no está en que exista: está en cuánto trabajo le transfiere al humano.**

Una con análisis, avance cuantificado y propuesta cuesta segundos. Una que pregunta en seco cuesta
reconstruir el estado. **Quince de las primeras son baratas; tres de las segundas son caras.** La
revisión pendiente no es reducir el número: es **auditar cuáles transfieren trabajo**, y ésas o se
arreglan con §8.1 o se eliminan.

## 8. Por qué esta nota se emitió tarde

**La 9.8 tocó cuatro archivos y §VI.3 exige nota.** Se emitió en la 9.9. Ver §7 de
`Coherencia-Compuerta-De-Arranque.md`, que tiene el mismo problema y la misma causa.

## 9. Veredicto

**APROBADO**, con la salvedad de §8.

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-17 | Emisión inicial, **con retraso**: la intervención es de la 9.8 y la nota se emitió en la 9.9. Registra la distinción **autoridad / capacidad**, la propuesta como artefacto **auditable**, el modo de falla de **la propuesta que arrastra**, y el **reencuadre del pendiente** de las detenciones. |
