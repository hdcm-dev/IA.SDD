# Nota de coherencia — El barrido pasa de recordarse a correrse

**Framework:** SDD
**Documento:** Coherencia-Barrido-Ejecutable.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-16
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 9.1
**Origen:** una pregunta del Product Owner — «¿y qué vamos a hacer con esos defectos?»

---

## 1. Alcance

Conversión de la comprobación 8 de `SDD-Development-Guide.md` §VI.3 —el barrido por concepto— de una
lectura que hay que recordar a una **corrida con resultado verificable**.

## 2. El problema, medido

**Cinco intervenciones seguidas cometieron el defecto que corregían**, y la quinta lo cometió **una
intervención después** de escribir la regla que lo evita.

| Intervención | Concepto | Descubierto en |
| --- | --- | --- |
| 8.7 | D8 y `redistribuible` como atributos del proyecto de código | 8.12 |
| 8.12 | El layout de la 8.0 en la tabla que se ejecuta | 8.13 |
| 8.13 | Citas al artefacto que la 6.0 eliminó | 8.15 |
| 8.15 | La cabecera que todo documento generado copia | 8.17 |
| 8.17 | El eje del «principal» y el bloque de contexto | 9.0 |

**La 9.0 dejó anotado que la regla 4 no funciona como control**, porque se cumple cuando alguien se
acuerda de correrla, y declaró que volverla mecánica exigía decidir contra qué se corre. **Ese
diagnóstico era falso, y comprobarlo llevó cinco búsquedas.**

## 3. Lo que la comprobación destapó

**Los cinco conceptos tenían una forma anterior literal:**

| Concepto | Forma anterior | Vivas hoy |
| --- | --- | --- |
| Layout de la 8.0 | `Proyectos/` | **1**, declarada: `Vocabulario-Rules.md` §8 describe el estado anterior para registrar su cierre |
| Vocabulario de la 6.0 | `README §5` | 0 |
| Nivel del despacho | `{{NOMBRE_PROYECTO_CODIGO}}` | 0 |
| Eje del principal | `proyecto de código principal` | 0 |
| Cabecera del documento generado | `**Proyecto de código:**` | 0 |

**Ninguna era difícil de encontrar. Ninguna estaba escrita en ninguna parte.** Lo que faltaba no era
que el concepto fuera expresable: era que **nadie lo expresaba**. El barrido dependía de que quien
interviene recordara qué buscar, y cinco veces seguidas la memoria falló donde un `grep` no habría
fallado.

## 4. La solución

**§VI.3.2 es nueva.** Toda intervención que cambia un concepto declara el par **forma anterior / forma
vigente**, con la anterior expresada como **patrón de búsqueda y no como descripción** —«el nivel del
bloque técnico» no sirve; `**Proyecto de código:**` sí—.

**El residuo aceptable es cero fuera de las exclusiones enumeradas una por una con su motivo**, y las
seis clases de exclusión se declaran de una vez —filas de control de cambios, `_legacy/`,
`Bootstrap/`, notas de coherencia anteriores, rutas ilustrativas y renombres declarados— para que no
se redescubran en cada intervención, que es lo que las volvía discutibles.

**Y la regla 4 se corre con los mismos patrones sobre el texto propio.** Es la parte que faltó las
cinco veces: el barrido se corrió sobre el árbol y **no sobre lo que la intervención acababa de
escribir**. Una intervención que introduce la forma vigente puede introducir también la anterior —en
un ejemplo nuevo, en una fila nueva, en una cita— y es el único lugar donde nadie mira.

**§VI.3 comprobación 8** se reformula sobre eso, y la forma de la nota de coherencia suma la sección
de barrido declarado: **sin ella, la comprobación 8 no es verificable por nadie que no sea quien la
corrió**, que es el defecto que tenía.

## 5. El límite, declarado y no disimulado

**Esto cubre los conceptos con huella textual**: renombres, cambios de nivel, nombres de variable y de
campo. **No cubre un cambio semántico sin forma anterior distinta.** Cuando la 8.14 pasó a exigir que
toda fuente declarativa nombre a su responsable, no había ninguna cadena vieja que buscar: el defecto
era una **ausencia**, y una ausencia no se encuentra con un patrón.

Para ésos la regla 4 sigue siendo una lectura, y la nota lo declara en lugar de simular una corrida.
**Un control que dice qué no cubre es un control; uno que pretende cubrir todo es lo que nos trajo
hasta acá** — la comprobación 4 decía «sin contradicción entre lo escrito y lo que ya estaba» y tres
intervenciones la pasaron con una contradicción adentro.

## 6. Barrido declarado de esta intervención

| Concepto | Forma anterior | Forma vigente |
| --- | --- | --- |
| La comprobación 8 como lectura | «todo lugar donde aparece el concepto está enumerado y verificado» | «declara la forma anterior como patrón y lo corre… cero ocurrencias vivas fuera de las exclusiones enumeradas» |

**Residuo:** una ocurrencia, en `SDD-Development-Guide.md` §VI.3.1, que es el texto que explica **por
qué** la comprobación cambió. Se declara y se conserva.

**Regla 4 sobre el texto propio:** los cinco patrones de §3 se corrieron sobre esta nota y sobre
§VI.3.2. Las apariciones son **citas del patrón dentro de tablas que lo declaran**, que es la única
forma en que pueden aparecer en el documento que los define.

## 7. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Guides/SDD-Development-Guide.md` | 1.14 → **1.15** | **§VI.3.2 nueva**; §VI.3 comprobación 8 reformulada; la forma de la nota de coherencia suma la sección de barrido declarado |
| `CHANGELOG.md` | — | Entrada `[9.1]` |

## 8. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Sin cambios de idioma ni de nombres |
| **D4**, **D5** | Conforme | El archivo subió versión y registró su fila; comprobación 10 en cero |
| **D6** Trazabilidad | Conforme | §VI.3.2 cita las cinco intervenciones que la fundamentan y la comprobación 3 de la que toma una exclusión |
| **D7** Neutralidad | Conforme | No se nombra ningún destino |
| **D8** Conjunto cerrado | Conforme | No se toca |
| **D9** Evidencia | **Conforme, y es el punto** | Los cinco patrones se corrieron y su residuo está en la tabla de §3 |

## 9. Lo que esta nota deja anotado

**El control nuevo no impide el sexto caso: lo vuelve detectable en la misma intervención en lugar de
en la siguiente.** Una intervención que no declara su patrón sigue pudiendo cerrarse; lo que cambia es
que la nota de coherencia queda visiblemente incompleta, y la comprobación 8 no se puede marcar.

**Y una constatación que ya es un patrón propio: la pregunta que destrabó esto fue del Product
Owner.** Es la quinta vez. La diferencia esta vez es que la respuesta no era trabajo pendiente sino un
diagnóstico mío equivocado, y comprobarlo llevó **cinco búsquedas**.

## 10. Veredicto

**APROBADO.** El conjunto 9.1 tiene el barrido por concepto expresado como corrida con residuo
verificable, sus exclusiones declaradas de una vez, la regla 4 aplicada al texto propio, y su límite
enunciado.

## 11. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-16 | Emisión inicial. Convierte el barrido en corrida: **forma anterior como patrón**, residuo cero fuera de exclusiones enumeradas, **regla 4 sobre el texto propio**, y el límite declarado —cubre huella textual, no ausencias—. Registra que el diagnóstico de la 9.0 sobre por qué no se podía mecanizar **era falso**, y que comprobarlo llevó cinco búsquedas. |
