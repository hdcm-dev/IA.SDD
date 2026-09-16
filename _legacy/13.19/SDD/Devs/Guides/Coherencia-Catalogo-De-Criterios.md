# Nota de coherencia — El catálogo de criterios

**Framework:** SDD
**Documento:** Coherencia-Catalogo-De-Criterios.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-17
**Versión del conjunto resultante:** SDD 9.11
**Origen:** el Product Owner — «¿el framework te permite capturar criterios de decisión ante situaciones, identificar situaciones y buscar criterios para aplicar? No inventes, buscá evidencias»

---

## 1. Alcance

Índice de los criterios de decisión del método, y marca de detección en las tablas de anti-patrones de
las dieciséis reglas que las tienen.

## 2. El diagnóstico, medido antes de intervenir

| Forma en que el método escribe un criterio | Cantidad |
| --- | --- |
| Tablas de anti-patrones (*situación → problema → solución*) | **18 archivos** |
| Umbrales numéricos declarados | **71** |
| Secciones «cuándo corresponde y cuándo no» | **1** |
| «Regla de decisión» explícita | **3** |

**Cuatro formas distintas de escribir lo mismo, en dieciocho archivos, y ningún punto de entrada.**
Ninguno de los archivos de reglas se llama Criterios, Decisiones ni Situaciones.

**La evidencia de que el problema es real, y es de esta misma corrida:** al decidir la salida de
consolidación de una categoría se aplicó **S4** —coexistencia con identidad propia— **por recuerdo de
otra migración, no por búsqueda**. El criterio estaba escrito en `Migracion-Rules.md` §4.3.2 con su
fundamento medido. Nadie lo habría encontrado sin haber leído esa sección antes.

## 3. Qué se hace en la industria, y qué se adoptó

**Existe un estándar para esta mecánica exacta: DMN**, publicado por la OMG en 2015, que modela
decisiones operativas repetibles como tablas con **columnas de entrada** —las condiciones de la
situación— y al menos una **columna de salida**, con un diagrama de requisitos que muestra las
dependencias entre decisiones. Está diseñado para ser intercambiable entre organizaciones y ejecutable.

**Se adoptó su forma y no el estándar.** Las tablas de anti-patrones del método ya eran *situación →
solución*; lo que les faltaba era **con qué se evalúa la entrada**. Adoptar DMN completo exigiría un
motor de decisión y un formato de intercambio XML que un framework de documentación en Markdown no
tiene y no necesita. **La decisión queda declarada en §5 del catálogo** para que sea revisable.

**Y hay dos convergencias que conviene registrar, porque son evidencia de que el razonamiento del
método iba bien y de que no se consultó el estándar a tiempo:**

- La práctica de **ADR** exige documentar *«sólo las decisiones que afectan la estructura, los
  atributos de calidad clave, o que son difíciles de revertir»*, y advierte que **un registro sin
  justificación pierde valor porque nadie puede evaluar si sigue aplicando cuando las circunstancias
  cambian**. Es exactamente el fundamento del apartamiento con disparadores y contador de la 9.7,
  al que se llegó por cuenta propia.
- La gobernanza de agentes de 2026 pide **registrar la decisión de política y el paso de razonamiento
  previo a la acción**, con la auditabilidad como requisito crítico. Es lo que la 9.8 escribió como
  «la propuesta es auditable y la pregunta no».

## 4. La marca de detección

Las tablas suman la columna **Detección**, con `[enumerable]` o `[interpretativo]` — **vocabulario que
el método ya tenía**, usado 421 veces en criterios de aceptación desde la intervención de los reportes
`00` a `11`, más la «marca de detectabilidad» del audit. **No se inventó una clasificación nueva.**

**Reparto: 202 situaciones · 97 `[enumerable]` · 105 `[interpretativo]`.**

**La marca dice quién puede aplicar el criterio**, que es su utilidad: los enumerables los verifica la
compuerta mecánica de `Master-Prompt.md` §10.0 **antes** de que nadie interprete.

**Cómo se clasificó, con su límite declarado.** Criterio conservador y escrito en el catálogo:
`[enumerable]` cuando el anti-patrón nombra una **ausencia, presencia, recuento, umbral numérico o
forma literal** buscable; `[interpretativo]` en todo otro caso, **incluida la duda**. Es una primera
pasada revisable, y se declara como tal: **no está verificada fila por fila**, y una marca mal puesta
se corrige en la regla que la contiene.

## 5. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | **1.0** | Nuevo. 22 criterios por situación, catálogo de anti-patrones por regla, y lo que no resuelve |
| Las **16 reglas** con tabla de anti-patrones | minor cada una | La columna **Detección** |
| `README.md` | — | Suma la fila del catálogo a su tabla de artefactos |
| `CHANGELOG.md` | — | Entrada `[9.11]` |

## 6. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Sin cambios de idioma ni de nombres |
| **D4**, **D5** | Conforme | Las 16 reglas subieron versión y registraron su fila; comprobación 10 en cero sobre 61 archivos |
| **D6** Trazabilidad | **Conforme, y es el punto** | El catálogo **no copia** ningún criterio: enlaza a la sección que lo define. Cero enlaces rotos |
| **D7** Neutralidad | Conforme | No se nombra ningún destino |
| **D8** Conjunto cerrado | Conforme | No se toca |
| **D9** Evidencia | Conforme | Las cuatro formas y sus cantidades se midieron sobre el árbol antes de intervenir; las referencias externas se citan con su URL |

## 7. Lo que esta nota deja anotado

**La clasificación de 202 filas es una primera pasada y no está verificada una por una.** Se declara en
el catálogo y acá. Revisarla exige abrir cada anti-patrón y preguntarse si un guion puede encontrarlo:
es trabajo de una intervención propia, y el criterio conservador —ante la duda, `[interpretativo]`—
hace que el error probable sea **subestimar** lo automatizable, que es el lado seguro.

**Y el catálogo tiene el problema de todo índice: se desactualiza.** Un criterio nuevo que no se
agregue queda invisible otra vez. La comprobación que faltaría es enumerable —contrastar las secciones
de criterio de las reglas contra las entradas del catálogo— y no se agrega acá para no cerrar en falso
una intervención que ya toca dieciocho archivos.

## 8. Veredicto

**APROBADO.** El método tiene un punto de entrada para sus criterios, las situaciones catalogadas
declaran cómo se detectan, y las dos decisiones discutibles —no adoptar DMN completo, y clasificar en
una primera pasada conservadora— quedan escritas donde se pueden revisar.

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-17 | Emisión inicial. Registra el diagnóstico medido —cuatro formas, dieciocho archivos, ningún índice—, la evidencia de que el problema es real en esta misma corrida, la comparación con **DMN** y **ADR** con lo que se adoptó y lo que no, y los dos límites declarados: la clasificación es una primera pasada y el índice puede desactualizarse. |
