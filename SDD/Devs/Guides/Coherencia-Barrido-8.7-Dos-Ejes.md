# Nota de coherencia — El barrido por concepto de la 8.7, corrido tarde

**Framework:** SDD
**Documento:** Coherencia-Barrido-8.7-Dos-Ejes.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-16
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 8.12
**Origen:** una pregunta del Product Owner —«el barrido por concepto corrió una sola vez; ¿vale la pena pasarlo por lo que tocó la 8.7?»— sobre un tema que yo había anotado como menor

---

## 1. Alcance

Aplicación retroactiva del **barrido por concepto** (`SDD-Development-Guide.md` §VI.3.1) al concepto
que la **8.7** corrigió: **qué eje declara D8 y `redistribuible`, y a qué nivel se pide el bloque
técnico §17**.

**La 8.7 es anterior al barrido**, que entró en la 8.9. Corrigió el lugar donde el defecto se había
manifestado —§17 de la plantilla de intake— y **declaró ese archivo como su alcance**.

## 2. Lo que el barrido encontró

**Cinco archivos, y el concepto estaba vivo en los cinco.** Ninguno estaba en el alcance que la 8.7
declaró.

| # | Dónde | Qué decía | Gravedad |
| --- | --- | --- | --- |
| 1 | `Intake-Rules.md` §4, paso 2 y mapeo | Una **sola** tabla de mapeo que le pide a la misma fila el `Nombre-Proyecto-Codigo` y el `tipo_unidad_entrega`; el paso 2 lee `redistribuible` de la fila del proyecto | **La más grave** |
| 2 | `Master-Prompt.md` §8, §9 y §10 | Tres plantillas citan **`{{NOMBRE_PROYECTO_CODIGO}}`**, que **el contexto de despacho ya no define** desde la 7.0 | **Marcador roto** |
| 3 | `PRODUCT-INTAKE-template.md` §19 | El checklist pide «§17 completo para cada **proyecto de código**» | Dentro del archivo que la 8.7 tocó |
| 4 | `Intake-Rules.md` §5 | «Parte C: §17 completo por cada proyecto de código» | Contradice §2.2 del mismo archivo |
| 5 | `Marco-Teorico-SDD.md` §13 y glosario | El manifiesto «enumera sus unidades de entrega y, por cada uno, su tipo D8, rol, dependencias y **nombres de código**» | Doctrinal |

Más una derivada: `Vocabulario-Rules.md` §223 **cita literalmente** la línea de insumos del despacho,
y la corrección del hallazgo 2 la alcanza.

## 3. Los dos hallazgos que valen por sí solos

**El hallazgo 1 es una regla que se contradice consigo misma a treinta líneas de distancia.** El
mismo §4 de `Intake-Rules.md` que mapea D8 desde la fila del proyecto de código valida, más abajo:

> **Ningún proyecto de código declara un valor D8.** Si lo declara, el intake está confundiendo los
> dos ejes: el tipo es atributo de la entrega.

La validación se escribió en la 8.0 y **el mapeo de arriba nunca se revisó**. Una regla que valida
contra una confusión y la comete en su propio procedimiento **no la detecta ninguna verificación de
coherencia entre artefactos**, porque el defecto no cruza ningún borde: entra y sale del mismo
archivo. Es lo que la 8.9 llamó **coherencia interna del artefacto**, y es su primer caso cobrado.

**El hallazgo 3 es el que la regla del barrido nombró y todavía no había cobrado.** §VI.3.1 exige
barrer **el interior de lo ya tocado**. La 8.7 reescribió §17 de la plantilla y **no abrió el
checklist de §19 que verifica §17**, en el mismo archivo, a trescientas líneas. El checklist siguió
pidiendo el nivel que esa misma intervención acababa de sacar.

**El hallazgo 2 es el de consecuencia mecánica.** Desde la 7.0 el despacho se parametriza por unidad
de entrega y define `{{NOMBRE_UNIDAD_ENTREGA}}`. Tres plantillas quedaron citando
`{{NOMBRE_PROYECTO_CODIGO}}`: el insumo del intake, el bloque de ambigüedad y el despacho del
auditor. **Un marcador sin valor en el contexto no falla: se completa con lo que el agente suponga**,
que es la forma más silenciosa de este defecto.

## 4. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Rules/Intake-Rules.md` | 4.0 → **4.1** | §4: el mapeo pasa de **una** tabla a **tres** —entrega, construcción, producto— y el prefijo de organización se resuelve por el puente §13.3, no por la fila. §5 corrige la Parte C. §1 y §3 nombran la subsección |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 7.7 → **7.8** | §8, §9 y §10: `{{NOMBRE_PROYECTO_CODIGO}}` → `{{NOMBRE_UNIDAD_ENTREGA}}`. §2 paso 2 y §4 nombran el nivel correcto |
| `SDD/Devs/Intake/PRODUCT-INTAKE-template.md` | 3.1 → **3.2** | §19: el checklist de la Parte C pasa a la unidad de entrega y nombra las **dos** tablas de identidad. §16: la pregunta del prefijo deja de tratar `redistribuible` como atributo del proyecto |
| `SDD/Devs/Rules/Vocabulario-Rules.md` | 3.0 → **3.1** | La cita literal del despacho sigue al original |
| `SDD/Devs/Guides/Marco-Teorico-SDD.md` | 3.0 → **3.1** | §13 y el glosario del manifiesto declaran los dos ejes y la matriz |
| `SDD/Guides/SDD-Development-Guide.md` | 1.7 → **1.8** | §VI.5 declara **cuándo** se toma el snapshot de `_legacy/`, su verificación mecánica, y que la intocabilidad no cubre una carpeta que archivó el conjunto equivocado |
| `_legacy/8.6/`, `8.7/`, `8.9/`, `8.10/` | — | **Reconstruidos**: contenían el conjunto de la versión siguiente |
| `CHANGELOG.md` | — | Entrada `[8.12]` |

## 4.1 El hallazgo que apareció al archivar, y que no es del barrido

**Al tomar el snapshot de `_legacy/8.11/` se verificó el anterior, y estaba mal.** `_legacy/8.10/`
contenía `Master-Prompt-Reanudacion.md` **1.1** y `Master-Prompt.md` **7.7**, que son las versiones de
la 8.11. Al revisar los cinco más recientes, **cuatro estaban corridos un lugar**: todos se habían
copiado del árbol de trabajo **después** de aplicar la intervención.

**Es mío, y en cuatro intervenciones seguidas.** `_legacy/8.8/` es el único correcto, y por casualidad:
esa intervención no tocó ninguno de los archivos que verifiqué.

**Lo que rompe no es el archivo histórico.** `Master-Prompt-Migracion.md` lee `_legacy/` para construir
el diff normativo de un salto. Con `_legacy/<N>/` conteniendo el conjunto `N+1`, **el diff de ese salto
sale vacío**, y una migración sin nada que aplicar se declara completa sin haber hecho nada. Es la misma
forma de defecto que el resto de esta corrida: **una fuente que afirma algo falso sobre sí misma**, y
esta afirma ser una versión que no es.

**La causa está en la regla, no sólo en mí.** §VI.5 de `SDD-Development-Guide.md` declaraba **qué**
copiar —el conjunto entero, y por qué entero— y **qué queda afuera**, y no declaraba **cuándo**. Un
procedimiento que no dice cuándo se ejecuta se ejecuta cuando resulta cómodo, que acá era al final.

**Las cuatro carpetas se reconstruyeron** desde el estado que a cada una le corresponde, verificando
archivo por archivo la versión de cabecera. **La regla de intocabilidad no lo impide y la nueva
redacción lo dice**: una carpeta que archivó el conjunto equivocado no es un registro que se corrige,
es un registro que nunca se escribió.

## 5. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Registro, encoding, fechas y nombres sin cambios |
| **D4**, **D5** | Conforme | Los cinco archivos subieron versión y registraron su fila |
| **D6** Trazabilidad | Conforme | Cada tabla nueva del mapeo nombra la subsección de la que lee |
| **D7** Neutralidad | Conforme | No se nombra ningún destino |
| **D8** Conjunto cerrado | **Conforme, y es el punto** | Los ocho valores no cambian. Cambia **a qué eje se le piden**, que es lo que la 8.0 ya había decidido y estos cinco lugares no habían acatado |
| **D9** Evidencia | Conforme | Los cinco hallazgos se verificaron abriendo el archivo y contrastando con la sección que lo contradice |

## 6. Lo que esta nota deja anotado

**El barrido encuentra lo que se le pide barrer, y a nadie se le pide barrer los conceptos de las
intervenciones viejas.** La 8.7 es de ayer y ya había dejado cinco lugares; las intervenciones
anteriores a la 8.9 son todas anteriores al barrido, y **ninguna lo corrió**.

No se resuelve acá porque barrer retroactivamente todo el historial es una intervención de otra
escala. Lo que queda anotado es el criterio: **cuando una intervención vieja se toca por cualquier
motivo, su concepto se barre entonces**, que es lo que pasó acá.

**Y una constatación incómoda: el barrido lo pidió el Product Owner, no el método.** Yo había listado
este tema como el tercero de tres y con la formulación más blanda de las tres —«vale ver si aplica»—.
Aplicaba, y traía un marcador roto en el despacho.

## 7. Veredicto

**APROBADO.** El conjunto 8.12 es coherente en el concepto barrido: en todo lugar vivo del framework,
D8 y `redistribuible` son atributos de la **unidad de entrega**, `Identidad-Codigo` y las
dependencias de compilación lo son del **proyecto de código**, y el bloque §17 es **uno por unidad de
entrega vigente**.

## 8. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-16 | Emisión inicial. Suma §4.1 con un hallazgo ajeno al barrido, aparecido al archivar: **cuatro de los cinco `_legacy/` más recientes estaban corridos un lugar**, con lo que el diff normativo de esos saltos salía vacío. Barrido retroactivo del concepto de la 8.7, con **cinco archivos alcanzados**, ninguno en el alcance que la 8.7 declaró. Registra los tres hallazgos que valen por sí solos: una regla que se contradice consigo misma a treinta líneas, un marcador de despacho sin valor en el contexto, y el checklist que verifica la sección que la propia 8.7 reescribió. |
