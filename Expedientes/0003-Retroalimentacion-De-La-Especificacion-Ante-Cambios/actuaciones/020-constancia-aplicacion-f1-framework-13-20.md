| Campo | Valor |
|---|---|
| Tipo | constancia |
| Fecha | 2026-09-16 |
| Autor | Presidente de mesa, como implementador |
| Corrige | — |

# Aplicación del tramo F1: framework 13.20

Plan del folio 019 §5, tramo F1. Aplicado en la rama `expediente-0003-retroalimentacion-de-la-especificacion` sobre `main` `b8943c2`, con `_legacy/13.19/` tomado antes de editar.

## Lo que entra

| Archivo | Versión | Cambio |
|---|---|---|
| `SDD/Devs/Rules/Root-Rules.md` | 8.9 | §14 «Reintegración de un cambio posterior al handoff» (§14.0–§14.7); control de cambios → §15 |
| `SDD/Devs/Rules/Rules-Backlog-Tecnico.md` | 5.4 | §3.6 tres fuentes del evento y tres clases del cambio; §4.1 «Estado real: entregado en el pedido de fusión #N» como evidencia D9 |
| `SDD/Devs/Rules/Rules-Contexto.md` | 4.7 | §3.5 cita pura |
| `SDD/Devs/Rules/Mesa-Rules.md` | 1.5 | §6.1 cita del código vs decisión cerrada; §6.6 artefacto que altera cada parche y fila `Reintegra`; §6.7 la cita; §7 disparador 3 en mesa a pedido |
| `SDD/Devs/Rules/Expediente-Rules.md` | 1.1 | §4 paso 4; §5 conjunción y qué se cita; §6 A13–A15, I6 |
| `SDD/Devs/Rules/Deriva-Rules.md` | 5.5 | §3 dimensión «decisión de arquitectura»; §2.3 `ADR-XXXXX` |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | 1.20 | tres situaciones |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.21 | §6 fila; §7 paso 1 bis; §10 P0 acotado y criterios; §10.0 comprobaciones 9 y 10; §12.1 T3/T4; erratas §3.4→§3.6; §15 término |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.15 | R0 paso 4; bloque de R1 |
| `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` | 1.2 | pasos 9 y 10; filtro «decisión» |
| `SDD/Devs/Guides/Coherencia-Reintegracion-Posterior-Al-Handoff.md` | 1.0 | nota de coherencia con la fuente de cada afirmación y la verificación |
| `CHANGELOG.md` | 13.20 | entrada con lo agregado, lo cambiado, lo rechazado, por qué es minor e impacto |

## Verificación

- Diez archivos normativos con versión subida y fila de control de cambios que cita este expediente; ninguna regla sube major; ninguna fase nueva.
- `grep -n "Rules-Backlog-Tecnico.md. §3.4" Master-Prompt.md` → sólo las filas 8.18 y 8.21 del historial (la prosa corregida; el historial conservado).
- S2 sobre lo escrito en el framework: `git grep -n -iE "pushdispatch|/home/|<usuario del host>" -- SDD Conocimiento CHANGELOG.md README.md` → 0.
- A1 a A9 del expediente en verde con los comandos de `Expediente-Rules.md` §6 (carátula de seis campos, foliatura contigua 001–020, cabeceras y tipos, huellas de los dos bloques de testimonio, pase del último folio, cabecera de tres líneas en cada pieza de evidencia).
- `_legacy/13.19/`: 137 archivos.

## Apartamientos declarados

- **La mesa aplicó** (providencia 002 «QUIÉN APLICA») en un objeto que no cumple `Mesa-Rules.md` §0.0 entero: rige la forma de la mesa a pedido, cuyo paso 9 es «quien el pedido designe», y el Product Owner designó («evalua, planifica, y comenza»). No hay contradicción normativa (folio 009, C6).
- **El experimento C2** se corrió por lectura (folio 019 §3.1), no por corrida de un orquestador sobre los cuatro casos: los dos de 13.14 se reclasificaron sobre su registro en `CHANGELOG.md:337`; los dos del destino sobre sus resoluciones.
- **Lo que no se observó:** ningún destino generado íntegramente por el orquestador corrió todavía la Fase I con el paso 1 bis ni la comprobación 10 de §10.0; su primera corrida real es el evento que abre la revisión de esta versión, con el mismo criterio de 13.14 → 13.15.

Sigue: fusión de 13.20 con la comprobación del pedido de fusión, y tramo F2 en el destino (expediente 0005 del destino: enmienda a su convención de cambios, reintegración de 0002–0004, ADR-23) · presidente como implementador · Cierra con: `archivo` de este expediente cuando F2 y F3 tengan su constancia en el destino y el Product Owner haya contestado el lote del folio 019 §4
