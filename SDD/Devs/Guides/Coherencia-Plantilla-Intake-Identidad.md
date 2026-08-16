# Nota de coherencia — La tabla de identidad de §17 contradecía a §13

**Framework:** SDD
**Documento:** Coherencia-Plantilla-Intake-Identidad.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-16
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 8.7
**Origen del hallazgo:** la fase M2 de una migración real de un destino, de 6.0 a 8.6

---

## 1. Alcance

Corrección de una contradicción **interna** de `PRODUCT-INTAKE-template.md`, entre su §13 y su §17,
introducida por la intervención 8.0 y presente durante **tres versiones del conjunto**.

## 2. El defecto

La 8.0 hizo dos cosas: partió §13 en los dos ejes —unidades de entrega, proyectos de código y matriz
de composición— y movió el bloque técnico de §17 de «por proyecto de código» a «por unidad de
entrega».

**La tabla de identidad que encabeza §17 se conservó del bloque anterior.** Siguió pidiendo:

| Campo | Problema |
| --- | --- |
| `tipo_unidad_entrega` (D8) | §13.2 declara que **«los proyectos de código no llevan valor D8»** |
| `redistribuible` | §13.1 lo hace **columna de la unidad de entrega** |

Y ocho instrucciones de P.1 a P.12 seguían diciendo «del proyecto de código» bajo un encabezado que
dice «por unidad de entrega».

**La consecuencia es la que hace al defecto grave.** Quien completara §17 siguiendo la plantilla
**declaraba D8 tantas veces como proyectos de código tuviera el producto**, y tenía que elegir una
forma de entrega para algo que no se entrega. Es exactamente el error que el modelo de dos ejes
existe para hacer imposible, escrito **en el documento que lo enseña**.

## 3. Cómo apareció, y por qué importa cómo

**No lo encontró ninguna verificación del framework. Lo encontró un agente usando la plantilla.** En
la fase M2 de una migración real, al re-expresar el intake de un destino bajo la 3.0, el agente
tuvo que decidir qué hacer con esa tabla: la plantilla le pedía un dato que la misma plantilla
declaraba inexistente. Lo emitió como hallazgo aguas arriba en lugar de copiarlo.

**Estuvo tres versiones del conjunto sin detectarse —8.0 a 8.6— y no por descuido de las
verificaciones, sino porque ninguna mira eso.** Las notas de coherencia verifican los invariantes D1
a D9 y la coherencia entre artefactos; el audit de `Master-Prompt.md` §10 verifica los entregables de
un destino. **La coherencia interna de una plantilla entre dos de sus propias secciones no la mira
nadie**, y una plantilla es el artefacto del framework con más superficie de contacto: cada producto
nuevo la lee entera.

**El patrón es conocido y ya está registrado.** Es el mismo de la 8.5 —el orquestador de migración
que quedó dos versiones atrás y que también se descubrió al ir a usarlo— y el mismo que la nota de
la 8.0 declara sobre sí misma: **una intervención que corrige un patrón lo comete en su propio
alcance**. La 8.0 movió §17 de eje y no revisó lo que §17 traía adentro.

## 4. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Intake/PRODUCT-INTAKE-template.md` | 3.0 → **3.1** | §17: dos tablas de identidad en lugar de una; ocho instrucciones de P.1 a P.12 reexpresadas sobre la unidad de entrega |
| `CHANGELOG.md` | — | Entrada `[8.7]` |
| `SDD/Devs/Guides/Coherencia-Plantilla-Intake-Identidad.md` | — | Esta nota |

**Qué quedó en §17.** La identidad de la **unidad de entrega**, con su D8, su `redistribuible` y los
proyectos que la componen; y la identidad de **esos proyectos**, con nombre, identidad de código y
rol, **sin D8 y sin `redistribuible`**, con la constancia de por qué no los llevan. Se agrega la
regla de que **un proyecto compartido aparece en el bloque de cada entrega que compone**, que es lo
que la matriz de §13.3 hace visible y que un lector del bloque de una entrega necesita ver sin ir a
buscarlo a otro bloque.

**Las ocho instrucciones no se limitan a cambiar de sujeto.** Cada una suma la regla de **nombrar el
proyecto de código cuando el dato es de uno en particular**, que es lo que evita que la corrección
produzca el defecto inverso —perder el dato por capa al subirlo de nivel—:

- **P.1** enumera los stacks con su proyecto.
- **P.3** distingue el contrato de **integración** de §13.1 del de **compilación** de §13.2.
- **P.6** declara los umbrales de cobertura **por proyecto y sin promediar**.
- **P.10** admite los NFR de una capa interna nombrando su proyecto, para el caso —observado en el
  destino que levantó el hallazgo— de un producto que **mide** la latencia de un proyecto que no se
  despliega.

## 5. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D2** | Conforme | Registro, encoding y fechas sin cambios |
| **D3** Nombres | Conforme | No se toca |
| **D4**, **D5** | Conforme | El archivo tocado subió versión y registró su fila |
| **D6** Trazabilidad | Conforme | La segunda tabla declara su origen: los proyectos vienen de §13.2 |
| **D7** Neutralidad | Conforme | El destino que levantó el hallazgo se cita como «una migración real», sin nombrar su dominio |
| **D8** Conjunto cerrado | **Conforme, y es el punto** | Los ocho valores no cambian. Lo que cambia es **a qué se le pide el valor**: deja de pedírsele al proyecto de código, que es lo que §13.2 ya declaraba |
| **D9** Evidencia | Conforme | La contradicción se verificó abriendo las tres secciones del mismo archivo |

## 6. Lo que esta nota deja anotado y no resuelve

**No existe verificación de coherencia interna de las plantillas.** Esta corrección la hizo un agente
que las estaba usando, y eso es suerte, no método. Una plantilla que se contradice **no rompe nada
hasta que alguien la completa**, y para entonces el producto ya arrastra el dato mal declarado.

Lo que haría falta es una comprobación que, ante un cambio de nivel de una sección, recorra **las
demás secciones que nombran ese nivel**. No se incorpora acá porque merece su propia intervención y
porque hay al menos dos casos más del mismo patrón registrados —la 8.5 y la propia 8.0—, de modo que
lo que corresponde es tratarlos juntos y no agregar una comprobación por caso.

## 7. Veredicto

**APROBADO.** El conjunto 8.7 es internamente coherente en lo que esta intervención toca: §13 y §17
de la plantilla de intake declaran lo mismo sobre los dos ejes, y las doce subsecciones del bloque
técnico hablan del nivel que su encabezado declara.
