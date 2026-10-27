# Nota de coherencia — Analizar antes de elevar

**Framework:** SDD
**Documento:** Coherencia-Logica-De-Decision.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-10-27
**Versión del conjunto resultante:** SDD 13.23
**Origen:** el Product Owner, 2026-10-27: «nada que con un analisis previo no se resuelva por si solo, y que si el analisis indicaba algo mas complejo, se lanza una mesa para buscar un camino posible mas plausible que cumpla el objetivo propuesto — o bien de caer ante una consulta al agente humano, se le puede dar sugerencias plausibles o bien una explicación»

---

## 1. Alcance

Alta de `Conocimiento/Knowledge-Logica-De-Decision.md` 1.0 y su efecto sobre tres piezas que nombran causas de detención o escalada:
`SDD/Devs/Orchestrator/Master-Prompt.md` §9 (8.22), `SDD/Devs/Rules/Mesa-Rules.md` §7 (1.6) y
`Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md` §4 (1.1). También suma la fila del índice (1.8).

## 2. El defecto, medido

Una mesa de documentación elevó al Product Owner un lote de 13 filas. Sólo 2 correspondían. Una de las evitables
era la superación de una fila propia del producto, «el producto no lleva manual», frente a un agregado de ayuda de
usuario que es aditivo y reversible. Tres causas:

- el disparador 3 (alcance) no distinguía lo aditivo de lo estructural;
- el disparador 7 trataba una decisión propia como decisión cerrada ajena;
- «la aprobación de quien puede decidirla» no tenía sujeto.

## 3. Qué cambia, pieza por pieza

| Pieza | Antes | Después |
| --- | --- | --- |
| `Master-Prompt.md` §9 | La detención empezaba en «autoridad» | La prueba de materialidad va antes de detener; la detención lleva propuesta, default que avanza y qué la cambiaría |
| `Mesa-Rules.md` §7 | Siete disparadores; el 3 cubría todo agregado | Prueba previa y ADR consecuente; el 3 sólo cubre lo estructural; el 5 suma credenciales, producción y organización ajena; el 6 escala sólo entre opciones irreversibles; el 8 es la zona del Product Owner; el 9 es la primera delegación, acotada; el 10 es el obstáculo en el momento |
| `Knowledge-Excepcion-A-Un-Conocimiento.md` §4 | «¿Cuál cede?» iba al Product Owner | Un ADR propio cede por ADR consecuente ante un cambio que pasa la prueba |

## 4. Lo que no cambia

- «Ante la duda sobre un hecho ajeno a la corrida, se detiene».
- La lista de fases irreversibles.
- Ningún punto de invocación nuevo.
- Ningún insumo obligatorio nuevo.

## 5. Copias

El conocimiento es copia fiel de `hdcm-dev/IA.Knowledge.Base` (`Knowledges/Knowledge-Logica-De-Decision.md`). Sólo
cambian la cabecera y el párrafo de equivalencias. La base lleva el chequeo de deriva del cuerpo
(`tools/deriva-logica-de-decision.py`).

## 6. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-10-27 | Emisión inicial (framework 13.23). |
