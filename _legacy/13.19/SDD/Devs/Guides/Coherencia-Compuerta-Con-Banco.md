# Nota de coherencia — La exclusión de alcance deja de concederse contra una declaración

**Framework:** SDD
**Documento:** Coherencia-Compuerta-Con-Banco.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-23
**Autor:** AG-00990 (Arquitecto de Soluciones)

---

## 1. Alcance

Dos hilos en una sola intervención, porque tocan los mismos archivos y comparten la misma clase de
defecto: **algo declarado que nadie comprueba**.

1. **El reporte `16`**, que evaluó SDD 13.3 y se aplica sobre 13.5.
2. **El barrido de pendientes del framework**, que encontró un ítem diferido con su evento de cierre
   cumplido y dos afirmaciones vencidas.

## 2. Verificación previa, que el prompt del fix exige antes de tocar nada

**Qué de las propuestas del reporte ya estaba resuelto en 13.5.** Se comprobó contra los archivos vivos,
y se declara aunque el resultado sea que no entró:

| Propuesta | Estado medido | Evidencia |
| --- | --- | --- |
| **6.1** La compuerta trae su banco de inyección | **No entró** | `grep -c "banco de inyección\|caso que la ejerce"` sobre `Master-Prompt.md` y `SDD-Development-Guide.md` devuelve **0** en los dos |
| **6.2** El alcance viaja como lista, no como prosa | **Parcial** | §10.0 obligaba a declarar el alcance, pero en prosa y sin enumerar recortes |
| **6.3** Un hallazgo cerrado exige su caso | **No entró** | `grep -c "no se declara cerrado sin"` devuelve **0** |
| §7 criterio 4, proporción detectable por guion | **Ya existía** | `Master-Prompt.md` §10, punto 6.2 de la estructura del informe de ronda. **El defecto es de cumplimiento, no de norma**, y por eso no se toca |

## 3. La medición de §8.1, hecha antes de corregir

El reporte señala una discrepancia entre §10.0 —«97 de 202»— y `Catalogo-De-Criterios.md` §4 —«208 /
100 / 108»—. **El prompt del fix obliga a medir en vez de creerle a ninguno de los dos.**

**Método**: contar las filas de tabla que llevan marca `[enumerable]` o `[interpretativo]` en los
diecinueve archivos de regla, excluyendo las filas de control de cambios por su patrón de fecha.

| Fuente | `[enumerable]` | `[interpretativo]` | Total |
| --- | --- | --- | --- |
| **Medido sobre los archivos vivos** | **100** | **108** | **208** |
| `Catalogo-De-Criterios.md` §4 | 100 | 108 | 208 |
| `Master-Prompt.md` §10.0 | 97 | — | 202 |

**Veredicto: el catálogo es correcto y §10.0 es el que quedó viejo.** El hallazgo no es del reporte.

**Y la corrección no es actualizar el número.** El número ya quedó viejo dos veces sin que nada lo
detectara, que es lo que `Root-Rules.md` §10 prohíbe para un dato derivado en la prosa. **§10.0 deja de
transcribirlo y cita `Catalogo-De-Criterios.md` §4 como única fuente.** Corregir el número lo dejaba
listo para envejecer una tercera vez.

## 4. Inventario de archivos

### 4.1 Creados

| Archivo | Qué es |
| --- | --- |
| `SDD/Devs/Guides/Coherencia-Compuerta-Con-Banco.md` 1.0 | Esta nota |

### 4.2 Editados

| Archivo | Versión | Cambio | Hilo |
| --- | --- | --- | --- |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.13 → 8.14 | §10.0: tres obligaciones nuevas, alcance como lista, recuento fuera de la prosa | Reporte 16 |
| `SDD/Devs/Rules/Root-Rules.md` | 8.4 → 8.5 | §9.2: regla de reparto interno del bloque `009xx` | Pendientes |
| `SDD/Devs/Guides/Coherencia-Renumeracion-AG.md` | 9.0 → 9.1 | §8: el ítem diferido 4 pasa a **cerrado** | Pendientes |
| `SDD/Guides/SDD-Development-Guide.md` | 1.27 → 1.28 | §III.11: corrige la afirmación que la 13.5 volvió falsa | Pendientes |

## 5. El hallazgo P1, que es el más importante del barrido

**Un ítem diferido cuyo evento de cierre ya había ocurrido siguió abierto tres versiones.**

El ítem 4 de `Coherencia-Renumeracion-AG.md` §8 declaraba que el bloque `009xx` no llevaba regla de
reparto interno, con este motivo textual: *«No hay un segundo rol de nivel producto que fuerce la
decisión: fijarla ahora sería inventar el caso»*.

**`AG-00980` fue ese segundo rol, y se acuñó en la 13.2.** El evento de cierre ocurrió ahí. El ítem
siguió abierto en la 13.3, la 13.4 y la 13.5.

`Root-Rules.md` §12.2 lo califica sin ambigüedad: **«Ítem diferido cuyo evento de cierre ya ocurrió y
sigue abierto → Hallazgo P1»**.

**Vale registrar cómo pasó, porque es instructivo.** La intervención que acuñó `AG-00980` verificó que
el identificador estuviera libre —lo estaba— y que el bloque lo admitiera —lo admitía—. **Lo que no
hizo fue preguntarse a qué ítem diferido le cumplía la condición.** La comprobación existía; nadie la
corrió contra el registro de diferidos.

## 6. Lo que se decidió y lo que se difirió, uno por uno

| Ítem | Decisión | Fundamento |
| --- | --- | --- |
| Reporte §6.1, banco de inyección | **Se aplica** | Es la causa raíz. Los cuatro PR fallidos tuvieron revisión; lo que no tuvieron fue una prueba que fallara |
| Reporte §6.2, alcance como lista | **Se aplica** | Sin enumerar, el despacho del audit pierde la mitad que más vale: «esto no lo miré y es tuyo» |
| Reporte §6.3, cerrado exige caso | **Se aplica** | Es la corrección más chica y la que rompe el ciclo de reincidencia |
| Reporte §6.4, banco central | **Se descarta con fundamento** | Cae en `SDD-Development-Guide.md` §II.7. **La obligación es del método; el banco es del destino** |
| Reporte §8.1, el recuento | **Se aplica, y distinto de lo propuesto** | Medido: el catálogo está bien. Se saca el número de la prosa en vez de actualizarlo |
| Reporte §8.2, archivado fallido | **Se difiere** | Ver §7 |
| Pendiente: reparto de `009xx` | **Se aplica y cierra el diferido** | Su evento de cierre ocurrió |
| Pendiente: solapamiento `009xx` con categorías `90`-`99` | **Sigue diferido, y se declara agravado** | Su evento de cierre **no** ocurrió. Ahora hay dos ocupantes en vez de uno |

## 7. El diferimiento de §8.2, declarado con los cuatro campos de §12.2

El prompt del fix pide elegir explícitamente entre resolver §8.2 ahora con la evidencia de un solo
destino, o diferirlo hasta que el reporte `17` exista. **Se difiere**, y por dos motivos:

1. **§8.2 converge con `HM-03`, medido en un destino cuyo reporte todavía no existe.** Resolverlo ahora
   importaría esa evidencia por la puerta de atrás, cuando el propio prompt la declara fuera de rango.
2. **Una regla sobre qué hacer cuando un archivado salió mal, escrita desde un único incidente, es
   justamente la generalidad que el prompt advierte no heredar del reporte.**

| Campo | Valor |
| --- | --- |
| **Qué falta** | `Master-Prompt.md` §5.1 no declara qué hacer cuando un archivado a `_legacy/` salió mal |
| **Por qué no hoy** | La evidencia disponible es de un solo destino y su reporte no existe; se resuelve junto con él |
| **Quién lo cierra** | La organización dueña del repositorio |
| **En qué evento se cierra** | Cuando el reporte `17` se emita con `HM-03` escrito, o cuando un segundo destino mida el mismo defecto |

## 8. Verificación contra los cuatro criterios de §7 del reporte

| # | Criterio | Veredicto |
| --- | --- | --- |
| 1 | Toda comprobación tiene al menos un caso; casos ≥ comprobaciones | **Exigido desde 13.6.** §10.0 obligación 1. No verificable sobre el framework: se verifica en cada destino, que es donde vive la compuerta |
| 2 | Todo recorte declarado tiene su caso de la clase inversa | **Exigido desde 13.6.** §10.0 obligación 2 |
| 3 | Un hallazgo sobre el instrumento no pasa a «cerrado» sin su caso | **Exigido desde 13.6.** §10.0 obligación 3, con la condición de que el caso **falle antes y pase después**. Es el decisivo y quedó escrito con esa palabra |
| 4 | La proporción de hallazgos detectables por guion se declara en cada informe | **Ya estaba exigido** en §10 punto 6.2 y no se toca. El defecto que el reporte midió es de **cumplimiento**, y una norma que ya existe no se corrige agregándola de nuevo |

**Sobre el criterio 4, que es el único que no se atiende con una edición.** El reporte midió que ninguna
de las ocho rondas lo declaró hasta que se lo pidieron. Eso no es un hueco normativo: es una norma que
no se cumplió. Agregarla otra vez habría sido tratar el síntoma, y la habría duplicado.

## 9. Impacto sobre destinos existentes

**Es una obligación nueva sobre el instrumento del destino, y hay que decirlo con precisión.** Un
destino con compuerta ya escrita **no queda incumpliendo el día de la publicación**: §10.0 declara que
la obligación rige para las compuertas escritas desde esta versión en adelante, y que una compuerta
existente trae su banco **en la próxima intervención que la toque**, declarando hasta entonces la
ausencia como recorte.

**No es una migración.** Nada de lo ya emitido deja de cumplir y ningún destino tiene trabajo forzado
por la publicación. El precedente del alcance temporal es la conformidad D9 de la propia §10.0, que
tampoco se aplicó retroactivamente.

## 10. Verificación de invariantes

| Invariante | Verificación | Resultado |
| --- | --- | --- |
| **D1** | Español rioplatense, sin emojis ni marketing | Cumple |
| **D2** | UTF-8 sin BOM, LF. Conteo de `\r` = 0 en los cinco archivos | Cumple |
| **D3** | `Coherencia-Compuerta-Con-Banco.md`, Título-Con-Guiones ASCII. `AG-00980` cumple `AG-[0-9]{5}` | Cumple |
| **D4/D5** | Los cuatro editados suben versión con su fila. Conjunto superado archivado completo | Cumple |
| **D6** | Esta nota inventaría lo tocado; el reporte cierra su fila; el `CHANGELOG.md` registra | Cumple |
| **D7** | Nada de lo agregado nombra un dominio, cliente o producto concreto | Cumple |
| **D8** | No se toca ningún tipo de proyecto de código | Cumple |
| **D9** | Cada afirmación numérica de esta nota trae el comando que la mide, no la cita de quien la afirmó | Cumple |

## 11. Veredicto

**Coherente.** La exclusión de alcance deja de concederse contra una declaración y pasa a concederse
contra evidencia. El ítem diferido con su evento cumplido queda cerrado, y el que sigue legítimamente
abierto queda declarado con su agravamiento. Ninguna regla existente se deroga y ningún destino queda
incumpliendo por la publicación. El conjunto sube **minor**.

## 12. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-23 | Emisión inicial. Cubre la aplicación del reporte `16`, la medición de §8.1, el diferimiento declarado de §8.2 y el cierre del ítem diferido 4 de la renumeración de `AG`. |
