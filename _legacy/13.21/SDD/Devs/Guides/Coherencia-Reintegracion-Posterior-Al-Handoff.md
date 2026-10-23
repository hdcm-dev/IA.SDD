# Nota de coherencia — Reintegración de un cambio posterior al handoff y deriva de una decisión de arquitectura

**Framework:** SDD
**Documento:** Coherencia-Reintegracion-Posterior-Al-Handoff.md
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-09-16
**Versión del conjunto resultante:** SDD 13.20
**Origen:** pedido del Product Owner, 2026-09-16, expediente `Expedientes/0003-Retroalimentacion-De-La-Especificacion-Ante-Cambios/` (actuaciones 001 y 010) — *«sería bueno que editaras tus prompts orquestadores para que incorporen el concepto de que si hacemos modificaciones en el sistema se vayan incoporando al ciclo de especificación … la mesa debería revisar de que no se cumnplio el diseño propuesto, y efectuar una corrección ya en el prompt orquestador que le corresponda»*

---

## 1. Alcance

Dos huecos del mismo lazo, medidos en un destino privado sobre cuatro expedientes cerrados en tres días:

1. **Un cambio aplicado después del handoff no volvía a la especificación.** El único evento que reabre 00 y 06 era una fila del intake que sólo el Product Owner asienta (`Rules-Backlog-Tecnico.md` §3.6); la Fase I toca 10 y 11; la mesa entrega y no aplica; el `archivo` del expediente no nombraba la especificación. Resultado: el expediente 0001 citado desde quince documentos, el 0002 desde cuatro, el 0003 desde cuatro, el 0004 desde uno; ninguno de los tres últimos tocó backlog, casos de uso ni acta (evidencia ev-01).
2. **Un desvío de una decisión de arquitectura se absolvió reescribiendo la documentación.** El diseño fijaba un modo de render; el sistema se construyó en otro; un `fix` lo consolidó sin ADR; una mesa del destino, aplicando el P0 «un documento contradice el código» sin distinguir hecho de decisión, corrigió la arquitectura «para describir el código» y fundó un ADR en el desvío (evidencia ev-03; folio 017).

## 2. La decisión de fondo

**Una sección transversal, no un archivo ni una fase.** `Root-Rules.md` §14 vive junto a §11 y §12 —la familia «cerrar el lazo con un evento que ocurre afuera»— y los orquestadores y reglas la **citan** desde cuatro canales (Fase I, plan de mesa, expediente, pedido de fusión). Un archivo `Reintegracion-Rules.md` habría pagado el eje III.8 entero (recuentos, cableado, declaración en siete categorías) sin que el mecanismo lo necesitara; una «Fase I bis» sube major por un hueco que no es de fase. Es el mismo criterio de 13.14 («se ensambló con los instrumentos que ya existen»).

**El evento de §3.6 gana fuentes y clases sin perder lo que tenía.** Se corrió el experimento que el refutador exigió antes de publicar: los dos casos con los que se midió el criterio de 13.14 no cambian de clase con las tres clases nuevas; los dos del destino que motivaron la intervención sí (folio 019 §3.1). El criterio se extiende, no se reemplaza.

**El P0 de la Fase I se acota a los documentos como hecho.** Una contradicción entre `src/` y un ADR `Aceptado` es deriva mayor (`Deriva-Rules.md` §3, dimensión nueva «decisión de arquitectura», con sonda por ADR con observable), con sus dos vías; la mesa no funda un parche sobre una decisión cerrada con una cita del código (`Mesa-Rules.md` §6.1). El filtro «descripción o control» del conocimiento gana la tercera clase, «decisión».

**Lo que se rechazó, y por qué.** Obligar a correr el modo reincorporación completo del destino (nadie lo completó nunca); reintegrar retroactivamente tres expedientes como condición de cierre (se hace por folio de alta acotado a lo que altera el compromiso); un campo nuevo en el bloque de cierre de la mesa (se escribió una vez de cuatro: la declaración va en la resolución, cuatro de cuatro); un registro de incrementos en lugar del plan de sprints (rediseño de una categoría por un síntoma que una fila resuelve); un campo `Última revisión` en las cabeceras (redundante con el historial: sólo la compuerta); alcance asentado por silencio del Product Owner (contradice el disparador 3 de la mesa).

## 3. Inventario de archivos

| Archivo | Versión | Qué cambia |
| --- | --- | --- |
| `SDD/Devs/Rules/Root-Rules.md` | 8.8 → 8.9 | §14 nueva; control de cambios pasa a §15 |
| `SDD/Devs/Rules/Rules-Backlog-Tecnico.md` | 5.3 → 5.4 | §3.6 tres fuentes y tres clases; §4.1 «Estado real» como evidencia D9 |
| `SDD/Devs/Rules/Rules-Contexto.md` | 4.6 → 4.7 | §3.5 cita pura |
| `SDD/Devs/Rules/Mesa-Rules.md` | 1.4 → 1.5 | §6.1 cita del código vs decisión cerrada; §6.6 artefacto que altera cada parche y fila `Reintegra`; §6.7 la cita; §7 disparador 3 en mesa a pedido |
| `SDD/Devs/Rules/Expediente-Rules.md` | 1.0 → 1.1 | §4 paso 4; §5 conjunción y qué se cita; §6 A13–A15, I6 |
| `SDD/Devs/Rules/Deriva-Rules.md` | 5.4 → 5.5 | §3 dimensión «decisión de arquitectura»; §2.3 `ADR-XXXXX` como elemento |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | 1.19 → 1.20 | tres situaciones |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.20 → 8.21 | §6 fila; §7 Fase I paso 1 bis; §10 P0 acotado y criterios de Fase I; §10.0 comprobaciones 9 y 10; §12.1 T3 unidades y T4 líneas; §13.1 y §15 errata §3.4→§3.6; §15 término |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.14 → 1.15 | R0 paso 4 y bloque de R1 |
| `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` | 1.1 → 1.2 | §2.1 pasos 9 y 10; §3.3 tercera clase |
| `_legacy/13.19/` | — | 137 archivos, tomados de `main` con `git archive` antes de editar, sin `Expedientes/` |

## 4. La fuente de cada afirmación

| Afirmación | Fuente |
| --- | --- |
| Tres expedientes de cuatro sin reintegrar; quince, cuatro, cuatro y un documento | `Expedientes/0003-…/evidencia/ev-01-alcance-de-los-expedientes-del-destino.out` |
| El único disparo era la fila del intake; la Fase I toca 10 y 11; la mesa no aplica; el `archivo` no nombra la especificación | folio 003 (consultor del framework), inventario de quince cláusulas con línea |
| Con el criterio binario, 0002 y 0003 eran «nomenclatura» | folio 009, ataque A3; folio 019 §3.1 |
| El bloque de cierre se escribió una de cuatro veces; la resolución cuatro de cuatro | folio 009, ataque A11 |
| El desvío nació en `src/` el 2026-08-31; el esqueleto cumplía; el fix invirtió la carga de la prueba; la mesa del 0002 absolvió | folio 017 (perito del desvío), línea de tiempo con commits; folio 018, ataque A4 |
| El P0 de Fase I no distingue hecho de decisión; ninguna dimensión de deriva ve un render mode | folio 017, PD-04 y PD-05 |
| Cinco actos escriben cookie en el destino; dos páginas quedan SSR | folio 018, ataque A6 |
| Las API de .NET 10 que el plan de migración nombra existen | folio 018 §0 (documentación oficial, moniker 10.0) |
| Fuentes de industria (IEEE 828, 12207, 29148, CMMI, PMBOK, Scrum Guide, Nygard, Martraire) | folio 008; verificadas por el refutador en folio 009 §0 |

**Lo que no se observó.** Ningún otro destino del framework; un destino generado por el orquestador de principio a fin (el del caso corre una norma propia: la corrección le llega por la mesa a pedido y el expediente, y por la enmienda a su convención de cambios que el expediente del destino propone).

## 5. Verificación

| # | Ítem | Resultado |
| --- | --- | --- |
| 1 | `[enumerable]` Cada archivo tocado sube versión y lleva su fila de control de cambios con la cita al expediente | **Cumple** — diez archivos, diez filas, `grep -c "13.20"` ≥ 1 en cada uno |
| 2 | `[enumerable]` Ninguna regla sube major; ninguna fase nueva; ningún insumo obligatorio nuevo | **Cumple** — el paso 1 bis vive dentro de la Fase I existente |
| 3 | `[enumerable]` La regla vive en un solo lugar y los demás citan (`R3`) | **Cumple** — el texto de §14 no se repite; `git grep -c "Root-Rules.md. §14"` da citas, no copias |
| 4 | `[enumerable]` La errata §3.4 queda corregida en la prosa y conservada en el historial | **Cumple** — `grep -n "Rules-Backlog-Tecnico.md. §3.4" Master-Prompt.md` → sólo las filas 8.18 y 8.21 del historial |
| 5 | `[enumerable]` `_legacy/13.19/` con el conjunto entero, sin `Expedientes/` | **Cumple** — 137 archivos |
| 6 | `[enumerable]` S2 sobre lo escrito en el framework: sin nombres del destino privado, rutas del host ni datos de personas | **Cumple** — `git grep -n -iE "pushdispatch|/home/|fernando" -- SDD Conocimiento CHANGELOG.md` → 0 |
| 7 | `[interpretativo]` El criterio ampliado se corrió sobre los cuatro casos antes de publicarse | **Cumple** — folio 019 §3.1 |
| 8 | `[interpretativo]` Ningún parche rechazado por el refutador entró | **Cumple** — §2 lista los rechazados |

## 6. Veredicto

Publicable como **13.20, minor**. Impacto sobre destinos existentes: **ninguno retroactivo** (`Root-Rules.md` §14.6): lo aplicado antes de que un destino declare 13.20 se lista en la reanudación y no cuenta como pendiente; un destino que declare 13.19 sigue cumpliendo. Lo que sí cambia para todo destino que adopte 13.20: un expediente resuelto no se archiva sin su reintegración o su declaración de clase, y el código que contradiga un ADR ya no se corrige reescribiendo el ADR.

## 7. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-09-16 | Emisión, con la intervención 13.20 |
