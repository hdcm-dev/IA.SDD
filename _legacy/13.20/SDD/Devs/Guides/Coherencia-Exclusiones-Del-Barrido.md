# Nota de coherencia — Las exclusiones estructurales del barrido

**Documento:** Coherencia-Exclusiones-Del-Barrido.md
**Versión:** 1.0
**Fecha:** 2026-08-20
**Versión del conjunto resultante:** SDD **10.1**
**Origen:** `Reportes/15-Las-Exclusiones-Estructurales-Del-Barrido.md` **1.1**

---

## 1. Alcance

`SDD-Development-Guide.md` §VI.3.2 suma su **séptima** clase de exclusión —la declaración de la propia
intervención— y declara que la sección de barrido de la nota de coherencia **cita** la tabla en lugar
de reescribirla.

**Lo que esta intervención NO hace:** no toca las seis clases existentes, no cambia la mecánica del
barrido y no convierte nada en ejecutable — eso último cae en la decisión de alcance que `Reportes/12`
declara sin tomar.

## 2. Inventario

| Archivo | De → a | Qué cambió |
|---|---|---|
| `Guides/SDD-Development-Guide.md` | 1.19 → **1.20** | §VI.3.2 séptima clase y obligación de citar; §VI.3 comprobación 8 reformulada |
| `Rules/Catalogo-De-Criterios.md` | 1.6 → **1.7** | Un criterio nuevo |
| `CHANGELOG.md` | — | Entrada **10.1** |
| `_legacy/10.0/` | — | Snapshot del conjunto superado, **tomado antes de la primera edición** |

## 3. Barrido declarado

**Esta intervención no cambia ningún concepto con forma anterior**: agrega una fila y una obligación.
No hay par forma anterior / forma vigente que declarar, y §VI.3.2 lo admite explícitamente en su
límite —*«no cubre un cambio semántico sin forma anterior distinta»*—. **Se declara en lugar de
simular una corrida**, que es lo que esa misma sección pide.

## 4. Verificación

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 | **Sin violaciones** |
| 2 | Autosuficiencia | **Cero** referencias fuera del repositorio |
| 3 | Referencias internas | **Cero rotos** |
| 4 | Sin contradicción con lo que ya estaba | **Sin contradicciones.** Las seis clases se conservan literales |
| 5 | Control de cambios por archivo | **Una fila** en los dos que suben versión |
| 6 | Caso degenerado | **Verificado**: nada del layout se tocó |
| 7 | Nada fuera del alcance | **Sin cambios colaterales** |
| 8 | Barrido por concepto | **No aplica**, declarado en §3 |
| 9 | Coherencia interna | **Sin contradicciones** |
| 10 | Integridad del registro | **Verificado**: cabecera igual a la mayor fila en los dos |
| 11 | Cobertura de la nota | **Esta nota**, con el conjunto declarado |
| 12 | Cobertura del catálogo | **Un criterio** registrado |

## 5. Observaciones

**El reporte que originó esta intervención tuvo que corregirse antes de aplicarse, y por el defecto
que él mismo describe.** Su emisión 1.0 afirmaba que faltaban **dos** clases; §VI.3.2 ya tenía seis y
una de las dos estaba entre ellas por triplicado. **El autor enumeró desde lo que su residuo le
mostraba en vez de leer la tabla** — que es literalmente el patrón que el reporte enuncia. Se corrigió
a **1.1** antes de tocar el framework, y queda registrado acá porque es la mejor evidencia disponible
de que el hueco era real.

**Y una limitación de la muestra, declarada:** las tres intervenciones que no leyeron la tabla fueron
**del mismo agente**. Que el motivo sea de ubicación y no de atención **no está verificado contra
ningún otro autor**.

## 6. Veredicto

**CONFORME.** El conjunto queda en **SDD 10.1**.
