# Nota de coherencia — La condición de convocatoria de la mesa de evaluación

**Documento:** Coherencia-Condicion-De-Convocatoria.md
**Fecha:** 2026-08-29
**Conjunto resultante:** SDD **13.8**
**Origen:** Reporte `18` de `IA.SDD.Documentacion/Reportes/`, y el ítem diferido de la entrada `13.7` del `CHANGELOG.md`

## 1. Alcance

**Qué se corrige.** `Mesa-Rules.md` 1.0 declaraba los **puntos de invocación** de la mesa y no la
**condición** que la hace necesaria. Los dos producían la misma lista el día que se escribió; el
primer caso que satisfizo la condición desde otro lugar quedó sin quién lo convocara.

**Qué NO se toca, y se declara porque el origen lo delimita.** El refutador, la ceguera del panel
(§5.3), la escala de ancla (§6.1 E1-E4/C), el jurado (§6.4), el cuerpo de parches (§6.5) y el contrato
de entrada (§4). Se midieron funcionando en tres corridas reales y el reporte `18` §2 los enumera uno
por uno. **Ninguno fue modificado.**

## 2. Inventario de archivos tocados

| Archivo | Antes | Después | Qué cambió |
|---|---|---|---|
| `SDD/Devs/Rules/Mesa-Rules.md` | 1.0 | **1.1** | §0.0 nueva —la condición—; §0.3, §2.1, §2.2, §6.1 y §6.7 corregidas |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.10 | **1.11** | §3.1.1 deja de excluir a la generación por categoría |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | 1.14 | **1.15** | Dos criterios nuevos; total 220 → **222** |
| `CHANGELOG.md` | — | — | Entrada **13.8** |
| `_legacy/13.6/`, `_legacy/13.7/` | ausentes | **repuestos** | Ver §6 |
| Esta nota | — | 1.0 | — |

**Nada fuera de esta lista fue modificado** (comprobación 7). En particular
`Master-Prompt-Migracion.md` **no se tocó**: su M1 convoca la mesa, y bajo §0.0 eso sigue siendo
correcto como **caso** de la condición.

## 3. Barrido por concepto (§VI.3.2)

| Concepto | Forma anterior (patrón literal) | Forma vigente |
|---|---|---|
| La convocatoria se declara por punto y no por condición | `invoca declara **cuándo**` | `declara **qué es correcto y cuándo hace falta**` + §0.0 |
| La generación excluida por categoría | `no se convoca en la generación desde cero` | `no se convoca sobre un destino vacío` + la condición 1 de §0.0 |

**Corrida sobre todo el árbol vivo, incluidos los bloques cercados:**

```
grep -rn 'no se convoca en la generación desde cero' --include='*.md' . | grep -v _legacy   → 1
grep -rn 'invoca declara \*\*cuándo\*\*'             --include='*.md' . | grep -v _legacy   → 1
```

**Residuo: cero fuera de las exclusiones.** Las dos ocurrencias son **filas de control de cambios**
—la de `Master-Prompt-Reanudacion.md` 1.11 y la de `Mesa-Rules.md` 1.1— que citan la forma anterior
**para describir el cambio**. Caen en dos clases estables de §VI.3.2 a la vez: «filas de control de
cambios» y «la declaración de la propia intervención», que existe precisamente porque nombrar la forma
anterior es su función.

## 4. Verificación de invariantes y de la lista de §VI.3

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 intactas | **Sin violaciones.** La intervención no toca gating, ni estructura obligatoria, ni conjuntos cerrados |
| 2 | Autosuficiencia: cero referencias fuera del árbol | **Cero.** El reporte `18` vive en otro repositorio y **no se cita desde ninguna regla**: el origen se nombra en esta nota y en el `CHANGELOG.md`, que es lo que §VI.2 admite |
| 3 | Referencias internas resuelven | **Cero rotas.** §0.0 cita `Master-Prompt-Reanudacion.md` §3.1 y `Master-Prompt-Migracion.md` M1; §0.3 cita §0.2 y `Master-Prompt.md` §10; §6.1 cita `Master-Prompt-Reanudacion.md` §7 y `Migracion-Rules.md` §2.1 |
| 4 | Sin contradicción con lo que ya estaba | **Sin contradicciones.** §0.0 no deroga los dos puntos: los reclasifica como casos, y los dos siguen declarados donde estaban |
| 5 | Control de cambios actualizado en cada archivo | **Una fila por archivo**, tres filas |
| 6 | El caso degenerado sigue produciendo el layout aplanado | **No aplica**: la intervención no toca layout |
| 7 | Nada fuera del alcance fue modificado | **Verificado**, §2 |
| 8 | Barrido por concepto declarado y corrido | **§3.** Residuo cero fuera de dos clases estables |
| 9 | Coherencia interna de cada artefacto tocado | **Verificada.** §0.0 y §0.3 de `Mesa-Rules.md` dicen lo mismo desde dos ángulos; §6.1 y §4 no se contradicen —§4 prohíbe **relevar el estado**, §6.1 obliga a **abrir la fuente que se cita**, que son actos distintos y la regla lo dice con esas palabras— |
| 10 | Integridad del registro: cabecera = última fila, en orden, sin repetir | **Verificada en los tres archivos** |
| 11 | Cobertura de la nota de coherencia | **Ésta**, para la entrada 13.8, que tocó tres archivos |
| 12 | Cobertura del catálogo de criterios | **Dos criterios nuevos** y uno reapuntado a §0.0. Total 220 → 222 |
| 13 | Devolución al origen | **§5** |

## 5. Devolución al origen (comprobación 13)

El reporte `18` fija **cinco criterios de aceptación** en su §7. Uno por uno:

| # | Criterio del reporte | Veredicto |
|---|---|---|
| 1 | La condición está declarada y los puntos derivan de ella | **CUMPLIDO.** `Mesa-Rules.md` §0.0 enuncia las tres cláusulas y declara que los puntos son casos y no definición |
| 2 | Un caso que cumple la condición sin orquestador **se convoca** | **CUMPLIDO.** Recorrido sobre el caso de §3.1 del reporte —un `P0` que las rondas no cierran—: hay corpus previo, el estado está leído, hay una decisión de alcance por tomar. Resuelve a «se convoca», **sin agregar ningún punto nuevo** |
| 3 | La generación deja de estar excluida categóricamente | **CUMPLIDO.** `Mesa-Rules.md` §0.3 y `Master-Prompt-Reanudacion.md` §3.1.1 distinguen «destino vacío» de «generación», con el límite contra el audit de fase escrito en las dos |
| 4 | Un `P0` anclado en una fuente declarativa exige su contraste, **y entra como caso de banco** | **CUMPLIDO A MEDIAS, y se declara.** La regla está en §6.1. **El caso de banco no**: el banco es del destino y el framework no lo distribuye —decisión del reporte `12`, que la 13.6 ratificó—, de modo que el framework **no puede** agregarlo. Lo que sí queda es la obligación de §10.0: la comprobación que un destino escriba para esta regla entra con su caso. **El criterio no se declara cumplido entero** |
| 5 | El ítem diferido de la 13.7 queda cerrado con su medición | **CUMPLIDO.** La entrada `13.8` del `CHANGELOG.md` lo cierra con las cuatro lecturas y **con la advertencia** sobre el criterio de corte del ciclo, que §6.7 incorpora |

**Cuatro cumplidos y uno a medias, declarado.** El criterio 4 no se puede cumplir entero desde el
framework sin violar una decisión anterior, y **decirlo es lo que la comprobación 13 existe para
obligar**: una intervención que contesta menos de lo que el origen pedía y se declara resuelta igual es
el defecto que esa comprobación mide.

## 6. Observación: dos snapshots de `_legacy/` faltaban

**No es parte del origen y se corrigió acá porque bloqueaba la propia intervención.** `_legacy/`
llegaba hasta **13.5**: las intervenciones que publicaron la 13.6 y la 13.7 no tomaron el suyo.

§VI.5 declara qué rompe: el diff normativo de una migración se construye leyendo `_legacy/`, de modo
que **un salto desde 13.6 o desde 13.7 salía vacío**, y una migración sin nada que aplicar se declara
completa sin haber hecho nada.

**Repuestos** desde los commits de publicación de cada versión, **antes** de aplicar ningún cambio de
esta intervención, que es lo que §VI.5 exige. Verificación mecánica que esa misma sección pide:

| Snapshot | `Mesa-Rules.md` dentro | Correcto porque |
|---|---|---|
| `_legacy/13.6/` | **no existe** | La mesa entró en la 13.7 |
| `_legacy/13.7/` | **1.0** | Es la versión previa a esta intervención, no la 1.1 |

**Si alguno mostrara la versión nueva, el snapshot se habría tomado tarde.** Ninguno la muestra.

## 7. Veredicto

**COHERENTE.** Trece comprobaciones de §VI.3 verificadas, barrido con residuo cero fuera de dos clases
estables, y devolución al origen con **cuatro criterios cumplidos y uno declarado a medias con su
motivo**. Conjunto resultante: **SDD 13.8**.

## Control de cambios

| Versión | Fecha | Cambios | Autor |
|---|---|---|---|
| 1.0 | 2026-08-29 | Emisión. Cubre la intervención que convierte los puntos de invocación de la mesa en **casos de una condición declarada**, corrige la exclusión categórica de la generación, obliga a contrastar la fuente cuando un `P0` se ancla en una declaración, y suma tres correcciones de forma que sólo aparecen con volumen. Declara además la reposición de **dos snapshots de `_legacy/` que faltaban** desde la 13.6, y por qué eso bloqueaba cualquier migración desde esas versiones. | Intervención de la condición de convocatoria |
