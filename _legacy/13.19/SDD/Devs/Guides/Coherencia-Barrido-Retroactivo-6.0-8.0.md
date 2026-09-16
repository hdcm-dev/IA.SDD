# Nota de coherencia — El barrido retroactivo de la 6.0 y la 8.0

**Framework:** SDD
**Documento:** Coherencia-Barrido-Retroactivo-6.0-8.0.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-16
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 8.15
**Origen:** el punto 3 del plan de trabajo aprobado por el Product Owner, y el criterio que la 8.12 fijó sobre las intervenciones anteriores al barrido

---

## 1. Alcance

Barrido por concepto, **retroactivo**, de los dos conceptos grandes que quedaban de intervenciones
anteriores a la 8.9, que es cuando el barrido entró al método:

1. **El vocabulario de la 6.0**: la unificación del intake, que eliminó `PROJECT-BRIEF` y
   `PROJECT-README` y los reemplazó por un `PRODUCT-INTAKE` único.
2. **Los dos ejes de la 8.0**, más allá de lo que la 8.12 y la 8.13 ya cubrieron.

Es el **tercer barrido**, después del de la 8.7 —cinco archivos— y del layout en la 8.13 —diecinueve—.

## 2. El vocabulario de la 6.0 estaba limpio, y conviene decirlo

**No se corrigió nada por este concepto, y no es un no-resultado.** Las apariciones vivas de
`SOLUTION-INTAKE`, `PROJECT-BRIEF` y `PROJECT-README` son de tres clases, y las tres son correctas:

| Clase | Dónde | Por qué se conserva |
| --- | --- | --- |
| Registro histórico | `CHANGELOG.md`, filas de control de cambios, notas de coherencia anteriores | Reescribirlas falsearía el registro |
| Evidencia del origen | `SDD/Devs/Bootstrap/` | La guía §I.2 la declara no editable: es la evidencia de por qué varias reglas son como son |
| Renombre declarado | «reemplaza a las antiguas `PROJECT-BRIEF` y `PROJECT-README`» | Es lo que permite que un destino generado con la versión vieja se reconozca |

**La forma desnuda tampoco divergió.** «Solución» aparece viva sólo como palabra común —la columna
«Solución» de las tablas de anti-patrones, «confirmar la causa antes de aplicar la solución»— y
«proyecto» sin calificar sólo en oraciones que acaban de decir «proyecto de código», que es el uso que
`Vocabulario-Rules.md` §9.2 admite explícitamente.

**Que la 6.0 haya quedado limpia y la 8.0 no es informativo**: la 6.0 renombró **artefactos**, y un
nombre de artefacto que sobrevive se ve; la 8.0 cambió **niveles**, y un nivel equivocado se lee bien.

## 3. El hallazgo: ocho citas a una sección de un documento que no existe

**`Master-Prompt.md` citaba ocho veces `README §5 del proyecto de código`.** Es una sección del
`PROJECT-README` que la **6.0 eliminó**, en el nivel que la **8.0 cambió**: los dos conceptos en la
misma línea.

**Cinco de las ocho están en la tabla de flags de §4**, y ahí es donde importa:

| Flag | Nivel que declaraba | De dónde decía leer el valor |
| --- | --- | --- |
| `multi_tenant` | unidad de entrega | `README §5 P.4` **del proyecto de código** |
| `tiene_auth` | unidad de entrega | `README §5 P.5` **del proyecto de código** |
| `tiene_portal_developers` | unidad de entrega | `README §5` **del proyecto de código** |
| `tiene_extensibilidad` | unidad de entrega | `README §5 P.2` y rol **del proyecto de código** |
| `tiene_observabilidad_critica` | unidad de entrega | `README §5 P.10` **del proyecto de código** |

**Las cinco filas se contradicen dentro de sí mismas**: declaran el nivel nuevo en su segunda columna
y leen del nivel viejo en la tercera, de un documento que no existe. Las dos filas vecinas —`usa_llm`
y `tiene_persistencia`— sí se habían migrado a `§17 … de la unidad de entrega`, lo que muestra que la
8.0 corrigió la tabla **fila por fila y no terminó**.

**Por qué no lo detectó nada.** Son **flags de gating**: deciden qué categorías se generan y cuáles se
omiten. Un subagente al que se le pide leer una sección inexistente no falla: **infiere el valor**, y
un flag inferido produce documentación que parece correcta. Las tres citas restantes están en la
columna de insumos upstream de la tabla de §7, con el mismo efecto.

**Y una segunda, más chica y del mismo molde.** `Rules-Devops.md` §0.2 declaraba **dos** matrices de
artefactos publicables —«por unidad de entrega, la matriz de artefactos publicables por proyecto de
código»—: la actualización de la 8.0 **agregó la nueva sin retirar la vieja**, y quedó una oración que
enumera dos matrices donde hay una. Se construye por proyecto de código y **se publica por unidad de
entrega**.

## 4. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 7.9 → **7.10** | Las **ocho citas** a `README §5` pasan a `PRODUCT-INTAKE` §17 de la unidad de entrega, con la misma numeración de P; el origen y el impacto de los cinco flags; la matriz de publicables de §7 |
| `SDD/Devs/Rules/Rules-Devops.md` | 4.2 → **4.3** | §0.2 y §2.1: una sola matriz, publicada por unidad de entrega |
| `SDD/Guides/SDD-User-Guide.md` | 1.12 → **1.13** | §5.2 recorría las Fases B a G «por proyecto de código»; el glosario publicaba por proyecto de código |
| `SDD/Devs/Guides/Marco-Teorico-SDD.md` | 3.2 → **3.3** | §3.9 describía la consolidación de producto con una vista de un solo eje |
| `CHANGELOG.md` | — | Entrada `[8.15]` |

## 5. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Sin cambios de idioma, registro ni nombres |
| **D4**, **D5** | Conforme | Los cuatro archivos subieron versión y registraron su fila; comprobación 10 de §VI.3 en cero |
| **D6** Trazabilidad | **Conforme, y es el punto** | Ocho referencias que no resolvían pasan a resolver contra una sección que existe |
| **D7** Neutralidad | Conforme | No se nombra ningún destino |
| **D8** Conjunto cerrado | Conforme | No se toca |
| **D9** Evidencia | Conforme | Las ocho citas y las dos matrices se enumeraron sobre el árbol vivo, excluyendo `Bootstrap/` y los registros históricos |

## 6. Lo que esta nota deja anotado

**Los tres barridos retroactivos encontraron algo, y el criterio que los ordenó era ambiguo.** La 8.12
lo dejó escrito como «cuando una intervención vieja se toca por cualquier motivo, su concepto se barre
entonces». Los tres se corrieron por decisión explícita del Product Owner, no porque una intervención
tocara los conceptos: **el disparador que la regla declara no se disparó ninguna de las tres veces**.

No se resuelve acá porque la alternativa —barrer todos los conceptos de todas las intervenciones—
tiene que ser una intervención propia y no una condición ambiental. Lo que queda dicho es que **el
criterio, tal como está escrito, no habría encontrado ninguno de estos tres**.

**Y una observación sobre qué clase de defecto sobrevive.** Los tres barridos dan la misma respuesta:
sobrevive **la tabla, no la prosa**. La 8.13 lo encontró en la tabla del plan maestro; la 8.12 en la
tabla de mapeo de la derivación; ésta en la tabla de flags. En los tres casos la prosa que rodea la
tabla ya decía lo correcto.

## 7. Veredicto

**APROBADO.** El conjunto 8.15 no tiene ninguna referencia viva a los artefactos que la 6.0 eliminó, y
los cinco flags de gating que leían de ellos leen ahora del `PRODUCT-INTAKE` §17 de la unidad de
entrega, que es el nivel que las tres columnas de su fila declaran.

## 8. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-16 | Emisión inicial. Tercer barrido retroactivo. Declara que el vocabulario de la 6.0 **estaba limpio** y por qué, y registra el hallazgo de los dos conceptos juntos: **ocho citas a `README §5`**, una sección de un documento que la 6.0 eliminó, en el nivel que la 8.0 cambió, de las cuales **cinco son el origen de flags de gating**. Anota que el criterio de disparo del barrido retroactivo no se disparó ninguna de las tres veces. |
