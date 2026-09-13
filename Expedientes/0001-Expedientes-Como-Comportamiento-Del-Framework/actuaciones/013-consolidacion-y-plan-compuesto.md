# Actuación 013 — Consolidación del panel y plan compuesto

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 013 |
| Tipo | `providencia` (consolidación, `Mesa-Rules.md` §6.3) y **propuesta de plan** |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa |
| Insumos | Informes 004 a 011, réplica `ev-06`, constancias 003 y 012, y el segundo ejemplar de la forma: `Lab-Geometria-mig1316/SDD/Expedientes/0001-Migracion-Normativa-A-13.16/` (sólo lectura) |
| Prefijo de ítems | `J-` para los ítems del jurado y `Q` para las preguntas del caso. `grep -rnoE '\bJ-[0-9]{2}\b'` sobre el conjunto normativo sin `_legacy` y sobre este expediente devuelve 0 antes de este folio |

> **Declaración de límites.** §6.3 manda al presidente consolidar sin juzgar. La Parte A cumple eso: agrupa por raíz, deduplica y eleva las contradicciones. **La Parte B no es consolidación.** Es el plan compuesto que el cuerpo de parches de §6.5 tendría que diseñar, y este presidente lo redacta porque la mesa no tiene cuerpo de parches separado. Se declara para que el refutador y el jurado lo traten como una propuesta de parte interesada.

---

## Parte A — Consolidación

### A.1 Raíces comunes, con la réplica como control

«Réplica» indica si la segunda convocatoria (`ev-06`), trabajando a ciegas, llegó a la misma raíz. **Coincidir no vuelve verdadero un hallazgo**; lo que mide es cuán estable es la mirada.

| # | Raíz | Primera convocatoria (folios) | Réplica `ev-06` | Ancla más fuerte |
|---|---|---|---|---|
| R1 | **Dos huellas truncadas del índice no coinciden con `SHA256SUMS`** (`ev-02` y `ev-05`) | V1-01, V2-01, N2-01 | N2-01, V2-03, V4-01 | E1 |
| R2 | **La raíz no deja el expediente fuera del snapshot.** La exclusión de la guía l.990 es por lista, y `Conocimiento/` y `Examples/` entraron. La premisa de 001 §2.2 es falsa | V1-02, N1-01, V5-05 | V1-01, N1-01, V5-05 | E1 (`ev-02`) |
| R3 | **La presentación no tiene fuente primaria ni clase de evidencia**, y además no es literal (folio 012) | V1-06, V2-04, V5-01 | **V2-01 (P0)**, V2-02, V3-03, V5-03, V1-07 | E1 (`ev-07`) |
| R4 | **La evidencia no está fijada a la base.** `ev-01` es observación viva; `ev-03` y `ev-05` leen el árbol de trabajo | V2-02, V5-02, N2-02, N3-07 | V2-04, V5-01, N2-04, N3-07 | E1 (re-corridas) |
| R5 | **«Nunca reescritas» no tiene sello.** Dos folios en un commit, rama sin publicar, un `SHA256SUMS` que se certifica a sí mismo; el precedente `06-Plan-Y-Cierre` perdió su versión 1.0 antes del primer commit | V3-01, V5-03, N2-03, N2-04, V1-08, V2-03, V2-08 | V3-02, V5-02, V2-05, N2-02, N2-03 | E1 |
| R6 | **El estado se declara a mano en la pieza que sí se reescribe.** Tiene que derivarse del último folio | V1-08, V3-03, V4-07, N2-07 | V1-04, V3-01, V4-01, V4-08, N2-06 | E2 |
| R7 | **Identificadores.** `0001` no tiene el ancho de §9.2; §9.1 no tiene ámbito para un expediente de framework; `ev-NN` convive con `EV-` (9 archivos en `Lab-Geometria`, cientos de ocurrencias en `RPI.VideoControl`); «expediente» ya tiene tres referentes (V3-05) | V2-06, V4-04, V4-05, N1-05, N2-05, V3-05 | V1-06, V2-08, V4-06, V5-08, N1-06, N2-07, V3-08 | E1 |
| R8 | **Duplicación con `SDD/Docs/Audit/`.** En un destino, expediente y `Mesa-<fecha>.md` serían dos registros del mismo acto (`Mesa-Rules.md` l.164-168 ya rechazó un tercer contenedor) | V1-07, V4-01, N1-06 | V1-03, V3-05, V4-02, N1-07 | E2 |
| R9 | **P4 («pruebas como parte de las especificaciones») tiene dos lecturas.** La literal choca con D9 (especificación sin evidencia) y con «las verificaciones viven en `Audit/`» | V2-05, V3-08, V4-06, N1-04, V5-06 | V2-02, V4-04, V5-05, N1-04 | E2 |
| R10 | **P7 tomado literal choca con la norma.** M4 manda detener (`Master-Prompt-Migracion.md` l.291) y no reconvocar (l.46); los bloqueantes de §7.0 salen en el momento; la mesa no mira lo que produjo la corrida | N1-07, N3-05 | N1-03, N3-05, V4-07 | E2 |
| R11 | **La carta despachada no está asentada**, así que un re-despacho no es reproducible. Ocurrió (003) | N2-06, N3-01 | N3-01 | E1 |
| R12 | **Sin umbral de apertura**, la figura se abre para todo y compite con `Audit/` | V4-08, N1-03 (P1) | V3-06, V4-05, N1-05 | E3 |
| R13 | **Autosuficiencia y §II.7.** El expediente en `IA.SDD` nombra otros repositorios, usa rutas absolutas del workspace y trae `.sh` | V5-04, N1-02 | V1-08, V2-07 (Q1), N1-02, N1-08 | E2 |
| R14 | **Datos personales y rutas de host en evidencia de repositorios públicos.** La compuerta de ofuscación alcanza sólo a `Conocimiento/` | V2-07 | V2-07 | E1 (V2: `curl` 200) |
| R15 | **Disposición.** La guía l.145 eliminaría un registro «absorbido»; no hay retención para expedientes | V1-05 | V1-02 | E2 |
| R16 | **El vocabulario procesal no tiene ancla**; `Audit/` no deja reconstruir un caso (fase `k`: 6 a 9 archivos, cinco bases, desenlace en el roadmap) | N3-03, N3-04, N3-08 | N3-03, N3-04, N3-06, N3-08 | E1 |
| R17 | **Ciclo de vida incompleto.** Faltan suspensión, desistimiento y reapertura; no hay vinculación ni desglose entre casos | V3-06, V3-07, V4-07 | V3-04, V3-07 | E2 |
| R18 | **Sólo en la primera convocatoria:** circularidad del caso que diseña la forma (V5-08), razonamiento descartado sin figura (V5-07), cita `l.29-32` que la evidencia no contiene (N2-08) | V5-07, V5-08, N2-08 | — | E1/E2 |

**Estabilidad medida.** De las dieciocho raíces, **diecisiete (R1 a R17) aparecen en las dos convocatorias** y R18 sólo en la primera. La réplica aportó un solo hallazgo de nivel superior que la primera no tenía: **R3 como P0**.

### A.2 Contradicciones entre comisiones, elevadas como ítems del jurado (§6.3)

| Ítem | Contradicción | Una lectura | La otra |
|---|---|---|---|
| **J-01** | Dónde viven los expedientes **del framework** | En la raíz de `IA.SDD`, por el literal del Product Owner (ev-07). Así lo leen V3 réplica Q1, V4 Q1 y N1 réplica Q1 | En `IA.SDD.Documentacion`, por el modelo de tres repositorios y por la autosuficiencia (N1-02 de ambas convocatorias, que lo propone como **escalada**, disparador 1) |
| **J-02** | El hash propio | Fuera de la forma mínima: sobre lo versionado no agrega nada (N2-04, V4-01 réplica, V5-02 réplica) | Hace falta antes del commit, para copias exportadas y para evidencia no versionada (V2-08, V2-05 réplica) |
| **J-03** | Clase del testimonio del Product Owner | Tipo nuevo `testimonio`, distinto de `humano` (V2-04) | `humano` con ratificación (V5-01 y V5-03 réplica) · fuente de intención, sin D9 (N1-04) · E4, como hace la 13.17 §3.2 y `Lab-Geometria` |
| **J-04** | Registro de mesa en un destino | El expediente folia por enlace y `Audit/` sigue siendo la fuente (V4, N1, V3 primera convocatoria Q9) | El expediente es el contenedor y el registro de mesa es su actuación: reabre parcialmente una decisión cerrada (V3-05 réplica) |
| **J-05** | Artefactos que cambió el caso | Tabla declarada en el expediente, como hace el `EXP-0001` de la migración | Derivada del historial, sin tabla (V4-03, V4-04 réplica) |
| **J-06** | Identificador y ámbito | `EXP-NNNNN` con ámbito «repositorio», un tercer ámbito en §9.1 (V4-04) · toca D3, major (N1-05) | Número local más repositorio y commit, sin familia nueva (V5 Q4) |
| **J-07** | Severidad del salto | Minor: todo se acomoda como regla nueva y pasos (N1 réplica, tabla de severidades) | Major, si toca D3 (ámbito), D5 (control de cambios de una actuación) o D9 (tipo nuevo) (N1-05, N1-08) |

### A.3 Solicitudes de convocatoria en caliente, y qué se hace con ellas

| Especialidad pedida | Quién la pide | Resolución |
|---|---|---|
| **Seguridad (AG-00050)** | V1, V2, V3, V4, V5 y N1, en las dos convocatorias | **Postergada por cupo**: el techo de `Mesa-Rules.md` §5.5 ya está en cinco variables. **Entra en el ciclo siguiente**, que es la intervención `09`. Mientras tanto, R14 va a deuda declarada con un evento de cierre, y la forma propuesta prohíbe sellar evidencia con datos personales o rutas de host sin redactarlas antes (B.Q7) |
| **Trazabilidad documental (AG-00110)** | N2 y N3, en las dos convocatorias | **Se corrige el motivo del descarte de 002 §3.3**: sí hay corpus medible (R7, R16). Postergada por cupo al ciclo siguiente |
| **Formal** | N1 réplica | Postergada: los conjuntos cerrados de B.Q5 y B.Q6 los audita el ciclo siguiente |
| Terminología | N3 y V3 | Sin titular en el catálogo. Queda **a cargo de la intervención**, con el comando de `Vocabulario-Rules.md` §9.4 (R7, R16) |

---

## Parte B — Plan compuesto (propuesta del presidente)

**Criterio rector, que es la trampa principal.** Una forma mínima que se completa en minutos y se verifica enumerando. Todo lo que el uso ya sabe hacer —git, `Audit/`, D9, §8.1, §12.2— **se reutiliza y no se duplica**.

| Q | Propuesta | Fundamento |
|---|---|---|
| **Q1** Dónde vive | **Destino:** `SDD/Expedientes/`, hermana de `Docs/`, fuera del alcance de M4 y de la compuerta de fase. **Framework:** `IA.SDD/Expedientes/` en la raíz, **por el literal del Product Owner, no por el snapshot**. Tres condiciones: (a) exclusión explícita en la guía §VI.5, con el mismo motivo que `CHANGELOG.md` (acumulativo; cita, no condiciona); (b) otros repositorios se **nombran y no se enlazan**, como en `README.md` l.152 («los estándares de industria se nombran, no se enlazan»), sin rutas absolutas del host; (c) sin archivos ejecutables sueltos: cada evidencia es **un archivo con su comando, su base y su salida juntos** (frontera de §II.7: «un comando citado en la prosa que lo funda, sí»). **No se escala J-01:** el árbol lo contesta (l.152 admite nombrar; §II.7 admite comandos en el texto). `IA.SDD.Documentacion/Expedientes/` queda **sin uso**, y la serie de reportes y fixes sigue en su lugar | R2, R13; N1-01; 001/ev-07 |
| **Q2** Cuándo se abre | **Condición**, no lista. Se abre cuando se cumplen **las dos**: (1) un hecho **presentado** —por el Product Owner o por un agente— **no se cierra en la unidad donde apareció**, porque sobrevivió al origen del hecho, a la pregunta previa y a la autocorrección, o convoca una mesa, o reabre una decisión cerrada; y (2) su tratamiento produce **evidencia o decisiones que otra corrida va a citar**. **No se abre** para: autocorrección, audit de fase, detención resuelta en el mismo lote, ítem diferido en forma, ni lo que se contesta con un comando | R12; V4-08; N1 Q2; 13.17 §3.1 («teatro deliberativo») |
| **Q3** Forma mínima / completa | **Mínima**, que se llena en minutos: carpeta `NNNNN-<Titulo>/`; `README.md` con **carátula fija** (número, título, apertura, origen, objeto, base) + **índice de actuaciones** (folio, tipo, fecha, autor, enlace) + **punto de continuación**; `actuaciones/NNN-<tipo>-<slug>.md` con una **cabecera de cinco campos** (expediente, folio, tipo, fecha, autor) y una línea final de **pase** (estado resultante y próximo acto). **Completa**, además: `evidencia/`, carta de cada despacho asentada **antes** de despachar, resolución motivada con **veredicto por criterio** y constancia de archivo. **Sin huellas en el índice** y sin manifiesto obligatorio (ver Q7) | R1, R6, R11; N2 C1–C11 |
| **Q4** Identificador | **`EXP-NNNNN`**, cinco dígitos por §9.2, correlativo **por repositorio**, nunca reciclado (§9.3). Se cita desde afuera como `<repositorio> EXP-NNNNN`. **Folio y número de evidencia** son posiciones dentro del expediente, familias excluidas como `FA-NN`. **La evidencia no usa `ev-` ni `EV-`**: se nombra `evidencia/NNN-<slug>.txt`. **Colisión de `EXP-`: cero en los cuatro repositorios** (`ev-03`). La intervención vuelve a medir `EXP-` y el nombre de evidencia con el comando de §9.4, en todos los destinos | R7; J-06 |
| **Q5** Estados | **Conjunto cerrado, derivado del tipo del último folio y nunca escrito a mano**: `abierto` (presentación) · `en trámite` (providencia, informe, refutación, veredicto, dictamen) · `suspendido` (constancia de suspensión, **con el evento que lo reanuda** en la forma de `Root-Rules.md` §12.2 punto 4) · `resuelto` (resolución) · `archivado` (archivo: aplicado y verificado, cerrado por decisión con lo abierto enumerado, o desistido) · `reabierto` (reapertura, **sólo con ancla E1 o E2**, mismo número) | R6, R17; V3-06; V4-07 |
| **Q6** Inmutabilidad y foliatura | **La foja es el commit de alta**: **un folio por commit**, con `Expediente: EXP-NNNNN/NNN` en el mensaje. **Ninguna actuación se modifica, se borra ni se renombra después** (`git log --diff-filter=MDR -- actuaciones/` vacío, **contra la rama publicada**). El folio se asigna **al incorporar**. Una corrección es un folio nuevo que nombra el folio que corrige. **El `README.md` es un índice derivado y mutable.** Antes del primer push, la inmutabilidad se declara **no observable**. Tipos, en conjunto cerrado: `presentacion`, `testimonio`, `providencia`, `informe`, `refutacion`, `veredicto`, `dictamen`, `resolucion`, `constancia`, `archivo`, `reapertura` | R5; V3-01, V3-04; N2-03 |
| **Q7** Evidencia | **Dos clases.** *Medición*: fijada a commit (`git show/grep/ls-tree <sha>`), reproducible y verificada con `cmp`. *Observación*: estado vivo o captura; no se exige que se reproduzca, **se preserva** con fecha, hora y zona. Toda pieza lleva **método, base, fecha-hora y quién la adquirió**. **Huella SHA-256 sólo** para lo que no está versionado o sale del repositorio, con la huella **en el expediente** y el objeto donde se custodie. **Una corrida descartada se conserva**, no se sobrescribe. **Testimonio del Product Owner:** el **original byte a byte** con su huella y su canal es la pieza; toda versión legible es **derivada y declara su transformación** (lección del folio 012). **Prueba que el Product Owner dijo algo, no que lo dicho sea cierto**, así que **funda intención y alcance y no estado del sistema**. Por eso **no se agrega un tipo a D9** (D9 excluye la intención) y **no es E4 por sí mismo**: pasa a E4 cuando queda asentado como decisión cerrada o restricción del contrato de entrada. **Antes de sellar** en un repositorio público no entran credenciales, datos personales ni rutas de host | R3, R4, R14; J-02, J-03 |
| **Q8** Evidencia → especificación | **La evidencia no se vuelve especificación: la funda.** El artefacto que cambia —ADR, ítem diferido, fila de control de cambios, intake— **cita** `<repo> EXP-NNNNN/NNN` en su motivo o en su ciclo de origen (§8.2). **La dirección inversa se deriva** con `git log --grep 'EXP-NNNNN'`, sin tabla escrita a mano. Todo patrón generalizado desde un caso declara **cuántos casos lo sostienen** | R9; J-05; V5-06; V3-08 |
| **Q9** Relación con `Audit/` y reportes | **Conviven sin mudanza.** En un destino, el registro de mesa, los informes de migración y de estado y los de audit **siguen en `Audit/`**; el expediente los folia **por enlace**, en una constancia con `ruta@commit`, y no los copia. En el framework, que no tiene `Audit/`, **el expediente es el registro**. En la serie de reportes, el reporte **es el pase** del caso a la intervención: cita el expediente, y el expediente folia el reporte **por nombre** | R8; J-04 |
| **Q10** Retroactivo | **No se reescribe nada.** Los 113 archivos de `Lab-Geometria/Audit/`, los 51 de `RPI.VideoControl` y los `OUTPUTs/` quedan como están. Un caso **vivo** que cumpla Q2 abre un expediente con una constancia de **incorporación de antecedentes** por `ruta@commit`, declarando que no tuvieron custodia antes de esa fecha. Los dos adelantos (`IA.SDD` 0001 y `Lab-Geometria` EXP-0001) **se alinean con una actuación nueva** cuando llegue la norma | R16; D9 l.59; `Migracion-Rules.md` §4.9 |
| **Q11** Mesa y no detención | **Paso con su fundamento** en `Master-Prompt.md` §8.1, que leen los tres orquestadores. Ninguna detención sale sin pasar este orden: (1) origen del hecho; (2) de la corrida → autocorrección; ajeno → pregunta previa; (3) lo que sobrevive y **cumple §0.0** → **una mesa por lote de fase**, no una por problema; (4) lo que sale de la mesa → lote de §7.0 con `SI NO RESPONDÉS`; (5) **salen en el momento sólo** los bloqueantes de §7.0 y los disparadores 2 y 3. **Cableado en** `Master-Prompt-Migracion.md` l.46 y l.291, y en la reanudación. Si el caso cumple Q2, cada paso queda como folio | R10; N1-07; N3-05 |
| **Q12** Punto de continuación | **Es el pase del último folio**, reflejado en el README: último folio y su commit; próximo acto, **quién** lo hace y qué folio le toca; insumos enlazados (cartas); base; qué se invalida si se corta; **«comprobar si el despacho anterior terminó antes de re-despachar»** (003); escaladas abiertas con su default. **La reanudación lee los expedientes abiertos** en R0 paso 4 | R11; N3 Q12; `Master-Prompt-Reanudacion.md` l.452 |

### B.1 Dónde vive cada pieza en la norma, y severidad (guía §VI.5)

| Pieza | Artefacto | Severidad propuesta |
|---|---|---|
| La figura: Q2 a Q8 y Q10 | **Regla transversal nueva**, `Expediente-Rules.md` (guía §III.8). La colisión del nombre la mide la intervención | minor |
| Layout de `SDD/Expedientes/` | `Master-Prompt.md` §3.5 | minor |
| Q11 | `Master-Prompt.md` §8.1; `Master-Prompt-Migracion.md` (M4, l.46); `Mesa-Rules.md` §0.0 y §2.1, sobre la relación con el expediente | minor |
| Q12, lectura en R0 | `Master-Prompt-Reanudacion.md` §2 y §5 | minor |
| Expedientes fuera de M4 | `Migracion-Rules.md` §2.2 | minor |
| Exclusión del snapshot | Guía §VI.5 | minor |
| `EXP` y el ámbito «repositorio» | `Root-Rules.md` §9.1, §9.2 y §9.5 | **J-07**: ¿extiende D3 o lo modifica? |
| Actuación sin control de cambios | D5 | **J-07** |
| Guía de usuario | `SDD-User-Guide.md` | minor |
| **Alinear** `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` §2.3 y §3.2 (13.17): la forma de la carpeta y «el testimonio es E4» | La propia 13.17, §8: «§2.3 se reescribe contra ella» | patch o minor del catálogo |

### B.2 Deuda que el plan declara

- **R14 (seguridad):** evento de cierre = el ciclo de mesa de la intervención `09` con Seguridad convocada, y su veredicto asentado en la nota de coherencia de esa intervención.
- **R15 (disposición):** los expedientes son de **conservación permanente**; se propone una excepción a la guía l.145. Queda a juicio del jurado.
- **R18:** V5-08 (circularidad) se atiende exigiendo que la intervención ejerza la forma contra **dos** instancias que no se escribieron para ella: el `EXP-0001` de la migración y el precedente `Mesa-2026-09-12-Colision-Lexica`.
