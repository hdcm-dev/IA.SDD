# Nota de coherencia — El proyecto de código de otro ecosistema, el insumo de construcción y el sample en el agrupador

**Documento:** Coherencia-Proyecto-De-Otro-Ecosistema.md
**Versión:** 1.0
**Fecha:** 2026-09-13
**Conjunto resultante:** SDD **13.16**
**Origen:** reporte `30` de la serie de reportes de evidencia —el método no sabe poner un proyecto de otro ecosistema en la solución—, evaluado contra SDD 13.15 y verificado sin cambios contra la misma base

## 1. Alcance

**Qué se corrige.** El modelo de dos ejes de la 8.0 tenía el stack por proyecto de código y la solución de
código como agrupador de la construcción, y **no tenía cómo decir que un proyecto de un ecosistema es insumo
de construcción de uno de otro dentro de la misma solución**, ni cómo entra al agrupador un sample que no se
compila, ni qué pasa donde falta la cadena de herramientas de un ecosistema. Un destino real lo necesitó y lo
inventó: una clase de arista, un modo de construcción sin la segunda cadena y once samples fuera del
agrupador. Además, `PRODUCT-INTAKE-template.md` §16.1 pedía los samples «según el tipo D8 de cada proyecto de
código», con el modelo anterior a la 8.0.

**Qué NO se toca, y se declara porque el origen lo delimita.**

- **Ninguna herramienta ni ecosistema entra al texto normativo.** El único lugar donde se nombra un ecosistema
  es el ejemplo del perfil de convención de `PRODUCT-MANIFEST-template.md` §1.2, declarado para eso.
- **`Vocabulario-Rules.md` no se modifica**: define la solución de código por su frontera —el comando de
  construcción—, y la decisión se apoya en esa definición en lugar de cambiarla.
- **El reporte `12` no se reabre**: la comprobación de que ningún sample quede fuera del agrupador es un
  instrumento del destino (`SDD-Development-Guide.md` §II.7); la regla fija la propiedad y su criterio.
- **D8 no cambia**, `Conocimiento/` no suma documentos y **ningún repositorio de destino se toca**.

## 2. Las decisiones

### 2.1 La pregunta de fondo: sí, con frontera

**Un proyecto de código cuyo ecosistema difiere del de la solución pertenece a esa solución cuando un proyecto
de la solución toma su artefacto como insumo de construcción; si ninguno lo toma, es su propia solución.** Que el
agrupador lo muestre es forma del repositorio. El fundamento es la frontera de `Vocabulario-Rules.md` §2: la
solución se delimita por el comando de construcción que la toma como entrada, y en el caso medido ese comando
genera el artefacto del proyecto de otro ecosistema a través de su consumidor. **La respuesta negativa obligaba
a declarar como consumo de artefacto publicado** (`PRODUCT-MANIFEST-template.md` §3) **un artefacto que no se
publica.** La regla vive en `Intake-Rules.md` §4.

### 2.2 Dos clases de arista y un único generador

`referencia de proyecto` e `insumo de construcción`, marcadas en la columna de dependencias; el insumo tiene
**un único generador**, y un segundo consumidor declara `generado por`. Se eligió `insumo de construcción` y no
el nombre que el destino había acuñado, por la colisión medida de §7.

### 2.3 La cadena de herramientas ausente

`Rules-Devops.md` §4.9, punto 4: cuando la construcción necesita la cadena de más de un ecosistema —por un
insumo **o dentro de un mismo proyecto de código**—, se declaran los ambientes sin la cadena y un **modo de
construcción explícito y nombrado**; sin él, la construcción **falla y nombra la cadena**, nunca entrega el
consumidor sin su insumo.

### 2.4 El sample en el agrupador

`Rules-Examples.md` §3.6: dos formas de entrada —con construcción y sin construcción—, **la verificación nunca
enganchada a la construcción de la solución**, la cobertura comprobada por enumeración en el destino, y la forma
del anfitrión mínimo de un artefacto que otro proyecto carga.

### 2.5 El canal

**Ninguna escritura en la guía.** La comprobación 13 de §VI.3 ya reconoce «un reporte, un incidente, un pedido»
como origen de una intervención, y ni `Migracion-Rules.md` §4.7 ni `Root-Rules.md` §11 declaran que el ADR de
apartamiento con dos saltos sea la única vía hacia una regla.

## 3. Inventario de archivos tocados

| Archivo | Versión | Qué cambia |
|---|---|---|
| `SDD/Devs/Rules/Intake-Rules.md` | 4.2 → **4.3** | §4: pertenencia del proyecto de otro ecosistema, dos clases de arista con su marca, único generador, cuatro validaciones bloqueantes. Control de cambios reordenado (4.2 estaba antes de 4.1) |
| `SDD/Devs/Rules/Rules-Devops.md` | 6.1 → **6.2** | §4.9 punto 4: único generador y modo de construcción donde falta la cadena. §4.8: dos anti-patrones `[interpretativo]` |
| `SDD/Devs/Rules/Rules-Examples.md` | 6.5 → **6.6** | §3.6 nueva. §4.5: dos anti-patrones (uno de cada marca). §6: dos criterios |
| `SDD/Devs/Rules/Rules-Arquitectura-Tecnica.md` | 4.5 → **4.6** | §4.8: aplicabilidad alineada con §2.1; punto 2 sin D8 ni `redistribuible` por proyecto; punto 3 con la clase de cada arista; omisión con una unidad **y** un proyecto |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.18 → **8.19** | §11: clase de arista en el grafo de la vista; README raíz con la tabla de **unidades de entrega**. §15: dos términos |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | 1.17 → **1.18** | §3: tres situaciones. §4: 222 → 226 (109 / 117). §1: recuento en prosa con su fuente |
| `SDD/Devs/Intake/PRODUCT-MANIFEST-template.md` | 6.0 → **6.1** | §1.2: capitalización, perfil por ecosistema con ejemplo. §2.B, §3, §4 y §7 |
| `SDD/Devs/Intake/PRODUCT-INTAKE-template.md` | 3.5 → **3.6** | §16.1 al D8 de la unidad de entrega. §13.2: pregunta y marca. Perfil: capitalización y declaración por ecosistema. Control de cambios reordenado (3.5 estaba antes de 3.0) |

Más `CHANGELOG.md` [13.16], esta nota y `_legacy/13.15/` (130 archivos, el conjunto entero).

## 4. Barrido por concepto (§VI.3.2)

**Forma anterior / forma vigente.** El tipo D8 atribuido a un proyecto de código → atribuido a la unidad de
entrega. Patrón corrido sobre todo el árbol vivo, incluido el interior de los archivos tocados y el texto de esta
intervención:

```bash
grep -rn -i -E "D8[^|]{0,60}proyecto de c[oó]digo|proyecto de c[oó]digo[^|]{0,40}(tipo )?D8" \
  SDD PROMPTS README.md Templates Conocimiento --include=*.md \
  | grep -v "_legacy\|no lleva\|No lleva\|no llevan\|sin D8\|Sin valor D8\|sin valor D8\|ningún campo D8\|Ningún campo D8\|Ningún proyecto de código declara\|^[^:]*:[0-9]*:| [0-9]\+\.[0-9]\+ |"
```

**Corregido en esta intervención**: `PRODUCT-INTAKE-template.md` §16.1 (el origen), `Rules-Arquitectura-Tecnica.md`
§4.8 punto 2 y `Master-Prompt.md` §11 (README raíz). Los dos últimos no los había medido el origen: los dio el
barrido del interior de los archivos tocados.

**Residuo, clasificado.** Las siete clases estables de §VI.3.2 se **citan**: `Coherencia-Roles-Y-Defectos-Verificados.md`
l.110, `Coherencia-Cita-De-Conocimiento.md` l.93, `Coherencia-Barrido-8.7-Dos-Ejes.md` l.42,
`Coherencia-Vocabulario-Producto-Y-Proyecto-De-Codigo.md` l.104 y `Coherencia-Base-Conocimiento.md` l.66 son
**notas de coherencia anteriores**; la fila 3.6 de `PRODUCT-INTAKE-template.md` es **la declaración de la propia
intervención**. **Exclusiones propias del caso**:

| Línea | Clase | Motivo |
|---|---|---|
| `Vocabulario-Rules.md` l.169, `Migracion-Rules.md` l.403, `SDD-Development-Guide.md` l.816 | Falso positivo | Dicen, o narran, que el D8 **pasó** a la unidad de entrega |
| `Master-Prompt.md` l.1852, `PROMPT-Agente-Bootstrap-SDD.md` l.64 | Falso positivo | Atribuyen D8 a la unidad de entrega; el patrón los alcanza por cercanía |
| `Rules-Devops.md` l.349 | Falso positivo | Habla de stacks que un proyecto usa, no de su D8 |
| `Master-Prompt.md` l.573, `Rules-Base-Conocimiento.md` l.487 y l.495, `SDD-Development-Guide.md` l.500 | **Residuo vivo, declarado y no corregido** | Son el mecanismo de carga de conocimiento: evalúa la condición «contra el tipo D8 del proyecto de código en curso». Corregirlo es decidir **la granularidad con que se carga el conocimiento**, un mecanismo con contrato propio (`AG-00980`) que este origen no trata. Queda como observación para un origen propio |
| `Marco-Teorico-SDD.md` l.1146 | **Residuo vivo, declarado y no corregido** | Texto teórico sobre el estilo interno de un proyecto «según su tipo D8»; no es instrucción de generación y su reescritura es de la guía teórica |

**Ninguna línea de clase estable fue reescrita.** `git diff main -- SDD | grep -E '^-\| [0-9]+\.[0-9]+ \| 20'`
devuelve exactamente dos filas, la 3.5 de `PRODUCT-INTAKE-template.md` y la 4.2 de `Intake-Rules.md`, y las dos
reaparecen **idénticas** como líneas agregadas: se movieron a su lugar en el orden, no se reescribieron.

## 5. Verificación de la lista de §VI.3

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 | **Cumple.** D8 intacto; D7 intacto: el texto normativo no nombra herramientas (criterio 5 de §6) |
| 2 | Autosuficiencia | **Cumple.** El texto agregado a `SDD/` no nombra otro repositorio (`grep` con salida vacía) |
| 3 | Referencias internas | **Cumple.** Existen `Intake-Rules.md` §4, `Rules-Devops.md` §4.8 y §4.9, `Rules-Examples.md` §3.2, §3.4 y §3.6, `SDD-Development-Guide.md` §II.7, `PRODUCT-MANIFEST-template.md` §1.2, §2.1 y §3, `Rules-Arquitectura-Tecnica.md` §2.1 y §4.8, `Root-Rules.md` §4 y `Vocabulario-Rules.md` §2 y §9.1 |
| 4 | Sin contradicción con lo que estaba | **Cumple.** La regla entre soluciones distintas de `PRODUCT-MANIFEST-template.md` §3 se conserva y la nueva opera dentro de una solución. El «declarar una vez por producto» de §1.2 se alineó con el perfil por ecosistema |
| 5 | Control de cambios | **Cumple.** Una fila por archivo modificado |
| 6 | Caso degenerado | **Cumple.** Un producto de un proyecto de código no tiene aristas, y §4.8 omite la vista con una unidad **y** un proyecto, como ya decía la tabla de §2.1 |
| 7 | Nada fuera del alcance | **Cumple.** Ocho archivos, esta nota, el `CHANGELOG.md` y el snapshot |
| 8 | Barrido por concepto | **Cumple con residuo declarado**, §4 |
| 9 | Coherencia interna | **Cumple.** Corregidas dos contradicciones internas de los archivos tocados: la aplicabilidad de §4.8 contra §2.1 en `Rules-Arquitectura-Tecnica.md`, y §1.2 del manifiesto contra su propio perfil por ecosistema |
| 10 | Integridad del registro | **Cumple.** Cabecera igual a la última fila en los ocho; tablas ordenadas; las dos filas fuera de orden de la base, reordenadas. `Rules-Examples.md` repite `1.0` tres veces desde antes: dos son filas de los ejemplos de §7, no del registro |
| 11 | Cobertura de la nota | **Cumple.** Esta nota declara el conjunto 13.16 |
| 12 | Catálogo de criterios | **Cumple.** Tres situaciones nuevas; recuentos de §4 contrastados con las tablas: `Rules-Devops.md` 15 (8 / 7), `Rules-Examples.md` 19 (10 / 9) |
| 13 | Devolución al origen | **Cumple**, §6 |
| 14 | Colisión con su medición | **Cumple**, §7 |

## 6. Devolución al origen (comprobación 13)

El reporte fija **cinco criterios de aceptación** en su §7:

| # | Criterio del reporte | Veredicto |
|---|---|---|
| 1 | §16.1 dice D8 de la unidad, medido con el mismo `grep` | **CUMPLIDO.** `grep -n "tipo D8 de cada proyecto de código" PRODUCT-INTAKE-template.md` ya no encuentra la instrucción: la única línea es la fila 3.6, que declara la corrección. La instrucción dice «según el tipo D8 de cada unidad de entrega» |
| 2 | El grafo de compilación admite la arista de construcción, y la vista de producto de un destino la declara sin inventar la clase | **CUMPLIDO.** `Intake-Rules.md` §4 y `Rules-Arquitectura-Tecnica.md` §4.8 punto 3. El nombre es `insumo de construcción` y no el que el destino acuñó (§7) |
| 3 | Completar un manifiesto con un proyecto de un ecosistema de paquetes de JavaScript dentro de una solución de otro ecosistema, sólo con lo que el framework dice | **CUMPLIDO.** El perfil por ecosistema (§1.2), la tabla y la marca (§2.B), la clase y el generador (§3), las validaciones (§4 y `Intake-Rules.md` §4) y el modo de construcción (`Rules-Devops.md` §4.9) salen del texto. Lo que el framework deja al destino —la forma concreta con que su ecosistema muestra un proyecto sin construirlo— lo deja **por regla**, no por omisión |
| 4 | Un sample que no se compila tiene forma declarada respecto del agrupador, y su verificación no se engancha a la construcción | **CUMPLIDO.** `Rules-Examples.md` §3.6, con un criterio `[enumerable]` y otro `[interpretativo]` en §6 |
| 5 | Ningún texto normativo nombra una herramienta: `grep -rn -i "NoTargets\|csproj\|webpack" SDD/Devs/Rules` no gana ocurrencias | **CUMPLIDO.** Vacío antes y después (`exit=1`), y ninguna herramienta ni ecosistema en las líneas agregadas a `SDD/Devs/Rules` y `SDD/Devs/Orchestrator` |

**Lo que ninguno de los cinco puede ver, y se declara**: ninguna corrida del orquestador ejerció todavía las
validaciones nuevas de `Intake-Rules.md` §4 sobre un intake real.

## 7. Afirmaciones de colisión, con su medición (comprobación 14)

Contexto de lectura por lector (`Vocabulario-Rules.md` §9.2): quien completa el intake, quien deriva y valida el
manifiesto, AG-00050 (vista de producto), AG-00090 (pipeline de producto), AG-00100 (samples) y el orquestador
(glosario de `Master-Prompt.md` §15). Medido sobre la base `main` del framework, antes de escribir:

```bash
R="SDD/Devs/Intake/PRODUCT-INTAKE-template.md SDD/Devs/Intake/PRODUCT-MANIFEST-template.md SDD/Devs/Rules/Intake-Rules.md SDD/Devs/Rules/Rules-Arquitectura-Tecnica.md SDD/Devs/Rules/Rules-Devops.md SDD/Devs/Rules/Rules-Examples.md SDD/Devs/Orchestrator/Master-Prompt.md SDD/Devs/Rules/Vocabulario-Rules.md"
for f in $R; do git show main:$f | grep -o -i "insumo de construcci" | wc -l; done        # 0 en los ocho
git grep -i -c "insumo de construcci" main -- '*.md' | grep -v '^main:_legacy/'           # vacío: 0 en el árbol vivo
# ídem "referencia de proyecto": 0 y 0. Ídem "activo de construcci": 0 y 0
for f in $R; do git show main:$f | grep -n -i -P '\bactiv[oa]s?\b'; done
#   Master-Prompt.md l.401, 404-406, 443 («activa el patrón»), 1617 («Flags activos»), 1859-1860, 1908 («Se activa»), 1997
#   Rules-Examples.md l.352 («está activa»)
for f in $R; do git show main:$f | grep -o -i -P '\binsumos?\b' | wc -l; done
#   65 en Master-Prompt.md, 5 en Vocabulario-Rules.md, 3 en PRODUCT-INTAKE-template.md, 3 en Rules-Arquitectura-Tecnica.md, 2 en Intake-Rules.md, 2 en Rules-Devops.md, 1 en Rules-Examples.md
```

**Qué se afirma, y sobre qué.** Los dos compuestos nuevos **no colisionan**: cero ocurrencias previas en los
ocho lectores y en el árbol vivo. **El compuesto que el destino había acuñado tampoco colisiona**, y aun así no se
adoptó: su forma desnuda, «activo», ya es adjetivo y verbo en dos de los lectores, y el término le sumaría el
sentido de sustantivo en el mismo contexto de lectura (§9.1). **«insumo», desnudo, ya significa en esos lectores
«entrada que alguien consume»**, que es el sentido del término: el compuesto no agrega un segundo sentido.

## 8. Veredicto

**APROBADO.** El conjunto normativo 13.16 es coherente con las catorce comprobaciones de §VI.3, con residuo del
barrido declarado en §4 y los cinco criterios del origen cumplidos.
