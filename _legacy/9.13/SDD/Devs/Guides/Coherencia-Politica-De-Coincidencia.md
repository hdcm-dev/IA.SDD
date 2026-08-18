# Nota de coherencia — La política de coincidencia, y el fundamento de DMN corregido

**Framework:** SDD
**Documento:** Coherencia-Politica-De-Coincidencia.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-17
**Versión del conjunto resultante:** SDD 9.12
**Origen:** dos observaciones del Product Owner sobre la 9.11 — que un criterio nuevo **debería implicar** actualizar el índice, y que si todo se trabaja en Markdown, descartar DMN por su representación no se sostiene

---

## 1. Alcance

Dos correcciones sobre la intervención inmediatamente anterior: una **obligación que se había escrito
como limitación**, y un **fundamento mal planteado**.

## 2. La limitación que era una obligación

La versión 1.0 del catálogo declaraba, en su sección de lo que no resuelve:

> «El catálogo tiene el problema de todo índice: se desactualiza. Un criterio nuevo que no se agregue
> queda invisible otra vez.»

**Eso no es una limitación. Es una obligación que faltaba escribir.** Un índice cuyo mantenimiento
depende de que alguien se acuerde **reproduce exactamente el problema que vino a resolver**, y el
método ya sabe cómo se corrige: es la forma de **D5** para el control de cambios —quien toca, registra—
y la de la comprobación 11 para las notas de coherencia.

Entra la **comprobación 12** en `SDD-Development-Guide.md` §VI.3: todo criterio que una intervención
agregue, mueva o retire está reflejado en el catálogo. Es **enumerable**: se contrastan las secciones
de criterio contra las entradas del índice.

**Vale registrar el patrón, porque es el cuarto caso en dos días:** escribí como «anotado» algo que
correspondía convertir en paso. La 9.1 lo hizo con el barrido, la 9.6 con el procedimiento de mover, la
9.10 con la comparación, y ahora la 9.12 con la cobertura del índice. **La declaración de una
limitación es cómoda y casi siempre está un paso antes de la regla que la elimina.**

## 3. El fundamento de DMN, corregido

La versión 1.0 decía que adoptar DMN completo «exigiría un motor de decisión y un formato de
intercambio que el método no tiene», y de ahí concluía que sólo se adoptaba su forma.

**El argumento mezclaba tres piezas que no se adoptan ni se descartan juntas**, y la observación que lo
señaló fue directa: si todo se trabaja en Markdown, la representación no puede ser el obstáculo.

| Pieza de DMN | Decisión | Fundamento |
| --- | --- | --- |
| Condiciones de entrada declaradas | **Se adopta** | Es lo que distingue una tabla de decisión de una lista de recomendaciones |
| Política de coincidencia | **Se adopta** (§4.1, nueva) | Es texto, y su ausencia dejaba sin resolver el caso de dos criterios simultáneos |
| Serialización XML y motor de ejecución | **No se adopta** | Son para intercambio entre herramientas y evaluación automática. Acá **el motor es el agente que lee** |

**Una tabla de decisión se expresa en Markdown sin pérdida**: columnas de entrada, columnas de salida,
una fila por regla. Lo que no corresponde adoptar es la **infraestructura**, no la notación — y decirlo
como se dijo en la 1.0 fue impreciso.

## 4. La política de coincidencia

**El método no declaraba qué pasa cuando aplica más de un criterio a la misma situación.** Se
verificó: las únicas apariciones de «precedencia» gobiernan términos del vocabulario y orden de fases,
no criterios.

Las dos tablas del catálogo reciben políticas distintas, y la distinción no es formal:

- **§3, criterios por situación: única.** Dos criterios para una situación son un **defecto del
  catálogo**, no una decisión del agente.
- **§4, anti-patrones: acumulativa.** Un documento puede tener a la vez un stack sin versión y un flujo
  de lectura único: son defectos independientes con remedios independientes, y tratarlos como
  excluyentes obligaría a elegir cuál corregir.

**Y el caso de conflicto no estrena mecanismo.** Dos criterios que difieren son dos cosas aprobadas que
se contradicen, que es exactamente la **detención por arbitraje** de `Master-Prompt.md` §7.0 —vigente
desde la 4.1— con la forma de §8.1. Es la tercera vez que esa detención absorbe un caso nuevo sin
modificarse, lo cual es evidencia de que estaba bien planteada.

**Trazabilidad de las fuentes.** Las políticas **Unique** y **Collect** se verificaron contra
[Camunda](https://camunda.com/dmn/), que las describe como «sólo una de las filas puede ser verdadera»
y «más de una regla podría serlo, lo que produce una lista de valores de salida». **La enumeración
completa de políticas que define el estándar no se verificó** y por eso no se cita: vive en la
especificación de la OMG.

## 5. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | 1.0 → **1.1** | **§4.1** nueva; §5 corrige el fundamento sobre DMN y separa sus tres piezas |
| `SDD/Guides/SDD-Development-Guide.md` | 1.16 → **1.17** | §VI.3 suma la **comprobación 12** |
| `CHANGELOG.md` | — | Entrada `[9.12]` |

## 6. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Sin cambios de idioma ni de nombres |
| **D4**, **D5** | Conforme | Los dos archivos subieron versión y registraron su fila; comprobación 10 en cero |
| **D6** Trazabilidad | Conforme | §4.1 cita §7.0 y §8.1 en lugar de redefinirlos; las políticas citan su fuente |
| **D7** Neutralidad | Conforme | No se nombra ningún destino |
| **D8** | Conforme | No se toca |
| **D9** Evidencia | Conforme | La ausencia de precedencia entre criterios se midió antes de intervenir; las dos políticas se verificaron contra fuente y la enumeración completa se declara **no verificada** |

## 7. Lo que esta nota deja anotado

**La comprobación 12 exige cobertura y no verifica corrección.** Que un criterio esté en el índice no
dice que su entrada lo describa bien. Eso sigue siendo lectura, y no se puede volver enumerable sin
duplicar el criterio en el índice — que es justo lo que el catálogo evita al enlazar en vez de copiar.

## 8. Veredicto

**APROBADO.** El catálogo declara qué pasa cuando aplica más de un criterio, su mantenimiento es una
obligación verificable en lugar de una expectativa, y la decisión sobre DMN está fundamentada por pieza
y no en bloque.

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-17 | Emisión inicial. Registra las dos correcciones y el patrón que las une: **una limitación declarada suele estar un paso antes de la regla que la elimina**, cuarto caso en dos días. |
