# Nota de coherencia — El eje del «principal», y el residuo de los ejemplos

**Framework:** SDD
**Documento:** Coherencia-Eje-Del-Principal.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-16
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 9.0
**Origen:** aplicar a la 8.17 la regla que la 8.17 acababa de escribir

---

## 1. Alcance

Cierre del concepto de la 8.0 en los dos lugares donde todavía vivía: **el campo que declara cuál es
el elemento principal del producto**, y el **bloque informativo que el orquestador publica antes de
generar**.

## 2. Cómo se encontró, que es la mitad del hallazgo

**La 8.17 agregó la regla 5 del barrido —entrar en los bloques de ejemplo— y no se la corrió a sí
misma.** Su regla 4 dice que la pregunta final de toda intervención es «¿mi intervención cometió el
defecto que corrige?». Se le corrió después, y devolvió **cuarenta apariciones** del concepto dentro
de bloques cercados, de las cuales veintiséis eran defectos.

**Es el quinto caso seguido del patrón, y el de intervalo más corto: una intervención.** Los cuatro
anteriores están registrados en `SDD-Development-Guide.md` §VI.3.1 y en las notas de la 8.0, 8.5, 8.7
y 8.10.

## 3. El defecto de fondo: dos ejes para una misma pregunta

| Documento | Qué declara sobre «el principal» |
| --- | --- |
| `PRODUCT-INTAKE-template.md` §13.1 | Marca `(principal)` sobre una fila de **unidades de entrega** |
| `Intake-Rules.md` §2.2 y §4 | Bloqueante: «hay exactamente **una unidad de entrega principal**» |
| `PRODUCT-MANIFEST-template.md` §1, §4, §7 | Pedía y validaba un ***proyecto de código* principal** |
| `Master-Prompt.md` §3.4 y §15 | Publicaba `proyecto-de-codigo-principal` |
| `Root-Rules.md` §4.1 | El README raíz declaraba `Proyecto de código principal` |

**El manifiesto se deriva del intake y validaba un eje distinto del que su origen declara.** No
producía un error visible porque en la mayoría de los productos la entrega principal **tiene** un
proyecto cabeza, y los dos nombres apuntaban al mismo string. Rompe en el caso que la 8.0 existe para
soportar: una entrega compuesta por varios proyectos, donde ninguno es «el principal».

**La evidencia de que era un renombre pendiente y no una decisión** estaba en el glosario de la guía
de usuario, que definía «Proyecto de código principal» como **«la unidad de entrega cabeza del
producto»**. La definición se migró en la 8.0; el término, no.

## 4. El segundo defecto: el bloque que se ve primero

`Master-Prompt.md` §3.4 publica el bloque informativo que resume el producto **antes de generar
nada**. Enumeraba **proyectos de código** llevando `tipo_unidad_entrega`, `redistribuible` y
`path-docs`.

**Es la misma mezcla que `Intake-Rules.md` §4 valida como imposible**, y que la 8.12 corrigió en la
tabla de mapeo de esa regla **sin llegar hasta acá**. La agravante es de posición: **es lo primero que
un subagente recibe**. Un modelo de datos mal presentado en el primer bloque de contexto no se corrige
leyendo el resto; se arrastra.

Pasa a **tres bloques** que espejan §2.A, §2.B y §2.C del manifiesto, y el orden topológico se
**desdobla**: el de compilación es entre proyectos de código y el de integración entre unidades de
entrega, y no son el mismo grafo —`Master-Prompt.md` §6 y §7 ya recorrían el de integración—.

## 5. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Intake/PRODUCT-MANIFEST-template.md` | 5.0 → **6.0** | El campo, sus validaciones bloqueantes y su checklist |
| `SDD/Devs/Rules/Root-Rules.md` | 5.4 → **6.0** | El campo del README raíz y la tabla de sus dos ejemplos |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 7.11 → **8.0** | §3.4 a tres bloques; el campo; el orden topológico desdoblado |
| Once reglas de categoría, `Deriva-Rules.md`, `Maqueta-Rules.md` | patch cada una | `{{NOMBRE_PROYECTO_CODIGO}}` en su prompt de despacho |
| `Rules-Plan-Sprint.md`, `Rules-Documentacion.md`, `Rules-Necesidades-Negocio.md` | patch | Las cabeceras de sus ejemplos **rellenos** |
| `SDD/Devs/Intake/PRODUCT-INTAKE-template.md` | 3.3 → **3.4** | El árbol de §16 |
| `SDD/Devs/Rules/Migracion-Rules.md` | 3.4 → **3.5** | La señal de clasificación, que quedaba circular |
| `SDD/Guides/SDD-User-Guide.md` | 1.14 → **1.15** | El campo y el glosario |
| `CHANGELOG.md` | — | Entrada `[9.0]` **con su bloque de impacto sobre destinos existentes** |

## 6. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Sin cambios de idioma ni de nombres de archivo |
| **D4**, **D5** | Conforme | Los veinte archivos subieron versión y registraron su fila; comprobación 10 en cero |
| **D6** Trazabilidad | Conforme | El manifiesto declara de qué fila del intake toma el valor del campo |
| **D7** Neutralidad | Conforme | No se nombra ningún destino |
| **D8** Conjunto cerrado | **Conforme** | Los ocho valores no cambian. Cambia el eje al que se le piden, que es lo que la 8.0 decidió |
| **D9** Evidencia | Conforme | Las 18 apariciones del campo, las 40 de los bloques cercados y las 11 del marcador se enumeraron sobre el árbol |

**Registro de impacto (§VI.4).** La entrada `[9.0]` lleva el bloque «Impacto sobre destinos
existentes» con sus tres tablas, incluida la de campos bloqueantes declarada **vacía**: el conjunto de
campos no cambia, cambia a qué eje se le piden.

## 7. Lo que esta nota deja anotado

**Cinco intervenciones seguidas cometieron el defecto que corregían, y la quinta lo cometió una
intervención después de escribir la regla que lo evita.** La regla 4 existe desde la 8.9 y **no está
funcionando como control**: se cumple cuando alguien se acuerda de correrla, que es la definición de
lo que no es un control.

No se resuelve acá porque convertirla en algo mecánico exige decidir **contra qué** se corre —el
concepto que la intervención cambió no está declarado en ninguna parte en forma verificable—. Lo que
queda dicho es que las cinco veces el defecto **se encontró**, y las cinco fue mirando, no leyendo.

## 8. Veredicto

**APROBADO.** El conjunto 9.0 nombra un solo eje para el elemento principal del producto —**la unidad
de entrega**, que es la que el intake señala y la que su regla valida—, y el bloque informativo que
gobierna la generación presenta los dos ejes por separado con su matriz.

## 9. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-16 | Emisión inicial. El campo del elemento principal pasa a la **unidad de entrega** en los cinco lugares que lo declaraban por el eje anterior, incluido el manifiesto, que **validaba un eje distinto del que su origen declara**. El bloque informativo de `Master-Prompt.md` §3.4 pasa a tres bloques. Registra que la 8.17 **no se corrió a sí misma la regla que acababa de escribir**, quinto caso del patrón, y que la regla 4 no funciona como control. |
