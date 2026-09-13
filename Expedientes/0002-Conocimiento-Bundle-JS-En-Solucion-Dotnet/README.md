# Expediente 0002 — Conocimiento `Bundle-JS`: un bundle JavaScript en el árbol de una solución .NET

> **Forma provisoria**, la misma que dejó en uso el expediente `0001`: carátula de cinco campos, folios
> contiguos que nunca se reescriben, pase al final de cada folio, evidencia que abre con método, base y
> quién. No es norma hasta que la intervención `09-Fix-Reporte-31` la aplique.

## Carátula

| Campo | Valor |
|---|---|
| Número | `0002` |
| Título | Conocimiento `Bundle-JS`: un bundle JavaScript en el árbol de una solución .NET |
| Apertura | 2026-09-13 |
| Origen | Tool-prompt del Product Owner `IA.SDD.Documentacion/PROMPTs/SDD/Catalogado/02-Extraccion-Concepto-Espcificacion-Integracion-Proyecto-Bundle-JS/`, preservado en `evidencia/ev-05-presentacion-original.md` (actuación 001) |
| Base | `IA.SDD` `main` `a501857` (13.17) · `IA.SDD.Documentacion` `main` `3f78a5c` · `<F1>` `main` `9aabe5c` — `evidencia/ev-01-base.out` |

Índice de actuaciones: `actuaciones/`. Estado y qué sigue: el pase del último folio.

## Índice de actuaciones

| Folio | Tipo | Autor | Actuación |
|---|---|---|---|
| 001 | `presentacion` | Product Owner, asienta el presidente | [Presentación del caso](actuaciones/001-presentacion-del-product-owner.md) |
| 002 | `providencia` | Presidente de mesa | [Convocatoria de mesa: contrato de entrada, compuerta mecánica y panel](actuaciones/002-providencia-convocatoria-de-mesa.md) |
| 003 | `informe` | Comisión N1, requisitos | [Informe N1](actuaciones/003-informe-requisitos.md) |
| 004 | `informe` | Comisión N2, verificación | [Informe N2](actuaciones/004-informe-verificacion.md) |
| 005 | `informe` | Comisión N3, lector sin contexto | [Informe N3](actuaciones/005-informe-lector-sin-contexto.md) |
| 006 | `informe` | Comisión V1, arquitectura de integración | [Informe V1](actuaciones/006-informe-arquitectura-integracion.md) |
| 007 | `informe` | Comisión V2, contrato con el consumidor | [Informe V2](actuaciones/007-informe-contrato-js-dotnet.md) |
| 008 | `informe` | Comisión V3, operación y entrega | [Informe V3](actuaciones/008-informe-cadena-de-construccion.md) |
| 009 | `informe` | Ad hoc AH-1, ingeniería del bundle | [Informe AH-1](actuaciones/009-informe-ingenieria-del-bundle.md) |
| 010 | `informe` | Ad hoc AH-2, interoperabilidad Blazor | [Informe AH-2](actuaciones/010-informe-interop-blazor.md) |
| 011 | `providencia` | Presidente de mesa, como relator | [Consolidación del panel y plan compuesto](actuaciones/011-consolidacion-y-plan-compuesto.md) |
| 012 | `informe` | Refutador | [Refutación del plan compuesto: 16 ataques](actuaciones/012-refutacion-del-plan-compuesto.md) |
| 013 | `informe` | Jurado de cinco funciones | [Veredicto: 15/16 ataques proceden, defaults como deuda, ESC-001](actuaciones/013-veredicto-del-jurado.md) |
| 014 | `providencia` | Presidente de mesa | [Dictamen: especificación del documento, deuda D-1 a D-6, cierre de mesa](actuaciones/014-dictamen.md) |
| 015 | `resolucion` | Presidente de mesa | [Verificación: el documento cumple el dictamen; ocho defectos corregidos; ESC-001 pendiente](actuaciones/015-verificacion-del-documento.md) |
| 016 | `constancia` | Presidente de mesa, a pedido del Product Owner | [Redacción S2 del producto privado y del host; ESC-001 resuelta por opción B](actuaciones/016-constancia-redaccion-s2-del-producto-privado.md) |

## Índice de evidencia

Integridad: `sha256sum -c SHA256SUMS` corrido desde `evidencia/`; `ev-07` lleva manifiesto propio. Cada
salida se obtuvo corriendo su guion el 2026-09-13 contra la base de la carátula. Los dos manifiestos se
regeneraron en el folio 016 después de la redacción S2; las huellas previas de cada pieza redactada están en ese folio.

| Id | Qué muestra | Procedencia |
|---|---|---|
| `ev-01` | Base de la corrida: commits y ramas de los tres repositorios, versión vigente y último snapshot del framework | [`ev-01-base.sh`](evidencia/ev-01-base.sh) → [`.out`](evidencia/ev-01-base.out) |
| `ev-02` | Las líneas de la norma 13.17 que el caso cita, y la cuenta de «PoC» en el conjunto normativo (cero) | [`ev-02-citas.sh`](evidencia/ev-02-citas.sh) → [`.out`](evidencia/ev-02-citas.out) |
| `ev-03` | Precedente real fijado a commit: un bundle TypeScript dentro de una biblioteca de clases Razor generado con el framework —árbol, `package.json`, targets de MSBuild, contrato de los dos lados, interoperabilidad, dos ADR, consumo desde la maqueta | [`ev-03-precedente.sh`](evidencia/ev-03-precedente.sh) → [`.out`](evidencia/ev-03-precedente.out) |
| `ev-04` | Huella, tamaño e índice del tool-prompt y del documento de entrada (árbol de trabajo, no fijado a commit) | [`ev-04-input.sh`](evidencia/ev-04-input.sh) → [`.out`](evidencia/ev-04-input.out) |
| `ev-05` | **Presentación original del Product Owner, byte a byte**: el tool-prompt tal como se invocó | [`ev-05-presentacion-original.md`](evidencia/ev-05-presentacion-original.md) |
| `ev-06` | Compuerta mecánica: todo archivo del framework citado por el documento de entrada resuelve, y toda sección citada tiene encabezado | [`ev-06-chequeo-mecanico.sh`](evidencia/ev-06-chequeo-mecanico.sh) → [`.out`](evidencia/ev-06-chequeo-mecanico.out) |
| `ev-07` | Encargo común, las ocho cartas de comisión y las del refutador y el jurado, asentadas **antes** de cada despacho, con manifiesto propio | [`ev-07-cartas-despachadas/`](evidencia/ev-07-cartas-despachadas/) |
| `ev-08` | Registro de estáticos en el primer build desde limpio: defecto reproducido y corrección probada sobre una copia del precedente F1, SDK 10.0.400 | [`ev-08-registro-de-estaticos.md`](evidencia/ev-08-registro-de-estaticos.md) |
| `ev-09` | Dos artefactos desde la misma construcción (bundle empaquetado, `main.js` sin empaquetar) y acuse íntegro por un doble de la referencia .NET | [`ev-09-dos-artefactos/`](evidencia/ev-09-dos-artefactos/) → `corrida.out` |
| `ev-10` | Esqueletos del §5 del documento construidos de punta a punta y criterios de §6.1 | [`ev-10-esqueletos-de-punta-a-punta.md`](evidencia/ev-10-esqueletos-de-punta-a-punta.md) |
| `ev-11` | Chequeos enumerables de formato sobre el documento producido | [`ev-11-formato-del-documento.sh`](evidencia/ev-11-formato-del-documento.sh) → [`.out`](evidencia/ev-11-formato-del-documento.out) |
| `ev-12` | Redacción S2 (folio 016): cero rutas del host y recuento de los marcadores que reemplazan al producto privado | [`ev-12-ofuscacion.sh`](evidencia/ev-12-ofuscacion.sh) → [`.out`](evidencia/ev-12-ofuscacion.out) |
