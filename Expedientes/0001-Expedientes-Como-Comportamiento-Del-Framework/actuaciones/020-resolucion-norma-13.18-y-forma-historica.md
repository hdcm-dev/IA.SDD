# Actuación 020 — Resolución: la norma que el caso pidió es la 13.18, y este expediente queda como forma histórica

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 020 |
| Tipo | `resolucion` |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa de la intervención `09`, que es el órgano que el folio 016 §9 designó para resolver |
| Corrige | — |

---

## 1. Qué se resuelve

**El `Framework SDD` adopta el caso como figura normada.** La norma es `SDD/Devs/Rules/Expediente-Rules.md`
1.0, publicada en **SDD 13.18**, con el cableado en `Master-Prompt.md` 8.20, `Master-Prompt-Migracion.md`
2.11, `Master-Prompt-Reanudacion.md` 1.14, `Mesa-Rules.md` 1.4, `Migracion-Rules.md` 3.21, `Root-Rules.md`
8.8, `Catalogo-De-Criterios.md` 1.19, `SDD-Development-Guide.md` 1.31, `README.md` y la alineación por
remisión de `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` 1.1.

La intervención `09` **no aplicó el dictamen de este expediente al pie de la letra**: lo sometió a una mesa
propia —Seguridad, Formal y Trazabilidad documental, las tres que este expediente postergó; Requisitos,
Verificación, Lector sin contexto y un refutador— y a un **jurado de cinco agentes distintos**, que votó
diecisiete ítems 5-0. El registro está en `IA.SDD.Documentacion/PROMPTs/Fixs/09-Fix-Reporte-31/OUTPUTs/`.

## 2. Veredicto por pregunta del caso (folio 016 §2)

| Q | Veredicto | Qué cambió respecto del dictamen, y dónde está el fundamento |
|---|---|---|
| Q1 Dónde vive | **Aplicada** | Igual; la reformulación de la autosuficiencia quedó en `README.md` con la regla de visibilidad |
| Q2 Cuándo se abre | **Aplicada con cambio** | Precedencia explícita entre ramas y exclusiones, y radicación donde corre la corrida (J9-05) |
| Q3 Forma mínima | **Aplicada con cambio** | La carátula suma `Objeto`: diecinueve campos y no dieciocho, por la letra de `ev-07` (J9-13); en un destino el panel se folia por enlace (J9-04); tres momentos de uso (J9-14) |
| Q4 Identificador | **Aplicada con cambio** | **Cuatro dígitos** y no cinco: una familia excluida no usa el ancho de `Root-Rules.md` §9.2, y con cinco A1 fallaba para siempre (J9-03) |
| Q5 Estados | **Aplicada con cambio** | El estado se deriva de la secuencia: una errata no reabre (J9-06) |
| Q6 Inmutabilidad | **Aplicada con cambio declarado** | S1 desde el primer push, con **una excepción**: la redacción S2 con constancia, como el folio 019 (J9-07) |
| Q7 Evidencia | **Aplicada con cambio** | S2 por clase de dato, visibilidad verificada o declarada por el dueño, antes de cada push (J9-08). **E-3 por la opción C**: D9 intacta (J9-02) |
| Q8 Evidencia → especificación | **Aplicada con cambio** | La cita puede ir directa o a través del registro de `Audit/` (J9-10) |
| Q9 Relación con `Audit/` | **Aplicada** | Igual (J9-04) |
| Q10 Retroactivo | **Aplicada** | Este expediente y el de la migración de `Lab-Geometria` son **forma histórica** (§3) |
| Q11 Mesa y no detención | **Aplicada con cambio** | Párrafo con fundamento en `Master-Prompt.md` §8.1, cableado también en la reanudación (J9-11) |
| Q12 Punto de continuación | **Aplicada con cambio** | La reanudación lee sólo expedientes de forma vigente (J9-12) |

**Deuda del folio 015 §6 y del 016 §4:** D-2, D-5 y D-6 **cerradas** por la mesa de la intervención `09`,
con Seguridad, Formal y Trazabilidad convocadas; D-3 **cerrada por remisión**; D-7 **cerrada**, con
conservación permanente (`Expediente-Rules.md` §2); D-4 cerrada por el folio 016; **D-1 sigue siendo de la
corrida de migración de `Lab-Geometria`** y esta resolución no la cierra.

## 3. Este expediente queda como forma histórica

- **No se renombra, no se alinea y no se le exigen A2 a A12** (`Expediente-Rules.md` §5.1). Su nombre de
  carpeta ya es conforme con los cuatro dígitos.
- **Su `README.md` no se edita**: su índice y su punto de continuación quedan como estaban al fusionarse, y
  el estado de este expediente es el que deriva esta resolución. Quien lo abra lee el último folio.
- **Los folios 019 y 020 se agregaron después de la fusión**, que es alta y no modificación; la única
  modificación de piezas publicadas es la redacción S2 del folio 019.

Sigue: nada en este expediente · — · Cierra con: `CHANGELOG.md` de `IA.SDD`, entrada `[13.18]`
