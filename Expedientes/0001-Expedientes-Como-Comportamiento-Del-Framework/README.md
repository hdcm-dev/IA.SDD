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
| Estado | **En trámite** — mesa convocada, panel despachado |
| Apertura | 2026-09-13 |
| Partes | **Presenta**: Product Owner del `Framework SDD`. **Tramita**: orquestador de la corrida (Claude Opus 5), como presidente de mesa sin voto. **Panel**: ocho comisiones (actuación 002 §3) |
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

## Punto de continuación

**Dónde está el caso**: mesa convocada (002); **ocho comisiones despachadas a ciegas y en paralelo** el
2026-09-13. Ningún informe asentado todavía.

**Qué sigue**: asentar cada informe **verbatim** como actuación `informe` (folios 003 a 010, en el orden
de la tabla de 002 §3); consolidar; despachar al refutador con los ocho informes; jurado; dictamen;
reporte `31`; prompt `09`.

**Si la corrida se corta acá**: los informes que no estén asentados no existen para el expediente. Se
vuelven a despachar con la carta de 002 §3 —no se reconstruyen de memoria—, y el expediente declara la
segunda convocatoria en una actuación nueva.
