# Nota de coherencia — Puesta al día de las guías contra la capa de conocimiento

**Framework:** SDD
**Documento:** Coherencia-Guias-Capa-Conocimiento.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-23
**Autor:** AG-00990 (Arquitecto de Soluciones)

---

## 1. Alcance

Las versiones 12.2, 12.3 y 13.0 incorporaron una capa que no existía —`Rules-Base-Conocimiento.md` y la
carpeta anexa `Conocimiento/`— **sin tocar ninguna guía**. Esta intervención cierra ese desfasaje.

**El hueco estaba medido, no supuesto.** Antes de esta intervención,
`grep -c "Rules-Base-Conocimiento\|Conocimiento/"` devolvía **0 en los cuatro documentos**: las tres
guías de `SDD/Guides/` y el marco teórico. Las guías describían un framework que ya no era el publicado.

## 2. Inventario de archivos

### 2.1 Creados

| Archivo | Qué es |
| --- | --- |
| `SDD/Devs/Guides/Coherencia-Guias-Capa-Conocimiento.md` 1.0 | Esta nota |

### 2.2 Editados

| Archivo | Versión | Cambio |
| --- | --- | --- |
| `SDD/Guides/SDD-Development-Guide.md` | 1.25 → 1.26 | §III.11 nueva, el eje de extensión. §I.2: dos recuentos corregidos |
| `SDD/Guides/SDD-User-Guide.md` | 1.17 → 1.18 | F-23.1 nueva. §4.4: dos recuentos corregidos. Árbol y glosario |
| `SDD/Guides/SDD-Getting-Started-Guide.md` | 1.5 → 1.6 | Una línea en el árbol del paso 4 |
| `SDD/Devs/Guides/Marco-Teorico-SDD.md` | 3.6 → 3.7 | §8.7.1 nueva, método contra oficio. §1.5: mapa y `D1..D9` |

### 2.3 Publicación

| Artefacto | Estado |
| --- | --- |
| `_legacy/13.0/` | Construido **desde git y no desde el árbol de trabajo**, antes de editar, según `SDD-Development-Guide.md` §VI.5 |
| `CHANGELOG.md` | Entrada 13.1 |

## 3. El reparto por audiencia, que es la decisión de fondo

Un hecho contado cuatro veces con palabras distintas es el modo de falla propio de una actualización que
toca cuatro documentos a la vez. El reparto se hizo por audiencia y **se puede verificar contando**:

| Documento | Audiencia | Qué le toca | Menciones |
| --- | --- | --- | --- |
| `SDD-Getting-Started-Guide.md` | Quien arranca | Que la carpeta existe y **se puede ignorar** | 1 |
| `SDD-User-Guide.md` | Quien genera un producto | Qué es, en qué se diferencia de un modelo UX-UI, y qué se puede hacer hoy | 9 |
| `SDD-Development-Guide.md` | Quien extiende el framework | El eje de extensión, las obligaciones y el snapshot | 7 |
| `Marco-Teorico-SDD.md` | Quien audita el método | El encuadre: por qué el oficio no puede vivir en el conjunto normativo | 3 |

Ningún documento repite el contenido de otro: el marco teórico da el **porqué**, la guía de desarrollo el
**cómo se extiende**, la de usuario el **qué es y qué se puede hacer**, y la de arranque **que existe**.

## 4. Hallazgos previos que la intervención encontró y corrigió

Los chequeos mecánicos, corridos antes de tocar contenido, encontraron **tres defectos que no tienen
nada que ver con la capa nueva** y que estaban desde antes:

| # | Defecto | Dónde | Corrección |
| --- | --- | --- | --- |
| 1 | «los dieciocho archivos normativos: doce de categoría más seis transversales» | `SDD-Development-Guide.md` §I.2 | Diecinueve y siete |
| 2 | «dieciocho archivos en total», enumerando seis transversales | `SDD-User-Guide.md` §4.4 | Diecinueve y siete |
| 3 | **«Los tres master-prompts», describiendo sólo dos.** `Master-Prompt-Reanudacion.md` existe y no figuraba en ninguna de las dos guías | `SDD-Development-Guide.md` §I.2 y `SDD-User-Guide.md` §4.4 | Se lo nombra y se declara su función |

El tercero es el más caro de los tres: un lector que corría la verificación del árbol veía tres archivos
donde la guía le describía dos, que es el mismo defecto que la 1.9 de la guía de usuario ya había
corregido una vez con el paso de uno a dos master-prompts.

**Dos falsos positivos declarados**, para que no se vuelvan a levantar: `Rules-Observabilidad.md` en
`SDD-User-Guide.md` §1284 es un **ejemplo hipotético** de un recorrido de extensión, y
`devs/Rules/decisiones-D1-D8.md` en `Marco-Teorico-SDD.md` §1961 es una **fila histórica de control de
cambios** que describe una corrección pasada. Ninguno es una ruta rota.

## 5. Verificación de invariantes

| Invariante | Verificación | Resultado |
| --- | --- | --- |
| **D1** | Español rioplatense, sin emojis ni lenguaje de marketing, en todo lo agregado | Cumple |
| **D2** | UTF-8 sin BOM, LF, fechas `YYYY-MM-DD`. Verificado por conteo de `\r` = 0 en los cinco archivos | Cumple |
| **D3** | `Coherencia-Guias-Capa-Conocimiento.md`, Título-Con-Guiones ASCII | Cumple |
| **D4/D5** | Los cuatro editados suben versión y registran su fila de control de cambios. El conjunto superado se archivó completo | Cumple |
| **D6** | Esta nota inventaría lo tocado; el `CHANGELOG.md` registra la publicación | Cumple |
| **D7** | Nada de lo agregado nombra un dominio, cliente o producto concreto. Los ejemplos son patrones de industria y artefactos del propio framework | Cumple |
| **D8** | No se agrega ni se altera ningún tipo de proyecto de código | Cumple |
| **D9** | Los tres defectos de §4 se declaran con archivo y sección; el hueco se declara con el comando que lo mide | Cumple |

## 6. Observaciones

1. **Se documentó el estado real, no el previsto, y eso obligó a un ajuste del reparto.** La capa
   **todavía no se consume en una corrida**: la cita desde el intake y la inyección en el despacho son
   pasos pendientes. La guía de usuario lo dice con esas palabras —el catálogo se puede poblar, citarlo
   no está cableado— en vez de describir una capacidad que no existe. Es lo que evita que un usuario
   intente algo que no va a funcionar.

2. **La frontera con `Modelos-UX-UI/` hubo que escribirla en tres lugares**, con el mismo criterio y
   distinta profundidad. No es duplicación: es la misma pregunta llegando desde tres audiencias. Que
   haya hecho falta escribirla es en sí un hallazgo — **antes de esta intervención el criterio no
   estaba en ningún lado**, y los dos catálogos comparten convención de nombres y territorio.

3. **`Rules-Base-Conocimiento.md` §0.4 y la nueva §III.11 se rozan** y conviene vigilarlo en la próxima
   intervención: la regla declara los tres modos de aportar, la guía declara cómo se agrega un
   documento. Hoy no se contradicen y la guía cita en lugar de redefinir, que es lo que corresponde.

## 7. Veredicto

**Coherente.** Las cuatro guías describen el framework publicado. Ningún procedimiento cambia, ningún
documento generado deja de cumplir, y ningún destino tiene trabajo. El conjunto sube **minor** por
puesta al día, según `SDD-Development-Guide.md` §VI.5.

## 8. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-23 | Emisión inicial. Cubre la puesta al día de las tres guías y el marco teórico contra la capa de conocimiento del conjunto 13.0, el reparto por audiencia y los tres defectos previos que los chequeos mecánicos encontraron. |
