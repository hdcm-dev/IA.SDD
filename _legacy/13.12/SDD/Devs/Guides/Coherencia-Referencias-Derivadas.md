# Nota de coherencia — Las referencias como dato derivado

**Framework:** SDD
**Documento:** Coherencia-Referencias-Derivadas.md
**Versión:** 1.2
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

**Lo que quedaba anotado, y cómo se cerró.** La variante estructural de la causa A —que la ruta se
derive de un índice de nivel producto en lugar de escribirse— resolvería el problema de raíz en lugar
de repararlo. Es posible desde la 7.0, porque recién con el ámbito de unicidad en el producto un
identificador es una dirección suficiente. La condición para evaluarla era **medir antes** qué
proporción del corpus referencia por ruta y cuál por identificador.

**La medición se hizo en la 8.16, sobre 759 documentos de tres destinos reales**, y el resultado
**descarta la variante**. Ver §5.1.

## 5.1 La medición, y por qué descarta la variante

**Corpus:** 759 documentos de tres destinos distintos, ninguno de ellos el que originó esta nota.

| | Documentos | Enlaces por ruta | Citas por identificador |
| --- | --- | --- | --- |
| Destino A | 158 | 1465 | 12 049 |
| Destino B | 176 | 171 | 7479 |
| Destino C | 425 | 2159 | 14 961 |
| **Total** | **759** | **3795** | **34 489** |

**El corpus ya referencia por identificador en el 90 % de los casos.** La proporción es **9,9 % por
ruta contra 90,1 % por identificador**, y no porque una regla lo exija: es cómo se escribe. La
variante propone imponer estructuralmente lo que la práctica ya hace.

**Y el 10 % restante no es sustituible.** De los 3795 enlaces por ruta:

| | Cantidad | Proporción |
| --- | --- | --- |
| Apuntan a un documento **con** identificador —los únicos reemplazables— | 2099 | 55,3 % |
| Apuntan a un documento **sin** identificador: `README.md`, la especificación de la categoría, un índice | 1696 | **44,7 %** |
| Ya llevan el identificador **en el texto del enlace** | 2165 | 57,0 % |

**Casi la mitad de las rutas apuntan a documentos que no tienen identificador**, y el índice de nivel
producto no puede direccionarlos: no hay nada que indexar. La variante alcanzaría, como techo, al
**55 % del 10 %**.

**El defecto que vendría a resolver mide 0,08 %.** Tres enlaces rotos en 3795, en 759 documentos, y la
compuerta mecánica que la 8.4 incorporó repara sin decisión los que son unívocos.

**El argumento que la cierra es de la 8.14.** El índice de nivel producto sería **una fuente
declarativa nueva que hay que mantener**, y no es subproducto de ningún acto: agregar un documento
obliga a acordarse de indexarlo. Es exactamente la clase de fuente que `Master-Prompt-Reanudacion.md`
§1.1 R3 manda evitar. **Cambiaríamos 3 enlaces rotos por un índice que se degrada en silencio**, que
es el defecto más caro de los dos.

**Una salvedad honesta sobre el corpus.** Los tres destinos están generados contra el conjunto **6.0**,
anterior al ámbito de unicidad en el producto que la 7.0 introdujo, y por lo tanto anterior a la
condición que hace posible la variante. Lo que la medición captura es **cómo se escribe**, no cómo se
resuelve, y en eso los tres destinos son válidos: nadie escribió esas 34 489 citas por identificador
porque una regla se lo pidiera.

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
| 1.2 | 2026-08-16 | §5 pasa de «lo que queda anotado» a **cómo se cerró**, y **§5.1 es nueva** con la medición que la condición pedía: 759 documentos de tres destinos, **9,9 % por ruta contra 90,1 % por identificador**, y de las rutas **44,7 % apuntan a documentos sin identificador**, que ningún índice puede direccionar. La variante estructural **se descarta**. |
