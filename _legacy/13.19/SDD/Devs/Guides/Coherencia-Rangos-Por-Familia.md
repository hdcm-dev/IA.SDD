# Nota de coherencia — El reparto de rangos es por familia

**Framework:** SDD
**Documento:** Coherencia-Rangos-Por-Familia.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-15
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 8.1

---

## 1. Alcance

Corrección acotada sobre el mapa de rangos de identificadores, encontrada al **ejecutar la migración
normativa de un destino real** con la versión 8.0 recién publicada, y aplicada antes de correr esa
migración.

Es la primera corrección del framework cuyo origen no es un reporte de evidencia ni un análisis, sino
una corrida.

## 2. Inventario

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `Master-Prompt.md` | 7.0 → **7.1** | §3.4: el reparto alcanza solo a las familias que más de una unidad de entrega produce; el mapa declara las dos listas con su motivo |
| `Root-Rules.md` | 5.0 → **5.1** | §9.1: la unicidad y el reparto son dentro de cada familia |
| `CHANGELOG.md` | — | Entrada `[8.1]` |
| `_legacy/8.0/` | — | Conjunto superado, 65 archivos |

## 3. El defecto, medido

Sobre un destino de siete proyectos de código y dos unidades de entrega, aplicar §3.4 a la letra
producía:

| Familia | Ocurrencias | ¿Colisiona entre unidades? | ¿Había que renumerar? |
| --- | --- | --- | --- |
| `CU` | 9224 | Sí | Sí, correctamente |
| `NB` | **2309** | **No**: solo la categoría 01, de nivel producto | **No**, y la regla obligaba igual |

El defecto no era detectable estáticamente: el texto de §3.4 era coherente consigo mismo y con el
resto del conjunto. Apareció al **calcular el árbol de migración** de un producto concreto y ver el
costo de aplicarlo.

## 4. Verificación de invariantes

| Invariante | Estado |
| --- | --- |
| **D3** | Conforme, sin cambios. El ancho y el ámbito de unicidad no se tocan: lo que se acota es **a qué familias se les reparte bloque**, que es una consecuencia operativa y no la invariante |
| **D1**, **D2**, **D4** a **D9** | Conformes, sin cambios |

## 5. Observaciones

**Lo que esta corrección enseña sobre el método, y conviene retener.** La versión 8.0 pasó todas sus
comprobaciones estáticas y su nota de coherencia, y aun así llevaba un defecto que costaba 2.309
renumeraciones inútiles en el primer destino que la usara. Ninguna lectura lo habría encontrado,
porque no había nada incoherente que leer: había una regla más amplia de lo necesario, y su costo solo
se ve cuando se calcula sobre un producto real.

Es el argumento a favor de validar cada versión mayor contra una migración antes de darla por buena,
y no solo contra sus propias comprobaciones.

## 6. Veredicto

**APROBADO.** La corrección es acotada, no alcanza ninguna invariante, no invalida documentación
emitida, y su origen queda declarado para que el criterio que la produjo se pueda reusar: **repartir
rangos donde no hay colisión posible obliga a renumerar sin motivo**.
