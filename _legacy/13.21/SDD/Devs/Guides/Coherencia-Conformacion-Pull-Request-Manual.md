# Nota de coherencia — El procedimiento de traspaso, catalogado como conocimiento

**Framework:** SDD
**Documento:** Coherencia-Conformacion-Pull-Request-Manual.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-29
**Versión del conjunto resultante:** SDD 13.9
**Origen:** pedido del Product Owner — que el procedimiento de trabajo acordado entre el agente orquestador y el agente humano quede catalogado, para poder citarlo desde un intake y para que otras variantes se puedan agregar sin desplazarlo

---

## 1. Alcance

Alta de un documento en `Conocimiento/`: `Knowledge-Conformacion-Pull-Request-Manual.md`, alias
`Conformacion-Pull-Request-Manual`, con su fila en `Index-Knowledge.md`. **No se toca ninguna regla, ni
ningún orquestador, ni ninguna plantilla.** Es el eje de extensión de `SDD-Development-Guide.md`
§III.11, el único de los once que no toca una regla.

## 2. Qué se catalogó, y qué no

**Lo catalogado es el procedimiento que ya rige**, tal como está declarado en `Master-Prompt.md` §12.1
—T0 compuerta, T1 el agente no fusiona, T2 árbol limpio, T3 una unidad un pull request, T4 la forma de
la entrega, T5 la reanudación verificada, T6 su límite— y en §8.1, que fija la forma del **cierre de
unidad**: la entrega con el enlace del pull request y las decisiones pendientes en un solo bloque.

**No se declaró nada que no estuviera escrito.** En particular quedan afuera, y el §0 del documento lo
declara: la convención de nombre de rama y de mensaje de commit, la protección de rama y los revisores
obligatorios. **El framework no los fija**, y catalogarlos habría sido inventar.

## 3. La decisión que ordena el resto: es catálogo, no norma

Un documento de conocimiento que reescribiera §12.1 sería el anti-patrón **conocimiento disfrazado de
regla** de `Rules-Base-Conocimiento.md` §4.5, y crearía la segunda fuente que `Master-Prompt.md` §6
prohíbe por nombre. El documento **cita turno por turno dónde vive cada norma y no copia ni uno de los
tres bloques literales**; su §8 declara la frontera completa.

**Lo que aporta, entonces, es lo que no existía:** un **alias** con el que `§17.P.13` del
`PRODUCT-INTAKE` puede nombrar el procedimiento, y una tabla de **puntos de variación** —quién fusiona,
quién borra la rama, granularidad de la unidad, concurrencia, forma de la reanudación, publicación del
estado— contra la cual una variante hermana se declara por diferencia.

## 4. Lo que este alta no habilita, y conviene no dar por hecho

**Una variante que cambie quién fusiona todavía no puede sustituir a ésta.**
`Rules-Base-Conocimiento.md` §0.4 habilita la sustitución **sólo sobre ítems que el framework haya
rotulado como decisión de stack**, y ningún ítem de `Master-Prompt.md` §12.1 lleva ese rótulo. Hoy una
variante es **desviación**: manda la regla del framework y se declara con su justificación.

**Que el rótulo exista o no es una decisión del responsable del framework**, y sería una intervención
sobre `Master-Prompt.md`, fuera del alcance de un alta de conocimiento. Queda anotado acá, que es donde
`Rules-Base-Conocimiento.md` §9.4 dice que se mira: **cada límite que aparece al usar el catálogo es
evidencia de lo que falta cablear**, no una falla del catálogo.

## 5. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `Conocimiento/Knowledge-Conformacion-Pull-Request-Manual.md` | **1.0** | Alta. 218 líneas, bajo el techo de 250 de un documento `canonico` |
| `Conocimiento/Index-Knowledge.md` | 1.0 → **1.1** | Fila nueva en §3, con las diez columnas de §7.1 |
| `CHANGELOG.md` | — | Entrada `[13.9]` |
| `_legacy/13.8/` | — | Snapshot del conjunto superado, **tomado antes de editar** |

## 6. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** Idioma y registro | Conforme | Español rioplatense técnico, sin emojis ni marketing |
| **D2** Encoding | Conforme | UTF-8 sin BOM, LF, fechas `YYYY-MM-DD` |
| **D3** Nombres | Conforme | `Knowledge-Conformacion-Pull-Request-Manual.md`, Título-Con-Guiones ASCII, sin prefijo numérico. No se acuña ningún identificador |
| **D4**, **D5** | Conforme | Un solo archivo por nombre lógico; el índice sube minor y registra su fila |
| **D6** Trazabilidad | Conforme | El §9 del documento declara índice, consumidor y origen; los enlaces internos son relativos y resuelven |
| **D7** Neutralidad de dominio | Conforme | Ver §7 |
| **D8** | No alcanzado | El documento no gatilla por tipo de proyecto de código: su condición de carga es `—`, se carga sólo por cita |
| **D9** Evidencia verificable | Conforme | Cada turno, prohibición y decisión del documento cita el archivo y la sección de donde sale |

## 7. Verificación de ofuscación, previa y bloqueante

El artefacto caracterizado es **el propio `IA.SDD`**, que es el repositorio público donde el documento
se deposita: no hay proyecto de origen distinto del destino.

| Qué se buscó | Resultado |
| --- | --- |
| Nombres de cliente, de solución, de entidades o de proveedores externos | Ninguno |
| Términos de un dominio de negocio | Ninguno |
| Términos de un stack de origen no genérico | Ninguno. Lo único nombrado es `pull request`, `rama`, `commit` y `merge`, que son vocabulario de control de versiones y ya están en el conjunto normativo |

**Falsos positivos léxicos:** ninguno que declarar.

## 8. Lo que deja anotado

**`Index-Knowledge.md` declara `Compatible con: Rules-Base-Conocimiento.md 2.0` y la regla va por 2.2.**
No se corrigió, y es deliberado: el contrato del índice —§7.1, sus diez columnas— **no cambió en 2.1 ni
en 2.2**, que tocaron §0.3 y §9. La declaración sigue siendo cierta. Se registra para que la próxima
intervención sobre la regla que sí toque §7 sepa que hay una versión que arrastrar.

## 9. Veredicto

**APROBADO.** El alta agrega un documento y su fila, no toca ninguna regla, y **el framework sigue
corriendo exactamente igual con `Conocimiento/` vacía**, que es la propiedad que
`Rules-Base-Conocimiento.md` §0.2 pide preservar en cada cambio posterior.

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-29 | Emisión inicial, con el alta de `Conformacion-Pull-Request-Manual`. |
