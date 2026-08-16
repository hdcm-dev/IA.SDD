# Nota de coherencia — Las referencias como dato derivado

**Framework:** SDD
**Documento:** Coherencia-Referencias-Derivadas.md
**Versión:** 1.1
**Estado:** Vigente
**Fecha:** 2026-08-15
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 8.4

---

## 1. Alcance

Corrección de **causa** sobre los seis huecos que la migración normativa de un destino real destapó y
que las versiones 8.1 a 8.3 habían resuelto uno por uno. El análisis posterior mostró que no eran
seis defectos independientes: eran **dos**.

## 2. Las dos causas

| Causa | Huecos que explica | Naturaleza |
| --- | --- | --- |
| **Una referencia es un dato derivado y el framework la trataba como texto** | El chequeo que incluía snapshots como origen; el archivado que no reescribía rutas; la etiqueta separada de su destino; la profundidad que cambia al fundir | Cuatro de los seis |
| **Una operación produce situaciones que su regla no declara** | El puntero del snapshot al renombrar; la colisión de nombres al fundir | Dos de los seis |

**La evidencia de que la primera es recalculable y no interpretable**: de 703 enlaces rotos en el
destino migrado, **los 703** se reconectaron resolviendo por identificador, sin una sola decisión
humana.

## 3. Inventario

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `Root-Rules.md` | 5.1 → **5.2** | §10 suma **R5**: la identidad de una referencia es el identificador del destino, y la ruta es derivada |
| `Master-Prompt.md` | 7.2 → **7.3** | §10.0 pasa de avisar a **reparar** cuando la resolución es unívoca |
| `SDD-Development-Guide.md` | 1.8 → **1.9** | Parte IV suma las cuatro preguntas sobre lo que una operación **produce** |
| `CHANGELOG.md` | — | Entrada `[8.4]` |
| `_legacy/8.3/` | — | Conjunto superado, 66 archivos |

## 4. Verificación de invariantes

| Invariante | Estado |
| --- | --- |
| **D6** Trazabilidad | Conforme y **reforzada**: exigir el identificador en toda referencia es lo que hace la trazabilidad recalculable en lugar de frágil |
| **D9** Evidencia | Conforme. La afirmación de que las referencias son recalculables se sostiene en una medición reproducible sobre un destino real |
| **D1** a **D5**, **D7**, **D8** | Conformes, sin cambios |

## 5. Observaciones

**Por qué la corrección de causa llegó después de las de síntoma, y por qué está bien.** Las
versiones 8.1 a 8.3 resolvieron los huecos a medida que la migración los encontraba. Recién con los
seis a la vista se pudo ver que cuatro eran el mismo. Intentar la causa antes de tener los casos
habría sido diseñar sobre una intuición: el patrón se reconoce con la muestra completa, no con el
primer caso.

**Lo que cambia de naturaleza en el instrumento.** La compuerta pasa de contar defectos a repararlos
cuando la reparación es unívoca, y reserva el hallazgo para lo que exige criterio. Es la misma
distinción que `Master-Prompt.md` §10.0 ya hacía entre propiedades enumerables e interpretativas,
llevada un paso más: de lo enumerable, lo que además es **corregible sin decisión** no debería
consumir la atención de nadie.

**Lo que queda anotado y no se hace.** La variante estructural de la causa A —que la ruta se derive
de un índice de nivel producto en lugar de escribirse— resolvería el problema de raíz en lugar de
repararlo. Es posible desde la 7.0, porque recién con el ámbito de unicidad en el producto un
identificador es una dirección suficiente. **No se aplica**, y la condición para evaluarla era medir
antes qué proporción del corpus referencia por ruta y cuál por identificador.

**Esa medición se hizo, y corrige la propuesta.** Sobre el destino migrado, 2.160 referencias a
artefactos identificados:

| | Referencias | |
| --- | --- | --- |
| Nombran el identificador, R5 cumplida | 2.035 | **94,2 %** |
| Solo la ruta | 125 | 5,8 % |

El cumplimiento es mucho más alto de lo que la propuesta suponía. Pero el 5,8 % restante dice algo que
cambia el diseño: **las 125 son enlaces cuya etiqueta es el título del documento** —«[Canjear
credenciales por un acceso firmado](CU-00001-…)»— y no un descuido. Es una forma legítima, y en medio
de una oración se lee mejor que un identificador.

De modo que la variante estructural, formulada como «citar por identificador **en lugar de** por
título», resolvería el problema técnico y empeoraría la lectura. **La forma correcta es conservar la
etiqueta descriptiva y exigir el identificador junto a ella**, no en su reemplazo. Con eso, el
esfuerzo pendiente no es reescribir el corpus: es completar 125 referencias.

Queda anotada con esa corrección, y ya no como decisión a ciegas.

## 6. Validación medida sobre un destino real

La intervención se verificó corriendo la compuerta, tal como la 8.4 la define, sobre el árbol migrado:

| | Reporta |
| --- | --- |
| Compuerta anterior | **660** |
| Compuerta 8.4 | **2** |

Los 658 que desaparecen se excluyen por salir de snapshots de `_legacy/`; los 2 que quedan son
hallazgos reales —un destino que no existe con ningún nombre— y son **anteriores** a la migración.
Reducción de ruido del 99,7 % **sin perder ningún hallazgo real**, que es lo que separa un instrumento
que se usa de uno que se desactiva.

Se verificó además la comprobación que R5 habilita y que antes no existía —que la etiqueta y el
destino de un enlace nombren el mismo identificador—: **cero discrepancias**. Es precisamente el error
que la pasada de aplicación de la migración cometió y que ninguna lectura habría encontrado, porque
el destino resuelve y lo roto es lo que el lector ve.

## 7. Veredicto

**APROBADO.** La intervención corrige la causa de cuatro huecos con una regla y la de los otros dos
con una pregunta de checklist, sin tocar ninguna invariante y sin invalidar documentación emitida.

---

## Control de cambios

| Versión | Fecha | Descripción |
| --- | --- | --- |
| 1.0 | 2026-08-15 | Nota inicial: las dos causas detrás de los seis huecos, con su corrección. |
| 1.1 | 2026-08-15 | Se incorpora la **validación medida** sobre el destino migrado —la compuerta pasa de 660 avisos a 2 hallazgos, y la comprobación de etiqueta contra destino da cero discrepancias— y la **medición que la propia nota pedía** antes de evaluar la variante estructural: 94,2 % de las referencias ya nombran el identificador. El 5,8 % restante resultó ser etiquetas con el título del documento, que es forma legítima, de modo que la propuesta se corrige: el identificador va **junto a** la etiqueta descriptiva y no en su reemplazo. |
