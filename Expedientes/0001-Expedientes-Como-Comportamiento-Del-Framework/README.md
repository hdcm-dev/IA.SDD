# Expediente 0001 — Expedientes como comportamiento del framework

> **Forma provisoria.** Este expediente es a la vez el caso y **el primer ejemplar vivo** de la forma que
> su mesa propone. La forma no es norma hasta que la aplique la intervención
> `IA.SDD.Documentacion/PROMPTs/Fixs/09-Fix-Reporte-31/`. Mientras tanto, lo que acá se ve es una
> propuesta en uso, no una obligación.

## Carátula

| Campo | Valor |
|---|---|
| Número | `0001` |
| Título | Expedientes como comportamiento del framework |
| Estado | **En trámite**: refutación asentada (014); veredictos pendientes |
| Apertura | 2026-09-13 |
| Partes | **Presenta**: Product Owner del `Framework SDD`. **Tramita**: orquestador de la corrida (Claude Opus 5), como presidente de mesa sin voto. **Panel**: ocho comisiones (actuación 002 §3), con una réplica a ciegas en `ev-06` (actuación 003) |
| Objeto | Diseñar cómo el `Framework SDD` adopta los expedientes de caso como comportamiento propio: dónde viven, cuándo se abren y cuándo no, su forma mínima, su identificador, su ciclo de vida, su evidencia y cómo esa evidencia pasa a formar parte de la especificación; su relación con `SDD/Docs/Audit/`, con la serie de reportes y con lo ya escrito; y el reemplazo de la detención por la mesa |
| Origen | Presentación del Product Owner del 2026-09-13 (actuación 001) |
| Versión del framework | SDD **13.16** (`IA.SDD` `main` `8c55a1e`) |
| Repositorio y rama | `IA.SDD`, rama `expedientes/0001-caso` (worktree `IA.SDD-exp1`). **Sin push ni PR** |
| Salidas previstas | Reporte `31` y prompt de intervención `09`, en `IA.SDD.Documentacion` rama `reportes/31-expedientes` |

## Índice de actuaciones

**Foliadas y nunca reescritas.** Una corrección es una actuación nueva que nombra el folio que corrige.

| Folio | Tipo | Fecha | Autor | Actuación |
|---|---|---|---|---|
| 001 | `presentacion` | 2026-09-13 | Product Owner (transcripción literal) | [Presentación del caso](actuaciones/001-presentacion-del-product-owner.md) |
| 002 | `providencia` | 2026-09-13 | Presidente de mesa | [Convocatoria de mesa: contrato de entrada y panel](actuaciones/002-providencia-convocatoria-de-mesa.md) |
| 003 | `constancia` | 2026-09-13 | Presidente de mesa | [Dos convocatorias del mismo panel, y el dato de la 13.17](actuaciones/003-constancia-segunda-convocatoria-y-dato-nuevo.md) |
| 004 | `informe` | 2026-09-13 | Comisión V1, gestión documental | [Informe V1](actuaciones/004-informe-gestion-documental.md) |
| 005 | `informe` | 2026-09-13 | Comisión V2, evidencia digital | [Informe V2](actuaciones/005-informe-evidencia-digital.md) |
| 006 | `informe` | 2026-09-13 | Comisión V4, ingeniería de software | [Informe V4](actuaciones/006-informe-ingenieria-de-software.md) |
| 007 | `informe` | 2026-09-13 | Comisión V5, metodología académica | [Informe V5](actuaciones/007-informe-metodologia-academica.md) |
| 008 | `informe` | 2026-09-13 | Comisión N3, lector sin contexto | [Informe N3](actuaciones/008-informe-lector-sin-contexto.md) |
| 009 | `informe` | 2026-09-13 | Comisión V3, procedimiento de expediente | [Informe V3](actuaciones/009-informe-procedimiento-de-expediente.md) |
| 010 | `informe` | 2026-09-13 | Comisión N2, verificación | [Informe N2](actuaciones/010-informe-verificacion.md) |
| 011 | `informe` | 2026-09-13 | Comisión N1, requisitos | [Informe N1](actuaciones/011-informe-requisitos.md) |
| 012 | `constancia` | 2026-09-13 | Presidente de mesa | [La presentación del folio 001 no es literal: el original queda como `ev-07`](actuaciones/012-constancia-la-presentacion-001-no-es-literal.md) |
| 013 | `providencia` | 2026-09-13 | Presidente de mesa | [Consolidación del panel y plan compuesto](actuaciones/013-consolidacion-y-plan-compuesto.md) |
| 014 | `refutacion` | 2026-09-13 | Refutador | [Refutación del plan compuesto: 14 ataques, forma mínima alternativa](actuaciones/014-refutacion-del-plan-compuesto.md) |

## Índice de evidencia

Integridad: `sha256sum -c evidencia/SHA256SUMS`, desde `evidencia/`. **Cada salida se obtuvo corriendo
su guion el 2026-09-13 contra la base de la actuación 002.**

| Id | Qué muestra | Procedencia | SHA-256 de la salida |
|---|---|---|---|
| `ev-01` | Base de la corrida: commits de los cuatro repositorios, worktrees, y las carpetas `Expedientes` del workspace con su cantidad de entradas | [`ev-01-base.sh`](evidencia/ev-01-base.sh) → [`.out`](evidencia/ev-01-base.out) | `61bb3917…f86a` |
| `ev-02` | Qué copia el snapshot `_legacy/<N>/`: raíz del repositorio contra `_legacy/9.6`, `13.0` y `13.15`, y la línea de exclusiones de la guía §VI.5 | [`ev-02-snapshot.sh`](evidencia/ev-02-snapshot.sh) → [`.out`](evidencia/ev-02-snapshot.out) | `dcf82b62…2fdd3` |
| `ev-03` | Colisión del prefijo `EXP-` en cuatro repositorios y del término «expediente» | [`ev-03-colision.sh`](evidencia/ev-03-colision.sh) → [`.out`](evidencia/ev-03-colision.out) | `239f1971…5fdd3` |
| `ev-04` | Inventario de lo ya escrito: `Audit/` de dos destinos por prefijo, carpetas `_legacy/` de destino y `OUTPUTs/` de las intervenciones | [`ev-04-inventario.sh`](evidencia/ev-04-inventario.sh) → [`.out`](evidencia/ev-04-inventario.out) | `233c0563…c81` |
| `ev-05` | Las líneas de la norma 13.16 que el caso cita | [`ev-05-citas.sh`](evidencia/ev-05-citas.sh) → [`.out`](evidencia/ev-05-citas.out) | `29417eca…4d34042` |
| `ev-06` | Réplica a ciegas del panel: los ocho informes de la segunda convocatoria, verbatim, con despacho y entrega | [`ev-06-segunda-convocatoria/`](evidencia/ev-06-segunda-convocatoria/README.md), manifiesto propio | ver `ev-06-segunda-convocatoria/SHA256SUMS` |
| `ev-07` | **Presentación original del Product Owner, byte a byte** (2026-09-13T12:03:02-03:00, 1486 bytes). Rige sobre el folio 001 (folio 012) | Extracción mecánica de la transcripción de la sesión: [`ev-07-presentacion-original.txt`](evidencia/ev-07-presentacion-original.txt) y [`.meta.txt`](evidencia/ev-07-presentacion-original.meta.txt) | `cb39bbd64dd919e3bb7ad484779c4215af473892cf02de5b797c76046f63dd1c` (`SHA256SUMS-ev-07`) |
| `ev-08` | Encargo a la corrida y cartas despachadas: 16 de comisión y la del refutador, verbatim y en orden de despacho | Extracción mecánica de las llamadas de despacho: [`ev-08-cartas-despachadas/`](evidencia/ev-08-cartas-despachadas/README.md) | ver `ev-08-cartas-despachadas/SHA256SUMS` |

## Punto de continuación

**Dónde está el caso.**
- Último folio: **014**. La refutación cambia 15 de los 19 ítems del plan, resiste en 4, y propone una forma mínima de 18 campos contra los 47 del plan.
- Las cartas despachadas quedaron asentadas en `ev-08`.

**Qué sigue, y quién.**

| Paso | Folio | Quién |
|---|---|---|
| Veredictos sobre J-01 a J-07, Q1 a Q12 y los ataques R-01 a R-14 | 015 | Jurado de cinco funciones, despachado el 2026-09-13 |
| Dictamen | 016 | Presidente, a partir de los veredictos |
| Corrección de las huellas truncadas de `ev-02` y `ev-05`, y constancia de las cartas asentadas tarde | 017 | Presidente |

Después vienen el reporte `31` y el prompt `09`. La intervención se numera como la siguiente a la vigente, probablemente la 13.18.

**Base.** Rama `expedientes/0001-caso`. Norma 13.16 (`8c55a1e`).

**Si la corrida se corta.**
- Lo que no esté commiteado no existe.
- Antes de volver a despachar el jurado, comprobar si el despacho anterior terminó (folio 003).
