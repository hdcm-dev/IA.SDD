# Nota de coherencia — Las referencias como dato derivado

**Framework:** SDD
**Documento:** Coherencia-Referencias-Derivadas.md
**Versión:** 1.0
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

**Lo que queda anotado y no se hace.** La variante estructural de la causa A —que los documentos
citen solo por identificador y la ruta se derive de un índice de nivel producto— resolvería el
problema de raíz en lugar de repararlo. Es posible desde la 7.0, porque recién con el ámbito de
unicidad en el producto un identificador es una dirección suficiente. **No se aplica**, y la
condición para evaluarla queda escrita: antes hay que medir qué proporción del corpus referencia por
ruta y qué proporción ya lo hace por identificador. Sin ese número es una decisión a ciegas.

## 6. Veredicto

**APROBADO.** La intervención corrige la causa de cuatro huecos con una regla y la de los otros dos
con una pregunta de checklist, sin tocar ninguna invariante y sin invalidar documentación emitida.
