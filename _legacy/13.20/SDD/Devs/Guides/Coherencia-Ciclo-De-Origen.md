# Nota de coherencia — El ciclo de origen de un hueco, y por qué se congela

**Documento:** Coherencia-Ciclo-De-Origen.md
**Versión:** 1.0
**Fecha:** 2026-09-12
**Conjunto resultante:** SDD **13.13**
**Origen:** Reporte `27` de `IA.SDD.Documentacion/Reportes/` —la especificación no se puede correlacionar con el ciclo que la produjo—, evaluado contra SDD 13.10, verificado sin cambios contra la 13.12

## 1. Alcance

**Qué se corrige.** `referencia pendiente`, `ítem diferido` y `apartamiento declarado` (`Root-Rules.md` §11,
§12.1, §12.2) declaran hacia dónde apuntan y ninguno declaraba de dónde salían. Una migración normativa no
tenía con qué distinguir un hueco que el propio ciclo no llegó a escribir —se completa— de un hueco que la
norma exige recién después —se declara deuda—, y lo que no podía reconstruir a mano lo elevaba al humano.

**Qué NO se toca, y se declara porque el origen lo delimita.** Los tres instrumentos no se fusionan (§6 del
reporte). El identificador no lleva el ciclo adentro: es un campo, no una forma de numerar (`Root-Rules.md`
§9). No se crea ningún rol nuevo (§5.6 del reporte). `Vocabulario-Rules.md` no se modifica: se usa su
criterio de colisión vigente desde la 13.12. Ningún repositorio de destino se toca, `Lab-Geometria` incluido.

## 2. La decisión de diseño, que ordena el resto

### 2.1 Se calcula, no se declara — y se congela, a diferencia del origen del hecho

Con el mismo fundamento del reporte `26` §5.3: un campo que completa el agente se completa de buena fe con
lo que el agente cree, y el resultado se lee como verificación sin serlo. Se reutiliza la base de la corrida
que la 13.11 publicó (`Master-Prompt.md` §12.1 T0), agregándole fase y unidad de trabajo.

**La diferencia que había que cuidar** (solicitud 7 de la intervención): el origen del hecho vive y muere
dentro de la corrida que lo calcula, y por eso **se recalcula** cada vez. Un hueco declarado hoy se sigue
leyendo en corridas futuras, cada una con su propia base de la corrida distinta; remitir el campo a «la base
de la corrida» sin más apuntaría, leído después, a un commit equivocado. Por eso el campo **escribe el valor
—fase, unidad de trabajo y commit corto— y lo congela** en el momento de declararse (`Master-Prompt.md` §8.2).

### 2.2 Qué no se declara aparte, y por qué

El reporte pregunta además si hay que registrar contra qué versión del producto se evaluó el hueco (§5.2).
No: la base de la corrida es un commit, y `git show {{base}}:{{manifiesto}}` sobre su bloque de procedencia
dice qué versión del framework regía en ese momento. Declarar un segundo campo sería mantener dos
declaraciones del mismo hecho, que es lo que `Root-Rules.md` §10 previene para los recuentos en prosa y que
acá se evita del mismo modo. `Migracion-Rules.md` §4.8 deriva ese dato cuando lo necesita, no antes.

### 2.3 El nombre, medido antes de confirmarse

El reporte `27` v1.1 había propuesto `ciclo de origen` **sin verificar sus secciones destino**, y su v1.2
reabrió la decisión al encontrar cero ocurrencias de `procedencia` en `Root-Rules.md`. Esta intervención
reproduce la verificación con la unidad de contexto que la 13.12 fija en `Vocabulario-Rules.md` §9.2 —el
contexto de lectura es del lector, y la suma de lo que un lector recibe no es un contexto—, en vez de heredar
el número de la mesa que midió un caso distinto (calificar `procedencia` para un sentido nuevo):

```bash
grep -rn "ciclo de origen" SDD/Devs --include='*.md'
```

Cero ocurrencias antes de esta intervención, en `Root-Rules.md`, `Master-Prompt.md`, `Migracion-Rules.md` y en
el resto de `SDD/Devs`. Se confirma el nombre de la v1.1, con la verificación que le faltó, y se escribe
desnudo: no hace falta forma calificada ni entrada de glosario porque no hay con qué colisionar.

### 2.4 El tratamiento retroactivo, medido y no estimado

Exigir el campo sobre los huecos ya declarados elevaría, en la primera migración que corra sobre cualquier
destino con huecos —que son todos—, el volumen completo al humano: el defecto que el mecanismo viene a
evitar. Se deriva donde se pueda (`git log -S` sobre el texto literal de la fila, tomando el commit más
antiguo de la lista) y se marca `no derivable — anterior al mecanismo` donde no resuelve, sin que ese valor
eleve por sí solo. Probado sobre una fila real de `Lab-Geometria` (`Pipeline-CI-CD.md` de
`GeometriaFactory-Api`, PD-04): `git log archivo/reanudacion-6-2026-09-12 --oneline -S"La vigencia exacta del
acceso firmado"` devuelve ocho commits; el más antiguo, `8520aa7 Fase B de GeometriaFactory-Api`, es el ciclo
de origen derivado. El costo real no está en el comando —bajo el segundo— sino en elegir por fila un
fragmento estable, que es trabajo de una migración concreta y no de esta regla.

## 3. Inventario de archivos tocados

| Archivo | Antes | Después | Qué cambió |
|---|---|---|---|
| `SDD/Devs/Rules/Root-Rules.md` | 8.6 | **8.7** | §11 punto 7; §12 el párrafo compartido del campo; §12.1 punto 4; §12.2 punto 5 y fila de escalamiento; §14 fila y reordenamiento de 8.3-8.6 |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.16 | **8.17** | §8.2 nueva; §10.0 comprobación 8; §15 un término; §16 fila |
| `SDD/Devs/Rules/Migracion-Rules.md` | 3.19 | **3.20** | §4.8 y §4.9 nuevas; §6 dos criterios; §9 fila |
| `CHANGELOG.md` | — | — | Entrada **13.13** |
| `_legacy/13.12/` | ausente | **tomado** | §VI.5, antes de editar |
| Esta nota | — | 1.0 | — |

**Nada fuera de esta lista fue modificado.** `Vocabulario-Rules.md`, `Mesa-Rules.md`,
`Master-Prompt-Migracion.md` y `Master-Prompt-Reanudacion.md` se leyeron para verificar que el mecanismo no
los necesitaba y no se tocaron.

## 4. Barrido por concepto (§VI.3.2)

| Concepto | Forma anterior (patrón literal) | Forma vigente |
|---|---|---|
| Los huecos declaran hacia dónde y no de dónde | `Ninguno de los tres apunta hacia atrás` (reporte `27` §1, no normativo) | `Su ciclo de origen`, en `Root-Rules.md` §11 punto 7, §12.1 punto 4, §12.2 punto 5 |
| El campo se recalcula como el origen del hecho | (no existía) | `se escribe una sola vez y queda fijo` (`Root-Rules.md` §12); `no se recalcula` (`Master-Prompt.md` §8.2) |

```bash
grep -rn --include='*.md' --exclude-dir=_legacy "ciclo de origen" SDD/Devs
```

Devuelve las ocurrencias de esta intervención en los tres archivos de la tabla del §3 y en esta nota, ninguna
fuera de ellos. **Residuo: cero fuera de la exclusión propia** —esta nota, que cita las formas como patrón y
no como afirmación nueva, la clase estable de §VI.3.2—.

**El límite, declarado.** El ciclo de origen es un campo nuevo, no un renombre: no hay forma anterior que
barrer en el resto del árbol, y por eso el barrido de esta intervención es angosto. Se releyeron enteras §11,
§12, §12.1 y §12.2 de `Root-Rules.md`, §8.1, §8.2 y §10.0 de `Master-Prompt.md`, y §4.5 a §4.9 y §6 de
`Migracion-Rules.md`.

## 5. Verificación de la lista de §VI.3

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 | **Sin violaciones.** No cambia gating, estructura obligatoria, conjunto cerrado ni D9. El campo es metadato del hueco, no contenido del entregable |
| 2 | Autosuficiencia | **Cero.** El texto agregado no cita el reporte, `IA.SDD.Documentacion` ni ningún destino |
| 3 | Referencias internas | **Resuelven**: `Root-Rules.md` §11, §12, §12.1, §12.2; `Master-Prompt.md` §7, §8.1, §8.2, §10.0, §12.1, §15; `Migracion-Rules.md` §3, §4.1, §4.5, §4.7, §4.8, §4.9, §6, §10 |
| 4 | Sin contradicción con lo que estaba | **Ninguna encontrada.** El campo es aditivo sobre los seis/cuatro/tres campos existentes de cada instrumento y no reescribe ninguno |
| 5 | Control de cambios en cada archivo | **Una fila por archivo**, tres |
| 6 | Caso degenerado | **No aplica**: no se toca layout ni gating |
| 7 | Nada fuera del alcance | **Verificado**, §3 |
| 8 | Barrido | **§4**, residuo cero fuera de la exclusión propia. Angosto por ser campo nuevo y no renombre |
| 9 | Coherencia interna | **Verificada**: `Root-Rules.md` declara el campo y remite el mecanismo a `Master-Prompt.md` §8.2, que lo declara y remite la clasificación a `Migracion-Rules.md` §4.8, que a su vez remite el valor terminal de lo no derivable a §4.9; ningún archivo duplica la definición |
| 10 | Integridad del registro | **Verificada en los tres archivos**: cabecera igual a la mayor fila, en orden. `Root-Rules.md` traía **8.3 a 8.6 en orden inverso**, defecto preexistente y no de esta intervención; se reordena sin cambiar el texto de ninguna fila (ver §7) |
| 11 | Cobertura de la nota | **Ésta**, para la entrada 13.13 |
| 12 | Catálogo | No se agrega ningún anti-patrón `[enumerable]` a `Catalogo-De-Criterios.md`; los dos criterios nuevos son de `Migracion-Rules.md` §6, ya inventariado como archivo, y no cambian su recuento de criterios por no ser anti-patrones de tabla `[enumerable]` de la forma que ese catálogo cuenta |
| 13 | Devolución al origen | **§6** |

**Snapshot (§VI.5).** `_legacy/13.12/` tiene **129** archivos, verificado con `diff -rq` contra el árbol de
trabajo previo a esta intervención: coincide byte a byte salvo los tres archivos de la tabla del §3 (esta
misma nota, posterior al snapshot, correctamente no está adentro). Adentro, `Root-Rules.md` está en 8.6,
`Master-Prompt.md` en 8.16 y `Migracion-Rules.md` en 3.19: ninguno muestra su versión nueva.

## 6. Devolución al origen (comprobación 13)

El reporte fija **cinco criterios de aceptación** en su §7. Uno por uno:

| # | Criterio del reporte | Veredicto |
|---|---|---|
| 1 | Declarar un hueco nuevo en una corrida real y comprobar que su ciclo de origen queda escrito sin que ningún agente lo haya tipeado | **SIN VEREDICTO: requiere una corrida real posterior a la 13.13** que declare un hueco. El mecanismo está escrito (`Master-Prompt.md` §8.2) y no se ejerció en esta intervención, que no generó documentación de producto |
| 2 | Cruzar dos recuentos de diferidos tomados en momentos distintos y comprobar que se pueden comparar sin abrir los ítems | **CUMPLIDO A MEDIAS, con el precedente del reporte `18`.** Se comprobó sobre un caso real —`Lab-Geometria`, 2026-08-27 contra 2026-09-12— que **el total** se cruza sin abrir los 118 ítems (§ del cuerpo del `CHANGELOG`), pero esa reconciliación no usó el mecanismo de esta intervención —es anterior a él— sino reconstrucción manual del orquestador de reanudación. El criterio, tal como lo pide el reporte —con el campo puesto—, no se pudo ejercer porque no hay todavía un par de recuentos posteriores a la 13.13 |
| 3 | Correr una migración sobre un árbol con huecos de las dos clases y contar cuántos se elevan; el número tiene que ser menor que el total | **SIN VEREDICTO: requiere correr `Migracion-Rules.md` §4.8 sobre un destino real**, y los destinos son de solo lectura para esta intervención. El criterio enumerable que lo exige está escrito en §6 de esa regla |
| 4 | Probar el caso retroactivo: correr la migración sobre los 118 de `Lab-Geometria` y comprobar que la decisión de §5.4 los absorbe sin elevarlos uno por uno | **CUMPLIDO A MEDIAS.** El mecanismo de §4.9 se probó sobre **una** fila real con éxito (§2.4) y no sobre las 118, porque correrlo entero es una migración sobre un destino, fuera del alcance de esta intervención |
| 5 | El criterio de §5.5, enumerable: ningún hueco posterior a la aplicación sin ciclo de origen | **CUMPLIDO.** Escrito como fila de escalamiento en `Root-Rules.md` §12.2 (hallazgo P1) y como comprobación 8 de la compuerta mecánica en `Master-Prompt.md` §10.0 |

**Tres de cinco quedan sin corrida real que los ejerza, y se declara en vez de darlos por resueltos**, con el
precedente explícito del reporte `18` que el propio reporte `27` cita como forma aceptada de cierre parcial.
