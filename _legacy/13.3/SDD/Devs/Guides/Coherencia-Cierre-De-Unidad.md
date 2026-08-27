# Nota de coherencia — El cierre de unidad, y la autocorrección

**Framework:** SDD
**Documento:** Coherencia-Cierre-De-Unidad.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-18
**Versión del conjunto resultante:** SDD 9.16
**Origen:** el Product Owner, sobre una entrega que informó y no pidió nada — «debiste informarme que haga el merge»; y sobre la incoherencia de diagnosticar sin corregir

---

## 1. Alcance

`Master-Prompt.md` §8.1 suma tres piezas y los otros dos orquestadores las adoptan: **la
autocorrección**, **el cierre de unidad** y el reconocimiento de que ese cierre **ya es un plan**.

## 2. El defecto: reglas escritas y no aplicadas por quien las escribió

**§12.1 T4 declara desde la 9.2 que el bloque de entrega termina con «qué sigue después del merge», y
§8.1 F4 declara desde la 9.8 que lo que se pide es una decisión y no una opinión.** Una entrega
posterior a las dos cerró con un informe completo y **sin pedir nada**, y el humano tuvo que preguntar
qué hacer.

**No es un defecto de las reglas: es de su aplicación**, y por el mismo que las escribió. Se registra
porque el patrón —escribir una regla y no aplicarla— ya tiene precedentes en esta serie, y porque la
respuesta correcta no era escribir una regla nueva sino cumplir las dos que había.

Lo que sí faltaba es lo de abajo.

## 3. La autocorrección, y su contraparte

**Detectar un defecto propio y ofrecerlo como opción es entregar trabajo a medias.** El framework no
distinguía dos casos que se parecen:

| Qué se detecta | Quién lo resuelve |
| --- | --- |
| Un **defecto del propio trabajo** | El agente, en la misma unidad. Se corrige y se declara |
| Una **decisión de diseño** | El humano |

**La contraparte es la mitad que evita el uso inverso de la regla.** Si corregir el defecto propio
cambia una decisión **que el humano ya tomó**, se detiene: dejó de ser un defecto del agente. El caso
límite es concreto —descubrir que una consolidación resuelta como **S4** por decisión del humano debía
ser **S1**— y sin esa mitad la regla habilitaría a deshacer decisiones ajenas «corrigiendo».

**El criterio de corte:** el agente **termina su trabajo**, no **rehace el del humano**.

## 4. El cierre de unidad

**Una unidad terminada produce dos cosas** —trabajo para revisar y decisiones para tomar— y separarlas
**obliga al humano a reconstruir el contexto dos veces**. El bloque las junta, con la entrega arriba y
las decisiones abajo, cada una con **su contexto de dos o tres líneas**.

**Ese contexto no es cortesía.** Quien decide no estuvo en la corrida: sin él, la elección se hace
sobre **el nombre de las opciones** y no sobre lo que implican. Es la misma razón por la que §8.1 exige
el avance cuantificado en lugar de «parcialmente hecho».

## 5. Por qué el cierre ya es un plan

**Es la observación del Product Owner y es la parte más valiosa de esta intervención.** Para escribir
«qué pasaría si» hay que proyectar: enumerar las opciones, estimar el impacto de cada una y recomendar
una **exige haber recorrido los caminos que no se tomaron**.

De ahí la consecuencia: **el plan no tiene por qué ser un artefacto aparte.** Lo que queda escrito en
el cierre de cada unidad —qué se hizo, qué queda abierto, qué caminos había y cuál se recomienda— **es
el plan, hecho en el momento en que se tiene la información** y no antes, cuando había que suponerla.

Es la misma lógica con la que `Migracion-Rules.md` §3 rechazó los playbooks por salto de versión: **un
plan escrito antes de tener el estado a la vista planifica sobre lo que se supone**. Y explica por qué
esta migración funcionó sin un plan maestro más allá del inventario: cada categoría cerró declarando lo
que la siguiente necesitaba saber.

## 6. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.5 → **8.6** | §8.1 suma la autocorrección, el cierre de unidad y su fundamento como plan |
| `SDD/Devs/Orchestrator/Master-Prompt-Migracion.md` | 2.7 → **2.8** | Cada fase se entrega con el cierre de unidad |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.6 → **1.7** | R3 y R4 lo adoptan |
| `CHANGELOG.md` | — | Entrada `[9.16]` |

## 7. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Sin cambios de idioma ni de nombres |
| **D4**, **D5** | Conforme | Los tres archivos subieron versión y registraron su fila; comprobación 10 en cero |
| **D6** Trazabilidad | Conforme | Los dos orquestadores **citan** §8.1 y no la redefinen |
| **D7** Neutralidad | Conforme | No se nombra ningún destino |
| **D8** | Conforme | No se toca |
| **D9** Evidencia | Conforme | El defecto de §2 es una entrega concreta de esta corrida, contrastable contra T4 y F4 |

## 8. Lo que esta nota deja anotado

**La regla nueva no impide el defecto que originó la intervención.** T4 y F4 ya existían y no se
aplicaron; §8.1 ahora tiene más forma que cumplir, no menos. **Lo que cambia es que el cierre es un
bloque único**: omitir «qué necesito de vos» deja el bloque visiblemente incompleto, mientras que antes
se podía terminar un informe sin que faltara nada a la vista.

Es el mismo argumento que sostuvo la comprobación 12 —una obligación cuya omisión **se nota** vale más
que una que depende de la memoria— y no es una garantía.

## 9. Veredicto

**APROBADO.** El agente corrige lo suyo y detiene lo ajeno, la entrega y las decisiones llegan juntas
con el contexto que hace falta para decidir, y queda registrado que ese bloque **es la planificación**
en lugar de su reemplazo.

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-18 | Emisión inicial. Registra que el defecto de origen fue **no aplicar dos reglas propias**, la autocorrección **con su contraparte**, el cierre de unidad con el contexto por decisión, y la observación del Product Owner de que **ese bloque ya es un plan** — hecho cuando se tiene la información y no antes. |
