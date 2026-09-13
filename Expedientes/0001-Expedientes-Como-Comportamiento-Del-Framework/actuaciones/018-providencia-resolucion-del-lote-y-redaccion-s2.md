# Actuación 018 — Providencia: resolución del lote E-1, E-2 y E-3, y redacción S2

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 018 |
| Tipo | `providencia` |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa, sobre la instrucción del orquestador de la sesión, que resolvió el lote **con el conjunto** y sin elevarlo al Product Owner |
| Corrige | Ninguna actuación. Redacta piezas ya asentadas (§3), por la regla S2 del dictamen (016 Q7): la pieza redactada es **derivada** y el original queda custodiado |

---

## 1. Resolución de las tres escaladas del folio 015 §5

| Escalada | Resolución | Fundamento |
|---|---|---|
| **E-1** (disparador 1) | **A.** Los expedientes del framework viven en `IA.SDD/Expedientes/`. | La ruta literal del Product Owner en `ev-07` («`/IA/SDD/IA.SDD/Expedientes`») expresa su intención: **no hay ambigüedad**. La reformulación de `README.md` l.152 la declara la intervención `09` |
| **E-2** (disparador 5) | **A.** El nombre copiado es un **dato personal**: la fuente es `evidencia/2026-09-02-mesa-ux/antes/` de `Lab-Geometria`, capturas del laboratorio **publicado** antes del ciclo, con una cuenta de producción. | Se redacta la copia en el expediente (§3). **La fuente en `Lab-Geometria` no se toca**: la trata el Product Owner después de la migración |
| **E-3** (disparador 7) | **No es pregunta: es insumo de la intervención `09`.** | La presentación (`ev-07`) dice que «las pruebas que aporse yo o las que obtuviesen los agentes quedarian como prte de las especificaciones»: intención declarada y fechada. Si D9 suma o no una oración, y con qué forma, lo decide la mesa de la intervención `09` con esa cita como **restricción dura**. El prompt `09` se actualiza para decirlo |

## 2. Rutas del host

Toda ruta `/home/<usuario>/workspaces/workspace-dev/...` de las piezas del expediente pasa a la forma raíz del workspace que usa la casa (`/IA/SDD/...`, `/PROG2/...`, `/Repos-RPIs/...`). En los guiones, `W=/`. Las rutas abreviadas con puntos suspensivos pasan a `/…/`.

## 3. Redacción S2: qué se cambió, con huella antes y después

- **Sustituciones:** el nombre de la cuenta → `[nombre de cuenta redactado]`; las rutas del host → forma raíz (§2).
- **Originales:** custodia local del orquestador, fuera del repositorio, con el manifiesto `HUELLAS-ANTES.txt` de las 33 piezas.
- **Manifiestos regenerados:** `evidencia/SHA256SUMS` (cambiaron `ev-01-base.out`, `ev-03-colision.out` y los cinco `.sh`), `ev-06-segunda-convocatoria/SHA256SUMS` (`V1.md`) y `ev-08-cartas-despachadas/SHA256SUMS` (las 18 cartas). `SHA256SUMS-ev-07` no cambia: `ev-07` no tenía rutas de host ni el nombre.
- **Los folios 005, 006, 007, 010, 011, 014 y 015 quedan redactados.** Sus cabeceras siguen mostrando la huella del cuerpo **original**, que ya no coincide con el texto: es a propósito, porque la cabecera es parte del folio y no se reescribe. La huella vigente de cada uno es la de esta tabla.
- **El historial de la rama conserva los originales** (commits `e8c84d9` a `8512a45`). No se reescribió ningún commit. Si el historial publicado no debe contenerlos, lo resuelve el Product Owner al fusionar con squash.

| Pieza | SHA-256 antes (16) | SHA-256 después (16) |
|---|---|---|
| `actuaciones/005-informe-evidencia-digital.md` | `daf465b5ea42d743…` | `82467ed396da398e…` |
| `actuaciones/006-informe-ingenieria-de-software.md` | `63b49ffca6905631…` | `aa83ea4bb8e79ccd…` |
| `actuaciones/007-informe-metodologia-academica.md` | `4082859c7fdc9dc7…` | `a4401d1db5182738…` |
| `actuaciones/010-informe-verificacion.md` | `e053a0922add66ed…` | `52daae4688f3f70f…` |
| `actuaciones/011-informe-requisitos.md` | `b028aba7aef1afd2…` | `0f2b246bbfb2311a…` |
| `actuaciones/014-refutacion-del-plan-compuesto.md` | `860fd5bcd8891c23…` | `c403970ba213817b…` |
| `actuaciones/015-veredicto-del-jurado.md` | `20203b1432cb165f…` | `cfd93d7cfe17b9ac…` |
| `evidencia/ev-01-base.out` | `61bb391755772118…` | `9be3a449260f9eb5…` |
| `evidencia/ev-01-base.sh` | `aa8977b0c6fdce3f…` | `942143712ac31e92…` |
| `evidencia/ev-02-snapshot.sh` | `5c8d7c01ed83ff82…` | `adff9c61f692408d…` |
| `evidencia/ev-03-colision.out` | `239f1971ebe92edf…` | `dd411d4a5bbfaf88…` |
| `evidencia/ev-03-colision.sh` | `87c13b1b734bb1ec…` | `0a42b3f94bb5228f…` |
| `evidencia/ev-04-inventario.sh` | `b27f211fd9f4804a…` | `a512a178167bb65e…` |
| `evidencia/ev-05-citas.sh` | `c93f0f88f9761064…` | `eaa650a1ce24709a…` |
| `evidencia/ev-06-segunda-convocatoria/V1.md` | `32ad7e48f80f1dfc…` | `15f39e69a20e77b5…` |
| `evidencia/ev-08-cartas-despachadas/01-Caso-EXP-0001--expedientes-en-el-framework.md` | `06bc34803f0dd756…` | `4112c0807f8aa0ca…` |
| `evidencia/ev-08-cartas-despachadas/02-Comisión-V1-gestión-documental.md` | `b1b3bdb6b3708bff…` | `1e70f5cb5d6ee6b9…` |
| `evidencia/ev-08-cartas-despachadas/03-Comisión-V2-evidencia-digital.md` | `238282b4328d1708…` | `c5dce13155900b82…` |
| `evidencia/ev-08-cartas-despachadas/04-Comisión-V3-procedimiento-expediente.md` | `d88e1c551716a11c…` | `772c8302bf304c7f…` |
| `evidencia/ev-08-cartas-despachadas/05-Comisión-V4-ingeniería-de-software.md` | `f5276576336b0931…` | `40f380340178e0ea…` |
| `evidencia/ev-08-cartas-despachadas/06-Comisión-V5-metodología-académica.md` | `2d1fba729070b3bc…` | `84d6e172fdc089e4…` |
| `evidencia/ev-08-cartas-despachadas/07-Núcleo--comisión-de-requisitos.md` | `75748d04b6e190b0…` | `27da220c2c5c2d34…` |
| `evidencia/ev-08-cartas-despachadas/08-Núcleo--comisión-de-verificación.md` | `ca65f3cc855fea33…` | `554b44dfccd22470…` |
| `evidencia/ev-08-cartas-despachadas/09-Núcleo--lector-sin-contexto.md` | `f407f44725dde136…` | `1390ad62b0e33e64…` |
| `evidencia/ev-08-cartas-despachadas/10-Comisión-V1-gestión-documental.md` | `a53180ea699cb90f…` | `71e23f90eaed73fb…` |
| `evidencia/ev-08-cartas-despachadas/11-Comisión-V2-evidencia-digital.md` | `6214f26250c5b040…` | `aec1c7202c0ae1be…` |
| `evidencia/ev-08-cartas-despachadas/12-Comisión-V3-procedimiento-expediente.md` | `45cb2f8a70f6ddf5…` | `364c91c193b91086…` |
| `evidencia/ev-08-cartas-despachadas/13-Comisión-V4-ingeniería-de-software.md` | `98e26dc1082a5be5…` | `ae80d5e8f95c89ed…` |
| `evidencia/ev-08-cartas-despachadas/14-Comisión-V5-metodología-académica.md` | `52a9e058538781af…` | `0529b19fa12708e1…` |
| `evidencia/ev-08-cartas-despachadas/15-Núcleo--comisión-de-requisitos.md` | `c6519b7963d11799…` | `6c0459fce70ced09…` |
| `evidencia/ev-08-cartas-despachadas/16-Núcleo--comisión-de-verificación.md` | `736047bd7ccc68c1…` | `4d3e9eacb003a10d…` |
| `evidencia/ev-08-cartas-despachadas/17-Núcleo--lector-sin-contexto.md` | `60978698ff5bb4fb…` | `143bd62120d49e0e…` |
| `evidencia/ev-08-cartas-despachadas/18-Refutador-del-plan-compuesto.md` | `e1a643bf4b5a79dd…` | `5579ad95f2b1ee12…` |
## 4. Lo mismo en `IA.SDD.Documentacion`

El reporte `31` y el prompt `09` no tenían rutas de host ni el nombre (medido: 0 líneas). El prompt `09` se actualiza en su sección de escaladas conforme a §1, en la rama `reportes/31-expedientes`.

Sigue: intervención `09` · quien la ejecute. Este expediente queda **dictaminado**, con el lote resuelto.
