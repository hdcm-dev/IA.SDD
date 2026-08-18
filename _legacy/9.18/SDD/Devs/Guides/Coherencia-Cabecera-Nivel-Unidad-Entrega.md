# Nota de coherencia — La cabecera que todo documento generado copia

**Framework:** SDD
**Documento:** Coherencia-Cabecera-Nivel-Unidad-Entrega.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-16
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 8.17
**Origen:** una pregunta del Product Owner al cerrar el plan de trabajo — «¿acá quedó algo pendiente que seguir? ¿terminamos todos los issues?»

---

## 1. Alcance

Cuatro hallazgos que aparecieron al **verificar** que no quedaba nada pendiente, en lugar de
contestarlo de memoria. Tres son del mismo concepto de la 8.0 y uno es un renombre sin propagar.

## 2. El hallazgo principal: veintiséis cabeceras con el nivel anterior

**Las diez reglas de categoría definen, en su §4.1, la cabecera que lleva cada documento que el
framework genera.** Las veintiséis empezaban igual:

```markdown
# CU-XXXXX — <Nombre del caso de uso>

**Proyecto de código:** {{Nombre-Proyecto-Codigo}}
```

Desde la 8.0 esos documentos pertenecen a una **unidad de entrega** y viven bajo
`Unidades-Entrega/<Nombre-Unidad-Entrega>/`. **Ninguna de las diez reglas usaba `Unidad de entrega:`
en su cabecera: cero de veintiséis.**

**Es la tercera capa del mismo cambio, y explica por qué tres barridos la pasaron de largo.** La 8.12
buscó el concepto en reglas y plantillas, la 8.13 en rutas y tablas, la 8.15 en citas y flags.
**Ninguna abrió los bloques de ejemplo cercados**, y la cabecera vive ahí. `SDD-Development-Guide.md`
§VI.3.1 suma la quinta regla del barrido por eso: **un cerco de código no es un límite del barrido**.

**Y es el peor lugar donde dejarlo.** Un ejemplo no se lee: se copia. Cada documento generado desde la
8.0 arrastra un campo de cabecera que declara el nivel equivocado, y lo arrastra **literal**.

## 3. El segundo hallazgo: un renombre que no se propagó ni dentro de su propio archivo

**`Rules-Arquitectura-Tecnica.md` §2.1 renombró el artefacto a `Arquitectura-Unidad-Entrega.md`**, y
el mismo archivo seguía nombrando `Arquitectura-Proyecto-Codigo.md` en cuatro lugares: §4.2 —el
encabezado de sus secciones obligatorias—, el criterio de aceptación de §6, el ejemplo de §7 y los
insumos de §5. Fuera del archivo, en otros tres: la tabla del plan maestro, la plantilla de intake y
el árbol de la guía de usuario. **Siete en total.**

**El criterio de aceptación es lo grave.** El audit verificaba la existencia de `Arquitectura-Proyecto-Codigo.md`:
un documento generado con el nombre correcto **lo habría reprobado**, y uno generado con el nombre
viejo habría pasado. Las dos mitades corridas en la misma dirección, como en la 8.13.

**`Migracion-Rules.md` §111 ya dice por qué esto no se detecta solo:** un renombre de artefacto es el
único tipo de cambio que **ningún diff de versiones puede inferir**. Hay que propagarlo a mano, y acá
no se propagó ni dentro del archivo que lo decidió.

## 4. Los otros dos, y una falsa alarma verificada

**Dos notas de coherencia declaraban pendiente lo que la 8.15 cerró.** `Coherencia-Barrido-Layout-8.0.md`
§6 decía «quedan dos conceptos grandes sin barrer» y `Coherencia-Barrido-8.7-Dos-Ejes.md` §6 decía que
barrer retroactivamente era de otra escala. **Las dos habían quedado afirmando lo último que alguien
escribió**, que es literalmente el defecto que la 8.14 vino a regular. Las dos pasan a «y cómo se
cerró».

**`Root-Rules.md` §4.2** titulaba «Proyectos de código del producto» una sección cuyo contenido es la
tabla de unidades de entrega.

**Y una falsa alarma que se verificó y se declara.** Los catorce «enlaces rotos» del árbol son rutas
ilustrativas dentro de los ejemplos de las reglas —`[00-Contexto](00-Contexto/)`—, que describen el
árbol de un destino y **no tienen por qué resolver desde la ubicación de la regla**. La comprobación 3
de §VI.3 las excluye: sin la exclusión son catorce avisos permanentes, y **una comprobación que avisa
siempre es una comprobación apagada**. Es el mismo argumento con el que la 8.3 excluyó `_legacy/`.

*(Del mismo chequeo salió un detalle menor ya corregido: el control de cambios de los dos samples de
ejemplo de `Rules-Examples.md` §7 tenía pegado el texto del control de cambios **de la regla**,
incluida la mención a «categoría 11», que es el número anterior de Examples.)*

## 5. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| Las **diez** reglas de categoría | patch cada una | La cabecera obligatoria de §4.1: **26 ocurrencias** |
| `SDD/Devs/Rules/Rules-Arquitectura-Tecnica.md` | 4.1 → **4.2** | Además, las **cuatro** apariciones internas del nombre renombrado |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 7.10 → **7.11** | La fila C de §7: el nombre del artefacto y el nivel de sus documentos |
| `SDD/Devs/Rules/Root-Rules.md` | 5.3 → **5.4** | El título de §4.2 |
| `SDD/Devs/Intake/PRODUCT-INTAKE-template.md` | 3.2 → **3.3** | El nombre en la tabla de correspondencia de §19 |
| `SDD/Guides/SDD-User-Guide.md` | 1.13 → **1.14** | El nombre en el árbol de ejemplo |
| `SDD/Guides/SDD-Development-Guide.md` | 1.13 → **1.14** | §VI.3.1 la quinta regla del barrido; §VI.3 la exclusión de la comprobación 3 |
| `Coherencia-Barrido-Layout-8.0.md`, `Coherencia-Barrido-8.7-Dos-Ejes.md` | 1.0 → **1.1** cada una | §6 pasa a «cómo se cerró» |
| `CHANGELOG.md` | — | Entrada `[8.17]` |

## 6. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Sin cambios de idioma ni de nombres de archivo |
| **D4**, **D5** | Conforme | Los diecisiete archivos subieron versión y registraron su fila; comprobación 10 en cero |
| **D6** Trazabilidad | **Conforme, y es el punto** | El criterio de aceptación de 05 verificaba un nombre que su propia §2.1 había retirado |
| **D7** Neutralidad | Conforme | No se nombra ningún destino |
| **D8** Conjunto cerrado | Conforme | No se toca |
| **D9** Evidencia | Conforme | Las 26 cabeceras, las 7 apariciones del nombre viejo y los 14 enlaces se enumeraron sobre el árbol |

## 7. Lo que esta nota deja anotado

**Los cuatro hallazgos aparecieron porque el Product Owner preguntó si quedaba algo, no porque una
comprobación los levantara.** Es el cuarto caso seguido, y ya no es anécdota: **el método encuentra lo
que se le pide buscar**, y quien decide qué buscar es una persona.

Lo que sí mejoró es que las cuatro veces la respuesta se obtuvo **verificando y no recordando**. La
diferencia entre «creo que no queda nada» y catorce comandos es de un minuto, y las cuatro veces
quedaba algo.

## 8. Veredicto

**APROBADO.** El conjunto 8.17 no tiene ninguna cabecera de documento generado declarando el nivel
anterior a la 8.0, ninguna aparición viva del nombre `Arquitectura-Proyecto-Codigo.md`, y ninguna nota
de coherencia declarando pendiente algo ya cerrado.

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-16 | Emisión inicial. **26 cabeceras** de documento generado declarando el nivel anterior a la 8.0, dentro de bloques de ejemplo que ningún barrido abría; un **renombre de artefacto sin propagar** en siete lugares, con el criterio de aceptación del audit verificando el nombre viejo; dos notas de coherencia declarando pendiente lo que la 8.15 cerró; y la exclusión declarada de las rutas ilustrativas en la comprobación de enlaces. |
