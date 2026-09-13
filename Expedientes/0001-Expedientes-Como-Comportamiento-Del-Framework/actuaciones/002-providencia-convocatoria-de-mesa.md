# Actuación 002 — Providencia: convocatoria de mesa

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 002 |
| Tipo | `providencia` |
| Fecha | 2026-09-13 |
| Autor | Orquestador de la corrida, en función de presidente de mesa (`Mesa-Rules.md` §1.1: convoca, consolida, **no vota**) |
| Base de la corrida | `IA.SDD` `main` `8c55a1e` (13.16) · `IA.SDD.Documentacion` `main` `9427b6b` · `Lab-Geometria` `main` `b9675d8` · `RPI.VideoControl` `HEAD` `9aabe5c` — `evidencia/ev-01-base.out` |

---

## 1. Desde dónde se convoca

**Por la condición de `Mesa-Rules.md` §0.0, sin orquestador que la convoque** (l.23 y l.29-32,
`evidencia/ev-05-citas.out`):

1. **Hay corpus previo** que no produjo esta corrida: el conjunto normativo 13.16, 113 archivos de
   `Lab-Geometria/SDD/Docs/Audit/`, 51 de `RPI.VideoControl/SDD/Docs/Audit/` y nueve carpetas `OUTPUTs/`
   de intervenciones (`evidencia/ev-04-inventario.out`).
2. **El estado está leído**: §2 de esta providencia, con la base de arriba.
3. **Hay una decisión de alcance por tomar** sobre ese corpus: cómo adopta el framework los expedientes.

**Lo que la mesa no puede hacer aquí, y se declara.** `Mesa-Rules.md` §2.1 fija el registro en
`SDD/Docs/Audit/Mesa-<AAAA-MM-DD>.md` **del repositorio destino**; el repositorio del framework no es
un destino y no tiene `SDD/Docs/`. **Este expediente es el registro**, con las nueve secciones de §2.2
repartidas en actuaciones (tabla de §7). Y la compuerta mecánica de `Master-Prompt.md` §10.0 (§6.2
punto 1) **es la que escribe cada destino**; el framework no la tiene, por `SDD-Development-Guide.md`
§II.7. En su lugar corren los cinco guiones de `evidencia/`, que se declaran con su alcance.

## 2. Contrato de entrada (`Mesa-Rules.md` §4)

| Campo | Valor |
|---|---|
| `objeto` | La adopción de **expedientes de caso** como comportamiento del framework: dónde viven, cuándo se abren, qué forma tienen, cómo su evidencia se vuelve parte de la especificación, cómo conviven con `SDD/Docs/Audit/`, con la serie de reportes y con lo ya escrito, y cómo el orquestador reemplaza la detención por la mesa. Volumen del corpus alcanzado: el conjunto normativo 13.16 (`SDD/`, `PROMPTS/`, `Templates/`, `README.md`) y el inventario de `ev-04` |
| `estado` | Framework **13.16** publicado; `_legacy/13.15/` tomado. **Ninguna regla usa «expediente» como figura**: una sola ocurrencia, en prosa (`Migracion-Rules.md` l.669). Las tres carpetas `Expedientes` del workspace están vacías. **Hay precedente de hecho**: `PROMPTs/Fixs/05-Fix-Reporte-27/OUTPUTs/Mesa-2026-09-12-Colision-Lexica/` tiene forma de expediente —contrato, informes numerados, refutación, plan— y llama «expedientes» a sus piezas; `Lab-Geometria` tiene una carpeta `evidencia/` en su raíz |
| `diff_normativo` | No aplica: no hay salto de versión en juego. La mesa evalúa contra 13.16 |
| `restricciones_duras` | (R1) **No se modifica** `IA.SDD/SDD/`, `PROMPTS/`, `Templates/` ni `CHANGELOG.md` en esta corrida. (R2) Destinos, **sólo lectura**. (R3) Neutralidad de stack del texto normativo (D7; reporte `30` §3.1). (R4) El framework no distribuye código ejecutable (`SDD-Development-Guide.md` §II.7). (R5) `Conocimiento/` no recibe método (`Rules-Base-Conocimiento.md` §0.1). (R6) La intocabilidad de lo archivado y de las filas de control de cambios (guía §VI.5, l.1016) |
| `decisiones_cerradas` | Registro de mesa en `SDD/Docs/Audit/` (`Mesa-Rules.md` §2.1); informes de migración y de estado en `SDD/Docs/Audit/`; condición de convocatoria y no lista de puntos (§0.0); origen del hecho calculado (`Master-Prompt.md` §8.1); ciclo de origen congelado (§8.2); lote con `SI NO RESPONDÉS` (§7.0); tipos de evidencia D9 (`Deriva-Rules.md` l.53); ámbitos y familias de identificadores (`Root-Rules.md` §9); rechazo del eje de estratos por «un procedimiento que crece deja de leerse» (9.19; `Root-Rules.md` l.809). **Se reabren sólo con ancla E1 o E2 que muestre contradicción** |
| `fuera_de_alcance` | Aplicar la norma (lo hace la intervención `09`); modificar destinos; reanalizar reportes resueltos; herramientas de un stack |
| `pendientes_declarados` | Ítem diferido de `Root-Rules.md` §13 (no hay artefacto donde quede escrita una resolución de precedencia) — relevante porque un expediente podría serlo. La memoria del orquestador registra «SDD §12.3 pendiente: no hay registro durable de ítems diferidos» — **afirmación de segunda mano, nivel `C`** hasta que una comisión la abra |
| Tope de hallazgos | **Ocho por comisión**, más hasta tres «lo que revisé y está bien» |

## 3. Registro de convocatoria (`Mesa-Rules.md` §5)

### 3.1 Núcleo permanente (§5.1)

| Rol | Pregunta |
|---|---|
| **Requisitos** | ¿Qué exactamente tiene que cumplir la figura para satisfacer P1–P7 de la actuación 001, y qué está mal pedido o empaquetado? |
| **Verificación** | ¿Cómo se verifica, con criterios `[enumerable]`, que un expediente cumple la forma mínima? ¿Qué no se puede verificar? |
| **Lector sin contexto** | ¿Alguien que no estuvo puede abrir un expediente y saber dónde está el caso y qué sigue? ¿Puede la norma 13.16 guiarlo a abrir uno? |
| **Refutador** | Ataca el plan compuesto **por su aplicación**. Entra último, con los informes a la vista |

### 3.2 Variables (§5.2 y §5.4), con su señal y su ubicación

**Ninguna de las cinco tiene titular natural en el catálogo de §5.2**: son competencias externas al
método. Se instancian **ad hoc con carta de mandato** (§5.4), dentro del techo de cinco (§5.5).

| # | Comisión | Señal en el corpus, con ubicación | No-competencia |
|---|---|---|---|
| V1 | **Gestión documental y de registros** | «un registro que se corrige después deja de ser un registro» (guía §VI.5 l.1016); `_legacy/` como archivo de versiones (`README.md` l.40); retención implícita en los 5994 archivos de `_legacy/` (`ev-02`) | Evidencia digital forense; procedimiento judicial |
| V2 | **Evidencia digital y cadena de custodia** | D9 y sus cuatro condiciones de evidencia (`Deriva-Rules.md` §1, l.53-55: «una captura de una conversación» no es evidencia); P4 de la actuación 001 | Diseño documental general; normativa procesal |
| V3 | **Procedimiento de expediente** | La presentación pide expresamente la forma de «juicios, mesas o comisiones de investigaciones» (001 §1.1); el precedente `Mesa-2026-09-12-Colision-Lexica/` llama «expedientes» a sus piezas (`ev-03`) | Estándares de software; archivística técnica |
| V4 | **Ingeniería de software y operación** | ADR de apartamiento (`Root-Rules.md` §11); informe de audit con P0–P3 (`Master-Prompt.md` §10); `Observacion-*` y `Cierre-*` en `Audit/` (`ev-04`) | Derecho procesal; metodología de investigación |
| V5 | **Metodología académica** | P5 de la actuación 001 («estándares de la industria y la academia»); ciclo de origen como procedencia (`Master-Prompt.md` §8.2) | Normas ISO de gestión; procedimiento judicial |

### 3.3 Descartados y postergados, con su motivo (§3 P4)

| Rol | Decisión | Motivo |
|---|---|---|
| Seguridad (AG-00050) | **Postergado por cupo** | Señal real: la evidencia del Product Owner puede traer credenciales o datos personales, y el repositorio del framework es público (`Rules-Base-Conocimiento.md` fila 2.0, compuerta de ofuscación). Se prioriza V2, que cubre integridad y procedencia; **el refutador recibe la señal** para atacarla |
| Trazabilidad documental (AG-00110) | Descartado | Su pregunta —identificadores y enlaces entre documentos— la cubren Requisitos y V1 sobre esta figura; no hay corpus de expedientes con enlaces que medir |
| Cumplimiento (AG-00010) | Descartado | No hay obligación legal de retención en ningún destino medido; la retención como diseño la cubre V1 |
| Formal | Descartado | Sin umbrales numéricos ni cuantificadores en el objeto **todavía**; el umbral «cuándo no hace falta un expediente» lo propone el panel y lo ataca el refutador |
| Operación y entrega (AG-00090) | Descartado | Sin señal: no hay despliegue ni ambiente en juego |

## 4. Cómo trabaja el panel

- **A ciegas y en paralelo** (§5.3): ocho comisiones despachadas en el mismo acto, ninguna ve el informe
  de otra. El refutador entra después.
- **Cada comisión recibe**: la actuación 001, esta providencia, las rutas de la base, y su carta.
- **Fuentes externas citables**: nombre y número de norma o publicación, URL si es pública. **Si no hay
  certeza del número de un apartado, se cita la norma sin apartado.** Una afirmación sobre una norma
  que la comisión no pudo consultar se marca como tal.
- **Clase de ancla** `E1`–`E4` o `C` por hallazgo (§6.1); **toda afirmación de colisión, con comando**
  (§6.1 último párrafo).
- **El informe se asienta verbatim** como actuación `informe`, sin editar; lo que el presidente agregue
  va en actuación propia.

## 5. Jurado (§6.4)

**Se declara la limitación en lugar de simularla.** Los cinco jueces con funciones objetivo
diferenciadas se despachan como **un solo subagente con cinco mandatos**, después de la refutación.
`Mesa-Rules.md` §6.4 advierte que dos agentes del mismo modelo tienden a coincidir; uno solo con cinco
funciones coincide más. La salvaguarda de §6.4 —más del 80 % de votos 5-0 marca el ciclo como
sospechoso de homogeneidad— se aplica y se informa.

## 6. Constancias de la apertura

1. **Tercera carpeta `Expedientes`**: `IA/SDD/IA.SDD.Documentacion/Expedientes/`, vacía y sin seguimiento
   de git (un directorio vacío no se versiona). No la nombra la presentación. **No se escribe en ella**:
   el encargo fija el reporte y el prompt en sus carpetas de siempre. Queda para el dictamen.
2. **Error propio de la apertura**: `ev-05-citas.sh` corrió primero con `grep` sin `-F`, y dos patrones
   con `**` no devolvieron nada (`Punto de continuación` y `Origen del hecho`). Una ausencia leída así
   habría sido una afirmación falsa. Se corrigió a `grep -F`, se volvió a correr y se re-hasheó **antes de
   citar**. La nota queda dentro del guion.
3. **Un precedente del propio destino**: `Lab-Geometria` tiene `evidencia/2026-09-02-mesa-ux/` en la raíz
   del repositorio, fuera de `SDD/` (`ev-03`). La mesa lo tiene como dato.

## 7. Dónde queda cada sección de §2.2 en este expediente

| §2.2 | Actuación |
|---|---|
| 1. Cabecera y contrato de entrada | 002 (esta) |
| 2. Registro de convocatoria | 002 §3 |
| 3. Compuerta mecánica | 002 §1 y `evidencia/` |
| 4. Informes del panel | 003 a 010 |
| 5. Tabla de veredictos | Actuación de jurado |
| 6. Parches aprobados | Dictamen |
| 7. Deuda declarada | Dictamen |
| 8. Escaladas | Dictamen |
| 9. Bloque de cierre | Dictamen |
