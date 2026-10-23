# Nota de coherencia — El origen del hecho, y la base contra la que se calcula

**Documento:** Coherencia-Origen-Del-Hecho.md
**Versión:** 1.0
**Fecha:** 2026-09-12
**Conjunto resultante:** SDD **13.11**
**Origen:** Reporte `26` de `IA.SDD.Documentacion/Reportes/` —la pregunta previa no distingue quién generó la situación—, evaluado contra SDD 13.10

## 1. Alcance

**Qué se corrige.** La decisión de elevar algo al humano se tomaba con un solo eje —`Master-Prompt.md` §8.1,
*«¿esto tiene respuesta en el árbol?»*— y **un estado que la propia corrida dejó a medias no tiene respuesta en el
árbol por construcción**. Llegaba al humano con la forma de una consulta legítima. Y dentro del bucle de fases las
detenciones salían de a una: la única pieza que agrupaba antes de preguntar era la mesa.

**Qué NO se toca, y se declara porque el origen lo delimita.** La pregunta previa y su cita literal, que siguen
rigiendo para todo hecho ajeno a la corrida. **El eje de estratos que la 9.19 rechazó**: no se reabre (§2.3). La
condición de convocatoria de la mesa (`Mesa-Rules.md` §0.0): no se agrega ningún punto de invocación. `Root-Rules.md`
§13: no hay conflicto entre reglas que resolver. **Ningún rol nuevo.**

## 2. La decisión de diseño, que ordena el resto

### 2.1 Se calcula, no se declara

Declarado, el dato es el juicio del agente sobre su propio trabajo, que es el límite que
`Coherencia-La-Pregunta-Previa.md` §9 dejó anotado. Un agente que no se dio cuenta de que generó el problema declara
«ajeno» de buena fe, y **la cuenta de detenciones de la corrida da cero igual con una corrección real que con una
cosmética**.

### 2.2 Contra la base de la corrida, y no contra el snapshot de §8

**El origen proponía el snapshot que §8 archiva antes de despachar, y se verificó que no sirve.** Se toma **al
construir cada despacho** (`Master-Prompt.md` §8, esqueleto y reglas de construcción), de modo que ya contiene lo que
dejaron las unidades anteriores de la misma corrida: **contra él, un estado a medias de otra unidad se lee como
previo**. Es el valor equivocado, producido por el instrumento. Además cubre sólo el entregable, no rige en las Fases
I y J (§7.2), y se archiva por fecha y versión con correcciones de audit que no suben versión (§5).

**El ancla correcta ya la garantizaba §12.1 y nadie la registraba**: T0 corre antes de la primera escritura, T2 exige
el árbol limpio, un commit abarca el árbol entero y no se sobrescribe, y §12.1 la leen los tres orquestadores. **El
formato de T0 no publicaba el commit.** El destino que originó el reporte lo escribió por su cuenta en su informe de
estado, fuera de lo que el formato pedía. **Es el patrón del reporte —un dato que se toma y ninguna regla lee—
aplicado a la pieza correcta.**

### 2.3 Por qué no es el estrato de la 9.19

| | El estrato rechazado | El origen del hecho |
|---|---|---|
| Qué es | Clasificación **por juicio** de quién puede cerrar | **Dato calculado** contra un commit |
| Relación con la pregunta previa | Eje paralelo | Cláusula **anterior**: decide qué prueba corre primero |
| ¿La cita lo reemplaza? | Sí, y por eso se rechazó | **No**: un estado a medias de la corrida no tiene cita posible |

**Declarado por el agente, sería aquel estrato con otro nombre.** La derivación es lo que lo separa.

### 2.4 El nombre, medido antes de elegirse

`procedencia` **colisiona en secciones que esta intervención toca** —`Master-Prompt.md` §7.0 y
`Master-Prompt-Reanudacion.md` §3 y §6, con el sentido de la versión del framework declarada por el destino— y
`Vocabulario-Rules.md` §9.1 obligaría a desambiguar. `origen` a secas tiene otros referentes en §7.0 y en §8.1.
**`origen del hecho`, `base de la corrida`, `ajeno a la corrida` y `lote de la fase` tenían cero ocurrencias** en el
árbol vivo, y §15 declara que el primero se escribe siempre completo.

## 3. Inventario de archivos tocados

| Archivo | Antes | Después | Qué cambió |
|---|---|---|---|
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.14 | **8.15** | §7.0 el lote de la fase; §8 la cláusula del snapshot y por qué no es la base; §8.1 el origen del hecho, la tercera fila, el bloque de detención, el cierre y «Qué no cambia»; §9 el campo y el lote; §12.1 T0 la línea `Base` y T5; §15 tres términos; §16 fila y **reordenamiento** |
| `SDD/Devs/Rules/Mesa-Rules.md` | 1.1 | **1.2** | §7 el origen antes de la lista; §7.1 el campo y la generalización; §8 criterio enumerable |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.11 | **1.12** | §3 R1 la base en `REPOSITORIO`; §6 criterio enumerable |
| `SDD/Devs/Orchestrator/Master-Prompt-Migracion.md` | 2.9 | **2.10** | §8 M4, la segunda copia de la cláusula del snapshot |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | 1.15 | **1.16** | §3 dos situaciones nuevas y una reapuntada; §6 fila y **reordenamiento** |
| `CHANGELOG.md` | — | — | Entrada **13.11** |
| `_legacy/13.10/` | ausente | **tomado** | §VI.5, antes de editar |
| Esta nota | — | 1.0 | — |

**Nada fuera de esta lista fue modificado** (comprobación 7). `Conocimiento/Knowledge-Conformacion-Pull-Request-Manual.md`
nombra T0 sólo por su título y no reproduce sus campos, de modo que la línea `Base` no lo alcanza.

## 4. Barrido por concepto (§VI.3.2)

| Concepto | Forma anterior (patrón literal) | Forma vigente |
|---|---|---|
| La autocorrección tiene dos filas | `Hay que separar dos` | `Hay que separar tres`, con la tercera fila |
| §8.1 no quita detenciones | `no agrega ninguna detención ni quita ninguna` | `no agrega ninguna detención.** **Sí quita**` |
| Las ambigüedades se reenvían al humano de a una | `devuelve la lista de ambigüedades al usuario` | `las presenta en el lote de §7.0` |
| La compuerta de arranque sin base | un bloque `COMPUERTA DE ARRANQUE — {{` sin su línea `Base:` | `  Base:            {{`, y `Base de la corrida:` en el bloque de R1 que reproduce T0 |
| La cláusula del snapshot sin cálculo de origen | `contenido que el snapshot no refleja` sin `origen del hecho` en la misma línea | con `origen del hecho` |

**Corrida sobre todo el árbol vivo, incluidos los bloques cercados** (`grep -rn --include='*.md' --exclude-dir=_legacy`):
las tres primeras formas devuelven **1** cada una, y la única es la tabla de arriba; hay **1** bloque de T0 y **1** línea
`Base:` en `Master-Prompt.md`, y **1** `Base de la corrida:` en `Master-Prompt-Reanudacion.md`; la cláusula del snapshot
aparece en **4** líneas —**3** en las reglas y **1** en la tabla de arriba— y **las 4** llevan `origen del hecho`.

**Residuo: cero fuera de las exclusiones.** Las propias del caso son dos:

- **Esta nota**, que escribe las formas anteriores como patrón: es la clase estable «la declaración de la propia
  intervención» de §VI.3.2, que se cita y no se reescribe.
- **La regla 4 sobre el texto propio** —`origen` suelto en las líneas agregadas— deja dos coincidencias legítimas: la
  mención entre comillas de §15 que advierte que «origen» a secas tiene otros referentes, y un «origen del / hecho»
  partido por el salto de línea en `Mesa-Rules.md` §7. **Antes de esa corrida había nueve ocurrencias sueltas en el
  texto nuevo, en las mismas secciones donde el término ya tenía otro referente: la intervención cometió el defecto
  que su glosario prohíbe, y se corrigió antes de verificar.**

**El límite, declarado.** El origen del hecho es un cambio semántico: los patrones cubren sus huellas textuales, y lo
demás es lectura. Se releyeron enteras §7.0, §8, §8.1, §9, T0 y T5 de `Master-Prompt.md`, §7 de `Mesa-Rules.md` y §3 y
§6 de `Master-Prompt-Reanudacion.md`.

## 5. Verificación de la lista de §VI.3

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 | **Sin violaciones.** No cambia gating, estructura obligatoria de ningún documento generado, conjunto cerrado ni D9 |
| 2 | Autosuficiencia | **Cero.** El texto agregado a `SDD/` no cita el reporte, el repositorio de documentación ni ningún destino |
| 3 | Referencias internas | **Resuelven**: `Mesa-Rules.md` §7.1, `Master-Prompt.md` §7.0, §8.1, §9, §12.1 T0 y T5, §15, y `Master-Prompt-Reanudacion.md` R4 |
| 4 | Sin contradicción con lo que estaba | **Una encontrada y corregida**: «Qué no cambia» de §8.1 afirmaba que la sección no quita detenciones, **falso desde la 9.19**. `Root-Rules.md` §13 sigue diciendo que §8.1 corre antes, y es cierto: la cláusula vive adentro |
| 5 | Control de cambios en cada archivo | **Una fila por archivo**, cinco |
| 6 | Caso degenerado | **No aplica**: no se toca layout |
| 7 | Nada fuera del alcance | **Verificado**, §3 |
| 8 | Barrido | **§4**, residuo cero fuera de dos exclusiones propias |
| 9 | Coherencia interna | **Verificada**: la tabla de la autocorrección tiene tres filas y el texto dice «tres»; «ante la duda, se detiene» queda acotado a lo ajeno y la tabla del origen manda lo de la corrida a la autocorrección; §9 remite al lote de §7.0 y §7.0 al origen de §8.1 |
| 10 | Integridad del registro | **Verificada en los cinco archivos**: cabecera igual a la mayor fila, en orden, sin repetidas. **Dos estaban desordenados antes de esta intervención** —ver §7— y se reordenaron; la corrida contra la base muestra **4 filas fechadas quitadas y las 4 reaparecen idénticas**, más 5 nuevas |
| 11 | Cobertura de la nota | **Ésta**, para la entrada 13.11 |
| 12 | Catálogo | §3 pasa de **44 a 46** filas. El total de **222** anti-patrones de §4 no cambia: no entra ninguno |
| 13 | Devolución al origen | **§6** |

**Snapshot (§VI.5).** `_legacy/13.10/` tiene **127** archivos, los mismos **127** que el commit de publicación de la
13.10 fuera de las exclusiones, y **ninguno difiere** byte a byte de ese commit. Adentro, `Master-Prompt.md` está en
8.14, `Mesa-Rules.md` en 1.1, `Master-Prompt-Reanudacion.md` en 1.11, `Master-Prompt-Migracion.md` en 2.9 y
`Catalogo-De-Criterios.md` en 1.15: **ninguno muestra su versión nueva**.

## 6. Devolución al origen (comprobación 13)

El reporte fija **cinco criterios de aceptación** en su §7. Uno por uno:

| # | Criterio del reporte | Veredicto |
|---|---|---|
| 1 | Reproducir el caso en una corrida real: un agente deja un estado a medias y lo encuentra en la unidad siguiente | **CUMPLIDO A MEDIAS, y se declara.** El mecanismo está escrito. **El caso real no existe todavía**: el único candidato en el registro de la corrida que originó el reporte es un hallazgo de mesa clasificado como de esa corrida **por lectura**, resuelto con un parche **sin llegar al humano como detención**, y el caso del reporte son detenciones que llegan |
| 2 | La procedencia se reproduce contrastando contra el estado previo, **sin leer lo que el agente declaró** | **CUMPLIDO, contra la base y no contra el snapshot** (§2.2). Reproducido sobre tres hechos de esta misma intervención —uno ajeno, uno de la corrida por línea nueva, uno de la corrida por una línea que estaba en la base y la corrida reescribió— y sobre **una escalada abierta de un destino real**: su hecho vive en dos documentos de la categoría 09 que están en la base de aquella corrida **sin cambios**, y resulta ajena. Una segunda escalada del mismo destino cita un documento que no está en el repositorio: no calculable, de la corrida por duda. **Ninguna de las dos fuentes tenía un campo de origen que leer** |
| 3 | Contar las detenciones con procedencia propia; **si da cero, la corrección no funciona** | **SIN VEREDICTO: requiere una corrida con la corrección aplicada**, y esta intervención no la tuvo. **No hay cuenta, y por lo tanto no hay cero que celebrar.** Lo que queda es la forma de contar: el renglón `Cómo` separa lo calculado de lo tratado por duda, y §8.1 declara que una cuenta en cero —y también una cuenta hecha toda por duda— es lo primero que hay que mirar |
| 4 | El lote de una fase contiene todas sus detenciones y ninguna salió antes por su cuenta | **SIN VEREDICTO**, por el mismo motivo. La regla está en `Master-Prompt.md` §7.0 con lo bloqueante acotado a dos casos, que es lo que vuelve contable «salió antes por su cuenta» |
| 5 | Ninguna detención con procedencia propia sin su declaración de por qué la autocorrección no alcanzaba | **CUMPLIDO.** Escrito como criterio `[enumerable]` en `Mesa-Rules.md` §8 y en `Master-Prompt-Reanudacion.md` §6, y como obligación de cierre en `Master-Prompt.md` §8.1 |

**Dos cumplidos, uno a medias y dos sin veredicto.** Tres de los cinco dependen de una corrida real que el framework
no puede producir desde adentro, y **se declaran pendientes en lugar de darse por resueltos**: la intervención cierra
las cinco preguntas del reporte, **no afirma que el mecanismo funcione**.

## 7. Observaciones

**Dos registros de control de cambios estaban desordenados**, contra la comprobación 10, en archivos que esta
intervención tocaba: en `Master-Prompt.md`, **veintiuna filas** vivían después de «Fin del master-prompt» y la 8.12 a la
8.14 estaban entre la 8.2 y la 8.3; en `Catalogo-De-Criterios.md`, la 1.13 estaba entre la 1.2 y la 1.3. **Se
reordenaron sin cambiar el texto de ninguna fila.** Los **huecos** —la 7.5 del master-prompt y la 2.1 del orquestador de
migración— **no se rellenan**: no son desorden, y una fila la escribe quien hizo el cambio.

**La cláusula del snapshot vivía en dos lugares** —`Master-Prompt.md` §8 y `Master-Prompt-Migracion.md` §8 M4— y el
origen sólo citaba el primero. Se corrigieron los dos.

**Un límite de la mesa que la base vuelve calculable, y que no se resuelve acá.** `Mesa-Rules.md` §0.3 limita la mesa a
lo que existía al abrir la corrida, y una corrida con varios ciclos de mesa el mismo día mira, en cada ciclo, parches
aplicados por los anteriores. Si la mesa debe mirarlos **no es la pregunta de este origen**.

## 8. Lo que esta nota deja anotado

**La causa no está medida.** Si en las primeras corridas reales el origen del hecho sale **todo por duda**, la base no
se está publicando y la corrección es en T0, no en §8.1. Si sale **todo ajeno** en corridas donde el humano sigue
recibiendo problemas que la corrida generó, el cálculo se está haciendo contra algo que no es la base —el snapshot es
el candidato obvio, porque está a mano—. **Las dos lecturas son la medición que falta.**

## 9. Veredicto

**CONFORME.** Trece comprobaciones de §VI.3 verificadas; barrido con residuo cero fuera de dos exclusiones propias;
snapshot tomado antes de editar y verificado; y devolución al origen con **dos criterios cumplidos, uno a medias y dos
declarados sin veredicto con su motivo**. Conjunto resultante: **SDD 13.11**.

## Control de cambios

| Versión | Fecha | Cambios | Autor |
|---|---|---|---|
| 1.0 | 2026-09-12 | Emisión. Cubre la intervención que agrega **el origen del hecho** antes de la pregunta previa, **calculado contra la base de la corrida y no contra el snapshot por despacho** que el origen proponía; la tercera fila de la autocorrección; el lote de la fase; la línea `Base` de T0; y los criterios enumerables. Declara dos registros desordenados y una contradicción de §8.1 que venía de la 9.19, y deja tres criterios de aceptación pendientes de una corrida real. | Intervención del origen del hecho |
