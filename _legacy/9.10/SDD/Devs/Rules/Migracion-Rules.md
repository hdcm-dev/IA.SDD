# Reglas constructivas — Migración normativa de un destino a la versión vigente

**Carpeta target:** `SDD/Docs/Audit/` del repositorio destino para los dos artefactos propios. El alcance sobre el que la migración opera es `SDD/Intake/` y `SDD/Docs/` del mismo repositorio
**Nivel de aplicación (`Vocabulario-Rules.md` §4 R3):** Producto, unidad de entrega y proyecto de código
**Subagente target del orquestador:** el orquestador de migración para el plan y el cierre; el auditor independiente para el informe; el subagente titular de cada categoría para re-expresar los documentos de esa categoría
**Versión de las reglas:** 3.8

Dentro de este archivo «migración» se usa en forma desnuda, según la excepción que `Vocabulario-Rules.md` §9.6 declara: en este contexto de lectura no hay otro referente con el que colisione. En cualquier otro archivo del framework el término va calificado como «migración normativa».

---

## 0. El problema que resuelve

Un árbol `SDD/Docs/` sobrevive a varias versiones del framework. Cuando el framework avanza, la documentación ya emitida queda descripta contra reglas que dejaron de estar vigentes, y el propio framework declara que ante un salto major esa documentación **deja de cumplir**.

El framework ya sabía diagnosticar ese estado y no sabía repararlo. La reconciliación normativa de `Master-Prompt.md` §2.1 lee el bloque de procedencia del destino, lo compara contra las versiones vigentes, clasifica cada salto por severidad y enumera los documentos potencialmente invalidados. Sus tres salidas son emitir un plan sin tocar nada, regenerar desde cero archivando lo anterior, o seguir con las reglas viejas. **Ninguna lleva el destino de la versión de origen a la vigente preservando su contenido.** Regenerar desde cero lo consigue tirando lo que había; seguir con las reglas viejas lo consigue no avanzando.

Esta regla define el instrumento que faltaba: la mecánica con la que un destino se re-expresa bajo la normativa vigente conservando lo que ya decía. La reconciliación queda siendo el diagnóstico, que es lo que hace bien, y esta regla el tratamiento.

**Dos fronteras que conviene fijar de entrada.**

| Esta regla | No es |
| --- | --- |
| La mecánica de la migración: qué principio la gobierna, qué se preserva, qué no se inventa y cómo se verifica | El orden en que se recorren los documentos ni las fases de la corrida, que viven en el master-prompt de migración |
| Una regla transversal que atraviesa las doce categorías y los dos documentos de entrada | Una categoría documental: no produce una carpeta numerada ni tiene subagente titular propio |

---

## 1. Especialidad asignada

### 1.1 Especialidad base

La migración **no crea especialidades nuevas**. Es la consecuencia directa del principio de delegación de la especialidad que rige el orquestador: la especialidad es propiedad del documento que se va a producir, no del orquestador que lo pide. Un caso de uso migrado sigue siendo un caso de uso, y quien mejor lo re-expresa es el mismo perfil que lo habría generado.

De ahí la regla base: **el documento migrado lo re-expresa el subagente titular de su categoría**, leído de §1.2 del archivo de reglas de esa categoría, con la variante que corresponda al `tipo_unidad_entrega` del proyecto de código al que pertenece. Exactamente como en la generación.

### 1.2 Variantes de especialidad

Esta tabla **no tiene ocho filas por tipo D8**, y la omisión es deliberada y declarada. La migración no discrimina por tipo de proyecto de código porque no elige perfiles: los toma de la regla de cada documento, que ya discrimina por tipo en su propia §1.2. Agregar acá una segunda tabla indexada por D8 crearía dos declaraciones de la misma cosa, que es la clase de duplicación que se desincroniza al segundo cambio.

Lo que sí varía es el actor según la actividad:

| Actividad | Especialidad | De dónde sale |
| --- | --- | --- |
| Re-expresar un documento de una categoría | El subagente titular de esa categoría, en la variante de su tipo D8 | §1.2 del archivo de reglas de la categoría |
| Re-expresar el intake | Ninguna: el intake es documento humano. El agente **propone** y el Product Owner aprueba (§4.4) | `PRODUCT-INTAKE-template.md`, que declara que la autoría y la aprobación no se delegan |
| Re-derivar el manifiesto | El orquestador, que es quien lo deriva también en la generación | `Intake-Rules.md` §4 |
| Emitir el plan de migración | El orquestador de migración, sin despachar subagentes | Esta regla, §2.1 |
| Auditar la migración | El auditor independiente, invocado desde cero | Los criterios de audit del master-prompt de generación, más §6 de esta regla |

### 1.3 Lo que esta regla no asigna

No asigna un subagente «migrador». Un perfil genérico que re-expresa documentos de doce categorías distintas es exactamente el agente derivante que el framework existe para evitar: sin la especialidad de la categoría, el criterio con el que se decide qué contenido corresponde a qué sección lo pone el agente y no la regla.

---

## 2. Artefactos que produce

### 2.1 Tabla maestra de artefactos

| Archivo | Obligatorio para | Recomendado para | Omitir para | Descripción |
| --- | --- | --- | --- | --- |
| `Plan-Migracion-<origen>-a-<vigente>.md` | Toda migración | — | — | El plan: una fila por documento afectado, con su path, la regla que lo gobierna, qué cambió en esa regla, si requiere regeneración o solo revisión, su fuente de contenido y el orden de la cadena D6. Reemplaza a `Reconciliacion-<origen>-a-<vigente>.md` |
| `Informe-Migracion-<origen>-a-<vigente>.md` | Toda migración que haya escrito al menos un documento | — | Una migración que se detuvo antes de escribir: no hay resultado que auditar, y se declara así | El informe del auditor independiente: qué se migró, qué quedó pendiente, qué contenido quedó sin destino y el veredicto |

Los dos viven en `SDD/Docs/Audit/` del repositorio destino. Ninguno tiene gating por tipo D8: la migración es una propiedad del destino, no de la forma de entrega de sus proyectos de código.

**El plan es el contrato entre el orquestador de generación y el de migración.** Lo emite la salida A de la reconciliación normativa y lo consume la migración. Si el usuario invoca la migración sin plan previo, la migración lo genera ella misma aplicando el mismo procedimiento de diff: la dependencia es del artefacto, no de haber corrido el otro prompt.

**La columna de fuente de contenido** es propia de la migración y no existía en el informe de reconciliación. Declara de dónde sale el contenido de cada documento migrado, con exactamente tres valores admitidos: el propio documento de origen, un documento hermano del mismo destino, o pendiente de respuesta humana. No hay un cuarto valor, y esa es la forma en que §4.1 se vuelve verificable fila por fila.

### 2.2 Alcance: qué se migra y qué no

**Se migra** `SDD/Intake/` —el intake y el manifiesto derivado— y `SDD/Docs/` —todos los documentos de especificación generados—, en ese orden, por la razón que fija §4.4.

**Fuera de alcance, con su razón.** Se declara para que la migración no se lea como si hubiera cubierto todo:

| Artefacto | Por qué queda afuera |
| --- | --- |
| `SDD/Maquetas/` | Se versiona con el repositorio y está exento del archivado. Es material ejecutable que el humano edita a mano |
| `/samples/` | Es código, no documentación de especificación |
| `AGENTS.md` | Se regenera completo desde `Contrato-Agentes.md` en cada corrida de la Fase I. Migrar el contrato alcanza |
| Código fuente del destino | El framework produce documentación de especificación, no código |

**Caso especial: destino posterior al handoff.** Si el destino ya tiene código, la categoría 11 está en el tramo de documentación viva, donde D9 exige que toda afirmación sobre el estado del sistema cite evidencia. Migrarla por regeneración plana produciría un cuerpo documental que describe intenciones y se lee como si describiera hechos. En ese caso la migración de 11 se enruta por el criterio de re-ejecución de la Fase I del master-prompt de generación, no por regeneración.

### 2.3 Nomenclatura

Los dos artefactos llevan en el nombre las dos versiones que delimitan el salto, con la versión del conjunto y no la de un archivo suelto: `Plan-Migracion-4.1-a-6.0.md`. Cuando el origen no es determinable porque el destino no declara procedencia, el segmento de origen es `sin-procedencia`: `Plan-Migracion-sin-procedencia-a-6.0.md`. Es un dato del estado del destino y no un valor por defecto que oculte la falta.

---

## 3. El principio de estado objetivo

Es el principio rector de la migración y de él se derivan todas las reglas de §4.

> **La normativa vigente es la especificación del estado al que hay que llegar. El documento existente es la fuente del contenido. La migración re-expresa el segundo bajo la primera.**

No hay recetas por salto de versión. El salto de versión sirve para **priorizar**, no para transformar.

**Por qué el estado objetivo y no un playbook por salto.** Cinco fundamentos:

1. **El framework ya prohíbe la transformación mecánica, con su propio caso como prueba.** `Vocabulario-Rules.md` §9.5 prohíbe la sustitución global de cadena y documenta el daño que produjo en la intervención del framework 5.0. Un playbook por salto describe la migración como operación de texto: adoptarlo sería reintroducir la práctica que el framework acaba de prohibir.
2. **El estado objetivo ya está declarado y no hay que escribirlo.** Cada archivo de reglas declara su tabla maestra, sus reglas de inclusión por tipo, sus criterios de aceptación y sus anti-patrones. Ésa es la especificación completa del destino. Un playbook la duplicaría, y una duplicación que hay que mantener en paralelo se desincroniza.
3. **El costo de los playbooks crece sin techo y su mantenimiento es retroactivo.** Habría que escribir uno al publicar cada versión, y revisarlo cuando una versión posterior cambie lo que él migraba. Con el estado objetivo, publicar una versión no genera ninguna deuda de migración.
4. **Degrada bien cuando falta el conjunto de origen.** El archivado por versión rige desde la 4.0 hacia adelante, así que un destino generado con una versión anterior no es reconstruible. Un playbook necesita conocer el origen y sin él no hay migración posible. Con el estado objetivo la migración sigue siendo posible, porque el objetivo está declarado: lo único que se pierde es la clasificación de saltos. Es degradación de precisión, no pérdida de capacidad (§4.5).
5. **El diff que hace falta ya está calculado.** La reconciliación normativa ya lee la procedencia, lee las versiones vigentes, clasifica cada salto y enumera los artefactos gobernados por cada regla con salto major. Falta ejecutar, no calcular.

**Lo que el estado objetivo no resuelve solo.** Dice a dónde hay que llegar; no dice cómo mapear el contenido viejo cuando una sección desaparece, se parte en dos o se renombra. Para eso no se inventa mecanismo: se reusa el de preservación de correcciones manuales de §4.2. El agente relee, enumera las diferencias, declara cómo interpretó cada una y espera confirmación.

**La única concesión.** Hay un tipo de cambio que ningún diff de versiones puede inferir: el renombre de un artefacto. Que un intake pasó a llamarse de otra manera no se deduce de que su regla haya subido de 2.1 a 3.0. Ese conocimiento vive en el bloque «Impacto sobre destinos existentes» que `SDD-Development-Guide.md` §VI.4 exige en toda entrada major del `CHANGELOG.md`. La migración lo **lee**; no lo reconstruye por inferencia.

---

## 4. Reglas constructivas de la migración

### 4.1 Regla de no invención

**Todo contenido de un documento migrado proviene del documento de origen, de un documento hermano del mismo destino, o de una respuesta del humano. No hay una cuarta fuente.**

Cuando la normativa vigente exige una sección para la que el destino no tiene contenido, la sección **no se rellena**. Se emite como pendiente y la pregunta se consolida en la batería de `Intake-Rules.md` §6 si es del intake, o en el plan como fila sin resolver si es de un documento generado.

**Por qué es la regla más importante de esta regla.** Una migración que completa lo que falta produce un documento que cumple formalmente la normativa vigente y afirma cosas que nadie decidió. Es peor que el documento viejo: el viejo se veía viejo, y éste se ve al día. D9 lo prohíbe, y el audit de la migración lo trata como hallazgo P0.

Rellenar con contenido inferido y declararlo como inferido tampoco alcanza: el lector que consume el documento aguas abajo lee la sección, no la declaración.

### 4.2 Preservación de contenido y de correcciones manuales

**Nada de lo que el destino ya decía se pierde en silencio.** Tres reglas:

1. **Estado previo archivado.** Antes de sobrescribir, el estado previo del documento se archiva en el `_legacy/` de su propia carpeta, con la fecha, según la política de archivado del master-prompt de generación. Sin eso la migración no es reversible.
2. **Contenido sin destino, declarado.** Si el documento de origen tiene contenido que la normativa vigente no ubica en ninguna sección, ese contenido **no se descarta**: se enumera en el plan y en el informe, con su texto localizable, y el humano decide. Descartarlo por no encontrarle lugar es la forma silenciosa de perder información.
3. **Correcciones manuales, no pisadas.** Si el usuario editó a mano el documento, se aplica el patrón ya resuelto del criterio de re-ejecución del master-prompt de generación: el agente relee, enumera las diferencias, declara cómo interpretó cada una y **espera confirmación** antes de propagar. No se decide por cuenta propia qué corrección era intencional.

### 4.3 Clasificación por artefacto

Cada documento del plan recibe exactamente una de tres clasificaciones, derivada de la severidad del salto de la regla que lo gobierna:

| Salto de la regla que lo gobierna | Clasificación | Qué se hace |
| --- | --- | --- |
| Major | **Regenerar contenido** | El documento se re-expresa completo bajo la normativa vigente, con su contenido tomado del de origen según §4.1 y §4.2 |
| Minor | **Revisar** | Se verifica el documento contra la normativa vigente y se corrige solo lo que no cumple. Un minor incorpora sin invalidar, así que la mayor parte del documento queda como está |
| Sin cambio | **No tocar** | El documento no se abre para escritura. Aparece en el plan con esta clasificación, para que quede constancia de que se evaluó y no de que se omitió |

La severidad se lee de la propia numeración de las versiones, no se infiere del contenido. Es la misma regla que gobierna el diff de la reconciliación normativa, y acá no se reinterpreta.

### 4.3.1 Renumeración de identificadores y renombre de archivos

Un salto normativo puede cambiar **la forma de los identificadores**, y con ella el nombre de los
archivos que los llevan: `CU-XX-<Nombre>.md` no es solo texto, es un nombre de archivo, y toda
referencia que lo apunte tiene que seguirlo. Es el caso del salto a la versión 7.0, que fija cinco
dígitos uniformes y ámbito de unicidad producto (`Root-Rules.md` §9).

**La renumeración se hace en dos pasadas, y nunca en una.** Una sustitución archivo por archivo
deja referencias colgadas: en una corrida real, renumerar treinta y nueve archivos produjo por sí
solo dos hallazgos bloqueantes, porque la corrección no alcanzó a dos secciones que describían el
problema ya resuelto.

**Pasada 1 — Árbol de migración.** Antes de tocar nada, el agente construye el mapa completo y lo
presenta al humano para confirmación. Contiene, por cada identificador alcanzado:

| Campo | Contenido |
| --- | --- |
| Identificador de origen | `CU-14` |
| Identificador de destino | `CU-00014`, derivado del ancho vigente y del rango que el mapa de `Master-Prompt.md` §3.4 asigna a su proyecto de código |
| Archivo de origen y de destino | Cuando el identificador vive en el nombre del archivo |
| Referencias que lo apuntan | Todas, con archivo y sección: tablas de trazabilidad, enlaces relativos, cabeceras upstream y downstream, prosa, matrices de cobertura, contratos de verificación y anclas de sección |

El árbol se emite como artefacto del plan y se confirma. Un identificador sin fila en el árbol es
un identificador que la migración no va a tocar, y eso tiene que ser una decisión y no un olvido.

**Pasada 1.b — Familias acuñadas por el destino.** Antes de cerrar el árbol, el agente busca
**familias de identificador que el destino haya acuñado y que no pertenezcan al catálogo del
framework**: prefijos con forma de identificador que ninguna regla declara, y formas calificadas que
el destino inventó para desambiguar —`P·CU-XX`, `<Proyecto>·CU-XX` y equivalentes—.

Aparecen con certeza y no por azar: un destino que se choca con un hueco normativo **inventa un
identificador para seguir trabajando**, y esa invención es justamente la evidencia de qué le faltaba
al método. Ignorarlas al migrar deja identificadores huérfanos que ninguna regla gobierna y que
ninguna comprobación de referencias detecta, porque resuelven entre sí.

Por cada familia encontrada, el árbol declara:

| Campo | Contenido |
| --- | --- |
| Forma | `P·CU-XX` |
| Ocurrencias y dónde | Cuántas y en qué categorías |
| Qué hueco vino a llenar | La lectura del destino sobre qué le faltaba al framework |
| Resolución | Una de las tres de abajo |

Las tres resoluciones posibles, y el orden en que hay que evaluarlas:

1. **Se retira porque el hueco ya no existe.** La versión vigente resolvió lo que la familia venía a
   suplir, de modo que la invención dejó de hacer falta. Es la resolución preferible y la más
   frecuente, porque estas familias nacen de huecos que las intervenciones posteriores cierran. Se
   retira la forma calificada y sus citas pasan a la familia del framework que ahora las cubre.
2. **Se adopta como familia del destino**, con su prefijo, su forma y su ámbito declarados en la
   categoría que la acuña, según `Root-Rules.md` §9.5. Aplica cuando nombra algo que el framework no
   modela y que el producto sí necesita.
3. **Se escala como hueco del framework.** Si la familia nombra algo que el método debería modelar y
   no modela, la migración lo declara y **no lo resuelve por su cuenta**: no es una decisión de
   destino.

La resolución la confirma el humano, como el resto del árbol.

**Pasada 2 — Aplicación.** Se aplica **el árbol confirmado**, no una búsqueda: renombre de archivos,
sustitución de identificadores y actualización de cada referencia enumerada. Cierra con tres
comprobaciones bloqueantes:

1. **Ninguna referencia colgada.** Toda cita que apuntaba a un identificador de origen resuelve
   contra su destino.
2. **Ninguna colisión.** Dos identificadores de origen distintos no terminan en el mismo destino,
   que es el riesgo real cuando el ámbito de unicidad pasa de proyecto de código a producto y dos
   proyectos traían el mismo número.
3. **Ningún residuo de la forma vieja** fuera de `_legacy/`, donde los snapshots conservan la
   nomenclatura con que se emitieron y **no se renombran** (`Master-Prompt.md` §5.1).

#### El procedimiento de mover un documento

**Todo lo que sigue en esta subsección estaba escrito como lección y no como paso, y por eso se
redescubría en cada corrida.** Mover un documento —archivarlo, aplanarlo, fundirlo con otros— tiene
una consecuencia mecánica sobre sus enlaces y sobre los que lo apuntan. **No es criterio: es
aritmética**, y por lo tanto se ejecuta y se verifica en lugar de recordarse.

**Se corre completo cada vez que un documento cambia de ubicación**, y su resultado se registra:

1. **Antes de mover, resolver y registrar.** Por cada enlace relativo del documento, calcular su
   destino como **path absoluto desde la raíz del árbol** y anotarlo. Los enlaces que **ya no
   resolvían** se registran aparte como **rotos previos**: se declaran y **no se arreglan de paso**,
   porque arreglarlos acá los borra del registro de lo que estaba mal antes.
2. **Mover.**
3. **Después de mover, re-derivar.** Recalcular cada enlace desde la ubicación **nueva** hacia el
   **mismo destino absoluto** registrado en el paso 1. La profundidad cambió; el destino no.
4. **Reconectar los entrantes.** Los enlaces que **apuntaban** al documento movido se resuelven por
   **destino** —§4.3.1, regla 4— y **sólo sobre los que dejaron de resolver**. Nunca por sustitución
   de patrón: en una corrida real rompió 181 enlaces donde había 96.
5. **Verificar, y es enumerable.** Los enlaces que **resolvían antes resuelven después**, uno por uno;
   y **el conjunto de rotos previos es idéntico** al del paso 1. Si aparecieron rotos nuevos, la
   operación los produjo. Si desaparecieron rotos viejos, se arreglaron sin declararlos.

**Por qué el paso 5 compara conjuntos y no cantidades.** Un recuento igual puede esconder que se rompió
uno y se arregló otro. Es la misma lección que el audit incorporó en la 8.9: **un recuento correcto
puede sostener una conclusión falsa**.

**Y por qué el paso 1 va antes de mover y no después.** Después del movimiento, un enlace roto no dice
adónde quería ir: la ruta relativa vieja **no se puede resolver desde la ubicación nueva**, y
reconstruir la intención es adivinar. Medido en una corrida real: un archivado sin este paso dejó
**658 enlaces colgados**, todos anteriores a la migración que los encontró.

**Los punteros de un snapshot sí se reconectan.** Renombrar un documento vivo rompe los enlaces que
los snapshots de `_legacy/` le apuntaban. El árbol de migración los incluye y la pasada de aplicación
los reescribe. **No es modificar el cuerpo del snapshot**, que sigue intocable: lo que el snapshot
dice queda igual, y solo se actualiza el destino de un puntero que identifica al mismo documento con
su nombre vigente. Un puntero que sigue a su objeto no falsea el registro; uno que queda colgado no
preserva nada.

**Tres errores de la pasada de aplicación, con su regla.** Los tres se cometieron en una migración
real y los tres los encontró la comprobación, no la lectura:

1. **La etiqueta y el destino de un enlace son el mismo identificador.** En `[CU-14](.../CU-14-....md)`
   los dos se mapean juntos y con el mismo dueño. Tratarlos por separado deja la etiqueta apuntando a
   un identificador que no existe, y **la comprobación de enlaces no lo detecta**, porque el destino
   sí resuelve: lo roto es lo que el lector ve.
2. **Un documento que cambia de profundidad recalcula todos sus enlaces**, no solo los que apuntan a
   algo que se movió. Al fundir árboles, un documento que baja un nivel deja cortas todas sus rutas
   relativas aunque sus destinos no se hayan movido.
3. **Los enlaces se reconectan desde un registro, no desde una búsqueda.** Vale la misma disciplina de
   dos pasadas que para los identificadores: primero el registro completo —origen, enlace viejo,
   destino nuevo y si ya estaba roto antes de migrar—, se confirma, y recién después se aplica. La
   columna de «ya estaba roto antes» es la que distingue lo que la migración rompió de lo que reparó.
4. **La reconexión se hace resolviendo destinos, no sustituyendo patrones.** Un patrón que reescribe
   una ruta relativa **no sabe desde dónde se la cita**, y la profundidad correcta depende de eso: el
   mismo texto de enlace es correcto desde una carpeta e incorrecto desde otra. En una corrida real,
   una sustitución de patrón **rompió 181 enlaces donde había 96**, y alcanzó documentos de otra
   unidad de entrega que no tenían nada que ver con el cambio. El procedimiento correcto es: **para
   cada enlace que ya no resuelve** —y sólo para ésos—, buscar el destino real por nombre, acotado al
   ámbito del documento que cita, y calcular la ruta. No toca ningún enlace que funcione y no puede
   alcanzar a un documento ajeno.
5. **Una cita se declara ambigua después de agotar los resolutores, no antes.** Una cita desnuda
   —`CU-02` sin decir de quién— parece irresoluble y casi nunca lo es: el calificador suele estar en
   el texto, en formas que un solo resolutor no alcanza. En una corrida real aparecieron **cuatro**
   —el proyecto delante del identificador, detrás, en otra columna de la misma fila, y en el documento
   fuente citado en la fila— y aplicarlas en cascada llevó **305 citas «ambiguas» a 16**. Declarar
   ambiguo lo que no se intentó resolver traslada al humano un trabajo que el método podía hacer, y
   **gasta la única atención que hay que reservar para lo que de verdad no resuelve**.

**Qué alcanza el árbol, y es más de lo que parece.** El árbol de migración se construye sobre **todo
lo que lleva identificadores del producto**, no sobre las categorías generadas. En una corrida real
quedaron afuera dos conjuntos, y los dos volvieron como hallazgos:

- **Las familias que el propio intake acuña** —sus reglas de negocio, sus invariantes, sus
  funcionalidades—. `Root-Rules.md` §9.2 las alcanza y el árbol no las incluyó, con lo que el destino
  quedó con **dos numeraciones de la misma regla conviviendo** —`RN-15` y `RN-02015`— sin nada que lo
  dijera. Cuando una familia del intake **ya tiene numeración de destino** en el árbol migrado, no hay
  decisión que tomar: hay una inconsistencia que cerrar.
- **Los documentos de referencia cruzada de nivel producto** —un resumen de traspaso, una norma de
  nomenclatura—, que no pertenecen a ninguna categoría ni a ninguna unidad de entrega y por eso caen
  en el hueco entre dos recorridos.

**Qué no se renumera.** Los identificadores de los informes de audit ya emitidos y los hallazgos que
citan, porque son registros de lo que se verificó en un momento dado. Las familias excluidas del
ancho por `Root-Rules.md` §9.2 —`AG-XX` y el ordinal de iteración— tampoco. Y **un documento cuyos
recuentos también quedaron viejos no se reconecta a medias**: reescribirle los identificadores y
dejarle las cifras produce un documento que afirma cosas que nunca fueron ciertas, que es peor que uno
viejo con su fecha declarada. Se **declara superado**, con un puntero a dónde vive hoy cada cosa que
inventariaba.

### 4.3.2 Migración estructural: del proyecto de código a la unidad de entrega

El salto a la 8.0 no cambia el contenido de los documentos: cambia **de qué nivel son**. Un destino
generado con la 7.0 tiene un árbol de once categorías por cada proyecto de código; en la 8.0 tiene uno
por cada unidad de entrega, y los proyectos de código se inventarían a nivel producto. Fusionar árboles
es una operación que la migración no puede hacer sola, y por eso esta sección declara qué decide el
método y qué decide el humano.

**Lo que el método no puede decidir.** Cuál de los proyectos de código existentes es una unidad de
entrega. El manifiesto de un destino 7.0 no lo declara: hay que leerlo. La migración **propone** y se
**detiene**; no clasifica por su cuenta.

**Paso 1 — Propuesta de clasificación.** El agente enumera los proyectos de código del manifiesto y
propone una clasificación con dos señales, declarando cuál usó en cada caso:

| Señal | Qué sugiere |
| --- | --- |
| Es el unidad de entrega principal | Unidad de entrega, casi siempre |
| `redistribuible: true` | Unidad de entrega: se publica para que otro lo consuma |
| Su rol declara despliegue, publicación, host, punto de entrada o proceso propio | Unidad de entrega |
| Su rol declara dominio, contratos, abstracciones, utilidades o una capa | Proyecto de código de otra unidad, y hay que decir de cuál |

La propuesta se presenta como tabla, con una fila por proyecto de código, su clasificación propuesta,
la señal que la sustenta y —cuando no es unidad de entrega— a qué unidades compone. **El humano
confirma, corrige o reasigna.** Sin esa confirmación la migración no avanza.

**Paso 2 — Mapa de fusión.** Con la clasificación confirmada, el agente construye el mapa de qué
árbol va a dónde, y lo presenta antes de mover nada:

- Los árboles de los proyectos de código que **son** unidades de entrega se renombran a
  `Unidades-Entrega/<Nombre>/`.
- Los árboles de los proyectos de código que **no** lo son se **funden** en el de la unidad de entrega
  que componen. Los documentos que **chocan de nombre** al fundir —los índices de categoría:
  especificaciones, glosarios, READMEs, planes de prueba— **no se sobrescriben ni se fusionan
  automáticamente**: el árbol base conserva el nombre y los demás se preservan en
  `<categoria>/_fusion/<Proyecto-De-Origen>/`, con su procedencia en la ruta. Esa carpeta es el
  inventario de lo que espera consolidación humana, y su presencia declara que la fusión no terminó.
- **La consolidación se hace por categoría completa, no documento por documento.** Los documentos de
  una capa **se citan entre sí como vecinos de carpeta**, de modo que consolidar uno deja a sus
  hermanos estacionados apuntando al vacío. En una corrida real, el primer documento consolidado
  rompió **61 enlaces**, y de a uno habría obligado a reconectar la misma carpeta hasta nueve veces.
  Se consolidan los N documentos de una categoría **en una pasada** y recién entonces se retira su
  `_fusion/`: así cada carpeta se reconecta una vez y **la categoría nunca queda en un estado
  intermedio** donde la mitad cite a documentos vigentes y la otra a estacionados.
- **Consolidar no es deduplicar, y hay que medirlo antes de decidir cómo.** La hipótesis con la que se
  archiva en `_fusion/` es que varios documentos con el mismo nombre dicen lo mismo desde su capa. En
  una corrida real, medido sobre 67 grupos, el solapamiento fue del **5,9 %**: el 94 % del contenido
  era propio de una sola capa. **La medición se hace antes de elegir la salida**, porque decide cuál
  aplica: con solapamiento alto la salida es seleccionar, con solapamiento bajo es **unir con
  atribución** —una subsección por proyecto de código, nombrada— y casi nada se descarta.
- **Cuatro salidas, y la cuarta es la que más se descarta por incomodidad.** Un grupo se resuelve por
  **transposición con atribución** si sus documentos tienen secciones fijas que cada capa completa;
  por **unión de catálogo** si son colecciones de entradas identificadas —los identificadores ya no
  colisionan si la renumeración se hizo antes—; por **reescritura del índice** si son `README`; y por
  **coexistencia con identidad propia** si son **artefactos distintos que comparten nombre por
  convención**. Esta última **no reduce documentos**, y por eso se descarta con facilidad: cuatro
  samples con contratos de verificación distintos **no se funden en uno con un contrato, se funden en
  uno que no verifica ninguno**. Cuando se aplica, se renombran **todos** los del grupo, incluido el
  que estaba vigente, para que ninguno quede privilegiado por conservar el nombre corto.
- **Ninguna cifra se promedia al consolidar.** Si dos capas declaran umbrales distintos —coberturas,
  latencias, gates—, los dos quedan con su capa nombrada. Un promedio de umbrales **no es un umbral**:
  se cumple bajando el más alto, que es exactamente lo que ese umbral existía para impedir.
- **La transposición lee el documento entero, no sólo sus secciones numeradas.** El texto entre la
  cabecera y la primera sección —una nota previa, una declaración de origen— se pierde si el
  procedimiento recorre encabezados. En una corrida real alcanzó a dos documentos, y en uno de ellos
  era **la declaración de dónde salía lo que el documento afirmaba**, que ninguna fuente del
  producto declaraba.
- **La consolidación de los casos de uso se emite como propuesta.** Al fundir capas, la categoría 02
  resultante contiene varias vistas de la misma capacidad —el dominio la modela, la aplicación la
  orquesta, la infraestructura la persiste, la API la expone—. La migración emite la lista de pares
  candidatos con su semejanza, sus capas de origen y las tres salidas posibles por par, y **no la
  aplica**: los cuatro casos de uso de una capacidad no dicen lo mismo, y la unión no es la suma de
  sus partes. La fusión es lo que exige criterio: dos categorías 02 que se fusionan traen dos
  conjuntos de casos de uso que describen la misma capacidad desde capas distintas.
- Si un proyecto de código compone **más de una** unidad de entrega, su árbol no se funde en ninguna:
  su contenido de arquitectura va al inventario de `Producto/Vista-Producto.md`, y lo demás se
  presenta al humano documento por documento. Un artefacto de un proyecto compartido no tiene una
  unidad de entrega dueña, y adivinarla es exactamente el defecto que la 8.0 corrige.

**Citas desnudas ambiguas.** El árbol declara además los identificadores **citados en prosa cuyo
número no existe en el proyecto que los escribe**: apuntan a otro proyecto sin decir a cuál. Con
ámbito de unicidad por proyecto son inevitables y la migración no puede resolverlos contando, porque
el referente está en la oración —«`CU-13` del dominio», «`US-30` de Api»— o en el párrafo. Se
resuelven leyendo, uno por uno, y la resolución se confirma con el árbol. En una migración real
fueron 57, de los cuales 44 nombraban su proyecto en la misma oración y 13 no apuntaban a ningún
proyecto: eran una numeración de nivel producto prevista y no emitida.

**Paso 3 — Qué se conserva y qué se declara.** Rige §4.1: nada se inventa y nada se descarta en
silencio. En particular:

- **Los casos de uso duplicados por capa no se fusionan automáticamente.** Se conservan los dos, con
  su origen declarado, y la deduplicación se propone al humano como lista. Fundir por título produciría
  pérdidas invisibles.
- **Los artefactos que la 8.0 ya no ubica en ese nivel** —la experiencia de uso de un proyecto que no
  se despliega, el pipeline de una capa interna, los entornos de algo que no tiene entornos— se
  declaran en el informe como **contenido sin destino**, y el humano decide si se descarta o si aporta
  algo que hay que reubicar. No se borran por su cuenta.
- **El valor D8 de un proyecto de código que no es unidad de entrega se retira**, porque en la 8.0 el
  tipo es atributo de la entrega. El retiro se declara: no es una pérdida de dato, es un dato que
  cambió de nivel.

**Paso 4 — Renumeración, si corresponde.** El reparto de rangos pasa de ser por proyecto de código a
ser por unidad de entrega, de modo que la fusión de árboles puede producir colisiones de identificador
donde antes no las había: dos proyectos que se funden en la misma unidad traían numeraciones
independientes. Aplica el árbol de migración de §4.3.1 con sus dos pasadas y su comprobación de
colisión de destino.

**Migración parcial.** Es un estado final legítimo según §4.6, y acá es más probable que en cualquier
otro salto: un destino puede migrar sus unidades de entrega y dejar el inventario del eje de
construcción para después. Se declara documento por documento, como exige esa sección.

#### Cómo se comparan las versiones y cómo se verifica que no se perdió nada

**La consolidación tiene un paso débil y uno fuerte, y sólo el fuerte estaba implícito.** Decidir
**qué secciones difieren** entre las versiones de un grupo es lo que determina qué se transpone;
verificar **línea por línea** que nada se perdió es lo que lo corrige si se decidió mal. Ninguno de los
dos estaba declarado, y en una corrida real el primero falló y el segundo lo atrapó.

**C1 · La comparación no normaliza el nombre del proyecto de código.** Es tentador hacerlo —aparece en
la cabecera de las cinco versiones y ahí es ruido— pero **en el cuerpo es contenido**. Caso medido:
cinco documentos de velocidad de equipo parecían **idénticos** al normalizar, y cada uno declaraba
*«mide la porción de la velocidad del equipo que se gastó en»* **su** proyecto. El propio documento
advertía que las cinco tablas no son comparables y que **sumarlas da la velocidad del equipo**:
fundirlas en una habría destruido la única cifra con interpretación estable del conjunto.

**C2 · La verificación de preservación es literal y línea por línea**, de cada documento absorbido
contra el consolidado que lo reemplaza. No es una lectura ni un muestreo: es la comprobación que
sostiene todo lo demás.

**C3 · Se corre antes de re-derivar enlaces.** Si se corre después, **toda línea que contenga un
enlace aparece como perdida**, porque su ruta cambió de profundidad. Medido: **48 marcas, 0 pérdidas
reales**. Si por el orden de trabajo hay que correrla después, se compara **colapsando la ruta de los
enlaces y conservando su texto**, que discrimina exactamente lo mismo.

**C4 · Cada marca se verifica contra el texto; el recuento no alcanza.** Es la misma regla que el audit
adoptó cuando un verificador sobre-reportó cuatro de cinco veces: **un recuento correcto puede sostener
una conclusión falsa**, y acá el error frecuente es al revés —descartar por volumen un conjunto de
marcas donde una era real—.

**C5 · Cuatro clases no transponen, y se declaran una por una** en el `README` del archivado:

| Clase | Por qué no transpone |
| --- | --- |
| El **título** del documento absorbido | El consolidado tiene el suyo |
| Su campo de **identidad** | Lo reemplaza el nombre de la subsección atribuida |
| Un **encabezado renombrado** | La sección pasó de hablar de un proyecto a hablar de todos |
| Su **fila de control de cambios** | Es la historia **del absorbido**, no contenido suyo: vive en `_legacy/` |

**Lo que queda después de descontar esas cuatro es contenido, y su recuento aceptable es cero.**

---

### 4.4 El intake es documento humano

El Product Owner es el autor responsable del intake y quien lo aprueba. La redacción puede estar asistida por un agente, pero la autoría del contenido y la aprobación no se delegan. De ahí cuatro restricciones propias:

1. **El agente propone, no sobrescribe.** Emite el intake migrado como propuesta y presenta un diff **de estructura**: qué sección se movió, qué se partió, qué se renombró y qué contenido quedó sin destino. Escribe recién con aprobación explícita.
2. **Nada se rellena.** Rige §4.1 sin excepción: la sección sin fuente va a la batería de preguntas, no se completa.
3. **Escritura por el flujo controlado.** Archivado previo del intake, fila en su control de cambios y re-derivación del manifiesto con nueva confirmación, según las reglas de no-modificación del intake del master-prompt de generación. El bump del intake es **major**, porque una migración estructural reescribe secciones ya aprobadas.
4. **Verificación contra la plantilla vigente.** El intake migrado se verifica contra `PRODUCT-INTAKE-template.md` vigente y no solo contra los campos bloqueantes de `Intake-Rules.md` §2.2. Los dos conjuntos no coinciden hoy: la plantilla declara secciones obligatorias que la validación no comprueba. La migración no cierra ese hueco, que es una intervención aparte, pero tampoco lo agrava.

**Orden respecto del resto.** El intake se migra antes que el manifiesto, y el manifiesto antes que los documentos generados. No es preferencia: es la cadena D6. El intake es la fuente de verdad, el manifiesto se deriva de él y los documentos generados se derivan de los dos. Migrar `SDD/Docs/` contra un intake todavía con estructura vieja produce documentación derivada de un upstream superado.

### 4.7 La revisión de apartamientos

**Un destino acumula reglas locales que el método no contempla, y hasta acá la migración no las
miraba.** Cada apartamiento de `Root-Rules.md` §11 es una decisión que dijo «la obligación X no aplica
acá, por Y». Un salto de versión puede volverla obsoleta, puede contradecirla, o puede dejarla
exactamente igual de válida — y **las tres cosas se veían iguales**, porque nadie las resolvía.

**Se revisa cada apartamiento vigente contra la normativa vigente, y hay exactamente tres
resultados.** El insumo no es una interpretación: es el **campo 4 del propio ADR**, los disparadores
concretos que superarían la decisión. La pregunta es si la vigente los cumple.

| Resultado | Cuándo | Qué se hace |
| --- | --- | --- |
| **Absorbido** | La vigente ya dice lo que el apartamiento pedía, o su disparador se cumplió | El ADR pasa a `absorbido en SDD <X.Y>`, el artefacto omitido **vuelve a ser obligatorio** y entra al plan con su clasificación |
| **Contradicho** | La vigente decidió **lo contrario** de lo que el apartamiento declara | **Arbitraje**: no lo resuelve el agente. Se lleva a la detención de M1 con las dos lecturas |
| **No contemplado** | La vigente sigue sin decir nada del caso | El ADR **se preserva** tal cual y su contador de saltos sobrevividos **se incrementa** |

**El caso contradicho no estrena detención, y es deliberado.** Es la **detención por arbitraje** de
`Master-Prompt.md` §7.0, que ya existe desde la 4.1: dos cosas aprobadas que se contradicen y ninguna
autoridad en el agente para elegir. Lo único que cambia es qué se contradice — allá dos categorías del
mismo producto, acá el destino y el método a través de un salto. **Agregar una detención propia para
la misma forma habría sumado carga sin sumar criterio.**

**Qué se hace con el contador, y por qué es lo más valioso de esta revisión.** Un apartamiento con
**dos o más saltos sobrevividos** se declara en el informe de migración como **candidato a regla del
framework**, con su ADR, su fundamento y su cuenta. No lo resuelve la migración —el framework no se
toca desde un destino— pero deja de depender de que alguien se acuerde de reportarlo: **el número lo
reporta**.

**Los apartamientos no se re-fundamentan al migrar.** Si uno sigue `vigente`, se preserva **con su
texto literal**, incluido su fundamento original. Reescribirlo contra la normativa nueva produciría un
ADR que dice haber decidido algo que en su fecha nadie decidió, y §4.1 lo prohíbe con la misma razón
por la que no se rellena una sección sin fuente.

---

### 4.5 Destinos sin procedencia declarada

Un destino que no declara bloque de procedencia **sí es migrable**, y ésta es la capacidad que antes no existía: la reconciliación normativa solo le ofrece regenerar o abortar, porque no tiene contra qué comparar.

La migración por estado objetivo no necesita conocer el origen, porque el objetivo está declarado en la normativa vigente. Lo que se pierde es la clasificación de saltos de §4.3, y el efecto es concreto: **todos los documentos pasan a «revisar»**, sin discriminarse entre regenerar y no tocar.

Dos obligaciones cuando esto ocurre:

1. **Se declara la degradación**, en el plan y en el informe, con su consecuencia: el plan no prioriza, y el volumen de documentos a revisar es el total del destino.
2. **No se supone un origen.** Inferir la versión de origen a partir del aspecto de los documentos es una afirmación sobre el estado del sistema sin evidencia, y D9 la prohíbe. El segmento de origen del nombre de los artefactos es `sin-procedencia` (§2.3).

### 4.6 Migración parcial como estado final

Una migración puede terminar sin haber completado la cadena, y es un estado final legítimo. La razón es que la migración se detiene a pedir confirmación humana en cada corte: si un «no confirmo» no tuviera salida declarada, el destino quedaría en un estado que la propia regla considera inválido.

Las dos condiciones que la hacen legítima, y las dos son bloqueantes:

1. **El bloque de procedencia no se reescribe.** Una procedencia que declara la versión vigente sobre un árbol migrado a medias es una afirmación falsa sobre el estado del sistema, y D9 la prohíbe. La procedencia se actualiza **solo si toda la cadena quedó migrada**; reescribirla con migración parcial es hallazgo P0.
2. **El estado parcial se declara en el informe**, documento por documento: qué quedó migrado, qué quedó sin migrar y por qué. Una fila del plan que quedó sin resolver y sin declararse como pendiente es hallazgo P0.

El destino queda entonces declarando su procedencia de origen, que es lo que sigue siendo cierto, con un informe que dice exactamente cuánto se avanzó. Una migración posterior retoma desde ahí.

---

## 5. Preguntas guía

Antes de migrar un documento:

- ¿Cuál es la fuente de cada sección del documento migrado? Si alguna respuesta es «la completé yo», la migración de ese documento está mal y hay que volver a §4.1.
- ¿Qué decía el documento de origen que la normativa vigente no ubica en ninguna sección? Si la respuesta es «nada», ¿se verificó, o se asumió?
- ¿El usuario editó este documento a mano después de generarlo? ¿Con qué evidencia se responde eso?
- ¿La regla que gobierna este documento subió major, minor o no cambió? ¿De dónde se leyó la severidad?

Antes de cerrar la migración:

- ¿Quedó alguna fila del plan sin resolver? ¿Está declarada como pendiente?
- ¿Toda la cadena D6 quedó migrada? Si no, ¿la procedencia quedó sin tocar?
- ¿Algún documento migrado afirma algo sobre el estado del sistema que antes no afirmaba?

---

## 6. Criterios de aceptación

- [ ] [interpretativo] Si el salto alcanza el nivel de aplicación, la clasificación de proyectos de código en unidades de entrega la **confirmó el humano**, y el informe declara qué señal sustentaba cada propuesta.
- [ ] [enumerable] Todo proyecto de código del manifiesto de origen aparece en la clasificación: como unidad de entrega, o como componente de al menos una.
- [ ] [interpretativo] Ningún caso de uso se fusionó automáticamente por coincidencia de título; los duplicados por capa se conservan con su origen declarado y su deduplicación se propuso como lista.
- [ ] [enumerable] El contenido sin destino está declarado en el informe y no se descartó en silencio.

- [ ] [enumerable] El árbol declara las **citas desnudas ambiguas** y su resolución confirmada.
- [ ] [enumerable] Existe la **propuesta de consolidación de casos de uso** cuando la migración fundió árboles, y no se aplicó por su cuenta.
- [ ] [enumerable] Los documentos que chocaron al fundir están en `<categoria>/_fusion/<Origen>/` y ninguno se sobrescribió. **Que ninguno se sobrescribiera no significa que la fusión terminó**: mientras esa carpeta exista, no terminó, y ése es un criterio distinto.
- [ ] [enumerable] **No queda ninguna carpeta `_fusion/` en el árbol**, o la consolidación pendiente está declarada como tal en el informe, con su inventario por categoría.
- [ ] [enumerable] Existe la **medición de solapamiento** de los grupos de consolidación, y la salida elegida para cada grupo es coherente con ella.
- [ ] [interpretativo] Ninguna cifra se promedió al consolidar documentos de capas con umbrales distintos.
- [ ] [enumerable] Los enlaces se reconectaron **desde un registro confirmado**, y el registro distingue lo que la migración rompió de lo que reparó.
- [ ] [enumerable] **La verificación de preservación de cada grupo consolidado cerró en cero líneas de contenido**, con las cuatro clases que no transponen declaradas y las marcas por enlace discriminadas (§4.3.2).
- [ ] [enumerable] **Todo apartamiento vigente del destino fue revisado** (§4.7) y quedó con uno de los tres resultados declarado en el informe; ninguno quedó sin resolver.
- [ ] [enumerable] **Ningún apartamiento preservado fue re-fundamentado**: los que siguen `vigente` conservan su texto literal y sólo cambió su contador.
- [ ] [enumerable] **Por cada documento movido corrió el procedimiento de §4.3.1**, y su verificación cierra: los enlaces que resolvían antes resuelven después, y el conjunto de rotos previos es **el mismo conjunto**, no la misma cantidad.
- [ ] [enumerable] El árbol declara las **familias acuñadas por el destino** que no pertenecen al catálogo del framework, con su resolución confirmada por el humano.
- [ ] [enumerable] Si el salto alcanza la forma de los identificadores, existe el **árbol de migración** de §4.3.1 con una fila por identificador alcanzado, y está confirmado por el humano antes de la pasada de aplicación.
- [ ] [enumerable] Después de la pasada de aplicación, ninguna referencia queda colgada, ningún identificador de destino colisiona y no hay residuos de la forma vieja fuera de `_legacy/`.
- [ ] [enumerable] Ningún archivo de `_legacy/` fue renombrado por la renumeración.

**Naturaleza de cada criterio.** Cada ítem lleva su marca: `[enumerable]` si se decide contando o
comparando —existencia, forma, recuento, resolución de un enlace— y `[interpretativo]` si solo se
decide leyendo los dos lados. Los enumerables son los que la compuerta mecánica de
`Master-Prompt.md` §10.0 tiene que cubrir; los interpretativos son para lo que el audit existe.

La clasificación es **conservadora por diseño**: ante la duda, un criterio se marca interpretativo.
El error no es simétrico —declarar mecanizable algo que no lo es produce falsa confianza, que es peor
que la ausencia de verificación—, así que marcar de más un interpretativo solo cuesta atención del
auditor, y marcar de menos un enumerable dejaría un hueco que nadie mira.

Verificables por el auditor independiente sobre el resultado de la migración:

- [ ] [interpretativo] Todo documento migrado tiene su fuente de contenido declarada en el plan, con uno de los tres valores admitidos de §2.1.
- [ ] [interpretativo] Ninguna sección de ningún documento migrado contiene contenido que no provenga del documento de origen, de un documento hermano o de una respuesta del humano.
- [ ] [interpretativo] Ninguna sección exigida por la normativa vigente y sin fuente quedó rellenada: todas se emitieron como pendientes.
- [ ] [interpretativo] El estado previo de cada documento migrado quedó archivado en el `_legacy/` de su propia carpeta antes de sobrescribir.
- [ ] [interpretativo] Todo contenido del documento de origen que la normativa vigente no ubica quedó enumerado en el informe, con su texto localizable.
- [ ] [interpretativo] Ninguna corrección manual del usuario fue pisada sin declarar la interpretación y esperar confirmación.
- [ ] [interpretativo] Cada documento del plan lleva su clasificación de §4.3, incluidos los clasificados como «no tocar».
- [ ] [interpretativo] El intake migrado se verificó contra la plantilla vigente y no solo contra los campos bloqueantes de `Intake-Rules.md` §2.2, y su bump es major.
- [ ] [interpretativo] El intake se migró antes que el manifiesto, y el manifiesto antes que los documentos generados.
- [ ] [interpretativo] Si el destino no declaraba procedencia, la degradación de la clasificación está declarada y no se supuso ninguna versión de origen.
- [ ] [interpretativo] El bloque de procedencia se reescribió **solo** si toda la cadena quedó migrada. Si la migración fue parcial, la procedencia declara todavía el origen y el informe declara el estado parcial documento por documento.
- [ ] [interpretativo] Ninguna fila del plan quedó sin resolver y sin declararse como pendiente en el informe.
- [ ] [interpretativo] Ningún renombre de artefacto se resolvió por inferencia: se leyó del bloque de impacto sobre destinos existentes del `CHANGELOG.md` del framework.
- [ ] [interpretativo] Ninguna sustitución de un término dentro de un documento migrado se hizo por reemplazo global de cadena (`Vocabulario-Rules.md` §9.5).
- [ ] [interpretativo] **Ningún enlace se reconectó por sustitución de patrón**: la reconexión resolvió destinos, y sólo sobre enlaces que ya no resolvían.
- [ ] [interpretativo] **Ninguna cita se declaró ambigua sin agotar los resolutores disponibles**, y las que quedaron ambiguas están inventariadas una por una con su ubicación.
- [ ] [interpretativo] **Cada marca del verificador de preservación se comprobó contra el texto.** Un verificador que sobre-reporta entrena a ignorarlo; un recuento de pérdidas que nadie abrió no es evidencia de nada.

**Hallazgos P0**, que detienen la cadena: contenido inventado; sección exigida rellenada con contenido inferido; procedencia reescrita con migración parcial; corrección manual pisada sin declarar la interpretación; estado previo no archivado; fila del plan sin resolver y sin declarar.

---

## 7. Anti-patrones a evitar

| Anti-patrón | Síntoma | Consecuencia | Corrección |
| --- | --- | --- | --- |
| **Migrar por sustitución de cadena** | El renombre de un término se aplica con un reemplazo global sobre el árbol del destino | Las cuatro clases de daño que `Vocabulario-Rules.md` §9.5 documenta sobre el propio framework: palabras inexistentes, cabeceras de tabla pisadas, etiquetas convertidas sobre valores que no correspondían y filas históricas reescritas | El procedimiento por ocurrencia de §9.5: enumerar, clasificar por sentido, sustituir solo lo que cambia de referente, verificar con barrido negativo |
| **Rellenar para que el documento cumpla** | Una sección nueva de la normativa vigente aparece completa en el documento migrado | El documento afirma cosas que nadie decidió y se ve al día. Es el defecto más caro de la migración | Emitir la sección como pendiente. Un documento con pendientes declarados es más útil que uno completo y falso |
| **Escribir un playbook por salto de versión** | Aparece un documento «cómo migrar de X a Y» | Duplica el estado objetivo que las reglas ya declaran, hay que mantener las dos declaraciones sincronizadas, y no sirve cuando el conjunto de origen no es reconstruible | El principio de §3. El salto de versión prioriza; no transforma |
| **Cerrar la procedencia con la cadena incompleta** | El manifiesto declara la versión vigente y hay documentos sin migrar | El destino miente sobre su propio estado, y la migración siguiente parte de una premisa falsa | §4.6: la procedencia se toca solo con la cadena completa |
| **Migrar `SDD/Docs/` antes que el intake** | Los documentos generados quedan al día y el intake conserva su estructura vieja | La documentación queda derivada de un upstream superado, y la corrida siguiente del orquestador de generación vuelve a detenerse por el intake | El orden de la cadena D6 de §4.4 |
| **Descartar el contenido que no encuentra sección** | El documento migrado es más corto y nadie sabe qué se fue | Pérdida silenciosa de información, que es lo que el archivado previo existe para hacer detectable y no para hacer aceptable | §4.2 regla 2: enumerarlo en el informe y que el humano decida |
| **Usar un subagente genérico de migración** | Un mismo perfil re-expresa documentos de doce categorías | Sin la especialidad de la categoría, el criterio de qué contenido va en qué sección lo pone el agente y no la regla | §1.1: el subagente titular de la categoría del documento |
| **Suponer la versión de origen** | El plan declara un origen que el destino no declaraba | Afirmación sobre el estado del sistema sin evidencia, prohibida por D9. Además clasifica saltos que quizá no existieron | §4.5: `sin-procedencia`, con la degradación declarada |

---

## 8. Prompt-snippet sugerido

Para el despacho del subagente que re-expresa un documento, a agregar sobre el snippet de la categoría correspondiente:

```text
Estás migrando un documento existente, no generándolo desde cero.

Documento de origen: {{PATH_ORIGEN}} (ya archivado en {{PATH_LEGACY}})
Normativa vigente que lo gobierna: {{ARCHIVO_DE_REGLAS}} versión {{VERSION_VIGENTE}}
Salto de esa regla: {{major|minor|sin cambio}} → clasificación {{regenerar|revisar|no tocar}}
Fuente de contenido declarada en el plan: {{origen|documento hermano|pendiente humano}}

Reglas que no podés romper:

1. Todo contenido del documento que produzcas proviene del documento de origen, de
   un documento hermano de este destino, o de una respuesta del humano que te fue
   entregada. No hay cuarta fuente. Si una sección que la normativa vigente exige
   no tiene fuente, NO la completes: devolvela como pendiente, con el nombre de la
   sección y qué haría falta para llenarla.
2. Si el documento de origen dice algo que la normativa vigente no ubica en ninguna
   sección, no lo descartes: devolvelo en una lista de contenido sin destino, con su
   texto, para que el humano decida.
3. Si detectás que el documento de origen fue editado a mano después de generarse,
   no resuelvas por tu cuenta qué corrección era intencional: enumerá las
   diferencias, declará cómo las interpretás y detenete a esperar confirmación.
4. No apliques ningún renombre de término por sustitución global de cadena.

Devolvé, además del documento: la lista de secciones pendientes, la lista de
contenido sin destino, y la declaración de qué sección salió de dónde.
```

Para el despacho del auditor, los criterios de §6 de este archivo se suman a los criterios de audit del master-prompt de generación, con sus seis hallazgos P0.

---

## 9. Control de cambios

| Versión | Fecha | Cambios | Autor |
| --- | --- | --- | --- |
| 1.0 | 2026-07-29 | Regla inicial de migración normativa, decimoctava regla del framework y sexta transversal. Fija el **principio de estado objetivo** de §3, con sus cinco fundamentos y su única concesión, en lugar de playbooks por salto de versión: la normativa vigente es la especificación del destino y el documento existente es la fuente del contenido. §1 declara que la migración no crea especialidades y delega el perfil a §1.2 de la regla de cada categoría, con la omisión de la tabla por D8 declarada y fundamentada. §2 declara los dos artefactos propios, el plan como contrato entre los dos orquestadores con su columna nueva de fuente de contenido, el alcance sobre `SDD/Intake/` y `SDD/Docs/` y los cuatro artefactos fuera de alcance con su razón. §4 reúne la mecánica: **regla de no invención** (§4.1), preservación de contenido y de correcciones manuales con archivado previo (§4.2), clasificación por severidad del salto (§4.3), el intake como documento humano con el agente proponiendo y el orden de la cadena D6 (§4.4), **destinos sin procedencia** admitidos con clasificación degradada a revisar todo (§4.5) y **migración parcial** admitida con la procedencia intacta y el estado parcial declarado (§4.6). §6 declara catorce criterios de aceptación y seis hallazgos P0; §7, ocho anti-patrones. La regla no declara fases ni orden de ejecución de la corrida: eso vive en el master-prompt de migración. | Framework SDD (migración normativa) |
| 2.0 | 2026-08-15 | Renumeración de identificadores y renombre de archivos (intervención reportes 00 a 11). **§4.3.1 es nueva**: cuando un salto normativo cambia la forma de los identificadores —como el de la 7.0, que fija cinco dígitos y ámbito producto—, la migración se hace en dos pasadas. La primera construye el **árbol de migración** completo, con identificador de origen y de destino, archivos a renombrar y **todas** las referencias que los apuntan, y se confirma con el humano antes de tocar nada. La segunda aplica el árbol confirmado y cierra con tres comprobaciones bloqueantes: ninguna referencia colgada, ninguna colisión de destino —el riesgo real cuando el ámbito pasa de proyecto de código a producto— y ningún residuo de la forma vieja fuera de `_legacy/`, que no se renombra. La evidencia de por qué no alcanza una sola pasada es de una corrida real: renumerar treinta y nueve archivos produjo por sí solo dos hallazgos bloqueantes. §6 suma sus tres criterios. Además, §6 clasifica cada criterio de aceptación como `[enumerable]` o `[interpretativo]`. Sube **major**: incorpora una capacidad que la migración no tenía y sin la cual el salto a la 7.0 no se puede ejecutar. Origen: reportes `01` y `05`, y la decisión del responsable del 2026-08-15. | Framework SDD |
| 3.0 | 2026-08-15 | **Migración estructural del proyecto de código a la unidad de entrega** (framework 8.0). §4.3.2 es nueva y declara los cuatro pasos del salto: propuesta de clasificación con sus cuatro señales y **detención obligatoria** para que el humano la confirme, porque el manifiesto de un destino 7.0 no declara cuál de sus proyectos de código se despliega; mapa de fusión de árboles, con la regla de que el árbol de un proyecto **compartido** no se funde en ninguna unidad, ya que adivinarle una dueña es el defecto que la 8.0 corrige; qué se conserva y qué se declara, con la prohibición de fusionar casos de uso por coincidencia de título y la obligación de declarar el contenido sin destino en lugar de borrarlo; y la renumeración por el árbol de §4.3.1, que acá importa más que en otros saltos porque fundir dos árboles puede producir colisiones que antes no existían. §6 suma cuatro criterios. Sube **major**: incorpora una capacidad sin la cual el salto a la 8.0 no se puede ejecutar. | Framework SDD |
| 3.1 | 2026-08-15 | **Familias de identificador acuñadas por el destino** (framework 8.2). §4.3.1 suma la pasada 1.b: antes de cerrar el árbol de migración hay que buscar los prefijos con forma de identificador que ninguna regla del framework declara, y las formas calificadas que el destino inventó para desambiguar. Aparecen con certeza y no por azar —un destino que se choca con un hueco normativo inventa un identificador para seguir trabajando— y su invención es la evidencia de qué le faltaba al método. Se declaran con su forma, sus ocurrencias, el hueco que vinieron a llenar y su resolución, que es una de tres y se evalúa en orden: retirarla porque la versión vigente ya cubrió el hueco, adoptarla como familia del destino con prefijo y ámbito declarados, o escalarla como hueco del framework sin resolverla. Sube **minor**: agrega una pasada al árbol sin cambiar la mecánica de las dos existentes. **Origen**: la migración de un destino real que había acuñado `P·CU-XX`, con 166 ocurrencias, para nombrar una numeración de casos de uso de nivel producto que el ámbito de unicidad de la 7.0 volvió innecesaria. | Framework SDD (validación por migración) |
| 3.2 | 2026-08-15 | **Lo que una migración real necesitó y la regla no decía** (framework 8.3). §4.3.1 declara que los punteros de un snapshot **sí se reconectan** cuando el documento vivo se renombra —no es modificar su cuerpo: un puntero que sigue a su objeto no falsea el registro, y uno colgado no preserva nada— y suma los **tres errores de la pasada de aplicación** con su regla: la etiqueta y el destino de un enlace son el mismo identificador y se mapean juntos, porque tratarlos por separado deja la etiqueta rota sin que la comprobación lo vea; un documento que cambia de profundidad recalcula **todos** sus enlaces y no solo los que apuntan a algo movido; y los enlaces se reconectan desde un registro confirmado, con la columna que distingue lo que la migración rompió de lo que reparó. §4.3.2 declara la convención **`<categoria>/_fusion/<Proyecto-De-Origen>/`** para los documentos que chocan al fundir, y exige la **propuesta de consolidación de casos de uso** como artefacto, sin aplicarla. Suma además las **citas desnudas ambiguas** al árbol: identificadores citados en prosa cuyo número no existe en el proyecto que los escribe, que se resuelven leyendo y no contando. §6 suma cuatro criterios. Sube **minor**. **Origen**: la migración de un destino de siete proyectos de código, donde los seis huecos aparecieron uno tras otro y ninguno era detectable leyendo el framework. | Framework SDD (validación por migración) |
| 3.3 | 2026-08-16 | **Lecciones de la primera migración real completa**, de 6.0 a 8.6 sobre un destino de siete proyectos de código. **§4.3.1** suma dos errores de la pasada de aplicación a los tres que ya tenía —la reconexión **por resolución de destino y no por sustitución de patrón**, después de que un patrón rompiera 181 enlaces donde había 96; y **agotar los resolutores antes de declarar una cita ambigua**, después de que cuatro resolutores en cascada llevaran 305 citas «ambiguas» a 16—; y declara **qué alcanza el árbol de renumeración**, que en esa corrida dejó afuera las familias que el propio intake acuña y los documentos de referencia cruzada de nivel producto, los dos vueltos como hallazgos. **§4.3.2** suma cinco reglas de consolidación: la **categoría** como unidad de trabajo en lugar del documento, **medir el solapamiento antes de elegir la salida** —fue del 5,9 %, de modo que consolidar era unir y no deduplicar—, **las cuatro salidas** con la advertencia sobre la que no reduce documentos, **ninguna cifra se promedia**, y **la transposición lee el documento entero** y no sólo sus secciones numeradas. **§6** suma cuatro criterios de aceptación, incluida la distinción entre «ninguno se sobrescribió» y «la fusión terminó», que una auditoría real confundió. Sube minor. |
| 3.4 | 2026-08-16 | Desambiguación por el barrido de la 8.10: «el contrato entre los dos orquestadores» pasa a nombrarlos —**generación y migración**— porque con el de reanudación los orquestadores son tres y el plan sigue siendo contrato de dos. Ninguna regla cambia. |
| 3.5 | 2026-08-16 | La señal de clasificación de §4.3.1 se llamaba «es el proyecto de código principal», que con el renombre del campo sería circular —la señal serviría para decidir si algo es una unidad de entrega nombrándolo unidad de entrega—. Pasa a **«el intake lo señalaba como principal»**, que es lo que el agente efectivamente lee del origen. Sube **patch**. |
| 3.6 | 2026-08-17 | **§4.3.1 suma el procedimiento de mover un documento.** Todo lo que la subsección decía sobre enlaces estaba escrito como **lección y no como paso**, y por eso se redescubría en cada corrida: mover produce una consecuencia mecánica sobre los enlaces salientes y entrantes, que **no es criterio sino aritmética** y por lo tanto se ejecuta y se verifica. Cinco pasos: **resolver y registrar antes de mover** —con los **rotos previos** declarados aparte y **no arreglados de paso**—, mover, **re-derivar** hacia el mismo destino absoluto, **reconectar los entrantes por resolución de destino** y sólo los que dejaron de resolver, y **verificar comparando conjuntos y no cantidades**, porque un recuento igual puede esconder que se rompió uno y se arregló otro. §6 suma su criterio de aceptación enumerable. Sube **minor**: agrega un procedimiento y un criterio sin cambiar ninguna fase. | Framework SDD (procedimiento de mover) |
| 3.7 | 2026-08-17 | **§4.7 es nueva: la revisión de apartamientos.** Un destino acumula reglas locales que el método no contempla, y la migración **no las miraba**: un apartamiento absorbido, uno contradicho y uno todavía vigente se veían iguales. Se revisa cada uno contra la vigente con **tres resultados** —absorbido, contradicho, no contemplado—, y el insumo **no es una interpretación**: es el campo 4 del propio ADR, los disparadores que superarían la decisión. El caso **contradicho reusa la detención por arbitraje** de `Master-Prompt.md` §7.0 en lugar de estrenar una: es la misma forma —dos cosas aprobadas que se contradicen— entre el destino y el método. Los que sobreviven **dos o más saltos** se declaran **candidatos a regla del framework**, con lo cual el reporte aguas arriba deja de depender de que alguien se acuerde. Y **no se re-fundamentan al preservarse**: reescribir su fundamento contra la normativa nueva produciría un ADR que dice haber decidido algo que en su fecha nadie decidió. §6 suma dos criterios enumerables. Sube **minor**. | Framework SDD (ciclo de apartamientos) |
| 3.8 | 2026-08-17 | **§4.3.2 declara cómo se comparan las versiones y cómo se verifica la preservación**, que era la mecánica que sostenía la consolidación **sin estar escrita**. **C1: la comparación no normaliza el nombre del proyecto de código** —en la cabecera es ruido, **en el cuerpo es contenido**—; medido sobre cinco documentos que parecían idénticos y cada uno medía la porción de velocidad de **su** proyecto, con el propio texto advirtiendo que **sumar las cinco da la del equipo**. **C2** la verificación es literal y línea por línea. **C3 se corre antes de re-derivar enlaces**, o colapsando las rutas: si no, toda línea con enlace aparece como perdida —medido: **48 marcas, 0 pérdidas reales**—. **C4** cada marca se verifica contra el texto. **C5** declara las **cuatro clases que no transponen**, incluida la **fila de control de cambios del absorbido**, que es historia suya y vive en `_legacy/`. §6 suma su criterio enumerable. Sube **minor**. | Framework SDD (cómo se compara y se verifica) |
