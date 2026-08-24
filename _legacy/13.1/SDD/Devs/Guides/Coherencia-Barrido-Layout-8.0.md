# Nota de coherencia — El layout de la 8.0 nunca llegó a la tabla que se ejecuta

**Framework:** SDD
**Documento:** Coherencia-Barrido-Layout-8.0.md
**Versión:** 1.1
**Estado:** Vigente
**Fecha:** 2026-08-16
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 8.13
**Origen:** el plan de trabajo pedido por el Product Owner al cerrar la 8.12, que arrancó por evaluar qué quedaba pendiente en el framework

---

## 1. Alcance

Barrido por concepto del cambio de layout de la **7.0/8.0**: el nivel intermedio de `SDD/Docs/` pasó de
`Proyectos/<Nombre-Proyecto-Codigo>/` a `Unidades-Entrega/<Nombre-Unidad-Entrega>/`, y once categorías
pasaron a generarse por unidad de entrega.

**Es el segundo barrido retroactivo**, después del de la 8.7, y confirma lo que aquella nota dejó
anotado: las intervenciones anteriores a la 8.9 no lo corrieron, y el concepto sobrevive donde nadie
lo buscó.

## 2. El hallazgo, y por qué es P0

**`Master-Prompt.md` §3.5 declara el layout nuevo desde la 7.0. La tabla del plan maestro de §7 —la
que el orquestador ejecuta— seguía emitiendo al viejo, en sus quince filas.**

| | Lo que declaraba §3.5 y el intro de §7 | Lo que declaraba la tabla de §7 |
| --- | --- | --- |
| Ámbito de 02 a 11 | unidad de entrega | **proyecto de código** |
| Path de salida | `SDD/Docs/Unidades-Entrega/<Nombre-Unidad-Entrega>/` | **`SDD/Docs/Proyectos/<Nombre>/`** |

**El intro de esa misma §7 está treinta líneas más arriba de la tabla que lo contradice.** Es la forma
de defecto que la 8.12 encontró en `Intake-Rules.md` §4 —prosa y tabla operativa en desacuerdo dentro
del mismo archivo— pero acá la tabla es la que gobierna **toda la generación**: una corrida nueva
producía el layout anterior a la 8.0, con la prosa del archivo diciendo lo contrario.

**Qué acota el daño.** La migración no lee esta tabla, y por eso un destino real migrado a la 8.6
quedó correctamente bajo `Unidades-Entrega/`. Lo que rompía era **generar un producto nuevo**.

Se suman, del mismo concepto: el `path-docs` del bloque de manifiesto de §3.4, el criterio de ubicación
del audit de §10 —que verificaba contra la ruta vieja, de modo que **habría aprobado el layout
equivocado**—, la ruta de salida del prompt de despacho de referencia de **once reglas de categoría**,
el Ejemplo A de `Root-Rules.md` §7.1, el árbol del caso multi-unidad de la guía de usuario y su
resumen ejecutivo.

## 3. Lo que apareció de paso: 39 concordancias y seis registros inconsistentes

**La sustitución léxica de la 8.0 dejó 39 concordancias de género.** «Proyecto» es masculino y «unidad
de entrega» es femenina: quedaron «algún unidad de entrega», «ese unidad de entrega», «unidades de
entrega tipados». Es exactamente la clase de defecto que `Vocabulario-Rules.md` §9.5 documenta desde la
5.1, producida por la misma operación que esa sección regula. Se corrigieron las 39, en 13 archivos.

**Y una comprobación nueva salió de un defecto propio.** Al verificar los registros de control de
cambios aparecieron **seis archivos inconsistentes**, repartidos entre cuatro intervenciones:

| Archivo | Qué tenía |
| --- | --- |
| `Intake-Rules.md`, `PRODUCT-INTAKE-template.md`, `Migracion-Rules.md` | La fila nueva insertada **antes** de la última en lugar de después |
| `Vocabulario-Rules.md`, `Master-Prompt-Reanudacion.md` | La cabecera subida **sin agregar la fila** |
| `SDD-Development-Guide.md` | Las dos cosas: cabecera en **1.7** con la tabla llegando a **1.10**, y filas desordenadas |

**Cuatro de los seis son míos, de las tres intervenciones anteriores.** La comprobación 5 de §VI.3
pide «una fila por archivo» y se cumple escribiendo la fila **en cualquier lado**; nada verificaba que
la cabecera coincidiera con la última fila. Entra la **comprobación 10**, que es enumerable y mecánica.

## 4. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 7.8 → **7.9** | Las **quince filas** de la tabla de §7 en sus columnas de ámbito y de path; el gating por flag y la variante D8; el `path-docs` de §3.4; el criterio de ubicación del audit de §10 |
| Once reglas de categoría y `Deriva-Rules.md` | patch cada una | La ruta de salida de su prompt de despacho de referencia, y su marcador `{{NOMBRE_PROYECTO_CODIGO}}` |
| `SDD/Devs/Rules/Root-Rules.md` | 5.2 → **5.3** | El Ejemplo A de §7.1 y el bloque de insumos de §8 |
| `SDD/Guides/SDD-User-Guide.md` | 1.11 → **1.12** | El árbol del caso multi-unidad y el mapa del resumen ejecutivo |
| `SDD/Guides/SDD-Development-Guide.md` | 1.10 → **1.12** | **§VI.3 comprobación 10.** Absorbe además la 1.11, que la 8.12 había escrito sobre una cabecera desactualizada |
| `SDD/Devs/Rules/Rules-Contexto.md`, `Rules-Necesidades-Negocio.md`, `Marco-Teorico-SDD.md` | patch cada una | Sólo concordancias |
| `SDD/Devs/Rules/Vocabulario-Rules.md`, `Master-Prompt-Reanudacion.md` | — | La fila de control de cambios que faltaba |
| `CHANGELOG.md` | — | Entrada `[8.13]` |

## 5. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** Idioma | **Conforme, y es parte del alcance** | Las 39 concordancias que la sustitución de la 8.0 dejó |
| **D2** | Conforme | Encoding y fechas sin cambios |
| **D3** Nombres | Conforme | No se toca ningún nombre de artefacto |
| **D4**, **D5** | **Conforme, y verificado con la comprobación 10** | Cabecera igual a la última fila y tabla ordenada en los 21 archivos |
| **D6** Trazabilidad | Conforme | Ninguna referencia cambia de destino: la ruta corregida es la que §3.5 ya declaraba |
| **D7** Neutralidad | Conforme | El destino que sirvió para acotar el daño se cita sin nombrarlo |
| **D8** Conjunto cerrado | Conforme | No se toca |
| **D9** Evidencia | Conforme | Las 15 filas, las 39 concordancias y los 6 registros se enumeraron sobre el árbol |

## 6. Lo que esta nota dejaba anotado, y cómo se cerró

**Quedaban dos conceptos grandes sin barrer**: el vocabulario de la 6.0 —«solución» a «producto»,
«proyecto» a «proyecto de código»— y el de los dos ejes de la 8.0 más allá de lo que la 8.12 cubrió.
**Los dos se barrieron en la 8.15**: el vocabulario estaba limpio, y los dos ejes dejaron ocho citas a
una sección de un documento que la 6.0 había eliminado, cinco de ellas origen de flags de gating.
El criterio que la nota anterior fijó sigue en pie, y esta intervención lo confirma por segunda vez:
**el concepto sobrevive en la tabla que se ejecuta, no en la prosa que se lee**.

**Y una observación sobre dónde estaba el defecto.** No estaba escondido: estaba en la tabla más
grande del archivo más leído del framework. Sobrevivió tres versiones del conjunto porque **la prosa
que la precede dice lo correcto**, y quien lee de arriba hacia abajo llega a la tabla ya convencido.

## 7. Veredicto

**APROBADO.** El conjunto 8.13 es coherente en el concepto barrido: en todo lugar vivo, la
documentación de las categorías 02 a 11 se genera **por unidad de entrega** y se emite bajo
`SDD/Docs/Unidades-Entrega/<Nombre-Unidad-Entrega>/`. Las únicas dos apariciones que conservan la ruta
vieja son **históricas y se declaran**: `Vocabulario-Rules.md` §8, que describe el estado anterior a la
8.0 para registrar su cierre, y `Coherencia-Orquestador-Migracion-8.x.md`, que relata un hallazgo de su
fecha.

## 8. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-16 | Emisión inicial. Segundo barrido retroactivo. Registra el hallazgo P0 —las quince filas de la tabla del plan maestro emitiendo al layout anterior a la 8.0, con el audit verificando contra la misma ruta vieja—, las **39 concordancias** que la sustitución léxica de la 8.0 dejó, y los **seis registros de control de cambios inconsistentes** que originan la comprobación 10 de §VI.3. |
| 1.1 | 2026-08-16 | §6 pasa de «lo que deja anotado» a **cómo se cerró**: los dos conceptos que declaraba pendientes se barrieron en la 8.15. La nota había quedado **afirmando lo último que alguien escribió**, que es el defecto que ella misma describe. |
