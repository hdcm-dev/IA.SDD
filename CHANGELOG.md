# Changelog

Todos los cambios relevantes de este repositorio (`IA.SDD`) se documentan acá.
Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/).

## [9.1] - 2026-08-16

**Cinco intervenciones seguidas cometieron el defecto que corregían** —la 8.7, la 8.12, la 8.13, la 8.15 y la 8.17—, y la quinta lo cometió **una intervención después** de escribir la regla que lo evita. La 9.0 dejó anotado que la regla 4 «no funciona como control, porque se cumple cuando alguien se acuerda de correrla», y declaró que volverla mecánica exigía decidir contra qué se corre.

**Ese diagnóstico era falso, y comprobarlo llevó cinco búsquedas.** Los cinco conceptos tenían una **forma anterior literal**:

| Concepto | Forma anterior | Vivas hoy |
| --- | --- | --- |
| Layout de la 8.0 | `Proyectos/` | **1**, declarada |
| Vocabulario de la 6.0 | `README §5` | 0 |
| Nivel del despacho | `{{NOMBRE_PROYECTO_CODIGO}}` | 0 |
| Eje del principal | `proyecto de código principal` | 0 |
| Cabecera del documento generado | `**Proyecto de código:**` | 0 |

**Ninguna era difícil de encontrar. Ninguna estaba escrita en ninguna parte.** Lo que faltaba no era que el concepto fuera expresable: era que **nadie lo expresaba**. El barrido dependía de que quien interviene recordara qué buscar, y cinco veces seguidas la memoria falló donde un `grep` no habría fallado.

### Agregado

- **`SDD-Development-Guide.md` 1.14 → 1.15. §VI.3.2 es nueva: el barrido se declara como patrón y se corre.** Toda intervención que cambia un concepto declara el par **forma anterior / forma vigente**, con la anterior expresada como **patrón de búsqueda y no como descripción** —«el nivel del bloque técnico» no sirve; `**Proyecto de código:**` sí—.
- **El residuo aceptable es cero fuera de las exclusiones enumeradas una por una con su motivo**, y las **seis clases de exclusión se declaran de una vez** —filas de control de cambios, `_legacy/`, `Bootstrap/`, notas de coherencia anteriores, rutas ilustrativas y renombres declarados— para que no se redescubran en cada intervención.
- **La regla 4 se corre con los mismos patrones sobre el texto propio.** Es la parte que faltó las cinco veces: el barrido se corrió sobre el árbol y **no sobre lo que la intervención acababa de escribir**, que es el único lugar donde nadie mira.
- **La comprobación 8 de §VI.3** se reformula como corrida con residuo cero, y la forma de la nota de coherencia suma la **sección de barrido declarado**: sin ella, la comprobación 8 no es verificable por nadie que no sea quien la corrió.

### El límite, declarado

**Cubre los conceptos con huella textual** —renombres, cambios de nivel, nombres de variable y de campo— y **no cubre un cambio semántico sin forma anterior distinta**. Cuando la 8.14 pasó a exigir que toda fuente declarativa nombre a su responsable, no había ninguna cadena vieja que buscar: el defecto era una **ausencia**, y una ausencia no se encuentra con un patrón. Para ésos la regla 4 sigue siendo una lectura, y la nota lo declara en lugar de simular una corrida.

**Un control que dice qué no cubre es un control; uno que pretende cubrir todo es lo que nos trajo hasta acá** — la comprobación 4 decía «sin contradicción entre lo escrito y lo que ya estaba», y tres intervenciones la pasaron con una contradicción adentro.

**Queda anotado:** el control nuevo **no impide el sexto caso**, lo vuelve detectable **en la misma intervención en lugar de en la siguiente**. Una intervención que no declara su patrón puede cerrarse igual; lo que cambia es que su nota queda visiblemente incompleta y la comprobación 8 no se puede marcar.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/9.0/`.

---

## [9.0] - 2026-08-16

**El intake valida un eje y el manifiesto que se deriva de él validaba el otro.** `Intake-Rules.md` §4 declara como bloqueante que haya *exactamente una **unidad de entrega** principal*. El `PRODUCT-MANIFEST` —la fuente única de verdad del producto— pedía en su bloque §1, en sus validaciones §4 y en su checklist §7 un ***proyecto de código* principal**. Dieciocho lugares vivos seguían nombrando el eje anterior, y el glosario de la guía de usuario ya lo delataba: definía «Proyecto de código principal» como **«la unidad de entrega cabeza del producto»**. La definición se había migrado en la 8.0 y el término no.

**Y el bloque que gobierna toda la generación era de un solo eje.** `Master-Prompt.md` §3.4 —lo primero que el orquestador imprime y lo primero que un subagente ve— enumeraba proyectos de código llevando `tipo_unidad_entrega`, `redistribuible` y `path-docs`: exactamente la mezcla que `Intake-Rules.md` §4 valida como imposible, y que la **8.12** corrigió en la regla sin llegar hasta acá.

**Cómo aparecieron.** Aplicando a la 8.17 la regla que la 8.17 acababa de escribir —**entrar en los bloques de ejemplo**— y su regla 4: *«¿mi intervención cometió el defecto que corrige?»*. La respuesta era sí. **Quinto caso seguido del mismo patrón, esta vez con un intervalo de una intervención.**

### Impacto sobre destinos existentes

**Renombres de artefacto**

| Nombre anterior | Nombre vigente | Naturaleza |
| --- | --- | --- |
| `Proyecto de código principal` | `Unidad de entrega principal` | campo, en `PRODUCT-MANIFEST` §1 y en el README raíz |
| `proyecto-de-codigo-principal` | `unidad-de-entrega-principal` | campo, en el bloque informativo de `Master-Prompt.md` §3.4 |
| `orden-topologico` | `orden-topologico-de-compilacion` **+** `orden-de-integracion` | campo, partido en dos: no son el mismo grafo |

**Secciones movidas o partidas**

| Documento | Sección anterior | Destino vigente |
| --- | --- | --- |
| Bloque informativo de `Master-Prompt.md` §3.4 | «Proyectos de código», un bloque con D8 y `redistribuible` | Tres bloques: **unidades de entrega** (§2.A), **proyectos de código** (§2.B) y **matriz de composición** (§2.C) |

**Campos bloqueantes nuevos**

| Documento | Campo | Regla que lo exige |
| --- | --- | --- |
| — | — | Ninguno. El conjunto de campos no cambia; cambia **a qué eje se le piden** |

### Cambiado

- **`PRODUCT-MANIFEST-template.md` 5.0 → 6.0** y **`Root-Rules.md` 5.4 → 6.0.** El campo pasa a `Unidad de entrega principal`, con el valor tomado de la fila señalada `(principal)` en §13.1 del intake. Los **dos ejemplos de README raíz** de `Root-Rules.md` §7 encabezaban su tabla con `| Proyecto de código | Tipo D8 | … | Redistribuible |`: una tabla del eje de construcción llevando dos atributos del eje de entrega.
- **`Master-Prompt.md` 7.11 → 8.0.** §3.4 pasa a los tres bloques, con la constancia de que ningún D8 sale del eje de construcción y ninguna `Identidad-Codigo` del de entrega. **El bloque mezclado era la forma más directa de que un subagente confundiera los ejes, porque es lo primero que recibe.**
- **Once reglas de categoría, `Deriva-Rules.md` y `Maqueta-Rules.md`**, patch cada una: su prompt de despacho decía «de la **unidad de entrega** `{{NOMBRE_PROYECTO_CODIGO}}`». **La prosa se migró en la 8.0 y el marcador no**, con lo cual la primera línea que el subagente lee nombra el nivel correcto con una variable que el contexto ya no define.
- **`Rules-Plan-Sprint.md`, `Rules-Documentacion.md`**: la cabecera de sus ejemplos **rellenos**, que la 8.17 no alcanzó por haber reemplazado sólo la forma con marcador. **`Rules-Necesidades-Negocio.md`**: la tabla de cabecera de sus dos ejemplos.
- **`PRODUCT-INTAKE-template.md` 3.3 → 3.4.** El árbol de §16 se contradecía en la misma línea —«categorías 00-11 (**por proyecto de código** bajo `Unidades-Entrega/`)»— y condicionaba las maquetas a que «algún proyecto de código» ejecutara la Fase B2, cuando `requiere_maqueta` se evalúa por unidad de entrega.
- **`Migracion-Rules.md` 3.4 → 3.5.** La señal de clasificación «es el proyecto de código principal» habría quedado circular con el renombre: pasa a **«el intake lo señalaba como principal»**, que es lo que el agente lee del origen.
- **`SDD-User-Guide.md` 1.14 → 1.15.**

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.17/`.

---

## [8.17] - 2026-08-16

**Cuatro hallazgos que aparecieron al verificar que no quedaba nada pendiente, en lugar de contestarlo de memoria.**

### Corregido — la cabecera que todo documento generado copia

Las diez reglas de categoría definen, en su §4.1, la cabecera que lleva **cada documento que el framework genera**. Las **veintiséis** empezaban con `**Proyecto de código:** {{Nombre-Proyecto-Codigo}}`, cuando desde la 8.0 esos documentos pertenecen a una **unidad de entrega**. **Ninguna de las diez usaba `Unidad de entrega:`: cero de veintiséis.**

**Es la tercera capa del mismo cambio de la 8.0, y explica por qué tres barridos la pasaron de largo.** La 8.12 buscó en reglas y plantillas, la 8.13 en rutas y tablas, la 8.15 en citas y flags: **ninguna abrió los bloques de ejemplo cercados**, y la cabecera vive ahí. Y es el peor lugar donde dejarlo, porque **un ejemplo no se lee, se copia**.

- Las **diez** reglas de categoría, patch cada una.
- **`SDD-Development-Guide.md` 1.13 → 1.14.** §VI.3.1 suma la **quinta regla del barrido**: entrar en los bloques de ejemplo, porque **un cerco de código no es un límite del barrido**.

### Corregido — un renombre que no se propagó ni dentro de su propio archivo

**`Rules-Arquitectura-Tecnica.md` §2.1 había renombrado el artefacto a `Arquitectura-Unidad-Entrega.md`**, y el nombre viejo seguía vivo en **siete** lugares: cuatro en el mismo archivo —§4.2, el criterio de aceptación de §6, el ejemplo de §7 y los insumos de §5— y tres afuera —la tabla del plan maestro, la plantilla de intake y el árbol de la guía de usuario—.

**El criterio de aceptación es lo grave:** el audit verificaba la existencia del **nombre viejo**, de modo que un documento generado con el nombre correcto **lo habría reprobado**. `Migracion-Rules.md` §111 ya declara que un renombre de artefacto es el único cambio que **ningún diff de versiones puede inferir**; hay que propagarlo a mano, y no se propagó.

- **`Master-Prompt.md` 7.10 → 7.11**, **`PRODUCT-INTAKE-template.md` 3.2 → 3.3**, **`SDD-User-Guide.md` 1.13 → 1.14** y la regla de la categoría 05.

### Corregido — dos notas declaraban pendiente lo que la 8.15 cerró

`Coherencia-Barrido-Layout-8.0.md` §6 decía «quedan dos conceptos grandes sin barrer» y `Coherencia-Barrido-8.7-Dos-Ejes.md` §6 decía que barrer retroactivamente era de otra escala. **Las dos habían quedado afirmando lo último que alguien escribió**, que es literalmente el defecto que la 8.14 vino a regular. Las dos pasan a «y cómo se cerró». **`Root-Rules.md` 5.3 → 5.4**: §4.2 titulaba «Proyectos de código del producto» una sección cuyo contenido es la tabla de unidades de entrega.

### Declarado — la falsa alarma de la comprobación de enlaces

Los catorce «enlaces rotos» del árbol son **rutas ilustrativas dentro de los ejemplos de las reglas**, que describen el árbol de un destino y no tienen por qué resolver desde la ubicación de la regla. §VI.3 comprobación 3 las excluye: sin la exclusión son catorce avisos permanentes, y **una comprobación que avisa siempre es una comprobación apagada** —el mismo argumento con el que la 8.3 excluyó `_legacy/`—.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.16/`.

**Queda anotado:** los cuatro hallazgos aparecieron porque el Product Owner preguntó si quedaba algo, no porque una comprobación los levantara. Es el cuarto caso seguido. Lo que sí mejoró es que las cuatro veces la respuesta se obtuvo **verificando y no recordando**.

---

## [8.16] - 2026-08-16

**Se midió lo que la 8.4 había dejado como condición, y el resultado descarta la variante que llevaba cuatro versiones anotada.** `Coherencia-Referencias-Derivadas.md` §5 proponía que los documentos citaran **sólo por identificador** y la ruta se derivara de un índice de nivel producto, con una condición explícita para evaluarla: medir antes qué proporción del corpus referencia por ruta y cuál por identificador.

**Corpus medido: 759 documentos de tres destinos reales.**

| | Cantidad | Proporción |
| --- | --- | --- |
| Citas por identificador | 34 489 | **90,1 %** |
| Enlaces por ruta | 3795 | **9,9 %** |
| De las rutas: apuntan a un documento **con** identificador | 2099 | 55,3 % |
| De las rutas: apuntan a un documento **sin** identificador | 1696 | **44,7 %** |
| Enlaces rotos hoy | 3 | **0,08 %** |

**Tres razones, y la tercera es la que cierra:**

1. **El corpus ya cita por identificador nueve de cada diez veces**, y no porque una regla lo exija. La variante impondría estructuralmente lo que la práctica ya hace.
2. **Casi la mitad del 10 % restante no es sustituible.** Apunta a `README.md`, a la especificación de una categoría, a un índice: documentos **sin identificador**, que ningún índice de nivel producto puede direccionar. El techo de la variante es el **55 % del 10 %**.
3. **El índice sería una fuente declarativa nueva que hay que mantener, y no es subproducto de ningún acto.** Agregar un documento obligaría a acordarse de indexarlo. Es la clase de fuente que la **8.14** acaba de mandar evitar en `Master-Prompt-Reanudacion.md` §1.1 R3. **Cambiaríamos 3 enlaces rotos por un índice que se degrada en silencio**, que es el defecto más caro de los dos.

### Cambiado

- **`Coherencia-Referencias-Derivadas.md` 1.1 → 1.2.** §5 pasa de «lo que queda anotado» a **cómo se cerró**, y **§5.1** es nueva con la medición completa, su desglose por destino y la salvedad de que los tres corpus están generados contra el conjunto 6.0 —anterior a la condición que hace posible la variante—, con el argumento de por qué la medición sigue valiendo: captura **cómo se escribe**, y nadie escribió esas 34 489 citas porque una regla se lo pidiera.

**Ninguna regla, plantilla ni orquestador cambia**, y por eso el conjunto sube **patch**. El conjunto superado se archiva en `_legacy/8.15/`.

---

## [8.15] - 2026-08-16

**Tercer barrido retroactivo**, sobre los dos conceptos grandes que quedaban de intervenciones anteriores a la 8.9: el vocabulario de la **6.0** —la unificación del intake, que eliminó `PROJECT-BRIEF` y `PROJECT-README`— y los dos ejes de la **8.0** más allá de lo que la 8.12 y la 8.13 cubrieron.

**El vocabulario de la 6.0 estaba limpio, y conviene decirlo.** Las apariciones vivas de los nombres viejos son registros históricos, evidencia no editable de `Bootstrap/`, o renombres declarados —«reemplaza a las antiguas…»— que son lo que permite reconocer un destino generado con la versión vieja. **Que la 6.0 haya quedado limpia y la 8.0 no es informativo:** la 6.0 renombró **artefactos**, y un nombre de artefacto que sobrevive se ve; la 8.0 cambió **niveles**, y un nivel equivocado se lee bien.

### Corregido — ocho citas a una sección de un documento que no existe

**`Master-Prompt.md` citaba ocho veces `README §5 del proyecto de código`:** una sección del `PROJECT-README` que la **6.0 eliminó**, en el nivel que la **8.0 cambió**. Los dos conceptos en la misma línea.

**Cinco de las ocho son el origen de flags de gating** —`multi_tenant`, `tiene_auth`, `tiene_portal_developers`, `tiene_extensibilidad` y `tiene_observabilidad_critica`—. Las cinco filas **se contradicen dentro de sí mismas**: declaran el nivel «unidad de entrega» en su segunda columna y leen el valor del proyecto de código en la tercera, de un documento inexistente. Sus dos filas vecinas sí se habían migrado, lo que muestra que la 8.0 corrigió esa tabla **fila por fila y no terminó**.

**Por qué no lo detectó nada:** un subagente al que se le pide leer una sección inexistente no falla, **infiere el valor**. Y un flag de gating inferido decide qué categorías se generan y cuáles se omiten, produciendo documentación que parece correcta.

- **`Master-Prompt.md` 7.9 → 7.10.** Las ocho citas pasan a `PRODUCT-INTAKE` §17 de la unidad de entrega, con la misma numeración de P. Se corrigen además el origen y el impacto de los cinco flags, que nombraban categorías «del proyecto de código» cuando viven bajo `Unidades-Entrega/`.
- **`Rules-Devops.md` 4.2 → 4.3.** §0.2 declaraba **dos** matrices de artefactos publicables —«por unidad de entrega, la matriz de artefactos publicables por proyecto de código»—: la actualización de la 8.0 agregó la nueva **sin retirar la vieja**. Hay una sola: se construye por proyecto de código y **se publica por unidad de entrega**.
- **`SDD-User-Guide.md` 1.12 → 1.13** y **`Marco-Teorico-SDD.md` 3.2 → 3.3.** Las Fases B a G se recorren por unidad de entrega en el orden topológico del **grafo de integración**, y la consolidación de producto tiene los **dos** grafos con su matriz.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.14/`.

**Queda anotado:** los tres barridos retroactivos encontraron algo, y los tres se corrieron **por decisión explícita del Product Owner**. El criterio que la 8.12 fijó —«cuando una intervención vieja se toca por cualquier motivo, su concepto se barre entonces»— **no se disparó ninguna de las tres veces**. Y los tres dan la misma respuesta sobre qué clase de defecto sobrevive: **la tabla, no la prosa**.

---

## [8.14] - 2026-08-16

**Se cierra el único pendiente que una nota de coherencia declaraba sin resolver:** una dimensión del estado cuya fuente **nadie tenía obligación de mantener**. Lo destrabó una instrucción del Product Owner —«cuando no tengas dueño, colocá un dueño genérico, y con eso lo resolvés y no dejás algo boyando»— sobre una solución que yo había descartado.

**La había descartado mal.** Mi argumento era que declarar el dueño no alcanzaba, porque el registro que se degradó ya declaraba su regla de mantenimiento. Al ir a leerla, decía: *«se actualiza en la rama de la etapa, no después de la fusión»*. **Declara el cuándo y no declara el quién** — es una oración sin sujeto, y una obligación sin sujeto no la incumple nadie en particular. Faltaba un dueño, literalmente.

**La otra mitad se sostiene, y la evidencia es fuerte.** Esa dimensión tenía **dos** fuentes declarativas y **las dos se degradaron**: el registro quedó en la etapa `b` con el código en la `e`, y las etiquetas por etapa cerrada que el pipeline declaraba como **el** instrumento de versionado nunca se crearon —**cero en todo el repositorio**—. Lo único intacto fue el **nombre de la rama en cada confirmación de fusión**, que nadie tuvo que acordarse de escribir porque fusionar lo escribe.

### Agregado — las tres reglas

- **`Master-Prompt-Reanudacion.md` 1.1 → 1.2.** §1 suma la columna **«quién la mantiene»** a las seis dimensiones, y **§1.1** es nueva:
  - **R1** · Toda fuente declarativa nombra a su responsable **en el propio documento**, no en un plan ni en una regla del framework.
  - **R2** · Cuando ningún rol del producto corresponde, el responsable es **genérico y sigue siendo obligatorio**: el rol que el producto asigne, si no el perfil de convención del intake, si no **la organización dueña del repositorio**. Un campo vacío se lee como que la pregunta no se hizo.
  - **R3** · Entre dos fuentes posibles, **gana la que es subproducto del acto**. Y su consecuencia: cuando la fuente no es un subproducto, el contraste observable **deja de ser opcional**.
- **`Rules-Devops.md` 4.1 → 4.2.** §4.3 suma los ítems **7 y 8** a `Estrategia-Versionado.md` —el registro del avance con responsable nombrado, y el instrumento preferido— y §4.8 el anti-patrón, con el caso observado.
- **`SDD-Development-Guide.md` 1.12 → 1.13.** La Parte IV suma el bloque «sobre las fuentes declarativas que declares», para quien escribe una regla que crea un documento donde alguien va a declarar un estado.

**No extiende el alcance del framework, que era el temor de la nota anterior.** No le da un prompt al ciclo de construcción ni lo gobierna: exige que el documento **diga quién lo mantiene**, que es una propiedad del documento.

**El framework ya sabía la respuesta y la aplicaba en un solo lugar.** `Rules-Devops.md` §4.8 tenía el anti-patrón «CHANGELOG ausente o no mantenido» resuelto por generación automática desde los mensajes de confirmación: es **R3**, escrito para el registro del **integrador** y nunca aplicado al del **avance del producto**.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.13/`.

---

## [8.13] - 2026-08-16

**El cambio de layout de la 8.0 nunca llegó a la tabla que el orquestador ejecuta.** `Master-Prompt.md` §3.5 declara desde la 7.0 que la documentación de las categorías 02 a 11 se genera **por unidad de entrega**, bajo `SDD/Docs/Unidades-Entrega/<Nombre-Unidad-Entrega>/`. La tabla del plan maestro de §7 seguía declarando el ámbito «proyecto de código» en once categorías y emitiendo a **`SDD/Docs/Proyectos/<Nombre>/`**, en sus **quince filas**.

**El intro de esa misma §7 está treinta líneas más arriba de la tabla que lo contradice**, y dice lo correcto. Es la forma de defecto que la 8.12 encontró en `Intake-Rules.md` §4 —prosa y tabla operativa en desacuerdo dentro del mismo archivo—, pero acá la tabla gobierna toda la generación: **una corrida nueva producía el layout anterior a la 8.0**. Y el criterio de ubicación del audit de §10 verificaba contra la ruta vieja, de modo que **habría aprobado el resultado equivocado**.

**Qué acota el daño:** la migración no lee esta tabla. Un destino migrado quedó correctamente bajo `Unidades-Entrega/`. Lo que rompía era generar un producto nuevo.

### Cambiado — el layout

- **`Master-Prompt.md` 7.8 → 7.9.** Las quince filas de §7 en sus columnas de **ámbito** y **path de salida**; el gating por flag y la variante D8, que se leían del proyecto de código; el `path-docs` del bloque de manifiesto de §3.4; y el criterio de ubicación del audit de §10.
- **Once reglas de categoría y `Deriva-Rules.md`**, patch cada una: la ruta de salida de su prompt de despacho de referencia, que emitía a `SDD/Docs/Proyectos/{{NOMBRE_PROYECTO_CODIGO}}/` y citaba un marcador que el contexto de despacho ya no define.
- **`Root-Rules.md` 5.2 → 5.3.** El Ejemplo A de §7.1 publicaba su mapa de documentación sobre la ruta vieja: el ejemplo canónico de un README raíz contradecía a §2.1 del mismo archivo.
- **`SDD-User-Guide.md` 1.11 → 1.12.** El árbol del caso multi-unidad y el mapa del resumen ejecutivo le enseñaban al usuario una estructura que el framework ya no genera.

### Corregido — 39 concordancias de la sustitución de la 8.0

«Proyecto» es masculino y «unidad de entrega» es femenina. La sustitución léxica de la 8.0 dejó **«algún unidad de entrega»**, **«ese unidad de entrega»**, **«unidades de entrega tipados»**: 39 casos en 13 archivos. Es la clase de defecto que `Vocabulario-Rules.md` §9.5 documenta desde la 5.1, producida por la operación que esa misma sección regula.

### Agregado — la comprobación 10, integridad del registro

Al verificar los controles de cambios aparecieron **seis archivos inconsistentes**, repartidos entre cuatro intervenciones: tres con la fila nueva insertada **antes** de la última en lugar de después, dos con la **cabecera subida sin agregar la fila**, y `SDD-Development-Guide.md` con las dos cosas —cabecera en **1.7** mientras su tabla llegaba a **1.10**—. **Cuatro de los seis son de las tres intervenciones anteriores.**

- **`SDD-Development-Guide.md` 1.10 → 1.12.** §VI.3 suma la **comprobación 10**: la versión de cabecera **es** la mayor fila del control de cambios, las filas están **en orden** y ninguna se repite. La comprobación 5 pedía «una fila por archivo» y se cumplía escribiéndola en cualquier lado. La 1.12 absorbe además la 1.11, que la 8.12 había numerado sobre una cabecera desactualizada.
- Los seis registros quedaron restituidos, incluidas las dos filas que faltaban en `Vocabulario-Rules.md` y `Master-Prompt-Reanudacion.md`.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.12/`.

**Queda anotado:** quedan **dos conceptos grandes sin barrer** —el vocabulario de la 6.0 y el resto de los dos ejes de la 8.0—. Esta intervención confirma por segunda vez el criterio de la anterior: **el concepto sobrevive en la tabla que se ejecuta, no en la prosa que se lee**.

---

## [8.12] - 2026-08-16

**El barrido por concepto se corrió sobre lo que la 8.7 corrigió, y encontró el concepto vivo en cinco archivos más.** La 8.7 es anterior al barrido —que entró en la 8.9—: arregló el lugar donde el defecto se había manifestado, §17 de la plantilla de intake, y declaró ese archivo como su alcance.

**Tres de los cinco hallazgos valen por sí solos:**

- **`Intake-Rules.md` §4 se contradecía consigo mismo a treinta líneas de distancia.** Su mapeo era **una sola tabla** que le pedía a la misma fila el `Nombre-Proyecto-Codigo` y el `tipo_unidad_entrega`, y su paso 2 leía `redistribuible` —atributo de la entrega— de la fila del proyecto de código. Más abajo, el mismo §4 valida: *«Ningún proyecto de código declara un valor D8»*. Un defecto que entra y sale del mismo archivo **no lo cruza ninguna verificación entre artefactos**: es el primer caso cobrado de la coherencia interna que la 8.9 incorporó.
- **`Master-Prompt.md` tenía un marcador roto en el despacho.** Desde la 7.0 el despacho se parametriza por unidad de entrega, pero tres plantillas —el insumo del intake de §8, el bloque de ambigüedad de §9 y el despacho del auditor de §10— seguían citando **`{{NOMBRE_PROYECTO_CODIGO}}`**, que el contexto ya no define. Un marcador sin valor no falla: **se completa con lo que el agente suponga**.
- **El checklist que verifica §17 estaba dentro del archivo que la 8.7 tocó, y no se abrió.** §19 de la plantilla seguía pidiendo «§17 completo para cada proyecto de código». Es exactamente lo que `SDD-Development-Guide.md` §VI.3.1 manda barrer —**el interior de lo ya tocado**— y la primera vez que se cobra.

### Cambiado

- **`Intake-Rules.md` 4.0 → 4.1.** El mapeo de derivación pasa de **una** tabla a **tres** —eje de entrega, eje de construcción y producto—, con la constancia de que ningún campo D8 ni `redistribuible` sale del eje de construcción y ningún `Identidad-Codigo` sale del de entrega. El prefijo de organización de un redistribuible **se resuelve por el puente §13.3** —qué proyecto publica la entrega— y no por la fila. §5 corrige la Parte C, que decía «por cada proyecto de código» contra §2.2 del mismo archivo.
- **`Master-Prompt.md` 7.7 → 7.8.** Los tres marcadores rotos pasan a `{{NOMBRE_UNIDAD_ENTREGA}}`; §2 y §4 nombran el nivel correcto.
- **`PRODUCT-INTAKE-template.md` 3.1 → 3.2.** El checklist de la Parte C pasa a la unidad de entrega vigente y nombra las **dos** tablas de identidad que la 8.7 creó; §16 deja de tratar `redistribuible` como atributo del proyecto.
- **`Vocabulario-Rules.md` 3.0 → 3.1** y **`Marco-Teorico-SDD.md` 3.0 → 3.1.** La cita literal del despacho sigue al original; el glosario del manifiesto declara los dos ejes y la matriz.

### Corregido — el archivo de versiones estaba corrido un lugar

**Al tomar el snapshot de `_legacy/8.11/` se descubrió que cuatro de los cinco anteriores estaban mal.** `_legacy/8.10/` contenía el conjunto **8.11**, `_legacy/8.9/` el **8.10**, y así: todos se habían copiado **después** de aplicar la intervención en lugar de antes, con lo cual cada carpeta llevaba el nombre de una versión y el contenido de la siguiente.

**No es un problema del archivo histórico: es un problema de la migración.** `Master-Prompt-Migracion.md` construye el diff normativo de un salto leyendo `_legacy/`. Con el archivo corrido, **el diff de ese salto sale vacío** y una migración que no tiene nada que aplicar se declara completa sin haber hecho nada. Un snapshot corrido es más dañino que uno ausente, porque el ausente se nota.

- **`_legacy/8.6/`, `8.7/`, `8.9/` y `8.10/` reconstruidos** desde el estado que a cada uno le corresponde, verificados archivo por archivo contra la versión de cabecera que tenían al publicarse. `_legacy/8.8/` estaba bien.
- **`SDD-Development-Guide.md` 1.7 → 1.8.** §VI.5 declara **cuándo** se toma el snapshot —antes de aplicar la intervención—, la consecuencia de tomarlo tarde, la verificación mecánica por versión de cabecera, y que la regla de intocabilidad **no cubre** una carpeta que archivó el conjunto equivocado: reconstruirla no reescribe historia, la restituye.

**§VI.5 decía qué copiar y no decía cuándo**, y ese hueco produjo cuatro errores seguidos sin que ninguna verificación los viera.

**Ninguna invariante modificada, y D8 conforme en el sentido que importa:** los ocho valores no cambian; cambia **a qué eje se le piden**, que es lo que la 8.0 decidió y estos cinco lugares no habían acatado. El conjunto superado se archiva en `_legacy/8.11/`.

**Queda anotado:** las intervenciones anteriores a la 8.9 son todas anteriores al barrido y **ninguna lo corrió**. El criterio que esta entrada fija es que **cuando una intervención vieja se toca por cualquier motivo, su concepto se barre entonces**.

---

## [8.11] - 2026-08-16

**El orquestador de reanudación de la 8.10 diagnosticaba y se detenía.** Lo señaló el Product Owner el mismo día, con una pregunta directa: *«y si no se migra —porque no hay que migrar o porque se eligió no hacerlo—, ¿retomaría, recuperaría el contexto y seguiría?»*.

**La respuesta era no.** Sus cuatro fases terminaban en un informe y sus salidas decían a qué prompt ir, con lo cual **el siguiente volvía a deducir lo que éste acababa de deducir** —el trabajo que el prompt vino a evitar—. Y en la salida más frecuente, continuar la construcción, **no hay «tal otro»**: no tiene prompt, de modo que quedaba un diagnóstico sin punto de continuación.

### Cambiado

- **`Master-Prompt-Reanudacion.md` 1.0 → 1.1.** El informe **deja de ser un diagnóstico y pasa a ser el instrumento de entrega**: suma el **diff normativo** que el orquestador siguiente consume, la **decisión** con su autor y su fecha, y el **punto de continuación** —la etapa que sigue, su puerta de entrada y los documentos que la gobiernan—, que existe **para la salida que no tiene prompt**. Entra **R4, la continuación**: escrito el informe, se sigue en la misma sesión. Cortar ahí sigue siendo válido; lo que no lo es, es continuar **sin** escribir el informe, porque entonces el contexto vuelve a vivir sólo en la sesión.
- **`Master-Prompt.md` 7.6 → 7.7.** §2.1 **no vuelve a preguntar** cuando la reanudación ya resolvió el desfase: lee la decisión del informe, la informa como decidida y continúa. Caduca al cambiar la procedencia o la versión vigente.
- **`Master-Prompt-Migracion.md` 2.2 → 2.3.** **M1 verifica** el diff normativo que el informe trae, en lugar de reconstruirlo: rehacerlo no lo vuelve más confiable, lo vuelve más lento y arriesga dos diffs del mismo salto que no coinciden.

**La 8.10 cometió el defecto que la 8.9 había escrito para evitar.** Su regla dice que la pregunta final de toda intervención es «¿mi intervención cometió el defecto que corrige?», y acá la respuesta era sí: **un prompt contra la pérdida de contexto que no entregaba contexto**. Es el cuarto caso del mismo patrón, y los tres anteriores están registrados en esa misma regla.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.10/`.

---

## [8.10] - 2026-08-16

**«Si corto a mitad de camino, ¿cómo se continúa desde una sesión limpia?»** La pregunta la hizo el Product Owner al terminar una migración real, y **no había respuesta escrita**: los dos orquestadores declaran detenciones, confirmaciones humanas y auditores invocados desde cero, y ninguno declara cómo se retoma.

**Lo que había en su lugar era una propiedad cierta y no escrita**: el estado vive en el árbol y no en la conversación. Es la razón de ser del framework, y **que fuera cierta sin estar declarada es lo que hizo que nadie la verificara**.

La corrida que produjo la pregunta tenía la prueba del daño: el destino declaraba en su registro de cambios la etapa `b` y su código estaba en la `e` —**tres etapas fusionadas que nunca actualizaron el único documento que declara el avance**, con la regla de actualizarlo escrita en la segunda línea de ese mismo documento—. Una sesión limpia habría concluido que faltaba arrancar la `c`. En la misma corrida divergieron otras dos fuentes, y las tres tienen la misma forma: **un documento que quedó atrás y sigue afirmando lo último que alguien escribió**.

### Agregado

- **`Master-Prompt-Reanudacion.md` 1.0**, tercer orquestador del método, con la cardinalidad de **una vez por reanudación**. Declara las **seis dimensiones del estado**, cada una con su fuente declarativa y —en las tres que divergieron— su **contraste observable**, con la regla de que **gana el observable y la divergencia se declara**. Cuatro fases, dos detenciones, y **no escribe nada del destino salvo su informe de estado**.
- **`PROMPT-Agente-Reanudacion-SDD.md` 1.0**, tercer prompt de entrada, con la tabla de los tres y su cardinalidad.
- **La cuarta salida no tiene prompt, y es deliberado.** Tres invocan un orquestador —reparar, migrar, seguir en la versión declarada— y la cuarta, **continuar la construcción**, no invoca ninguno. Es la más frecuente y la que más se pasa por alto: un método que sólo ofrece lo que sabe ejecutar **sesga la decisión hacia lo ejecutable**.

### Cambiado

- **`Master-Prompt.md` 7.5 → 7.6.** §2.1 apunta al orquestador de reanudación cuando quien invoca no sabe el estado, y declara que la reconciliación normativa resuelve **una** de sus seis dimensiones.
- **`Migracion-Rules.md` 3.3 → 3.4** y **`Master-Prompt-Migracion.md` 2.1 → 2.2.** «El contrato entre los dos orquestadores» pasa a **nombrarlos**: con tres, la frase seguía siendo cierta y pasaba a ser ambigua.
- **Cinco documentos más** actualizan sus recuentos y sus tablas de ruteo.

**Esta intervención estrena el barrido por concepto de la 8.9**, y lo justificó en su primera corrida: encontró **siete lugares** que decían «dos», y **cuatro no estaban en el alcance que se habría declarado** —dos guías de usuario, la de arranque y un prompt de entrada—. Dos se **desambiguaron en lugar de recontarse** y tres se **dejaron declaradas** por ser registros de lo verificado en su fecha.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.9/`.

---

## [8.9] - 2026-08-16

**La lista de comprobación de coherencia tenía «sin contradicción entre lo escrito y lo que ya estaba», y tres intervenciones seguidas la pasaron dejando una contradicción adentro.** No porque nadie la corriera: porque **está enunciada sobre los archivos tocados**, y los tres defectos vivían en lugares que la intervención había tocado sin mirar, o que ni figuraban en su alcance.

Los tres son el mismo caso. La **8.0** movió el bloque técnico del intake de colgar del proyecto de código a colgar de la unidad de entrega, y **la tabla de identidad dentro de ese mismo bloque** siguió pidiendo el valor D8 al proyecto de código —descubierto **tres versiones después**, completando un intake real—. La misma 8.0 dejó **el orquestador de migración** describiendo el modelo anterior —descubierto **dos versiones después**, al ir a ejecutarlo—. Y su propia nota de coherencia registró que **la intervención cometió el defecto que corregía** en su propio alcance, y aun así volvió a pasar.

**Lo que falló no fue el cuidado: el alcance se declaró por archivo y el cambio era por concepto.**

### Cambiado

- **`SDD-Development-Guide.md` 1.6 → 1.7.** La lista de comprobación de §VI.3 pasa de **siete a nueve**: entra el **barrido por concepto** —enumerar el término en todo el árbol, sin filtrar por el alcance declarado, **incluido el interior de los archivos ya tocados**— y la **coherencia interna de cada artefacto**, que ninguna comprobación entre archivos detecta. Entra **§VI.3.1** con el procedimiento de cuatro pasos, los tres casos que lo produjeron y por qué una plantilla es el peor lugar para dejar una contradicción: no rompe nada hasta que alguien la completa, y es el artefacto con más superficie de contacto del framework.
- **La cuarta regla del procedimiento es la que faltaba y la que más cuesta.** La pregunta final de toda intervención no es «¿toqué todo lo que había que tocar?» sino **«¿mi intervención cometió el defecto que corrige?»**. En los tres casos la respuesta era sí, y en los tres se podía haber contestado antes de publicar.
- **`README.md`** suma la fila de «cambiar un concepto» a su tabla de reglas de intervención.
- **`Coherencia-Plantilla-Intake-Identidad.md` 1.0 → 1.1.** Su §6 pasa de «lo que no resuelve» a **cómo se cerró**: pedía tratar los tres casos juntos y no agregar una comprobación por caso, y así se hizo.

**Esta intervención se verificó con la regla que incorpora.** El barrido por concepto encontró **una** aparición alcanzada fuera de su alcance declarado —una nota de coherencia que citaba «las siete comprobaciones»— y **se declaró en lugar de reescribirse**, porque es un registro de lo que se verificó en su fecha. Es la regla 3 del propio procedimiento.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.8/`.

---

## [8.8] - 2026-08-16

**Lecciones de la primera migración real completa.** Un destino de siete proyectos de código migró de 6.0 a 8.6 y **se llevó la migración hasta el final**: las siete fases, la consolidación de casos de uso, la de la fusión —67 grupos, 143 documentos absorbidos, 9726 líneas— y seis rondas de auditoría. Lo que sigue son las reglas que esa corrida necesitó y que no estaban escritas, cada una con el error que la produjo.

### Cambiado

- **`Migracion-Rules.md` 3.2 → 3.3.** §4.3.1 suma **dos errores de la pasada de aplicación** a los tres que ya tenía: la reconexión se hace **resolviendo destinos y no sustituyendo patrones** —un patrón no sabe desde dónde se lo cita, y en la corrida rompió **181 enlaces donde había 96**—, y **una cita se declara ambigua después de agotar los resolutores**, no antes: cuatro resolutores en cascada llevaron **305 citas «ambiguas» a 16**. Y declara **qué alcanza el árbol de renumeración**, que dejó afuera dos conjuntos que volvieron como hallazgos: las familias que el propio intake acuña —con dos numeraciones de la misma regla conviviendo— y los documentos de referencia cruzada de nivel producto, que caen en el hueco entre dos recorridos.
- **§4.3.2 suma cinco reglas de consolidación.** La **categoría** es la unidad de trabajo y no el documento, porque los documentos de una capa se citan entre sí como vecinos y consolidar de a uno deja a los hermanos apuntando al vacío. **El solapamiento se mide antes de elegir la salida**: en la corrida fue del **5,9 %**, de modo que consolidar no era deduplicar sino **unir con atribución**. Se declaran **cuatro salidas**, con la advertencia sobre la única que **no reduce documentos** —cuatro samples con contratos distintos no se funden en uno con un contrato, se funden en uno que no verifica ninguno—. **Ninguna cifra se promedia**: un promedio de umbrales no es un umbral. Y **la transposición lee el documento entero**, no sólo sus secciones numeradas.
- **§6 suma cuatro criterios de aceptación**, incluida la distinción entre «ninguno se sobrescribió» y «la fusión terminó», que la auditoría de la corrida confundió durante tres rondas.
- **`Master-Prompt-Migracion.md` 2.0 → 2.1.** El formato del diff de estructura suma el renglón de **secciones colapsadas** —el inverso del de partidas, y **el movimiento más grande de la fase** en esa corrida: siete bloques a dos— y dos renglones para **campos que cambian de dueño o desaparecen**. Y declara **cómo se transpone un bloque colapsado sin reescribirlo**, que es lo que vuelve verificable la regla de no invención.
- **`Master-Prompt.md` 7.4 → 7.5.** §10 suma dos criterios de audit: **un recuento que confirma una propiedad no confirma las demás**, y usarlo para afirmar lo que no decide es **P1**; y **toda marca de una comprobación se abre antes de reportarla**, porque un verificador que sobre-reporta entrena a ignorarlo y el día que acierta ya nadie lo mira.

**Ninguna invariante modificada.** El conjunto superado se archiva en `_legacy/8.7/`.

---

## [8.7] - 2026-08-16

**La plantilla de intake se contradecía a sí misma, y el defecto se descubrió usándola.** La 8.0 partió §13 en dos ejes y movió el bloque técnico de §17 de «por proyecto de código» a «por unidad de entrega». **La tabla de identidad de §17 se conservó del bloque anterior** y siguió pidiéndole `tipo_unidad_entrega` (D8) y `redistribuible` **al proyecto de código**, contra lo que §13.2 del mismo documento declara —«los proyectos de código no llevan valor D8»— y contra §13.1, que hace de `redistribuible` una columna de la unidad de entrega.

**El daño no es formal.** Quien completara §17 siguiendo la plantilla **declaraba D8 tantas veces como proyectos tuviera el producto**, y tenía que elegir una forma de entrega para algo que no se entrega. Es el defecto que el modelo de dos ejes existe para hacer imposible, escrito en el documento que lo enseña.

**Cómo apareció.** Migrando un destino real de 6.0 a 8.6, en la fase M2. El agente que completaba el intake tuvo que decidir qué hacer con esa tabla y emitió la contradicción como hallazgo aguas arriba en lugar de copiarla. **Ninguna verificación del framework la había detectado en tres versiones**: la coherencia interna de una plantilla entre dos de sus secciones no la mira nadie.

### Cambiado

- **`PRODUCT-INTAKE-template.md` 3.0 → 3.1.** §17 pasa a **dos tablas de identidad**: la de la unidad de entrega, con su D8, su `redistribuible` y los proyectos que la componen; y la de esos proyectos, con nombre, identidad de código y rol, **sin D8 y sin `redistribuible`**, con la constancia de por qué no los llevan y de que un proyecto compartido aparece en el bloque de cada entrega que compone.
- **Ocho instrucciones de P.1 a P.12** decían «del proyecto de código» bajo un encabezado que dice «por unidad de entrega». Pasan a decirlo de la entrega, con la regla de **nombrar el proyecto cuando el dato es de uno en particular**: P.1 enumera los stacks, P.3 distingue el contrato de integración de §13.1 del de compilación de §13.2, P.6 declara los umbrales **por proyecto y sin promediar**, y P.10 admite los NFR de una capa interna nombrando su proyecto.

Ninguna sección se agrega ni se retira, ningún campo bloqueante cambia y ninguna invariante se modifica. El conjunto superado se archiva en `_legacy/8.6/`.

---

## [8.6] - 2026-08-15

**R5 estaba declarada y nada la verificaba.** La 8.4 incorporó la regla —toda referencia a un artefacto identificado nombra su identificador en el texto visible— y no agregó ninguna comprobación que la exija. La compuerta usaba R5 **solo para reparar** un enlace ya roto.

La consecuencia es la que hace al defecto grave: una referencia **sin ancla pasa todos los controles**, y se descubre en el momento en que su destino cambia, que es exactamente cuando ya no se puede reparar —no hay de dónde deducir a qué apuntaba—.

Es el patrón del reporte `10` cometido por la intervención que lo tenía presente: la regla quedó escrita del lado que no bloquea.

### Cambiado

- **`Master-Prompt.md` §10.0** suma la quinta comprobación de la compuerta: anclaje de las referencias. Es la que hace posibles a las demás, y se verifica **antes** de que se rompa nada.
- **§10** suma el criterio de audit correspondiente, nivel **P2**. No es cosmético: el costo de una referencia sin ancla no se paga al escribirla sino cuando alguien mueve el archivo.

Ninguna invariante modificada. El conjunto superado se archiva en `_legacy/8.5/`.

---

## [8.5] - 2026-08-15

**El orquestador de migración había quedado dos versiones atrás, y la verificación no lo vio.** Detectado al ir a ejecutar la migración real de un destino: el prompt que la conduce seguía hablando del modelo de dos niveles.

### Qué pasó

`Master-Prompt-Migracion.md` estaba en 1.1. Su §2 tomaba «el orden topológico de los **proyectos de código**», su §7 validaba «dos **proyectos de código** principales» y su §8 M4 —la fase larga, la que recorre `SDD/Docs/`— recorría «cada **proyecto de código**». Con la 8.0 el nivel intermedio pasó a la unidad de entrega, y este archivo no se enteró.

**Por qué la verificación de la 8.0 lo dio por conforme.** Porque midió la **ausencia de lo viejo**: contó residuos de `tipo_proyecto_codigo` y de la ruta anterior, y este archivo tenía **cero** de las dos cosas. No porque estuviera migrado, sino porque **nunca las había usado**: ordenaba el recorrido nombrando el nivel en prosa, sin citar la variable. Un archivo que nunca usó el término viejo pasa la comprobación sin haber sido migrado, y ése es el falso negativo.

### Cambiado

- **`Master-Prompt-Migracion.md` 2.0.** M4 recorre **unidades de entrega** en el orden del grafo de **integración**, suma el inventario del eje de construcción en la vista de producto, y declara que los proyectos de código no tienen árbol propio y no se recorren como nivel. §2 y §7 se alinean.
- **La precondición que faltaba**: cuando el salto cambia el nivel de aplicación, M4 ejecuta **primero** la migración estructural de `Migracion-Rules.md` §4.3.2, con su detención de clasificación. No puede recorrer un nivel que el destino todavía no tiene, y hacerlo al revés migra documentos contra un nivel que va a cambiar y obliga a tocarlos dos veces.
- **`SDD-Development-Guide.md` Parte IV** suma cómo se verifica una intervención estructural: comprobar la **presencia de lo nuevo** y no solo la ausencia de lo viejo; explicar cada archivo del alcance que **no cambió**, porque «no le correspondía» y «se olvidó» se ven igual; y, cuando cambia un nivel, revisar que **cada archivo que ordena un recorrido** nombre el nivel nuevo, que es lo que más se olvida porque el orden no suele nombrar la variable renombrada.

### Sobre el origen

Es la cuarta corrección que sale de ejecutar y no de leer, y la primera que sale de **ir a ejecutar**: apareció al abrir el orquestador para lanzar la migración, antes de tocar un solo archivo del destino. Si la corrida hubiera arrancado, habría migrado hacia el modelo que la 8.0 dejó atrás.

El conjunto superado se archiva en `_legacy/8.4/`.

---

## [8.4] - 2026-08-15

**Los seis huecos eran dos causas.** Las versiones 8.1 a 8.3 resolvieron uno por uno los huecos que la migración de un destino real destapó. Con los seis a la vista, el análisis muestra que no eran independientes.

| Causa | Huecos que explica |
| --- | --- |
| **Una referencia es un dato derivado, y el framework la trataba como texto** | El chequeo que incluía snapshots como origen, el archivado que no reescribía rutas, la etiqueta separada de su destino y la profundidad que cambia al fundir |
| **Una operación produce situaciones que su regla no declara** | El puntero del snapshot al renombrar y la colisión de nombres al fundir |

### Cambiado — las referencias

- **`Root-Rules.md` §10 suma R5.** Una ruta relativa codifica dos cosas: la **identidad** del destino, que es un dato declarado, y la **posición relativa** entre dos archivos, que es una relación y se rompe cuando el destino se renombra, el documento se mueve o cambia de profundidad. Es el mismo defecto que R1 a R4 describen para los números. De ahí las dos obligaciones: toda referencia a un artefacto identificado **lo nombra** —`[CU-00014](ruta)`, nunca solo la ruta—, y la ruta se trata como derivada.
- **`Master-Prompt.md` §10.0 pasa de avisar a reparar.** Una ruta que no resuelve pero cuyo identificador existe en el árbol **se recalcula y se informa como reparación**; el hallazgo queda reservado para lo que no se resuelve de forma unívoca. La compuerta deja de acumular avisos de algo que sabe arreglar.

**La evidencia de que esto es recalculable y no interpretable**: de 703 enlaces rotos en el destino migrado, **los 703** se reconectaron resolviendo por identificador, sin una sola decisión humana. Un dato que un guion recalcula al cien por ciento no debería estar escrito a mano.

### Cambiado — las operaciones

**`SDD-Development-Guide.md` Parte IV** suma cuatro preguntas sobre lo que una operación **produce**, no sobre lo que hace. Renombrar deja punteros al nombre viejo, archivar acorta rutas relativas, fundir produce colisiones, propagar hacia una categoría aprobada produce contradicciones: son consecuencias necesarias, no casos exóticos, y sin declararlas cada agente improvisa. Es la misma pregunta que la guía ya hacía sobre los criterios de aceptación, aplicada a los verbos en lugar de a los artefactos.

### Lo que queda anotado y no se hace

La variante estructural: que los documentos citen **solo** por identificador y la ruta se derive de un índice de nivel producto. Resolvería el problema de raíz en lugar de repararlo, y es posible desde la 7.0 porque recién con el ámbito de unicidad en el producto un identificador es una dirección suficiente. La condición para evaluarla queda escrita en `Coherencia-Referencias-Derivadas.md` §5: **antes hay que medir** qué proporción del corpus referencia por ruta y cuál por identificador.

Ninguna invariante modificada. Ninguna documentación emitida deja de cumplir. El conjunto superado se archiva en `_legacy/8.3/`.

---

## [8.3] - 2026-08-15

**Lo que una migración real necesitó y la regla no decía.** Tercera y última corrección salida de ejecutar la migración normativa de un destino de siete proyectos de código. Los seis huecos aparecieron uno tras otro durante la corrida, y **ninguno era detectable leyendo el framework**: el texto era coherente consigo mismo en los seis casos.

### Cambiado — la comprobación de enlaces

- **`Master-Prompt.md` §10.0 excluye los snapshots de `_legacy/` como origen.** Sus referencias no son navegación vigente: dejan de resolver por hechos posteriores —un renombre, un archivado— que no son defectos del árbol vivo. Incluirlos produce el volumen de avisos que desactiva la comprobación, que es lo que ella misma viene a evitar. Los enlaces **hacia** `_legacy/` sí se verifican.
- **§8 suma la reescritura de enlaces al archivar.** Un documento archivado baja uno o dos niveles y todas sus rutas relativas quedan cortas, de modo que cada archivado dejaba colgados tantos enlaces como referencias tuviera el documento. En el destino medido la acumulación llegó a **658 enlaces rotos, todos anteriores** a la migración que los encontró.

### Cambiado — la pasada de aplicación de la migración

`Migracion-Rules.md` §4.3.1 declara que **los punteros de un snapshot sí se reconectan** cuando el documento vivo se renombra. No es modificar su cuerpo: lo que el snapshot dice queda igual y solo se actualiza el destino de un puntero que identifica al mismo documento con su nombre vigente. Un puntero que sigue a su objeto no falsea el registro; uno que queda colgado no preserva nada.

Y suma los **tres errores concretos** que la corrida cometió, con su regla:

1. **La etiqueta y el destino de un enlace son el mismo identificador** y se mapean juntos. Tratarlos por separado deja la etiqueta apuntando a un identificador inexistente, y **la comprobación de enlaces no lo detecta** porque el destino sí resuelve: lo roto es lo que el lector ve.
2. **Un documento que cambia de profundidad recalcula todos sus enlaces**, no solo los que apuntan a algo movido. Al fundir árboles, un documento que baja un nivel deja cortas todas sus rutas aunque sus destinos no se hayan movido.
3. **Los enlaces se reconectan desde un registro confirmado**, con la misma disciplina de dos pasadas que los identificadores. La columna «ya estaba roto antes de migrar» es la que distingue lo que la migración rompió de lo que reparó: en la corrida, de 703 enlaces reconectados **664 ya estaban rotos** y 39 los rompió el renombre.

### Añadido — la fusión de árboles

`Migracion-Rules.md` §4.3.2 declara:

- La convención **`<categoria>/_fusion/<Proyecto-De-Origen>/`** para los documentos que chocan de nombre al fundir —los índices de categoría—. No se sobrescriben ni se fusionan automáticamente: el árbol base conserva el nombre y los demás se preservan con su procedencia en la ruta. La presencia de esa carpeta declara que la fusión no terminó.
- La **propuesta de consolidación de casos de uso** como artefacto obligatorio y **no aplicado**. Al fundir capas, la categoría 02 resultante contiene varias vistas de la misma capacidad; la migración emite los pares candidatos con su semejanza, sus capas de origen y las tres salidas posibles, y no elige. Los cuatro casos de uso de una capacidad no dicen lo mismo, y la unión no es la suma de sus partes.
- Las **citas desnudas ambiguas** como sección del árbol: identificadores citados en prosa cuyo número no existe en el proyecto que los escribe. Se resuelven **leyendo y no contando**, porque el referente está en la oración o en el párrafo. En la corrida fueron 57, de las cuales 44 nombraban su proyecto en la misma oración y 13 no apuntaban a ningún proyecto.

### Sobre el origen de las tres últimas versiones

La 8.1, la 8.2 y la 8.3 salieron todas de **ejecutar una migración**, no de leer el framework ni de un reporte de evidencia. La 8.0 pasó sus comprobaciones estáticas y su nota de coherencia, y llevaba seis huecos que solo aparecen al calcular sobre un producto real. Es el argumento para validar cada versión mayor contra una migración antes de darla por buena, y queda escrito en `Coherencia-Rangos-Por-Familia.md` §5.

Ninguna documentación emitida deja de cumplir. El conjunto superado se archiva en `_legacy/8.2/`.

---

## [8.2] - 2026-08-15

**El árbol de migración declara las familias de identificador que el destino acuñó.** Segunda corrección encontrada al ejecutar la migración de un destino real, y de la misma clase que la 8.1: ninguna comprobación estática podía detectarla.

**Qué faltaba.** `Migracion-Rules.md` §4.3.1 construía el árbol sobre las familias del catálogo del framework y no decía nada sobre las que el destino inventa. Un destino que se choca con un hueco normativo **acuña un identificador para poder seguir**, y esa invención es justamente la evidencia de qué le faltaba al método. Si la migración las ignora, quedan identificadores huérfanos que ninguna regla gobierna y que ninguna comprobación de referencias detecta, porque resuelven entre sí.

**El caso que lo originó.** Un destino de siete proyectos de código había acuñado `P·CU-XX`, con **166 ocurrencias**, para nombrar una numeración de casos de uso de nivel producto que su documento de necesidades preveía. La inventó porque con ámbito de unicidad por proyecto la previsión no podía coincidir con lo emitido: es el incidente que el reporte `01` documenta, resuelto por el destino con un identificador propio. **La 7.0 volvió innecesaria esa invención** al fijar el ámbito en el producto, y sin la pasada nueva la migración la habría arrastrado.

### Añadido

- **`Migracion-Rules.md` §4.3.1, pasada 1.b**: buscar prefijos con forma de identificador que ninguna regla declare y formas calificadas inventadas por el destino; declarar cada una con su forma, sus ocurrencias, el hueco que vino a llenar y su resolución. Las tres resoluciones se evalúan en orden: **retirarla** porque la versión vigente ya cubrió el hueco —la preferible, y la más frecuente—, **adoptarla** como familia del destino con prefijo y ámbito declarados, o **escalarla** como hueco del framework sin resolverla, porque no es una decisión de destino.
- Un criterio de aceptación en §6.

Ninguna documentación emitida deja de cumplir. El conjunto superado se archiva en `_legacy/8.1/`.

---

## [8.1] - 2026-08-15

**El reparto de rangos de identificadores es por familia.** Corrección encontrada al **migrar un destino real** con la versión 8.0, antes de aplicar la migración: es el primer defecto que la validación en corrida destapa, y por eso su origen se declara.

**Qué estaba mal.** `Master-Prompt.md` §3.4 repartía bloques de numeración por unidad de entrega sobre **todas** las familias, y reservaba además un rango para las de nivel producto. Aplicado a la letra sobre un destino de dos unidades de entrega, eso obligaba a renumerar **2.309 citas de `NB`** —de `NB-01` a `NB-90001`— sin que existiera una sola colisión que lo justificara: las necesidades de negocio son de nivel producto, hay un único conjunto y ninguna otra unidad las produce.

**Por qué es un defecto y no una molestia.** La unicidad es **dentro de la familia**: que exista un `NB-00014` no vuelve ambiguo a un `CU-00014`, porque el prefijo los distingue. Repartir bloques donde no hay colisión posible no evita nada y obliga a renumerar, que es la operación más cara y más riesgosa del método —el reporte `01` midió que renumerar treinta y nueve archivos produjo por sí solo dos hallazgos bloqueantes—.

### Cambiado

- **`Master-Prompt.md` §3.4**: el reparto alcanza **solo a las familias que más de una unidad de entrega produce**. Una familia producida en un solo nivel conserva su numeración natural desde `00001` y solo respeta el ancho. El mapa declara **las dos listas** —familias repartidas y familias sin reparto, con su motivo— para que una familia sin bloque se lea como decisión y no como olvido.
- **`Root-Rules.md` §9.1**: la consecuencia operativa se precisa en el mismo sentido.

### Sobre el origen

Es la primera corrección del framework que no sale de un reporte de evidencia ni de un análisis, sino de **ejecutar la migración sobre un destino**. La 8.0 se publicó sin ella porque ninguna comprobación estática podía detectarla: el texto era coherente consigo mismo, y solo al calcular el árbol de migración de un producto concreto apareció el costo de aplicarlo.

Ninguna documentación emitida deja de cumplir. El conjunto superado se archiva en `_legacy/8.0/`.

---

## [8.0] - 2026-08-15

**El nivel de unidad de entrega.** Cierra el pendiente que `Vocabulario-Rules.md` §8 declaraba desde la versión 5.0: la unidad de entrega estaba definida y no era un nivel del layout de salida. Sube major por todo: cambia el layout, el nivel de aplicación de once categorías y el nombre de una variable bloqueante.

**Nota sobre el archivado.** Las versiones 7.0 y 8.0 se publican en la misma intervención, de modo que la 7.0 nunca fue un conjunto vigente que un destino pudiera consumir. `_legacy/` conserva la **6.0**, que es el último conjunto efectivamente superado; no hay `_legacy/7.0/` y no debe haberlo.

La nota de coherencia es [`Coherencia-Unidad-De-Entrega.md`](SDD/Devs/Guides/Coherencia-Unidad-De-Entrega.md).

### El problema, medido

El framework tenía dos niveles —producto y proyecto de código— y los productos reales tienen tres. El nivel intermedio se poblaba con proyectos de código, y las once categorías que colgaban de él producían artefactos que no eran de ese nivel. Medido sobre tres destinos reales antes de corregir:

| Destino | Proyectos de código | De ellos, se despliegan | Casos de uso emitidos | Necesidades de negocio |
| --- | --- | --- | --- | --- |
| Lab-Geometria | 7 | 2 | 71 | 9 |
| RPI.VidelControl | 5 | 1 | 58 | 8 |

Un proyecto de código de DTOs tenía guía de onboarding para developers y documento de entornos de despliegue; ese documento tuvo que abrir con una sección de apartamiento declarando que el proyecto «no tiene ambientes ni canales propios». Y la misma capacidad del producto aparecía fragmentada por capa: `CU-05-Crear-Y-Reeditar-Un-Trabajo` en el dominio y `CU-03-Contrato-De-Carga-Y-Edicion-Del-Trabajo` en los contratos.

### Cambiado — el modelo

- **Dos ejes, no tres niveles.** El de **entrega** —producto → unidades de entrega— y el de **construcción** —producto → soluciones de código → proyectos de código—. Su relación es de **muchos a muchos**: una unidad de entrega se compone de varios proyectos de código y un proyecto de código puede componer varias unidades. Los dos grafos son distintos y no coinciden: el de integración une unidades en runtime, el de compilación une proyectos al construir.
- **El proyecto de código deja de tener árbol documental propio.** Se inventaría una sola vez, a nivel producto, en `Vista-Producto.md`, con su stack, su rol y sus dependencias de compilación. Anidarlo obligaría a documentar un proyecto compartido una vez por cada entrega que lo usa, o a asignarlo arbitrariamente a una dejando en las otras una referencia colgada.
- **La matriz de composición** es el puente entre los ejes: una columna con más de una marca es un proyecto compartido, y su modificación alcanza a todas las entregas marcadas.
- **`tipo_proyecto_codigo` pasa a `tipo_unidad_entrega`.** El conjunto D8 no cambia: siguen siendo ocho valores. Cambia de qué es atributo, porque `SDD-Development-Guide.md` declara que los ocho «cubren el espacio de **formas de entrega** de software», y una forma de entrega es propiedad de lo que se entrega.

### Cambiado — el layout

`SDD/Docs/Proyectos/<Nombre-Proyecto-Codigo>/` pasa a `SDD/Docs/Unidades-Entrega/<Nombre-Unidad-Entrega>/`. Y los casos de aplanado pasan de uno a cuatro, en cascada:

| Composición | Resultado |
| --- | --- |
| Una unidad de entrega y un proyecto de código | Idéntico al template de tipo único |
| Una unidad de entrega y varios proyectos de código | Categorías directo bajo `SDD/Docs/`, **con** vista de producto: hay eje de construcción que inventariar |
| Varias unidades de entrega | Layout completo |

La segunda fila es la que la versión anterior no podía expresar, y es exactamente `RPI.VidelControl`: un monolito de cinco proyectos de código que producía cinco árboles de once categorías, cuatro de ellos sobre unidades de compilación que no se despliegan.

### Cambiado — gating por nivel

Cada flag declara su nivel. `equipo_n` y `requiere_compliance` son del producto; `tipo_unidad_entrega`, `tiene_ui_final`, `usa_llm`, `requiere_maqueta`, `redistribuible` y `tiene_persistencia` son de la unidad de entrega; el proyecto de código **no tiene flags de gating**, porque no emite categorías.

Dos consecuencias:

- **`entrega_diferida`** es un flag nuevo: una unidad de entrega puede estar en el roadmap y no en la etapa en curso. Se enumera y no se le genera documentación, y su ausencia no requiere ADR de apartamiento.
- **El caso del reporte `06` se disuelve.** Con `tiene_persistencia` evaluado en la unidad de entrega, un monolito cuya persistencia vive en una de sus capas compiladas **sí persiste**, y su modelo lógico es uno solo. El conflicto que obligó a inventar un ADR desaparece sin necesidad del ADR.

### Cambiado — intake, manifiesto y validación

- `PRODUCT-INTAKE-template.md` §13 se parte en **§13.1 unidades de entrega**, **§13.2 proyectos de código** y **§13.3 matriz de composición**, con el criterio que decide qué es cada cosa y la aclaración de que las dos condiciones no se excluyen: una librería que se publica es proyecto de código **y** unidad de entrega. §14 distingue contratos de **integración** de contratos de **compilación**. §17 se repite por unidad de entrega.
- `PRODUCT-MANIFEST-template.md` deriva las dos tablas, la matriz y **los dos grafos por separado**.
- `Intake-Rules.md` suma siete validaciones, de las cuales dos impiden confundir los ejes: que ningún proyecto de código declare un valor D8, y que todo proyecto componga al menos una unidad de entrega y toda unidad se componga de al menos un proyecto.

### Cambiado — DevOps y arquitectura, donde los dos ejes se cruzan

- **`Rules-Devops.md`**: se **construye por proyecto de código** y se **publica por unidad de entrega**. La regla declaraba que «el orden de construcción y de publicación lo fija el grafo de dependencias del manifiesto», que con dos ejes es falso. La matriz única se parte en matriz de build y matriz de publicación.
- **`Rules-Arquitectura-Tecnica.md`**: `Arquitectura-Proyecto-Codigo.md` pasa a `Arquitectura-Unidad-Entrega.md` y declara de qué proyectos se compone; `Vista-Producto.md` pasa a ser el artefacto de los dos ejes; y los ADR de nivel producto incorporan **toda decisión sobre un proyecto de código compartido**, que es el caso que la versión anterior no podía ubicar y que terminaba en la carpeta de la primera entrega que lo escribiera.

### Añadido — migración estructural

`Migracion-Rules.md` §4.3.2 declara los cuatro pasos del salto 7.0 → 8.0. El primero es una **detención obligatoria**: el manifiesto de un destino anterior no declara cuál de sus proyectos de código se despliega, así que el agente **propone** una clasificación con cuatro señales declaradas y el humano la confirma. El árbol de un proyecto **compartido** no se funde en ninguna unidad; los casos de uso duplicados por capa no se fusionan por coincidencia de título; y el contenido sin destino se declara en el informe en lugar de borrarse.

### Añadido — el inventario de vocabulario propio

Se corrió el pendiente y encontró **nueve términos** usados en dos o más artefactos del framework sin definición en ningún glosario suyo: `compuerta mecánica`, `glosario operativo`, `referencia pendiente`, `apartamiento declarado`, `despacho`, `matriz de sensado de deriva`, `conjunto cerrado`, `mapa de rangos de identificadores` y `salida prometida`. **Cinco de los nueve los acuñaron las versiones 7.0 y 8.0**, que es el patrón del reporte `11` cometido por la propia intervención que lo corregía. Los nueve entran al glosario operativo.

### Cerrado — los pendientes que quedaban

Los tres pendientes que la 7.0 dejó abiertos se cierran en esta misma versión, para que el conjunto no se publique con deuda declarada:

- **La condición de terminado en dos capas.** El reporte `07` proponía adelantarla a la Fase A y la 7.0 la administraba con una referencia pendiente. Con el nivel por artefacto disponible, la solución es mejor que cualquiera de las dos: la **capa de acuerdo del equipo** —revisión, cobertura acordada, documentación— es de nivel producto y se emite en la Fase A, dentro de `Acuerdo-Equipo.md` §5, porque es donde el equipo la acuerda; la **capa de verificación** —pirámide de testing, quality gates, matriz de cobertura— es de la unidad de entrega y vive en la 08, que **refina** la primera. La obligación de la Fase A hacia la Fase E desaparece porque no era una dependencia real: un equipo puede acordar cómo cierra su trabajo sin saber todavía qué pirámide de testing va a usar cada entrega.
- **La cardinalidad de soluciones de código.** `PRODUCT-MANIFEST-template.md` §2.B agrupa los proyectos de código **por solución de código** cuando hay más de una, y §3 declara que hay **un grafo de compilación por solución**, porque la solución es lo que delimita un comando de construcción. Una dependencia entre proyectos de soluciones distintas no es una arista de ese grafo: es un consumo de artefacto publicado, y confundirlas produce un orden de build que ningún comando puede ejecutar.
- **D9 y los recuentos en prosa.** Se decide **no** ampliarla, y la decisión queda escrita en `Root-Rules.md` §10 con su motivo, para que no vuelva a plantearse como pendiente: D9 está acotada a afirmaciones sobre el estado del sistema, y un recuento sobre una tabla del propio documento no lo es. Las cuatro reglas de §10 consiguen el mismo efecto sin tocar la invariante más cara de verificar del framework.

Con eso, `Vocabulario-Rules.md` §8 pasa de «Pendiente declarado» a «Pendientes declarados y su cierre», y **el conjunto 8.0 se publica sin pendientes normativos abiertos**.

### Impacto sobre destinos existentes

| Qué deja de cumplir | Cómo se repara |
| --- | --- |
| El árbol entero de `SDD/Docs/Proyectos/` | Migración estructural de `Migracion-Rules.md` §4.3.2, con su detención de clasificación |
| El `PRODUCT-INTAKE` en su Parte B y su Parte C | Migración del intake por §4.4, que es documento humano: el agente propone y el Product Owner aprueba |
| El `PRODUCT-MANIFEST` completo | Se rederiva del intake migrado |
| Todo documento que declare `tipo_proyecto_codigo` | Renombre a `tipo_unidad_entrega`, y retiro del valor en los proyectos de código que no son unidades de entrega |
| La numeración, cuando dos árboles se funden en una unidad | Árbol de migración de §4.3.1, cuya comprobación de colisión de destino es la que lo detecta |

Lo que **no** cambia: el contenido de los documentos. El salto cambia de qué nivel son y dónde viven, no lo que dicen. Un caso de uso migrado sigue diciendo lo mismo.

---

## [7.0] - 2026-08-15

Intervención sobre los **doce reportes de evidencia** `00` a `11` emitidos durante corridas reales del orquestador. Sube major por tres motivos independientes: se modifica la invariante **D3** (ancho y ámbito de los identificadores), sube major `Rules-Plan-Sprint.md` (artefactos del equipo al nivel producto) y sube major `Migracion-Rules.md` (renumeración de identificadores). El conjunto D8 queda intacto, el orden de fases no cambia y la mecánica plan-then-confirm tampoco.

**Qué tenían en común los doce reportes.** Ninguno era un error de un agente: en los doce, el agente cumplió la regla que tenía, o la única que había no se podía cumplir sin empeorar el resultado. El framework declaraba **qué** producir y con **qué forma**, y con menos frecuencia **qué propiedad tiene que conservarse** cuando eso que produjo cambia, se copia, se cuenta o entra en conflicto con otra cosa que también produjo.

La nota de coherencia es [`Coherencia-Reportes-00-11.md`](SDD/Devs/Guides/Coherencia-Reportes-00-11.md).

### Añadido — cuatro reglas transversales

- **`Root-Rules.md` §9 Sistema de identificadores.** Declara lo que hasta acá no estaba: el **ámbito de unicidad** —el producto—, el **ancho** —cinco dígitos uniformes— con sus familias alcanzadas y sus dos exclusiones declaradas (`AG-XX` y el ordinal de iteración), la interacción entre estabilidad y capacidad —el rango se dimensiona por el total histórico, porque un identificador retirado no libera su número—, las **colecciones derivadas** que dimensionan sobre la suma de sus fuentes, y la **titularidad**: toda categoría declara el prefijo, la forma y el ámbito de lo que acuña, y ninguna acuña identificadores para artefactos de otra.
- **`Root-Rules.md` §10 Datos derivados en la prosa.** Cuatro reglas, de la que más lejos llega a la que más verifica: preferir la forma que no cuenta, nombrar la fuente del recuento, anclar de modo que el número no admita otro referente —y si no se puede anclar, reescribir en lugar de verificar—, y registrar el recuento en el control de cambios cuando cambia. La métrica de éxito declarada no es cuántos recuentos se verifican: es cuántos dejaron de existir.
- **`Root-Rules.md` §11 Apartamiento declarado.** Un artefacto obligatorio puede no emitirse con un ADR que lo declare, con sus alternativas descartadas y sus disparadores de revisión. Generaliza la figura que solo admitía `Rules-Documentacion.md` §2.5 y que **tres destinos distintos tuvieron que inventar por su cuenta**.
- **`Root-Rules.md` §12 Referencia pendiente.** Forma para citar lo que todavía no existe, con su cierre obligatorio. Reemplaza a las dos salidas que rompían otra regla del framework: copiar el contenido, que crea una segunda fuente, y dejar la referencia colgada, que sella el hueco con el mecanismo que debería detectarlo.

Las cuatro entran en los insumos de **todo** despacho de subagente (`Master-Prompt.md` §8), por la misma razón por la que la 5.1 sumó ahí `Vocabulario-Rules.md`: una regla que las reglas de categoría citan y que no llega al despacho no la lee nadie.

### Añadido — verificación

- **Compuerta mecánica previa al audit** (`Master-Prompt.md` §10.0), con cuatro comprobaciones enumerables —enlaces y anclas, recuentos anclados, idempotencia de generadores, forma y unicidad de identificadores—, su resultado como insumo del despacho del auditor, y la obligación de **declarar qué no mira**: una compuerta que se lee como aprobación es peor que ninguna. La medición que la origina: tres rondas de audit independiente sobre la misma fase produjeron 33 hallazgos, **22 de ellos detectables por un guion**, con rendimiento decreciente y no nulo.
- **Criterio de corte de las rondas** (§10.1): una fase cierra cuando dos rondas seguidas no encuentran hallazgos interpretativos, con los enumerables en cero por la compuerta. Hasta acá una fase cerraba cuando el audit aprobaba, y si nunca aprobaba no había regla.
- **Dos marcas ortogonales al nivel de hallazgo**: la de **origen**, que distingue el hallazgo *aguas arriba* —un defecto que la fase reprodujo fielmente de un artefacto anterior, que sin la marca no podía ser P0 ni P1 y terminaba en P3 por descarte—, y la de **detectabilidad**, que produce la métrica que gobierna la compuerta.
- **Clasificación de los criterios de aceptación** de las diecisiete reglas como `[enumerable]` o `[interpretativo]`, con política conservadora declarada: ante la duda se marca interpretativo, porque declarar mecanizable lo que no lo es produce falsa confianza.
- **Cuatro criterios de audit nuevos**: conjuntos cerrados cruzando categorías como **P0** —el único que obliga a mirar fuera de la fase auditada—, recuentos anclados, referencias pendientes y apartamientos.

### Añadido — arbitraje entre categorías

- **Detención por extensión de un conjunto cerrado** y **registro único de decisiones pendientes del producto** (`Master-Prompt.md` §7.0), exhibido al cerrar **cada** fase y no solo en el handoff. El framework tenía titularidad por categoría y trazabilidad entre ellas, y no tenía arbitraje: la única salida disponible era una nota en prosa dentro de un artefacto, que no interrumpe a nadie y sobrevive a todos los audits.
- **Comprobación del grafo de obligaciones contra el orden de fases**, con **reapertura obligatoria que trae el insumo y no solo el turno** (`Master-Prompt.md` §6), y la prohibición de que una categoría emita un artefacto de otra.
- **Propagación por iteración** en la Fase B2, **regla de escape** de la matriz de propagación, fila para el caso en que la validación crea un proyecto de código, y el `PRODUCT-MANIFEST` incorporado a la regla de corte (`Maqueta-Rules.md` §3.5 y §3.6).

### Cambiado — invariante D3

- **El ancho pasa de dos a cinco dígitos uniformes y se declara el ámbito de unicidad: el producto.** La medición que lo obliga: una corrida real emitió **191 estados** de superficie y **374 sondas**, sobre una convención que llegaba hasta noventa y nueve, y el agente tuvo que elegir entre tres salidas —romper la uniformidad, fragmentar el identificador o comprimir el inventario— sin ningún criterio del método para preferir una. La tabla que el framework define como derivada de todas las otras era la que con más seguridad desbordaba.
- El ámbito de unicidad no estaba declarado en ninguna regla ni en los dos orquestadores, y dos partes del framework exigían lecturas incompatibles. Se elige **producto**, que es la que hace resolver sin tocarla la tabla de trazabilidad de `Rules-Necesidades-Negocio.md` §4.4, que cita el caso de uso por identificador desnudo desde un artefacto de nivel producto.
- El orquestador **deriva y publica el mapa de rangos** por proyecto de código antes de despachar la primera categoría (`Master-Prompt.md` §3.4), y lo incluye en cada despacho. En la corrida que lo originó, el orquestador tuvo que inventar la convención de rangos y declararla él mismo, y cinco prefijos de código de error colisionaron entre proyectos.

### Cambiado — obligatoriedad y nivel

- **La obligatoriedad se condiciona sobre el proyecto de código, no sobre el tipo.** `Rules-Arquitectura-Tecnica.md` alineó sus cuatro menciones del modelo lógico —que decían tres cosas distintas— sobre el flag `tiene_persistencia`, que el orquestador ya derivaba y cuyo impacto declarado ya era ése. `Rules-Examples.md` condiciona la categoría sobre `redistribuible` del manifiesto y da válvula al piso de tres samples.
- **El nivel de aplicación se declara por artefacto** (`Vocabulario-Rules.md` §4 R3). `Rules-Plan-Sprint.md` mueve al nivel producto los cuatro artefactos que describen al equipo —velocidad, capacidad y las dos plantillas de ceremonia—, declara que la numeración de iteraciones es la del roadmap de la categoría 00, y reemplaza el criterio «mínimo Sprint 0 y Sprint 1», que era insatisfacible en un proyecto de código cuyo trabajo empieza en la cuarta iteración del producto.

### Cambiado — el dato que se copia y el que se deriva

- **Regla de transcripción fiel** en `PRODUCT-INTAKE-template.md` §20: si la fuente enuncia un número y la transcripción arroja otro, se declaran los dos y la razón de la diferencia. Y **coherencia intra-escenario** en `Intake-Rules.md` §5, bloqueante cuando la discrepancia no está declarada, acotada a conteos y enumeraciones del propio payload para que la validación no produzca ruido.

### Cambiado — vocabulario del método

- **El vocabulario del método vive en el glosario operativo** de `Master-Prompt.md` §15 y se cita sin redefinir. Generaliza la política que `Rules-Plan-Sprint.md` §6 ya enunciaba una sola vez, y sobre términos que **ya estaban resueltos**. Entran al glosario `sonda`, `pasada de diseño`, `pasada de ejecución` y `arnés`: `sonda` es la unidad del sensado de deriva, nombra las 376 filas de una matriz de un solo proyecto de código, y no estaba definida en ningún glosario del framework.
- El criterio de gobierno de glosario, replicado en once reglas que mandaban a **nueve destinos distintos**, unifica su primera cláusula, y las dos reglas que no lo tenían —`Rules-Especificacion-Funcional.md` y `Rules-UX-UI-DX.md`— lo incorporan. `Rules-Calidad-Y-Pruebas.md` retira el noveno destino, que mandaba a definir `sonda` en línea en el cuerpo de un documento del producto.

### Cambiado — migración

- **`Migracion-Rules.md` §4.3.1**: la renumeración de identificadores y el renombre de archivos se hacen en **dos pasadas**. La primera construye el árbol de migración completo —cada identificador de origen con su destino, los archivos a renombrar y **todas** las referencias que los apuntan— y se confirma con el humano; la segunda aplica el árbol confirmado y cierra comprobando que ninguna referencia quedó colgada, que ningún destino colisiona y que no hay residuos de la forma vieja fuera de `_legacy/`. La evidencia de por qué no alcanza una pasada: renumerar treinta y nueve archivos en una corrida real produjo por sí solo dos hallazgos bloqueantes.

### Añadido — el grafo de obligaciones, corrido

La comprobación que el reporte `07` propone se **corrió** sobre las doce reglas de categoría, y no solo se incorporó como mecanismo. De 48 coincidencias brutas y 22 pares distintos, el triaje separó tres clases: obligación hacia adelante, que es el defecto; declaración de downstream, que D6 exige; y declaración de frontera, que evita el solapamiento entre categorías.

Encontró **tres obligaciones que ninguna corrida había detectado**: `Acuerdo-Equipo.md` §6 referencia la condición de listo de la categoría 06 desde la Fase A, tres fases antes —el mismo documento y la sección contigua al incidente que el reporte `07` sí encontró—; la tabla de trazabilidad de un contrato de prompt referencia la categoría 08 desde la Fase B; y un contrato de prompt tiene que expresar un costo en una moneda que la categoría 09 declara cuatro fases después, que no es una referencia colgada sino un dato faltante y se trata distinto. Las tres quedan declaradas con la forma de `Root-Rules.md` §12, y la familia del glosario técnico —cinco categorías que apuntan a `Glosario-Tecnico.md` de la 11 desde fases anteriores, que el reporte `11` §4.3 ya había señalado— también.

Es la evidencia de que la lista **no estaba cerrada**, tal como el reporte `07` advertía: cinco obligaciones conocidas por las corridas, ocho reales más la familia del glosario.

### Impacto sobre destinos existentes

| Qué deja de cumplir | Por qué | Cómo se repara |
| --- | --- | --- |
| Todo identificador emitido con dos dígitos, y todo archivo que lo lleva en el nombre | D3 fija cinco dígitos uniformes y ámbito de unicidad producto | Migración normativa con el árbol de `Migracion-Rules.md` §4.3.1 |
| Identificadores repetidos entre proyectos de código del mismo producto | El ámbito de unicidad pasa a ser el producto | Ídem. La comprobación de colisión de destino del árbol es bloqueante |
| La categoría 07 completa | `Velocidad-Equipo.md`, la capacidad y las plantillas de ceremonia pasan a nivel producto | Migración normativa, clasificación «regenerar contenido» |
| La categoría 10 de proyectos de código no redistribuibles | El gating pasa de tipo D8 a `redistribuible` | Migración normativa. La condición nueva es más permisiva: puede haber artefactos que dejen de ser obligatorios, no al revés |
| Los contratos de verificación de la categoría 10 | §4.6 suma campos obligatorios: qué pasos del flujo recorre la salida prometida, y el bloque `discrimina` | Migración normativa, clasificación «regenerar contenido» |
| La línea de base visual y la matriz de sensado | El ancho de los identificadores y la declaración de colección derivada | Migración normativa |

Lo que **no** deja de cumplir: las categorías 00, 01, 02, 03, 04, 05, 06, 08, 09 y 11 en su estructura y su contenido. Los cambios que las alcanzan son de criterio de aceptación y de vocabulario, y sus artefactos siguen siendo los mismos.

### Alcance de la evidencia

Los doce reportes salen de corridas reales sobre `Repos-RPIs/RPI.VidelControl`, un producto de cinco proyectos de código, entre el 2026-08-09 y el 2026-08-12. El análisis que ordenó la intervención en cinco familias, las correcciones propuestas por familia y el plan de aplicación viven en el repositorio de documentación, fuera de este repositorio.

**Lo que esta intervención decidió no hacer**, con su motivo declarado: correr la comprobación del grafo de obligaciones sobre las diecisiete reglas y tratar cada caso; el inventario completo del vocabulario propio del framework; adelantar la condición de terminado a la Fase A; decidir si el «glosario de categoría» es un artefacto real; y declarar que un recuento en prosa es una afirmación bajo D9, que `Root-Rules.md` §10 consigue sin ampliar el alcance de la invariante.

---

## [6.0] - 2026-07-29

Capacidad de **migración normativa**: llevar un destino generado con una versión anterior del framework a la versión vigente, preservando su contenido. Sube major porque `PRODUCT-MANIFEST-template.md` sube major y un manifiesto ya emitido deja de cumplir. Ninguna invariante D1-D9 modificada, el conjunto D8 intacto, el orden de fases y la mecánica plan-then-confirm sin cambios.

**Qué faltaba.** El framework sabía diagnosticar el desfasaje de un destino y no sabía repararlo. La reconciliación normativa de `Master-Prompt.md` §2.1 leía la procedencia, la comparaba contra las versiones vigentes, clasificaba los saltos y enumeraba los documentos potencialmente invalidados; sus tres salidas eran emitir un plan sin tocar nada, regenerar desde cero archivando lo anterior, o seguir con las reglas viejas. Ninguna llevaba el destino a la versión vigente conservando lo que ya decía: regenerar lo conseguía tirando lo que había, y seguir con las reglas viejas lo conseguía no avanzando. Además la reconciliación no alcanzaba a los dos documentos de entrada, y sobre un destino generado con la 4.1 **ni llegaba a correr**, porque §2 resolvía el producto buscando `PRODUCT-INTAKE-*.md` y en la 4.1 el intake se llamaba `SOLUTION-INTAKE`.

La nota de coherencia es [`Coherencia-Migracion.md`](SDD/Devs/Guides/Coherencia-Migracion.md).

### Añadido — la capacidad de migración

- **`Migracion-Rules.md` 1.0**, decimoctava regla del framework y sexta transversal. Fija el **principio de estado objetivo**: la normativa vigente es la especificación del estado al que hay que llegar, el documento existente es la fuente del contenido, y la migración re-expresa el segundo bajo la primera. No hay recetas por salto de versión; el salto sirve para priorizar, no para transformar. Se descartaron explícitamente los playbooks por par de versiones, con cinco fundamentos, el primero de ellos siendo que `Vocabulario-Rules.md` §9.5 ya prohíbe la transformación mecánica de texto con el daño de la 5.0 como prueba. Declara además la **regla de no invención** (§4.1): todo contenido de un documento migrado proviene del documento de origen, de un documento hermano o de una respuesta del humano, y no hay cuarta fuente; la sección exigida sin fuente se emite como pendiente y **no se rellena**. Catorce criterios de aceptación, seis hallazgos P0 y ocho anti-patrones.
- **`Master-Prompt-Migracion.md` 1.1**, orquestador contiguo con siete fases M0 a M6: reconocimiento del destino con tolerancia de nombres legados, diff normativo, migración del intake, re-derivación del manifiesto, migración de `SDD/Docs/` en orden de la cadena D6, cierre condicional de la procedencia y auditoría. **No redefine despacho ni auditoría**: cita §8 y §10 del master-prompt de generación, junto con su archivado de §5, su manejo de ambigüedad de §9 y su orden topológico de §3.3. La duplicación que no existe no se desincroniza.
- **`PROMPT-Agente-Migracion-SDD.md` 1.0**, prompt de entrada par del de bootstrap, con la tabla que decide cuál de los dos corresponde según el estado del destino.
- **Destinos sin procedencia declarada**: pasan de tener solo regenerar o abortar a ser migrables, con la clasificación degradada a «revisar todo». Es posible porque la migración opera contra el estado objetivo y no contra el conjunto de origen. La degradación se declara y **no se supone ninguna versión de origen**.
- **Migración parcial** como estado final legítimo, con dos condiciones bloqueantes: la procedencia no se reescribe y el estado parcial se declara documento por documento en el informe.

### Añadido — la instrumentación que la migración necesitaba

- **`PRODUCT-MANIFEST-template.md` (3.1 → 4.0 → 4.1).** El bloque de procedencia de §1.1 suma **dos filas obligatorias**: la versión de `PRODUCT-INTAKE-template` y la de `PRODUCT-MANIFEST-template`. Las plantillas se versionan aparte de las reglas, así que un cambio de su estructura no movía ninguna versión declarada y era invisible para el diff normativo: los dos documentos de entrada del destino no podían resultar candidatos de nada. Sube **major** por el criterio de `SDD-Development-Guide.md` §VI.1. En la 4.1 se completa además la fila de reglas transversales, que omitía `Vocabulario-Rules` pese a que `Master-Prompt.md` §8 la inyecta en todo despacho, y suma `Migracion-Rules`.
- **`Intake-Rules.md` (3.1 → 3.2).** **§2.1 nueva**, tabla maestra de sus dos artefactos. El paso 4 del diff normativo enumera los documentos que una regla gobierna leyendo «su tabla maestra de documentos (§2.1 de la regla)», y esta regla no la tenía: el intake y el manifiesto nunca podían aparecer entre los documentos potencialmente invalidados, ni siquiera ante el salto major de 2.1 a 3.0 de esta misma regla.
- **`Master-Prompt.md` (5.1 → 5.2).** §2 paso 1 **tolera nombres de artefacto legados**, buscándolos en `_legacy/` y en los bloques de impacto del `CHANGELOG.md` antes de concluir que no hay intake; un intake bajo nombre legado deja de detener la cadena y pasa a declararse como destino a migrar. §2.1 nombra el instrumento de su salida A y renombra su plan; sus tres prohibiciones y su detención quedan intactas y **no se agrega una cuarta salida**, porque ejecutar el plan sigue siendo una decisión aparte. §13 regla 2 pasa de un caso de escritura del intake a **dos**, con el segundo siendo la migración estructural bajo tres condiciones acumulativas.
- **`SDD-Development-Guide.md` (1.4 → 1.5 → 1.6).** §VI.4 especifica el bloque **«Impacto sobre destinos existentes»** con sus tres tablas, obligatorio en toda entrada major: hay una clase de cambio que ningún diff de versiones puede inferir, porque un renombre de artefacto no se deduce de que su regla haya subido de 2.1 a 3.0. §VI.5 declara la obligación correlativa. En la 1.6, tres conteos y el mapa de dependencias al día, y la **tabla de derivación del conjunto corregida**: hacía subir major solo por reglas e invariantes y no contemplaba las plantillas de intake.

### Cambiado — el término

- **`Vocabulario-Rules.md` (2.0 → 2.1).** **§9.6 nueva**: declara la familia calificada **«migración normativa»** con sus tres referentes verificados por barrido, porque la palabra ya tenía dos sentidos vigentes en el framework. Se adopta la forma calificada obligatoria —segundo escalón de la escalera de §9.3—, con el primero declarado insuficiente y su evidencia: los dos sentidos coexisten dentro de §9.5 de ese mismo archivo, y por §9.2 el criterio de colisión es la sección. Frente al tercer referente, las migraciones de datos del producto documentado, **no se desambigua nada** por contextos disjuntos, y la constancia queda escrita para que una auditoría posterior no lo levante como hallazgo. **§4 suma R6.** «Reconciliación normativa» conserva su nombre porque compara y no transforma.
- **Renombre léxico de «plan de adecuación» a «plan de migración normativa»**, por el procedimiento por ocurrencia de `Vocabulario-Rules.md` §9.5 y **no** por sustitución global de cadena: **diecinueve ocurrencias de «adecua\*» revisadas, siete sustituidas**, cero filas históricas de control de cambios reescritas y cero ocurrencias no normativas tocadas. Barrido negativo sin hallazgos. Alcanzó a `Master-Prompt.md`, `PROMPT-Agente-Bootstrap-SDD.md` (2.3 → 2.4), `SDD-User-Guide.md` (1.7 → 1.9) y `SDD-Getting-Started-Guide.md` (1.3 → 1.5).

### Impacto sobre destinos existentes

**Renombres de artefacto**

| Nombre anterior | Nombre vigente | Naturaleza |
| --- | --- | --- |
| `SDD/Docs/Audit/Reconciliacion-<origen>-a-<vigente>.md` | `SDD/Docs/Audit/Plan-Migracion-<origen>-a-<vigente>.md` | archivo |
| «plan de adecuación» | «plan de migración normativa» | término de la salida A de `Master-Prompt.md` §2.1 |

Los renombres de la 5.0 —`SOLUTION-INTAKE` a `PRODUCT-INTAKE`, `SOLUTION-MANIFEST` a `PRODUCT-MANIFEST`, `SDD/Docs/Solucion/` a `SDD/Docs/Producto/`, y los cinco identificadores— siguen vigentes y son los que la tolerancia de nombres legados de §2 paso 1 resuelve. No se repiten acá: su declaración vive en la entrada `[5.0]`.

**Secciones movidas o partidas**

| Documento | Sección anterior | Destino vigente |
| --- | --- | --- |
| `Intake-Rules.md` | §2 Campos bloqueantes | §2.2 Campos bloqueantes, dentro de §2 «Artefactos gobernados y campos bloqueantes». Las referencias externas apuntan a §2, que sigue conteniéndolos |
| `Master-Prompt.md` | §13 regla 2, caso único de escritura | §13 regla 2 caso (a). El caso (b) es nuevo |

**Campos bloqueantes nuevos**

| Documento | Campo | Regla que lo exige |
| --- | --- | --- |
| `PRODUCT-MANIFEST-<Slug-Producto>.md` | Fila de procedencia con la versión de `PRODUCT-INTAKE-template` | `PRODUCT-MANIFEST-template.md` §1.1 y su checklist de §7 |
| `PRODUCT-MANIFEST-<Slug-Producto>.md` | Fila de procedencia con la versión de `PRODUCT-MANIFEST-template` | `PRODUCT-MANIFEST-template.md` §1.1 y su checklist de §7 |

**Qué le pasa a un destino ya emitido.** Su manifiesto no declara las dos filas de plantilla y por lo tanto deja de cumplir. La vía de reparación es la que esta misma versión introduce: la migración normativa, que las completa en la fase M3 al re-derivar el manifiesto. Un destino que no se migre sigue siendo legible y utilizable; lo que pierde es la capacidad de que un diff normativo futuro detecte cambios de estructura de plantilla. No hay pérdida de contenido y no se requiere ninguna acción inmediata.

## [5.1] - 2026-07-29

Gobierno del glosario de la documentación generada, y reparación del método con que se aplicó la 5.0. Sube minor: agrega criterios de aceptación y un artefacto obligatorio a una categoría, sin modificar ninguna invariante D1-D9, el conjunto D8, el orden de fases ni la mecánica plan-then-confirm. Dos reglas suben major por su propio artefacto —`Rules-Especificacion-Funcional.md` y `Rules-UX-UI-DX.md`— y su documentación ya emitida sin glosario deja de cumplir.

**Origen.** Dos hechos que se explican uno al otro. El primero es una orden de trabajo emitida desde la corrida de un producto real, que verificó dos defectos: el framework no tenía ninguna regla que dijera **cuándo un término polisémico necesita desambiguarse**, y el glosario de la categoría 02 era sección de un documento condicional que ningún criterio de aceptación verificaba. El segundo es que **la intervención de la 5.0 se ejecutó sustituyendo cadenas de manera global**, y produjo cuatro clases de daño. Los dos son el mismo defecto: el framework no tenía criterio para intervenir vocabulario, y por eso su propia intervención de vocabulario salió mal. La nota de coherencia es [`Coherencia-Sustitucion-Lexica-Y-Gobierno-Glosario.md`](SDD/Devs/Guides/Coherencia-Sustitucion-Lexica-Y-Gobierno-Glosario.md).

### Añadido — el criterio de desambiguación léxica

- **`Vocabulario-Rules.md` §9** (1.0 → 2.0), en cinco subsecciones. **§9.1** fija la regla de decisión: un término polisémico se desambigua **solo cuando sus sentidos pueden aparecer en el mismo contexto de lectura**; cuando los contextos son disjuntos no se califica, porque hacerlo carga el texto sin resolver un problema que no existe. **§9.2** declara la pieza que es propia de cómo trabaja el framework y no se deduce de la lingüística: **el contexto de lectura de un subagente es la sección, no el documento**, porque el despacho de `Master-Prompt.md` §8 nombra secciones y no archivos completos; de ahí se sigue que las formas calificadas de una familia de términos están bien y **la forma desnuda es el defecto**. **§9.3** ordena las tres formas de desambiguar por costo creciente —entrada de glosario, forma calificada obligatoria, invariante de producto con prohibición de fusión— y obliga a usar la más barata que resuelva, declarando por qué las anteriores no alcanzaban. **§9.4** prohíbe declarar una invariante de desambiguación sin haber verificado la colisión, y remite esa verificación a D9. **§9.5** prohíbe la sustitución global de cadena al renombrar un término en un corpus ya escrito, con el procedimiento por ocurrencia que la reemplaza.
- **El criterio existía y vivía en el lugar equivocado.** Estaba enunciado dentro del `SOLUTION-INTAKE` §12 de un producto real, como hallazgo local de esa solución: «no se califica cuando los contextos son disjuntos, porque cargaría el texto sin resolver un problema que no existe». Un orquestador que adoptara la forma del patrón heredaba la forma sin el criterio.
- **`Vocabulario-Rules.md` §10** suma seis criterios de aceptación, incluido el **criterio negativo**: una polisemia con contextos disjuntos **no es hallazgo**, y reportarla es un defecto del informe de auditoría, no del documento auditado.
- **Cuatro términos nuevos en el glosario operativo del orquestador** (`Master-Prompt.md` §15): contexto de lectura, colisión de sentidos, falso positivo de ambigüedad léxica y glosario de categoría.

### Añadido — el glosario de la categoría 02 como artefacto

- **`Glosario-Funcional.md`** (`Rules-Especificacion-Funcional.md` 3.0 → **4.0**), obligatorio para los **ocho** tipos D8. Hasta ahora el glosario de 02 era el punto 6 de `Modelo-Conceptual.md`, documento condicional a la persistencia: **un `library` o un `cli-tool` no tenía glosario en absoluto**, aunque acuñara igual sus cinco casos de uso mínimos, sus reglas de negocio y su vocabulario. El glosario de la categoría que más términos introduce dependía de un flag que no tiene nada que ver con el vocabulario.
- **§4.2.4 nueva** con las cinco secciones obligatorias del glosario, entre ellas la de términos con más de un referente, que no se omite: si ninguno lo requiere, declara «ninguno verificado». Un glosario con tabla de términos vacía no cumple.
- **§3.3** suma la regla de inclusión —todo término que aparezca en más de un artefacto de 02—, la de no duplicación frente al glosario del dominio de 00 y la de polisemia. **§4.5** suma cuatro anti-patrones y **§5.4** tres preguntas guía. **§6** suma cinco criterios verificables. Las menciones de «glosario» en ese archivo pasan de **1 a 20**.
- **`Rules-UX-UI-DX.md`** (3.0 → **4.0**): `Glosario-UX.md` pasa de «Recomendado para todos los tipos con UI final» a **obligatorio para los ocho tipos**, incluidos los DX, que acuñan el vocabulario de su superficie pública. Su §6 pasa de verificar solo la no duplicación a verificar además existencia y completitud. La orden de trabajo de origen lo declaraba «sin cambios porque ya cumple»: era la única de las trece reglas que gobernaba su glosario, pero su artefacto era recomendado y su criterio no verificaba que existiera.
- **Criterio uniforme de gobierno del glosario en §6 de las quince reglas restantes**, con el **destino** de sus términos declarado en cada una: 01 los deja en el glosario del dominio de 00; 05 y 09 en el `Glosario-Tecnico.md` de 11; 06, 07, 08 y 10 no acuñan vocabulario y un término nuevo ahí es señal de que falta aguas arriba. **Archivos de reglas sin ninguna mención de «glosario»: de 9 sobre 17 a 0 sobre 17.**
- **`Deriva-Rules.md`** exige que los nombres canónicos `SUP`, `CMP`, `EST` y `NAV` de la línea de base coincidan término por término con los de 03 y estén declarados en `Glosario-UX.md`: un nombre de superficie que la línea de base inventa vuelve inservible el sensado, porque lo que se compara deja de ser lo que se aprobó.

### Cambiado — el audit del glosario deja de ser un criterio único

- **`Master-Prompt.md` §10** (5.0 → 5.1) reemplaza «glosario sin contradicciones» por **cuatro** criterios: sin contradicciones, **completitud** (todo término que la fase acuña y aparece en más de un artefacto está en el glosario de su categoría), **polisemia gobernada** (todo término con más de un referente tiene entrada que los declara o forma calificada en las ocurrencias que colisionan) y el **criterio negativo**. Un glosario incompleto cumplía «sin contradicciones» trivialmente, que es por qué ese criterio solo no alcanzaba. El punto 5 de la estructura del informe pasa a enumerar las polisemias evaluadas y descartadas, para que la ronda siguiente no las vuelva a levantar.
- **`Master-Prompt.md` §15** redefine *Producto* y *Proyecto de código* **por frontera**, remitiendo a `Vocabulario-Rules.md` §2. Definía el producto como «contenedor raíz del entregable que agrupa una jerarquía de proyectos de código», que es exactamente la definición-por-papel-en-la-herramienta que la 5.0 identificó como el origen del problema y corrigió en el marco teórico sin propagarlo al glosario del orquestador ni al de la guía de usuario.

### Corregido — `Vocabulario-Rules.md` no estaba cableada

La 5.0 incorporó la regla declarando como lector «el orquestador, todo subagente AG-XX, el auditor de cada fase», y los diecisiete archivos de reglas la citan desde la línea «Nivel de aplicación» de su cabecera. Pero **no estaba en los insumos obligatorios del despacho de `Master-Prompt.md` §8**, ni en los del auditor de §10: ningún subagente la recibía y la cita de su cabecera no resolvía. Ahora se inyecta en **todo** despacho, con la regla de construcción que declara por qué no admite excepción de categoría, y en el del auditor. `SDD-Development-Guide.md` §III.8 registra el caso como segundo ejemplo trabajado de agregar una regla transversal, con la lección explícita: **declarar el lector no es cablearlo.**

### Corregido — las cuatro clases de daño de la sustitución global de cadena

El renombre de la 5.0 era correcto y no se revierte. Lo que se repara es el método.

- **30 ocurrencias de la palabra inexistente «reproducto» en 12 archivos**, porque «re**soluci**ón» contiene la cadena `soluci`. La palabra «resolución» había desaparecido por completo del framework vivo. Entre las ocurrencias: el **título de §6 de `SDD-User-Guide.md`** con su ancla en la tabla de contenido, el **nombre del campo `resolucion`** de la bitácora de eventualidades de `Rules-Documentacion.md` en su tabla de campos y en su bloque de ejemplo, el **título del patrón** «Redirección con estado de resolución» de `Design-Rules-Primer-Arranque.md` con tres referencias internas, la variante `mobile-app-maui` de `Rules-Arquitectura-Tecnica.md` que el orquestador copia literal al despacho, y el nombre de la validación bloqueante «Regla de resolución de la Parte D» en `Intake-Rules.md` y en la plantilla de intake.
- **23 cabeceras de tabla de anti-patrones en 17 archivos**: `| Anti-patrón | Problema | Solución |` había quedado como `| … | Producto |`, y esa columna contiene el remedio. Alcanzaba a 15 de los 17 archivos de reglas y a siete tablas del marco teórico. No es cosmético: §8 manda a cada subagente respetar la sección de anti-patrones y §10 hace de un anti-patrón un hallazgo P1. R2 de `Vocabulario-Rules.md` conserva explícitamente ese uso de la palabra.
- **Concordancias de género y remedios pisados**: «no debe leerse como **producto técnica**», «saltando a **productos técnicas**», «separar en **productos** SDD **distintas**», «tabla síntoma/causa/**producto**», «antes de aplicar **el producto**» (dos lugares) y «sugerencia de **producto**».
- **14 etiquetas de cabecera en 13 archivos**: el campo `**Proyecto:**` se había convertido en `**Proyecto de código:**` sobre valores que no son unidades de compilación. Los siete con valor `Template SDD` pasan a `**Framework:** SDD`, patrón que la propia nota de la 5.0 ya usaba; los siete con valor `{{Nombre-Producto}}` pasan a `**Producto:**`, porque una etiqueta de un plano sobre el valor de otro es lo que `Vocabulario-Rules.md` §3 prohíbe. Se corrigieron además **27 marcadores `{{nombre-proyecto}}`** que la 5.0 dejó sin renombrar pese a haber declarado el identificador nuevo, y que violaban D3 por ser todo-minúsculas; las tres cabeceras modelo de `Rules-Contexto.md`, categoría de **nivel producto**, dejan de declarar un proyecto de código, según R3.
- **60 filas históricas de control de cambios reescritas en 23 archivos**, contra `SDD-Development-Guide.md` §VI.2, que lo prohíbe textualmente: «las filas ya escritas no se reescriben, aunque un cambio posterior invalide lo que describen; corregirlas hace que el changelog mienta». Todas restituidas a su texto original, verificado contra el control de versiones. El `CHANGELOG.md` sí había respetado la regla. **Límite declarado**: las filas que la 4.1 escribió el mismo día y la 5.0 reescribió a continuación no son recuperables, porque no hubo commit intermedio y no existe fuente de verdad de su texto; quedan con el vocabulario nuevo y se declara en lugar de reconstruirse, porque un registro reconstruido es un registro falso.

### Corregido — el registro de versiones de la 5.0

- **Cuatro archivos declaraban en cabecera una versión que su control de cambios no registraba**: `Master-Prompt.md` (5.0 sin fila, siendo que su propia §16 dice «cualquier cambio en su contenido sube versión y queda registrado»), `Marco-Teorico-SDD.md` (2.0 sin fila), `SDD-Development-Guide.md` (1.3 sin fila) y `SDD-Getting-Started-Guide.md`, que declaraba **dos versiones contradictorias en el mismo archivo**, `1.2` en el front-matter y `1.0` en el bloque de cabecera. Las filas faltantes se registran retroactivamente, declarando que se registran retroactivamente.
- **Unos veinte archivos habían sido modificados sin dejar fila**: los nueve del catálogo `References/Design/`, las notas de coherencia, el prompt de entrada, las dos guías de usuario y `Templates/`. Todos suben versión con su fila.
- **Filas de cuatro celdas insertadas en tablas de tres columnas**, que rompían el renderizado de la tabla. Normalizadas.
- **`Rules-Design-Modelo-Template.md` no tenía control de cambios propio**: declaraba versión en cabecera y su §15 es el control de cambios del documento que la plantilla produce, no de la plantilla. Se agrega §16, aplicación incompleta de D5 que §15 hacía difícil de ver.
- **`SDD-Development-Guide.md` no tenía salto de línea final.** Restituido.

### Corregido — desfase de los tres documentos de `SDD/Guides`

- **`SDD-User-Guide.md` (1.6 → 1.7) contradecía al orquestador en el punto que la 5.0 vino a corregir.** §4.5 paso 6 decía «Derivar `Slug-Producto`, `Raiz-Codigo` (PascalCase)» y F-18 que `Raiz-Codigo` «es la forma PascalCase del nombre del producto», cuando `Master-Prompt.md` §3.2 y `Vocabulario-Rules.md` §3 declaran que **se declara en el perfil de convención del intake y admite separadores de segmento**. Un usuario que siguiera la guía disparaba la validación bloqueante de independencia entre planos. Su glosario §10.1 pasa de dos entradas de vocabulario a nueve —los seis términos normativos por frontera, los cuatro planos de identidad, el contexto de lectura y el glosario de categoría—; §4.4 dejaba de listar tres de las cinco reglas transversales y §10.2 no incluía `Vocabulario-Rules.md` en el árbol; el resumen ejecutivo declaraba 23 entradas de FAQ y hay 29, defecto arrastrado desde la 1.5.
- **`SDD-Development-Guide.md` (1.2 → 1.4) contradecía al `README.md` raíz en tres conteos**: §I.2 declaraba «los dieciséis archivos normativos … más `Root-Rules`, `Intake-Rules`, `Maqueta-Rules` y `Deriva-Rules`», §II.1 «las cuatro reglas transversales» y §III.7 que una invariante «vive en los dieciséis archivos de reglas», cuando la propia 5.0 había agregado el decimoséptimo y el README ya decía diecisiete y cinco. Su mapa de dependencias §I.1 no tenía el nodo `Vocabulario-Rules` y su tabla §I.3 de quién lee cada pieza no la incluía, además de afirmar que el subagente «recibe un solo archivo de reglas».
- **`SDD-Getting-Started-Guide.md` (1.2 → 1.3)** suma al glosario mínimo los términos que un primer arranque necesita —producto, proyecto de código, proyecto como emprendimiento, solución de código, los cuatro nombres del producto con la aclaración de que `Raiz-Codigo` la declara el usuario, y la regla de vocabulario— y corrige el rango de la FAQ, que citaba `F-01 a F-23` cuando hay 29 desde la 3.0.

### Corregido — defectos preexistentes encontrados en el camino

- **`Rules-Especificacion-Funcional.md` §0 citaba «11 (ejemplos)»**, número nuevo con el significado viejo: residuo del intercambio 10 ↔ 11 de la 3.0 del framework.
- **Cuatro nombres de artefacto en todo-minúsculas** que la propia regla que los contenía prohíbe en el párrafo siguiente: `especificacion-funcional.md`, `modelo-conceptual.md` y `definicion-<concepto>.md` en §3.1, §3.5 y §5.1 de la regla de 02, contra su propia §2.1; y `glosario-ux` en §3.1 y §3.2 de la regla de 03, contra su §2.1 y contra D3.
- **`Rules-Arquitectura-Tecnica.md` declaraba dos veces la línea «Nivel de aplicación»** en su cabecera.
- **Tres valores de ejemplo que no cumplían Título-Con-Guiones**: `servicio-pagos`, `Turnos Médicos` y `Librería CSV` en cabeceras modelo de nivel proyecto de código.

### Corregido — dos celdas de verificación de la nota de coherencia de la 5.0

`Coherencia-Vocabulario-Producto-Y-Proyecto-De-Codigo.md` (1.0 → 1.1) reexpresa sus celdas **D1** y **D2**, que afirmaban verificaciones no realizadas: la D1 declaraba un «barrido de determinantes, adjetivos y participios adyacentes» que no se había hecho —lo demuestran «producto técnica» y las 30 «reproducto»—, y la D2 declaraba haber restituido el salto de línea final «en los archivos que no lo tenían» mientras `SDD-Development-Guide.md` seguía sin él. Eran afirmaciones sobre el estado del sistema sin evidencia válida, que es lo que D9 prohíbe. **El alcance verificado por la nota no se modifica**, según el criterio de reexpresión del `README.md`: el alcance no se toca nunca y solo se reexpresa la verificación concreta que quedaría falsa. Se agrega su observación 6 con la clase de defecto que la intervención introdujo y que su propio veredicto APROBADO no detectó, porque no había criterio contra el cual detectarlo.

### Preservado deliberadamente

- **`SDD/Devs/Bootstrap/` y `_legacy/` no se tocaron.** Las dos «reproducto» y los `project_type` que `Bootstrap/` conserva citan el estado vigente en su momento.
- **El renombre de la 5.0 no se revierte.** «Producto» y «proyecto de código» quedan como el vocabulario normativo. Lo que se repara es cómo se aplicó.
- **No se creó snapshot en `_legacy/`.** El archivado por versión rige por conjunto normativo publicado y esta entrada no publica una versión mayor: la 5.0 sigue siendo el conjunto de referencia y su subcarpeta se crea cuando sea superada.
- **No se propone una invariante D10.** El criterio de desambiguación es una regla operativa transversal, no una invariante del template.
- **No se unifican los glosarios en uno por producto**, y no todas las categorías reciben glosario propio. Solo 02, 03 y 11 emiten uno; las demás declaran dónde van sus términos. Multiplicar glosarios crearía el problema que la regla de no duplicación existe para evitar.
- **El nivel de unidad de entrega sigue definido y sin materializar**, pendiente declarado de `Vocabulario-Rules.md` §8.

### Verificación pendiente, declarada

La comprobación empírica del defecto del glosario de 02 es **generar la categoría 02 de un producto de tipo `library` o `cli-tool`** —sin persistencia— y verificar que emite glosario. Requiere una corrida del orquestador sobre un destino y queda fuera del alcance de una intervención sobre el repositorio fuente. Se declara como pendiente y no como cumplida, porque afirmarla sin haberla corrido sería el mismo defecto que la celda D1 de la nota anterior cometió.

## [5.0] - 2026-07-29

Vocabulario normativo: el nivel superior pasa de «solución» a **producto** y la unidad de compilación pasa de «proyecto» a **proyecto de código**. Sube major: cambian identificadores, nombres de artefacto y nombres de archivo, y toda la documentación generada bajo la nomenclatura anterior deja de cumplir. Alcanza a los diecisiete archivos de reglas, al orquestador, a las dos plantillas de intake y a las guías.

**Origen.** La constatación de que el framework no tenía glosario propio y de que sus dos términos centrales estaban definidos por su papel en la herramienta y no por su frontera: `Marco-Teorico-SDD.md` §9 definía *Proyecto* como «unidad de especialización del template» y *Solución* como «agrupación de una jerarquía de N proyectos». Un término definido así absorbe cualquier significado, y eso fue lo que ocurrió: «proyecto» llegó a designar cuatro cosas distintas dentro del mismo árbol generado —la unidad de compilación, la unidad que recibe las categorías 02 a 11, el emprendimiento de `Alcance-Proyecto.md` y, en un destino real, una entidad del dominio del cliente—.

### Añadido
- **`Vocabulario-Rules.md`**, decimoséptimo archivo de reglas y quinta regla transversal. Fija los **seis términos** con definición por frontera —producto, unidad de entrega, módulo, solución de código, proyecto de código, proyecto—, los **cuatro planos de identidad** de un producto, cinco reglas de uso, la tabla de confusiones que cierra, la precedencia frente al glosario del dominio del cliente y la correspondencia con el vocabulario de industria.
- **Los cuatro planos de identidad como campos propios**: `Nombre-Producto` (prosa de negocio), `Slug-Producto` (Título-Con-Guiones, deriva del anterior), `Raiz-Codigo` (identidad de código, **se declara**) y `Artefacto-Agrupacion` (el agrupador de construcción, que el framework no modelaba). Ninguno se distingue de otro solo por capitalización o puntuación.
- **Validación bloqueante de independencia** en `Master-Prompt.md` §3.2 e `Intake-Rules.md` §4: si `Slug-Producto` y `Raiz-Codigo` son la misma cadena salvo por la puntuación, el campo de negocio fue completado con un nombre de artefacto de código y la derivación no procede.
- **Regla de choque de vocabulario** en `Intake-Rules.md` §5: si el glosario del dominio del cliente usa uno de los seis términos con otro sentido, el intake debe declarar el choque y definir los dos usos. Es bloqueante. Convierte en procedimiento lo que cada destino venía resolviendo por reacción y de manera distinta.
- **Declaración de nivel en la cabecera de cada regla** (`Vocabulario-Rules.md` §4 R3): producto, proyecto de código, o ambos. El nivel fija qué nombre usa el documento en su prosa.
- **Ejemplo de raíz de código multi-segmento** en `PRODUCT-MANIFEST-template.md` §5 (`Contoso.Turnos`). Los dos ejemplos anteriores eran de un solo segmento y ocultaban el caso que el framework no podía expresar.

### Cambiado
- **`Raiz-Codigo` se declara, ya no se deriva.** `Master-Prompt.md` §3.2 obligaba a obtenerla del nombre legible «concatenando sin separadores», cláusula que hacía inexpresable cualquier raíz de espacio de nombres de más de un segmento —la forma normal en .NET, Java y Python— y que forzaba a escribir la identidad de código en el campo de negocio.
- **`SOLUTION-INTAKE` → `PRODUCT-INTAKE` y `SOLUTION-MANIFEST` → `PRODUCT-MANIFEST`**, con sus dos plantillas renombradas.
- **Identificadores**: `Nombre-Solucion` → `Slug-Producto`; `NombreSolucionCodigo` → `Raiz-Codigo`; `Nombre-Proyecto` → `Nombre-Proyecto-Codigo`; `nombre-proyecto-codigo` → `Identidad-Codigo`; `project_type` → `tipo_proyecto_codigo`.
- **Artefactos generados**: `Alcance-Proyecto.md` → `Alcance-Producto.md` (elimina el sentido «emprendimiento» del árbol), `Arquitectura-Solucion.md` → `Arquitectura-Proyecto-Codigo.md`, `Vista-Solucion.md` → `Vista-Producto.md`, `Pipeline-Solucion.md` → `Pipeline-Producto.md`, y la carpeta `SDD/Docs/Solucion/` → `SDD/Docs/Producto/`.
- **Esqueleto de despacho de `Master-Prompt.md` §8**: la línea de contexto repetía `{{NOMBRE_SOLUCION}}` dos veces en dos posiciones que debían llevar nombres distintos. Pasa a declarar los cuatro planos, cada uno con su marcador.
- **Bloque informativo de `Master-Prompt.md` §3.4**: imprimía tres líneas que declaraban formatos y parecían el mismo nombre escrito distinto. Pasa a declarar cuatro conceptos con su plano.
- **Redacción de D8**, que decía «conjunto cerrado de tipos de proyecto». El conjunto de ocho valores no cambia.

### Preservado deliberadamente
- **«Módulo» conserva su sentido funcional.** Se verificó que ya designaba un área funcional del producto en 37 lugares del framework y en los destinos reales —barra de navegación de módulos, acento por módulo, módulos incluidos en el plan de pruebas—. Usarlo para la unidad de compilación habría creado una colisión nueva en el plano de UX y de pruebas.
- **«Proyecto» a secas queda para el emprendimiento**, con una excepción declarada y única: los compuestos `multi-proyecto`, `inter-proyecto` y `cross-proyecto`, donde el calificador no entra sin deformar la palabra.
- **`SDD/Devs/Bootstrap/` y `_legacy/` no se tocaron**, por la regla de que un registro que se corrige después deja de ser un registro. El vocabulario que conservan era el vigente en su momento.
- **«Solución» sobrevive en un solo compuesto, «solución de código»**, donde significa exactamente lo que significa en el ecosistema. Es lo que elimina la homonimia con el archivo de solución de .NET.
- **El nivel de unidad de entrega queda definido pero sin materializar.** `Vocabulario-Rules.md` §8 lo declara como pendiente: hoy las once categorías de nivel producto cuelgan de un nivel poblado con proyectos de código, y reubicarlas es una intervención estructural aparte. `tipo_proyecto_codigo` conserva D8 por la misma razón.

### Impacto sobre destinos existentes
Los árboles generados bajo 4.x declaran su procedencia y la reconciliación normativa de `Master-Prompt.md` §2.1 los clasifica como desfasados. Ninguno se renombra retroactivamente: el usuario elige entre plan de adecuación, regeneración o continuar bajo la versión de origen, y el conjunto 4.1 queda archivado en `_legacy/4.1/` para poder aplicarlo.

## [4.1] - 2026-07-29

Vocabulario de roles, autoridad de decisión de AG-00 y defectos verificados. Sube minor: precisa el alcance de una especialidad y corrige defectos, sin modificar ninguna invariante D1-D9 ni el conjunto de artefactos de ninguna categoría. Ninguna documentación ya emitida deja de cumplir.

**Origen.** Un análisis externo del framework centrado en cómo quedaron definidos los conceptos de solución, producto, solución de código y proyecto. De sus hallazgos, esta entrada aplica los que **no requerían decidir nada**: los defectos contrastables contra el árbol y la acotación de AG-00, que el propio framework ya había vuelto innecesaria sin actualizar el texto.

### Corregido
- **Los ejemplos de `Nombre-Solucion` y `Nombre-Proyecto` usaban minúsculas**, variante que D3, el algoritmo de `Master-Prompt.md` §3.2 y **tres archivos de reglas** prohíben textualmente («quedan prohibidas las variantes todo-minúsculas»). El defecto se propagaba al nombre de archivo: `SOLUTION-MANIFEST-template.md` §5 declaraba `Nombre-Solucion` = `gestion-de-turnos` y en la fila siguiente citaba `SOLUTION-INTAKE-Gestion-De-Turnos.md`, siendo el patrón `SOLUTION-INTAKE-<Nombre-Solucion>.md`. 66 ocurrencias normalizadas en cuatro archivos. `SDD-User-Guide.md` §4.1 definía Título-Con-Guiones como «(minúsculas, …)», definición que se contradice a sí misma.
- **`SOLUTION-MANIFEST-template.md` no declaraba su versión en cabecera.** Era el único artefacto de `Intake/` sin campo `Versión` legible. La plantilla de intake había corregido el mismo defecto en su 1.3, declarándolo «una aplicación incompleta de D6 sobre las plantillas»; la corrección no se había propagado a la otra plantilla.
- **Las fichas de AG-10 y AG-11 del catálogo de especialidades estaban intercambiadas.** `Marco-Teorico-SDD.md` §4.2 declaraba AG-10 como Technical Writer y AG-11 como Developer Advocate, al revés de lo que declaran `Rules-Examples.md`, `Rules-Documentacion.md` y la tabla resumen §4.3 del propio marco. **La entrada 1.7 de su control de cambios afirma haber actualizado §4.2** en el intercambio 10 ↔ 11 del 2026-07-28: el registro declaraba una corrección que no se había aplicado a las fichas. Arrastraban la misma inversión el diagrama de trazabilidad de §4.4 y las interacciones cross-rol de AG-03.
- **Cuatro rutas `rules/` obsoletas** en el manifiesto, el master-prompt y el marco teórico. La del master-prompt caía en el primer paso de la fase de validación de intake.
- **El árbol de ejemplo del intake §16 contradecía el layout del orquestador**: mostraba `docs/` y `devs/Intake/` donde `Master-Prompt.md` §3.5 fija `SDD/Docs/` y `SDD/Intake/`. Es el ejemplo que el usuario copia, así que el defecto se propagaba a cada intake real.
- **El flag `equipo_n` declaraba un origen inexistente.** `Master-Prompt.md` §4 decía leerlo de «SOLUTION-INTAKE §2 (stakeholders) o §10 (restricciones)», y ninguna de las dos secciones pedía la cantidad de personas del equipo: §2 pide una tabla de roles y §10 pide presupuesto, fecha, normativa e integraciones. El flag gatea la emisión de `Acuerdo-Equipo.md` y la forma de la categoría 07.
- **Cuatro referencias al `BRIEF`**, plantilla deprecada desde la unificación de intake del 2026-06-10, y **residuos del intercambio 10 ↔ 11** en `Rules-Contexto.md`, cuya §1.1 decía «11 (examples)»: el número nuevo con el significado viejo. La ruta `03-UX-UI/` de la tabla §4.3 pasa a `03-UX-UI-DX/`.

### Cambiado — la autoridad de decisión de AG-00
- **`Rules-Contexto.md` (2.0 → 2.1) parte la responsabilidad de la especialidad.** Su §1.1 declaraba que la responsabilidad principal de AG-00 era «completar lo que el cliente todavía no dijo: **forzar la priorización MoSCoW, declarar exclusiones explícitas**, traducir aspiraciones en objetivos SMART». La frase mezcla dos comportamientos incompatibles: **formalizar lo implícito**, que es trabajo de Product Manager y se conserva, y **decidir lo no decidido**, que es arbitraje de Product Owner y se retira.
- **Por qué.** AG-00 corre aguas abajo del punto en que el humano ya confirmó el intake y el manifiesto. Una prioridad decidida ahí entra a la cadena D6 habiendo pasado el audit y ninguna aprobación, y es indistinguible de una decidida por el Product Owner: el audit verifica completitud, forma y coherencia interna, no fidelidad a una intención que nunca se expresó, y D9 declara explícitamente que no aplica a afirmaciones de contexto, que es lo que produce esta categoría. El riesgo no es que el agente invente mal, es que invente bien.
- **La arbitración ya era innecesaria y el texto quedó sin actualizar.** `Intake-Rules.md` §5 valida, antes de despachar cualquier subagente, que §4 tenga MoSCoW con Must mínimo y §9 al menos tres exclusiones. La frase proviene de `Rules-Contexto.md` **1.0, del 2026-05-17**, generada en el bootstrap; `Intake-Rules.md` no existió hasta el **2026-06-10**. Ninguna versión intermedia revisó ese párrafo.
- **`Rules-Plan-Sprint.md` (2.0 → 2.1)** deja de llamar «Product Owner / Backlog» a AG-06, que su propio archivo de reglas y el catálogo definen como Scrum Master, y explicita que no reprioriza.
- **`Marco-Teorico-SDD.md` §5.5** corrige el mapeo del rol Scrum Product Owner, que apuntaba a AG-00. La ficha de AG-00 siempre declaró el alias como «Product Owner senior **en contextos donde el rol no existe formalmente**»; la tabla de correspondencias había dejado caer la condición. Se restituye.

### Añadido
- **Product Owner y stakeholder como términos declarados**, con entradas de glosario en `Master-Prompt.md` §15 y `SDD-User-Guide.md` §10.1. El Product Owner es un rol humano aguas arriba del intake, **fuera de la cadena AG-XX**, dueño de la priorización y de las exclusiones. El stakeholder es una categoría de relación, parcial y plural, que aporta el material que el Product Owner arbitra. El framework ya usaba «Product Owner» sin traducir en cinco archivos de reglas; faltaba en el único documento que el rol escribe.
- **Campo `Product Owner` en la cabecera del intake** y nota que declara quién es responsable del documento: el PO es el autor del contenido y quien aprueba, y la redacción puede estar asistida por un agente sin que eso delegue la autoría. La pregunta bloqueante de §2 se desdobla: fusionaba al Product Owner con la categoría de stakeholder «propietario», que no son lo mismo —quien financia también es propietario y no por eso es el PO—.
- **`Rules-Contexto.md` §6.1, catálogo de ambigüedades de la categoría**: dieciocho ítems que AG-00 verifica **antes de redactar**, con el criterio que distingue formalización de decisión. Complementa el mecanismo reactivo de `Master-Prompt.md` §9 poniéndole un piso: enumera qué buscar en lugar de esperar a tropezarse con ello. Es el piloto de un patrón replicable a las once categorías restantes.
- **`Coherencia-Roles-Y-Defectos-Verificados.md`**, nota de coherencia con el inventario, la evidencia de cada defecto, la verificación D1-D9, la trazabilidad en seis eslabones y cinco observaciones.

### Preservado deliberadamente
- **`SDD/Devs/Bootstrap/` no se tocó**, por la regla de que un registro que se corrige después deja de ser un registro. Las referencias al `BRIEF` que ese directorio conserva son correctas: citan el estado vigente en su momento.
- **La triple asignación de la priorización queda cerrada solo en AG-00.** `Rules-Necesidades-Negocio.md` y `Rules-Backlog-Tecnico.md` conservan su mandato sobre la prioridad; corregirlos requiere que el Product Owner esté declarado, cosa que esta entrada recién habilita.
- **No se creó snapshot en `_legacy/`.** El archivado por versión rige por conjunto normativo publicado, y esta entrada no publica una versión mayor: la 4.0 sigue siendo el conjunto de referencia y su primera subcarpeta se crea cuando sea superada.

## [4.0] - 2026-07-28

Normalización del versionado y del archivado. **Sube major: se modifican las invariantes D4 y D5**, y la documentación generada con la nomenclatura anterior deja de cumplir.

**Origen.** El framework tenía **dos lógicas de versionado conviviendo dentro de cada plano**. En el propio repositorio, 34 archivos usaban nombre estable con la versión en la cabecera y 11 la llevaban en el nombre, de los cuales 4 mentían: el marco teórico iba por la versión 1.8 dentro de un archivo llamado `-v1.0.md`. En la documentación generada, la mayoría de los artefactos llevaba la versión en el nombre y nueve clases no la llevaban. **En los dos planos los defectos aparecieron en la frontera entre ambas lógicas**: la pérdida silenciosa de dos README de sección durante una corrida real, y los cuatro nombres desactualizados del framework, son el mismo choque visto de los dos lados.

### La regla única

En la carpeta de trabajo hay **un solo archivo por nombre lógico, sin sufijo de versión**. La versión vive en el campo `Versión` de la cabecera. Al ser superado, el archivo se copia completo a `_legacy/`, y **la copia archivada sí recibe el sufijo**. Aplica a los dos planos, sin excepciones de nombre.

Tres propiedades se siguen de la regla: cuál es la versión vigente deja de ser algo que hay que verificar y pasa a ser una propiedad estructural del árbol; subir de versión no propaga ninguna actualización de referencias, porque los enlaces apuntan a un nombre que no cambia; y un agente que lee una carpeta ingiere un solo ejemplar de cada documento.

### Cambiado
- **`README.md`**: D4 pasa a declarar que el archivo vivo lleva nombre lógico estable y que el sufijo `-v<X.Y>.md` identifica a las copias archivadas. D5 pasa a declarar que una sola versión vigente **es** un solo archivo por nombre lógico en la carpeta de trabajo. Se agrega la nota que explica la duplicidad anterior y por qué se elimina en lugar de parchearse, la fila de `_legacy/` en el mapa del repositorio y una fila de intervención para publicar una versión nueva del framework. Se agrega además el **criterio de qué se conserva y qué se reexpresa en una nota de coherencia**: el alcance verificado no se toca nunca, y una verificación concreta se reexpresa solo si quedaría falsa contra el árbol vigente o citaría un archivo que ya no existe.
- **Las cuatro notas de coherencia reexpresan su celda de D4** —la del marco teórico y las tres del catálogo de diseño— porque afirmaban que ciertos archivos llevaban sufijo de versión en el nombre y eso dejó de ser cierto. Cada celda declara bajo qué versión de la invariante se hizo la verificación original. **Las celdas de D5 quedan intactas**: afirmaban un único archivo por nombre lógico sin copias paralelas, que sigue siendo cierto bajo la formulación nueva.
- **Once archivos renombrados** a su nombre lógico estable: el marco teórico, la nota de coherencia del marco, los tres documentos de coherencia del catálogo de diseño y los seis `Design-Rules-*`. **163 referencias actualizadas** en 23 archivos, con cero enlaces rotos. Los `Design-Rules` previstos del roadmap del índice también pierden el sufijo, porque ese listado fija la convención de nombre.
- **`Master-Prompt.md` (3.7 → 4.0)**: §3 completa el bloque de procedencia del framework al derivar el manifiesto. §5 reescribe las celdas de versionado, deprecación y sufijo. §5.1 reescribe el detalle operativo alrededor de la regla única, con su ejemplo de árbol y las tres propiedades que se siguen.
- **Los dieciséis archivos de reglas suben major**: patrones de nombre, ejemplos, cabeceras modelo, anti-patrones y criterios de aceptación pasan a la nomenclatura sin sufijo. **751 nombres de artefacto normalizados** en 24 archivos, incluidas las dos guías de usuario, el prompt de entrada, las plantillas de intake y el marco teórico.
- **`SOLUTION-MANIFEST-template.md`**: §1.1 nueva con el bloque de procedencia del framework, que declara la versión del conjunto y la de cada regla aplicada. El perfil de convención de nombres pasa a §1.2.
- **`SDD-Development-Guide.md` (1.1 → 1.2)**: §I.2 suma `_legacy/` a la anatomía; §VI.4 declara que congelar la versión anterior depende de la procedencia y del snapshot; **§VI.5 nueva** con el versionado del framework como conjunto.

### Añadido
- **`_legacy/`** en la raíz del framework, con su README. Una subcarpeta por versión publicada, con el **conjunto normativo completo** —no los archivos que cambiaron— porque las reglas son interdependientes y lo que hay que poder reconstruir es el estado coherente. Un snapshot son unos 50 archivos y 1,5 MB, y se toma una vez por entrada de este changelog. **Rige desde la 4.0 hacia adelante**; las versiones anteriores solo son recuperables desde el historial del control de versiones, con el mismo criterio con que se incorporó D9.
- **Criterio de reexpresión de las notas de coherencia**, en el `README.md`. El **alcance** de lo que una nota verificó no se toca nunca: una nota que verificó D1 a D8 sigue diciendo D1 a D8. Una **verificación concreta** se reexpresa solo cuando quedaría falsa contra el árbol vigente o citaría un archivo inexistente; no alcanza con que la invariante haya cambiado de forma. La versión 4.0 es el ejemplo: D4 y D5 se reformularon las dos, pero solo las celdas de D4 se reexpresaron, porque las de D5 siguen siendo ciertas bajo la formulación nueva. Sin esta distinción el framework quedaba con dos prácticas opuestas para el mismo artefacto.
- **El `CHANGELOG.md` queda declarado como el mecanismo de versionado del framework.** El control de versiones vuelve a ser control de código fuente y nada más: reconstruir una versión no requiere tags ni ramas, porque el árbol se autocontiene.

### Corregido
- **Los checklists de D4 eran tautológicos.** Al menos seis reglas verificaban «Ningún archivo usa el patrón `-v<X.Y>.md`; todos usan `-v<X.Y>.md`», con los dos patrones idénticos, y `Rules-Contexto.md` daba un ejemplo inválido idéntico a los válidos. Una normalización anterior había convertido el patrón prohibido `.v<X.Y>.md` en el permitido y había vaciado de sentido toda línea que los contrastaba. Un auditor que los corriera pasaba siempre. Reescritos contra la regla nueva.
- **Campos `Documento` que no coincidían con su archivo**: cuatro notas de coherencia se declaraban con un prefijo de guion bajo que ningún archivo tenía.
- **Las cuatro notas de coherencia quedaban contradiciéndose a sí mismas** tras el cambio de D4: sus filas de inventario nombraban los archivos sin sufijo mientras sus celdas de verificación seguían afirmando que lo llevaban. Se readecuaron a las reglas vigentes, **declarando la reexpresión en la propia celda** e indicando bajo qué versión se hizo la verificación original. De paso citaban `Guia-Usuario-SDD-v1.0.md`, un archivo que nunca existió con ese nombre.
- **`§6.5` de `Maqueta-Rules.md` no existe**, y tres archivos lo citaban. §6 es una lista numerada sin subsecciones y la verificación de ofuscación es su punto 5. Defecto preexistente, verificado contra el estado anterior del repositorio.
- **`Master-Prompt.md` §0 titulaba «Modelo de dos repositorios»** mientras el `README.md` y la guía de arranque declaran tres. Reescrito: el framework opera sobre tres, el orquestador sobre dos de ellos y el tercero no lo toca nunca.
- **Cita ambigua a `§3.1`** en la derivación del manifiesto, que se leía como si la sección fuera del formato del manifiesto y no del propio master-prompt.

### Añadido — fase de reconciliación normativa

Hasta ahora, ante un `SDD/Docs/` con contenido previo el orquestador solo ofrecía **archivar todo y empezar de cero, o abortar**. No miraba con qué versión se había generado ese árbol ni proponía nada. Con la procedencia declarada y el archivado por versión, esa limitación deja de tener sentido.

- **`Master-Prompt.md` §2.1, nueva.** Se dispara solo si `SDD/Docs/` tiene contenido. Distingue tres casos: sin procedencia declarada (árbol anterior a que la procedencia existiera, se ofrece solo regenerar o abortar y se explica por qué), al día (lo informa y sigue) y desfasado (ejecuta la comparación). El diff normativo se arma sin despachar subagentes: lee la procedencia del manifiesto, lee las versiones vigentes de cabecera, clasifica cada salto por severidad leyéndola de la propia numeración, y para cada salto major enumera los artefactos que esa regla gobierna según su tabla maestra de documentos.
- **Tres salidas, con detención obligatoria.** **A** emite un plan de adecuación en `SDD/Docs/Audit/Reconciliacion-<origen>-a-<vigente>.md`, documento por documento y sin modificar nada. **B** regenera desde cero, que es el comportamiento histórico. **C** continúa bajo la versión de origen, leyendo sus reglas desde `_legacy/<version>/`; no se ofrece si ese conjunto no es reconstruible, porque el orquestador no puede aplicar reglas que no puede leer.
- **La decisión C se registra** en el manifiesto (`SOLUTION-MANIFEST-template.md` §1.1, tabla de decisiones de reconciliación). Sin registro, el arranque siguiente vuelve a preguntar lo mismo y el usuario vuelve a contestarlo sin memoria de haberlo hecho.
- **Prohibiciones de la fase**: no modificar ningún documento, no elegir salida por cuenta propia ni siquiera cuando no hay impacto, y no declarar reconstruible un conjunto de origen sin verificar que existe, porque es una afirmación sobre el estado del sistema y D9 exige evidencia.
- Propagado a `PROMPT-Agente-Bootstrap-SDD.md` (prerrequisito 4), `SDD-Getting-Started-Guide.md` (troubleshooting), `SDD-User-Guide.md` (lista de fases y glosario) y `Master-Prompt.md` §0, §3.5 y §7.

### Añadido — navegabilidad y anexos de datos del intake

Sintetizado del patrón que **dos intakes reales desarrollaron por su cuenta** sobre la plantilla 1.3, en dos soluciones sin relación entre sí. La convergencia entre ambos es la evidencia de que faltaba en la plantilla.

- **Tabla de contenido obligatoria** en el `SOLUTION-INTAKE`, después de la cabecera, con las secciones de primer y segundo nivel y con cada escenario de la Parte D listado por identificador. El framework ya la exigía a los documentos que genera; el intake, que es el que más agentes leen y que en la práctica supera las dos mil líneas, era la excepción injustificada.
- **Formato por escenario de §20, de tres piezas a cinco.** Suma **contexto** (qué situación real representa), **qué ejercita** (del modelo, las reglas y los invariantes) y **qué verificar** (traducción directa a casos de prueba). El último es el que convierte un JSON en fixture: es lo que `08-Calidad-Y-Pruebas` toma como criterio de aceptación y lo que `10-Examples` convierte en contrato de verificación.
- **`Estado` del dato como enum cerrado**: `medido`, `declarado`, `derivado`, `reconstruido`. Es la regla de evidencia D9 aplicada a los datos de ejemplo, con la consecuencia declarada de que un valor `reconstruido` no es una medición y no se presenta como tal.
- **Recomendación de encadenar los escenarios** como una única línea de tiempo coherente en lugar de emitirlos sueltos: un conjunto encadenado sirve de juego de datos para un *end-to-end* completo.
- **`Intake-Rules.md` (2.0 → 2.1) valida ahora la Parte D**, que hasta acá no verificaba nadie: presencia de los cuatro bloques por escenario, `Estado` dentro del enum, tabla de contenido con los escenarios listados, **regla de resolución de identificadores en las dos direcciones** (toda cita tiene anexo y todo anexo está citado) y **regla de autocontención**. Las dos reglas existían declaradas en la plantilla desde su 1.3 y ninguna validación las comprobaba.

### Preservado deliberadamente
- Las entradas anteriores de este changelog y los archivos de `SDD/Devs/Bootstrap/` **conservan los nombres que citaban en su momento**, según `SDD-Development-Guide.md` §VI.2 y la regla de que `Bootstrap/` nunca se edita. Un registro que se corrige después deja de ser un registro.

**Sobre el primer snapshot de `_legacy/`.** No se creó ninguno en esta versión. Las entradas `[3.2]` y `[4.0]` se produjeron en una misma sesión de trabajo sobre el estado `[3.1]`, así que no existe un árbol publicado intermedio que preservar. El archivado por versión rige desde la 4.0 hacia adelante: su primera subcarpeta se crea cuando la 4.0 sea superada. Fabricar un snapshot reconstruido sería un registro falso, que es justamente lo que la regla de intocabilidad de `_legacy/` prohíbe.

## [3.2] - 2026-07-28

Reparación de la política de deprecación y del archivado en `_legacy/`. Sube minor: precisa políticas existentes y agrega una sección al esqueleto de despacho, sin modificar ninguna invariante D1-D9 ni el conjunto de artefactos de ninguna categoría. Ninguna documentación ya emitida deja de cumplir.

**Origen.** Ocho hallazgos verificados sobre la política de archivado, cinco reportados por la evaluación de una corrida real del orquestador sobre una solución de cuatro proyectos y tres detectados al contrastarlos contra el framework. Cuatro de ellos comparten el mismo mecanismo: un artefacto se sobrescribe sin que ningún actor reciba error y sin que el directorio se vea incorrecto.

### Cambiado
- `Master-Prompt.md` (3.6 → 3.7). **§3.5**: el layout declara `SDD/Docs/Audit/`, que §10 escribía sin que ninguna fuente de estructura la declarara, y explica dónde aparece `_legacy/` y por qué no ocupa una posición fija. **§5**: la política de deprecación unifica la ruta en `<carpeta-del-artefacto>/_legacy/<YYYY-MM-DD>/` e incorpora los requisitos de estado `Superado` y nota a la versión vigente, que hasta ahora vivían solo en las reglas de categoría y por eso no llegaban al bloque de invariantes que §8 inyecta a los subagentes; la política de versionado incorpora el criterio de estado de cabecera para las correcciones derivadas del audit de la propia fase de emisión. **§7.2**: declara el versionado por corte de cadencia en el tramo de documentación viva y exceptúa a las Fases I y J de la regla de snapshot previo. **§8**: el esqueleto de despacho suma la sección «Estado previo del entregable», y el snapshot queda asignado al orquestador y no al subagente. **§10**: el path del informe de auditoría suma el eje de ronda.
- `Root-Rules.md` (1.4 → 1.5), `Rules-Contexto.md` (1.5 → 1.6), `Rules-Necesidades-Negocio.md` (1.4 → 1.5), `Rules-Examples.md` (2.0 → 2.1), `Rules-Documentacion.md` (2.0 → 2.1): cada una declara que su artefacto emitido sin sufijo de versión sí lo recibe al archivarse, con puntero a la regla general.

### Añadido
- `Master-Prompt.md` **§5.1**, sección nueva con el detalle operativo de la política de deprecación: la ruta única con su lectura de las abreviaturas de las reglas de categoría y el caso distinto de `SDD/Docs/_legacy/` del prerrequisito 4; el sufijo de versión que reciben al archivarse los artefactos emitidos sin sufijo; la tabla de cinco exenciones declaradas (`AGENTS.md`, `CHANGELOG.md`, maqueta, ADR y el campo `evidencia` de los contratos `VER-XX`); y la prohibición de renombrar retroactivamente lo ya archivado, porque etiquetar con una versión un archivo cuyo contenido no se verificó viola D9.

### Corregido
- **Ruta de archivado sin eje de proyecto.** `_legacy/<categoria>/<fecha>/` no tenía forma de distinguir dos proyectos que archivaran la misma categoría el mismo día. La ruta local a la carpeta del artefacto lo resuelve por construcción.
- **Artefactos sin sufijo de versión imposibles de archivar.** Seis clases de artefacto se emitían sin sufijo y se archivaban identificándose por nombre de archivo: el segundo archivado del mismo día sobrescribía al primero. Produjo pérdida real en dos README de sección durante la corrida que originó la evaluación.
- **Re-audit que sobrescribía su informe.** El path del informe de auditoría estaba fijo en `-v1.0` y §10 obliga a re-audit tras un veredicto RECHAZADO. El eje de ronda lo corrige, y con él la trazabilidad de las correcciones, que citan el hallazgo del informe que las origina.
- **Dos erratas de formato preexistentes**: la fila D9 de `Master-Prompt.md` §5 y la fila 3.4 de su §16 estaban separadas de sus tablas por una línea en blanco que las rompía como markdown.
- **Referencia colgada** en `SDD-Development-Guide.md` §2 a `SDD/Devs/Intake/_legacy/`, carpeta eliminada en la entrada 3.1 de este changelog.

## [3.1] - 2026-07-26

Eliminación de material histórico absorbido. No cambia ninguna regla ni el comportamiento del orquestador.

### Eliminado
- `SDD/Devs/Reformulacion/` (4 archivos, 80 KB): `Matriz-Coherencia-Template-v1.0.md` (línea base ST-01), `Propuesta-Modelo-Solucion-Jerarquia-v1.0.md` (ST-02, APROBADA e implementada), `Audit-Reformulacion-Final-v1.0.md` (ST-09, APROBADO sin P0) y `Audit-Unificacion-Intake-v1.0.md` (APROBADO sin P0). Documentaban la reformulación a modelo de solución con jerarquía de proyectos y la unificación del intake, ambas consumadas: el modelo que proponen **es** el framework vigente y los audits cerraron aprobados.
- `SDD/Devs/Intake/_legacy/2026-06-10/` (2 archivos, 56 KB): `PROJECT-BRIEF-template.md` y `PROJECT-README-template.md`, las dos plantillas que el `SOLUTION-INTAKE` unificado reemplazó.

**Criterio aplicado.** Un registro histórico se conserva mientras alguien lo cite o mientras explique algo que las reglas vigentes no expliquen por sí solas. Estos seis archivos no cumplían ninguna de las dos condiciones: cero referencias entrantes desde archivos vivos, y su contenido íntegramente absorbido en las reglas y en las entradas 2.0 a 2.5 de este changelog. El historial de git los preserva y son recuperables.

**No se tocó `SDD/Devs/Bootstrap/`.** Su `Audit-SDD1.md` es la evidencia empírica de las invariantes: siete archivos de reglas lo citan para justificar qué déficit del fuente corrigen. Eliminarlo dejaría a esas reglas diciendo «hacé X» sin poder decir por qué.

### Cambiado
- `README.md` y `SDD/Guides/SDD-Development-Guide.md`: la anatomía del repositorio pierde la fila de `Reformulacion/`, y la descripción de `Bootstrap/` deja de decir «registro histórico congelado» para declarar lo que realmente es, una fuente citada. La guía de desarrollo suma el criterio general para decidir cuándo un registro histórico se conserva y cuándo se elimina.

## [3.0] - 2026-07-26

Intercambio de las categorías 10 y 11, redefinición del cuerpo documental de entrega e incorporación del ciclo de documentación viva posterior al handoff. Sube major porque cambia el alcance y el gating de dos categorías, y porque la documentación generada con la numeración anterior deja de cumplir.

### Añadido
- `SDD/Guides/SDD-Development-Guide.md` (nuevo, 1.0): guía de desarrollo y extensibilidad del framework, para el mantenedor del framework y no el de una solución. Anatomía, seis contratos internos hasta ahora no escritos, **nueve** ejes de extensión con ejemplo trabajado, criterios, once anti-patrones y procedimiento de cambio. El archivo existía vacío desde su creación.
- `README.md` raíz: reescrito como superficie de entrada. Matriz de ruteo por intención, anatomía del repositorio, mapa de las doce categorías, invariantes D1 a D9 enunciadas y reglas de intervención.
- `Rules-Documentacion.md` (2.0): cuerpo documental de entrega organizado por rol de intervención, con artefactos de nivel solución (`Vision-General-Sistema`, `Guia-Inicio-Rapido`, `Guia-Despliegue`, `Bitacora-Eventualidades`, `Contrato-Agentes`, `AGENTS.md`) y tres cuerpos de proyecto: integrador, mantenedor y operador. Modelo de documentación viva en tres momentos, cadencia anclada al cierre de sprint, ensayo de entrega con gate humano y bitácora de eventualidades con triaje obligatorio. Identificadores `OPS-XX`, `EXT-XX` y `EVE-XX`.
- `Rules-Examples.md` (2.0): doble arista del sample. Contrato de verificación `VER-XX` con `verifica`, `comando`, `precondiciones`, `criterio_aceptacion` y `evidencia`, y dos pasadas de generación, de diseño pre-código y de ejecución durante la codificación.
- `Master-Prompt.md` (3.6): Fases I y J, con la precondición dura de la Fase I, su criterio de re-ejecución y diez hallazgos P0 propios. `AGENTS.md` como única salida fuera de `SDD/`.
- `Deriva-Rules.md` (1.1): sondas `VER-XX` en la matriz de sensado. Los proyectos sin interfaz visual dejan de quedar sin instrumento de sensado.
- `SDD-User-Guide.md` (1.5): §4.8 con el paso 7 del usuario y seis entradas de FAQ nuevas, F-24 a F-29.

### Cambiado
- **Intercambio 10 ↔ 11.** `Rules-Developer-Guide.md` pasa a `Rules-Documentacion.md`; la categoría de ejemplos pasa de 11 a 10 y la de documentación de 10 a 11. Carpetas target `10-Examples/` y `11-Documentacion/`. Subagentes reasignados: AG-10 Developer Advocate y AG-11 Technical Writer / Documentation Lead. La dependencia se invierte: 10 demuestra con código ejecutable y verificable, 11 explica, referencia y enlaza.
- **Gating de la categoría 11.** Deja de ser opcional para cuatro tipos D8 y pasa a existir siempre, con granularidad por cuerpo. El cuerpo mantenedor es obligatorio para los ocho tipos.
- **Orden de fases.** La Fase F queda solo con 09-Devops; la Fase G produce la pasada de diseño de 10-Examples; la Fase H suma el plan documental de 11. El handoff cierra el tramo de especificación y no el alcance del framework.
- **Definition of Done del sprint** (`Rules-Plan-Sprint.md` 1.4): incorpora la actualización de la categoría 11 como condición de cierre.
- **Fronteras declaradas en las dos direcciones**: `Rules-Arquitectura-Tecnica.md` (1.4), `Rules-Calidad-Y-Pruebas.md` (1.6) y `Rules-Devops.md` (1.6) declaran su frontera con la categoría 11. Sin esto, el subagente de esas categorías no la conoce, porque cada uno lee un solo archivo de reglas.
- **Tabla de contenido** exigida en los documentos generados por las diez categorías de 00 a 09, cuando superan las tres secciones de primer nivel.
- **Vocabulario de actores normalizado**: «consumidor» pasa a «integrador» y «constructor» a «mantenedor» donde designan un rol de intervención; «audiencia» pasa a «rol de intervención» donde designa a quien lee documentación. Se conservan los usos técnicos y la categoría de stakeholder del intake.
- **Referencias a la sección de anti-patrones**: el orquestador las citaba como «§4.5», numeración que solo coincidía en siete de los trece archivos de reglas. Ahora se las ubica por título.
- `SDD-Getting-Started-Guide.md` (1.1) y `Marco-Teorico-SDD-v1.0.md` (1.7): puestos al día con la numeración nueva.

### Corregido
- **Contradicción entre `Rules-Calidad-Y-Pruebas.md` y `Deriva-Rules.md`** (1.6 → 1.7). La categoría 08 seguía condicionando `Matriz-Sensado-Deriva` a `requiere_maqueta == true` y a haber ejecutado la Fase B2, contradiciendo la extensión del sensado a contratos y comportamiento. Ahora §0 declara las dos clases de sonda y su origen, §2.1 hace la matriz obligatoria también para proyectos con categoría 10, y §6 separa el criterio por clase de sonda y prohíbe la matriz vacía. Sin esta corrección, un proyecto sin interfaz visual seguía quedando sin instrumento de sensado.
- **Nomenclatura de invariantes.** El framework se refería al conjunto como «D1-D8» pese a que son nueve desde la incorporación de D9. Dieciocho ocurrencias normativas pasan a «D1-D9» en el master-prompt, las dos guías de usuario, `Root-Rules.md`, `Rules-Necesidades-Negocio.md`, el marco teórico y el catálogo de diseño, con las enumeraciones completadas. Las notas de coherencia ya emitidas conservan «D1-D8»: verificaron contra el conjunto vigente en su momento.
- **Neutralidad de dominio en la guía de arranque** (1.1 → 1.2). El ejemplo aplicado de §6 nombraba una solución concreta en dieciocho lugares. Pasan al placeholder `<Nombre-Solucion>`, con la descripción del dominio y los flujos de usuario enunciados en términos genéricos.
- **Referencia muerta en el marco teórico** (1.7 → 1.8). El bloque de ejemplo de §11.2 citaba `devs/Rules/decisiones-D1-D8.md`, archivo inexistente, con rutas del layout previo al modelo de tres niveles.
- **Versionado de la plantilla de intake** (1.2 → 1.3). `SOLUTION-INTAKE-template.md` no declaraba su propia versión en cabecera, solo en su control de cambios. Aplicación incompleta de D6 sobre las plantillas.
- **Autosuficiencia del repositorio.** Doce ocurrencias de rutas que apuntaban fuera del árbol quedaron eliminadas. Ningún archivo de `IA.SDD` referencia otro repositorio.

### Impacto sobre documentación ya emitida
La documentación generada con la numeración anterior no se regenera automáticamente. Una solución existente conserva sus carpetas `10-Developer-Guide/` y `11-Examples/` hasta que se ejecute una regeneración parcial de esas categorías. El resto de las categorías no se ve afectado.

## [2.5] - 2026-07-25

Normalización de la nomenclatura de los archivos de reglas: se elimina el prefijo numérico de las doce reglas por categoría.

### Cambiado
- `SDD/Devs/Rules/`: las doce reglas por categoría pierden el prefijo numérico y pasan a `Rules-<Categoria>.md` (`00-Rules-Contexto.md` → `Rules-Contexto.md`, …, `11-Rules-Examples.md` → `Rules-Examples.md`). Las cuatro reglas meta (`Root-Rules.md`, `Intake-Rules.md`, `Maqueta-Rules.md`, `Deriva-Rules.md`) ya cumplían la convención y no cambian. Sin cambios de contenido normativo: no se sube versión de ninguna regla. La numeración de las categorías se mantiene donde sí es semántica: títulos de las reglas (`# Reglas constructivas — 05 Arquitectura técnica`), carpetas destino (`SDD/Docs/05-Arquitectura-Tecnica/`) y fases del orquestador.
- Referencias actualizadas en los 20 markdown del repositorio que citaban los nombres anteriores: `SDD/Devs/Orchestrator/Master-Prompt.md`, `SDD/Guides/SDD-User-Guide.md`, `SDD/Devs/Guides/Coherencia-Auditoria-Marco-v1.0.md`, los nueve documentos de `SDD/Devs/References/Design/`, los cuatro de `SDD/Devs/Bootstrap/`, los tres de `SDD/Devs/Reformulacion/`, las propias reglas y las entradas históricas de este changelog.
- El patrón placeholder `XX-Rules-<Categoria>.md` pasa a `Rules-<Categoria>.md` en `Master-Prompt.md` (§1 y §6), `SDD-User-Guide.md` (§6 y §10 glosario), `Audit-Fase-3.md` y `Matriz-Coherencia-Template-v1.0.md` §2.1.
- `SDD-User-Guide.md` §4.4: la verificación del listado de `Rules/` deja de expresarse como rango `00-Rules-*.md` a `11-Rules-*.md` y pasa a "los doce archivos de reglas por categoría `Rules-*.md` (de `Rules-Contexto.md` a `Rules-Examples.md`)".

## [2.4] - 2026-07-24

Reorganización de las guías de usuario: convención de nombres en inglés y nueva guía de arranque rápido.

### Añadido
- `SDD/Guides/SDD-Getting-Started-Guide.md` (1.0): guía de arranque rápido para primeros pasos con el template, con front-matter estructurado (`doc_id`, `traces` a `SDD-User-Guide.md` y `PROMPT-Agente-Bootstrap-SDD.md`) y orientada a desarrolladores primerizos, analistas, líderes técnicos y agentes de IA.
- `PROMPTS/README.md`: descripción del agente orquestador (borrador inicial).

### Cambiado
- `SDD/Guides/Guia-Usuario-SDD-v1.0.md` → `SDD/Guides/SDD-User-Guide.md`: renombrado a la convención de nombres en inglés, sin cambios de contenido (se mantiene la v1.3).
- `README.md` raíz: se corrige el enlace de la guía de usuario al nombre nuevo (`SDD/Guides/SDD-User-Guide.md`), que había quedado roto tras el rename.

## [2.3] - 2026-07-20

Desacople de la ubicación del repositorio fuente respecto del destino y autocontención de los ejemplos de instancia en el intake.

### Cambiado
- `PROMPTS/PROMPT-Agente-Bootstrap-SDD.md` (2.0 → 2.1): la ubicación del repositorio fuente deja de asumirse hermana del destino. Se introducen los placeholders `<RUTA-FUENTE>` (derivada del path de la invocación, quitando el sufijo `/PROMPTS/PROMPT-Agente-Bootstrap-SDD.md`) y `<RUTA-DESTINO>` (la ruta indicada tras «en el repositorio:»), y se declara `../IA.SDD/` como alias de `<RUTA-FUENTE>/`, lo que cubre las ocurrencias del master-prompt y de las reglas sin editarlas. §1 introduce ambos placeholders y el bloque de invocación; §2 prerrequisito 1 pasa de «clonado como hermano» a «accesible en `<RUTA-FUENTE>`», verificable; §3 invoca al orquestador con las rutas derivadas. Habilita workspaces donde fuente y destino no son hermanas (p. ej. `IA/IA.SDD` y `DEV/<solución>`).
- `SDD/Devs/Intake/SOLUTION-INTAKE-template.md` (1.0 → 1.1): se agrega la **Parte D — Anexos de datos** (§20 escenarios con JSON completo y su procedencia y estado, §21 matriz de cobertura y trazabilidad), la **regla de autocontención** en la guía de uso (paso 5), los ítems de checklist de la Parte D y la fila de trazabilidad downstream. Objetivo: que el intake transcriba los ejemplos de instancia en lugar de referenciar archivos externos que el orquestador aguas abajo no puede resolver. La Parte D es opcional y condicional (existe solo si las fuentes aportan ejemplos), pero cuando existen es su hogar canónico: el cuerpo cita por identificador (`E-1`, `E-2`, …) y el anexo reproduce el dato completo, sin referencias colgantes ni anexos huérfanos.

## [2.2] - 2026-07-19

Incorporación de la Fase B2 de validación visual de maqueta y del mecanismo de sensado de deriva.

### Añadido
- **Fase B2 — Validación visual de maqueta**, opcional y por proyecto, entre la Fase B y la Fase C. Se activa con el flag nuevo `requiere_maqueta`, propuesto por el orquestador y confirmado por el humano. Materializa la especificación de la categoría 03 en una maqueta navegable (HTML, CSS, Bootstrap 5.0 y JavaScript estáticos, sin proceso de build), la valida con el humano en el navegador, retroalimenta la documentación y capitaliza el diseño.
  - `SDD/Devs/Rules/Maqueta-Rules.md`: subagente AG-03M con sus variantes por D8, artefactos, secuencia de siete pasos con tres detenciones, las dos vías de corrección (por prompt y manual, esta última con relectura, interpretación y confirmación antes de propagar), matriz de propagación de la retroalimentación, reglas constructivas de la maqueta, captura del modelo UX-UI, generación del template ofuscado con verificación bloqueante, y el método de lanzado y relanzado con sus tres formas soportadas.
  - `SDD/Devs/Rules/Deriva-Rules.md`: invariante **D9 — evidencia verificable**, con alcance acotado a las afirmaciones sobre el estado del sistema, cuatro condiciones de validez y formato de cita `EV-XX`; los tres artefactos de línea de base (`Linea-Base-Visual`, `Contrato-Datos-Maqueta`, `Matriz-Sensado-Deriva`) con sus identificadores `SUP`, `CMP`, `EST`, `NAV`, `DM` y `SD`; umbrales de deriva menor y mayor por dimensión; los cuatro puntos de sensado.
- **Catálogo de modelos UX-UI** en `SDD/Devs/Modelos-UX-UI/`: `Index-Modelos-UX-UI.md` (arranca vacío) y `Rules-Design-Modelo-Template.md`, la plantilla de captura. Es el tercer eje del sistema de diseño del template, ortogonal al documento base, a las especializaciones por stack y a las extensiones por capacidad; se aplica por encima del base y nunca lo reemplaza.
- **Carpeta `Templates/`** en la raíz del repositorio, con su `README.md` (estructura obligatoria de un template y regla de ofuscación) y `Modelo-Generico/`, el ejemplo de referencia ejecutable que fija la estructura: tres superficies, tokens del catálogo base como variables CSS, fuente única de datos, los cuatro estados conmutables y la superficie de configuración dirigida por esquema.

### Cambiado
- `Master-Prompt.md` (3.3 → 3.4): flag `requiere_maqueta` en §4, invariante D9 en §5, fila de la Fase B2 y dos notas operativas en §6, los nueve pasos de la fase en §7, criterios de audit propios de B2 y de D9 en §10, línea de base y matriz de sensado en el resumen ejecutivo del handoff en §12, seis términos nuevos en §15. Se declara la única excepción de escritura fuera del repositorio destino (captura del modelo UX-UI en `IA.SDD`, con aceptación explícita y ofuscación bloqueante).
- `Rules-UX-UI-DX.md` (1.5 → 1.6): nueva §1.5 con lo que le toca a AG-03 antes y después de la fase, tres artefactos nuevos en la tabla maestra, tres filas de trazabilidad, dos anti-patrones y dos criterios de aceptación condicionados a `requiere_maqueta`.
- `Rules-Calidad-Y-Pruebas.md` (1.2 → 1.3): `Matriz-Sensado-Deriva-v<X.Y>.md` en la tabla maestra y su criterio de aceptación. AG-08 resuelve el método de verificación de cada fila al generar la Fase E.
- `Index-Design-Rules.md` (1.2 → 1.3): nueva §4.1 con el registro del catálogo de modelos UX-UI como tercer eje, el orden de apilado de las cuatro capas y la regla de conflicto.
- `Guia-Usuario-SDD-v1.0.md` (1.2 → 1.3): se agrega la tabla de contenido del documento. Nuevo §4.6 (Paso 5b) con el recorrido completo de la fase; el §4.6 anterior pasa a §4.7. Nuevo §7.4 (agregar un modelo UX-UI). Cuatro entradas de FAQ nuevas (F-20 a F-23). Seis términos nuevos en el glosario. Árbol de carpetas con `SDD/Maquetas/`, las dos reglas nuevas y el catálogo de modelos.
- `Marco-Teorico-SDD-v1.0.md` (1.4 → 1.6): §8.8 (la maqueta como instrumento de diseño y de control) y §9.7 (la deriva como separación acumulativa, la línea de base como referente externo falsable y la fundamentación de D9 y de sus umbrales). Además, puesta al día con el framework vigente: §3.6 y §3.8 corrigen la referencia al master-prompt (v3.0 → 3.4) y el rastro del modelo anterior a los dos repositorios, e incorporan la Fase B2 al diagrama del flujo; §4.1 y §4.3 registran a AG-03M como subagente de fase que no altera el catálogo de 13 especialidades; §13 suma ocho términos. Se agrega la fila 1.5 que el cambio de 2.1 había omitido, en incumplimiento de la política de versionado D5.

### Decisiones registradas
- **El orquestador lanza la maqueta y degrada sin fallar.** Al terminar de construirla levanta un servidor estático local e intenta abrir el navegador con el abridor del sistema. Si no alcanza un entorno gráfico desde donde corre, informa la URL y el comando en lugar de tratarlo como error: el auto-lanzado es una comodidad, la URL informada es el contrato. Para la corrección manual se recomienda el servidor liviano del editor, que recarga solo al guardar y que el orquestador no puede disparar por su cuenta; para el resto de los casos la maqueta trae su propia recarga automática en la barra de validación, apagada por defecto.
- **La maqueta se sirve estática, sin paso de build.** Lo que se edita es lo que se sirve, y es lo mismo que después relee el orquestador; esa equivalencia es la que hace posible la corrección manual del humano. Un paso de build la rompería: obligaría a rebuild para ver cada cambio, dejaría al orquestador sin saber si la verdad es la fuente o el artefacto servido, y metería dependencias en el repositorio destino para un artefacto de vida corta. Tres métodos de lanzado soportados, en orden de preferencia: servidor liviano del editor (en Visual Studio Code, Live Server o equivalente, que recarga solo en cada guardado y es el mejor ajuste para la corrección manual), archivo directo en el navegador, y servidor estático de línea de comandos. La excepción, admitida vía ADR, está en `Maqueta-Rules.md` §7.2.
- **`SDD/Maquetas/` es hermana de `SDD/Docs/`, no está dentro.** `SDD/Docs/` es exclusivamente prosa generada por el orquestador; la maqueta es material ejecutable que el humano edita durante la validación.
- **D9 no se aplica retroactivamente.** Reauditar la documentación previa contra una invariante nueva produciría un volumen de hallazgos que ahoga a los reales.

## [2.1] - 2026-07-18

Incorporación del arquetipo de panel de control monolítico al catálogo de reglas de diseño, a partir de la extracción de características de un servicio en producción.

### Añadido
- **Tres extensiones por capacidad** en `SDD/Devs/References/Design/`, agnósticas de framework y sin literales del dominio de la fuente:
  - `Design-Rules-Primer-Arranque-v1.0.md`: predicado único de aprovisionamiento, corte en tres capas (ruteo, superficie y acción), superficie sin chrome, acto explícito e indivisible, orientación posterior.
  - `Design-Rules-Acceso-Monousuario-v1.0.md`: perfil de operador único definido por sus omisiones, shell partido acceso/trabajo, catálogo de códigos de resultado con rechazo indiferenciado, frontera de sesión.
  - `Design-Rules-Identidad-De-Version-v1.0.md`: versión derivada de la construcción y nunca transcrita, contrato de identidad, ubicaciones obligatorias del sello, detalle de diagnóstico.
- `SDD/Devs/References/Design/Coherencia-Panel-Monolitico-v1.0.md`: nota de coherencia del pase de QA (invariantes D1–D8 y trazabilidad).
- `Design-Rules-Blazor-Mudblazor-v1.0.md` §4.2: mapeo de los patrones de las tres extensiones a componentes MudBlazor.

### Cambiado
- `Design-Rules-Config-Esquema-v1.0.md` (1.0 → 1.1): frontera entre configuración de aplicación y configuración de entorno, y derivación de los presets a partir de los `ejemplos` y el `default` de los descriptores.
- `Design-Rules-Web-Generico-v1.0.md` (1.1 → 1.2), `Index-Design-Rules.md` (1.1 → 1.2), `Rules-UX-UI-DX.md` (1.4 → 1.5) y `Master-Prompt.md` (3.2 → 3.3): registro, criterio de carga, requisitos de artefacto, trazabilidad, anti-patrones e inyección de las extensiones nuevas en el despacho de AG-03.
- `Marco-Teorico-SDD-v1.0.md` §8.7 y `Guia-Usuario-SDD-v1.0.md` §10.2: descripción del arquetipo y árbol del plano `devs/` actualizados.

## [2.0] - 2026-07-17

Refactorización del template SDD: nueva nomenclatura y modelo de dos repositorios.

### Cambiado
- **Marca y nomenclatura:** todo lo que se llamaba `SDD2.2D` / `SDD 2.2` / `sdd2.2` pasa a llamarse `SDD`. La carpeta raíz `SDD2.2D/` es ahora `SDD/`.
- **Convención de nombres Título-Con-Guiones:** carpetas, archivos de metodología y artefactos generados usan Título-Con-Guiones (cada palabra capitalizada, separadas por guion medio), con sufijo de versión `-v<X.Y>.md`. Los identificadores (`NB`, `CU`, `RN`, `ADR`, `US`, `BT`, `RC`, `TC`) van en mayúscula; los valores del conjunto D8 (`library`, `rest-api`, etc.) se mantienen en minúscula por ser enums.
- **Doctrina D3/D4 reescrita:** de "kebab minúscula + sufijo `_v` con guion bajo" a "Título-Con-Guiones + sufijo `-v` con guion medio", incluido el algoritmo de normalización de nombres del `Master-Prompt.md` §3.2 y la tabla de invariantes §5.
- **Referencias internas:** actualizadas en toda la documentación (reglas, orquestador, plantillas, guías, marco teórico e históricos) a los nombres y rutas nuevos.

### Añadido
- **Modelo de dos repositorios:** la metodología pasa de copiar el template dentro del repositorio destino a trabajar con dos repositorios hermanos en un workspace común:
  - Repositorio fuente `IA.SDD` (solo lectura): reglas, plantillas, prompts, guías. Se referencia como `../IA.SDD/SDD/…`.
  - Repositorio destino de la solución: intake y manifiesto derivado en `SDD/Intake/`, documentación generada en `SDD/Docs/`.
  - Esto permite propagar mejoras del template a nuevas soluciones sin re-copiarlo.
- Documentado el nuevo flujo en la guía de usuario (Paso 4) y en el marco teórico (§1.5, §3.5).

### Reescrito
- `PROMPTS/PROMPT-Agente-Bootstrap-SDD.md`: pasa de contener el meta-prompt histórico de bootstrap (SDD 1.0 → 2.0) a ser el prompt de entrada real del modelo de dos repositorios, que fija prerrequisitos y delega en `SDD/Devs/Orchestrator/Master-Prompt.md`. El contenido histórico del bootstrap se conserva en `SDD/Devs/Bootstrap/`.

### Corregido
- El `README.md` raíz tenía dos enlaces rotos a la guía de usuario y al marco teórico (diferencias de casing y separador); ahora resuelven.
- Ejemplos válido/inválido de nomenclatura en las 12 reglas que habían quedado idénticos u orientados a la convención anterior.
