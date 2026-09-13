# Actuación 011 — Informe de la Comisión N1 — Requisitos

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 011 |
| Tipo | `informe` |
| Fecha | 2026-09-13 |
| Autor | Comisión N1 — Requisitos, primera convocatoria (actuación 002 §3), a ciegas |
| Despacho y entrega | Despachada 2026-09-13T12:16:20-03:00; informe final 2026-09-13T12:23:52-03:00 |
| Asentada por | Presidente de mesa, **por extracción mecánica** del último mensaje del subagente en su transcripción, sin edición. SHA-256 del cuerpo (desde la línea siguiente a la regla horizontal): `543a8bff14e88b62ea8bcccfc902e507511bb76ebb1705c300d39e4f026cae4d` |

---

# Informe — Comisión N1, Requisitos (núcleo permanente, `Mesa-Rules.md` §5.1)

## 1. Cabecera

| Campo | Valor |
|---|---|
| Comisión | N1 — Requisitos. Trabajé a ciegas, sin informes de otras comisiones |
| Expediente | `0001` — Expedientes como comportamiento del framework |
| Fecha | 2026-09-13 |
| Base | `IA.SDD` `main` `8c55a1e` (13.16), leída desde el worktree `IA.SDD-exp1` y desde `IA.SDD`. `IA.SDD.Documentacion` `main` `9427b6b`. `Lab-Geometria` `main` `b9675d8`, sólo con `git show`, `git ls-tree` y `git grep`. `RPI.VideoControl` `HEAD` `9aabe5c` |
| Base leída | Actuaciones 001 y 002. `README.md` del expediente. Los cinco `evidencia/ev-0N.{sh,out}`. `Mesa-Rules.md` entero. Del framework: `README.md` (anatomía, invariantes, reglas de intervención, autosuficiencia); `SDD-Development-Guide.md` §II.7, §III.7, §III.8, Parte IV, Parte V y §VI.5; `Root-Rules.md` §9 a §13; `Master-Prompt.md` layout (l.330-364), §7.0, §8.1, §8.2, §10 y §10.0; `Master-Prompt-Migracion.md` §2 a §4 y §8; `Master-Prompt-Reanudacion.md` §0, §1, §2, §3.1 y §5; `Deriva-Rules.md` §1; `Vocabulario-Rules.md` §2 y §9. De `IA.SDD.Documentacion`: `Reportes/README.md` y el precedente `Mesa-2026-09-12-Colision-Lexica/00-Contrato-De-Entrada.md` |
| Escritura | Ninguna, en ningún repositorio |

---

## 2. Hallazgos

### N1-01 · P1 · E1 — La premisa de la raíz es falsa: el snapshot no copia sólo `SDD/`, y ubicar el expediente en la raíz no lo deja afuera

**Ancla.** El orquestador escribió en la actuación 001 §2 punto 2: *«el expediente va en la raíz (`IA.SDD/Expedientes/`) y no en `SDD/Expedientes`, porque `SDD/` es el conjunto normativo y se copia entero a `_legacy/<versión>/`»*.

El propio `ev-02-snapshot.out` lo refuta:

```
== raíz en main
.gitignore CHANGELOG.md Conocimiento Examples PROMPTS README.md SDD Templates _legacy vs.bat
== _legacy/13.0
Conocimiento Examples PROMPTS README.md SDD Templates
== _legacy/13.15
Conocimiento Examples PROMPTS README.md SDD Templates
```

El snapshot copia **toda la raíz** menos `CHANGELOG.md`, `_legacy/` y la configuración, y copia también carpetas raíz que no son `SDD/` (`Conocimiento/`, `Examples/`). La exclusión es **por lista y no por ubicación**: `SDD-Development-Guide.md` l.990 dice *«Quedan fuera del snapshot el propio `CHANGELOG.md`, que es acumulativo y cuya historia es su contenido, la carpeta `_legacy/` misma, y los archivos de configuración»*. Con el criterio escrito, un `Expedientes/` en la raíz **entra** al snapshot, como entró `Conocimiento/` por el mismo criterio (guía l.494).

Hay además una tensión de fondo: el criterio de exclusión es *«lo que no condiciona lo que el orquestador genera»*, y P4 pide que la evidencia quede *«como parte de las especificaciones»*. En la lectura literal de P4, el expediente condiciona y entra al snapshot. **El fundamento de la exclusión de `CHANGELOG.md` —acumulativo, su historia es su contenido— es el mismo que tendría un expediente foliado**: es el simétrico que la guía, Parte IV, pide mirar.

**Impacto.** Si la mesa decide «raíz» creyendo que eso evita la copia, cada versión publicada duplicaría todos los expedientes dentro de `_legacy/<N>/`. Hoy `_legacy/` ya tiene 5994 archivos versionados (`ev-02`).

**Dirección.** Que el expediente entre o no al snapshot se decide **en la lista de exclusiones de §VI.5, con su motivo**, y no se deduce de la carpeta. La premisa de 001 §2.2 se corrige con una actuación nueva.

---

### N1-02 · P1 · E2 + E1 — P6 está mal enunciado y trae un conflicto con el repositorio del framework que la interpretación no nombra

**Lo que dijo el Product Owner** (001 §1.2): *«si planteaste una mesa en `IA.SDD`, llevá su expediente de reportes `/IA/SDD/IA.SDD/Expedientes`»*. El orquestador lo reescribió en P6 como *«el expediente vive en el repositorio donde ocurre el caso»*. Son dos criterios distintos: uno toma el repositorio **de la mesa** y otro el repositorio **del caso**. El caso de esta mesa ocurre en el framework, pero sus salidas van a `IA.SDD.Documentacion` (002 cabecera: reporte `31` y prompt `09`).

**Contra qué choca, en el repositorio del framework:**

- **Modelo de tres repositorios** (`README.md`, tabla): el framework *«Nunca se toca durante una corrida normal»*. El material de *«investigación, indexación y análisis»* es del repositorio de documentación.
- **Autosuficiencia** (`README.md` l.152): *«Ningún archivo de este repositorio referencia otro repositorio»*. El expediente 0001 ya la incumple. Medido con `grep -rnoE '/home/[^ \`]*|IA\.SDD\.Documentacion[^ \`]*' Expedientes`: aparece en `README.md` l.5 y l.21, `ev-03-colision.sh` l.3, l.6 y l.13, `ev-04-inventario.sh` l.3, l.11 y l.12, y `ev-05-citas.sh` l.4. Hay rutas absolutas `/…/...` y citas a `IA.SDD.Documentacion`.
- **§II.7, el framework no distribuye código ejecutable.** `find SDD -type f -not -name '*.md'` devuelve `0`, pero `find Expedientes -type f -not -name '*.md'` devuelve 11 archivos: cinco `.sh`, cinco `.out` y `SHA256SUMS`. La comprobación de la Parte V está **acotada a `SDD`**, así que un expediente en la raíz la esquiva por construcción y no la cumple.
- **Repositorio público.** `Rules-Base-Conocimiento.md` l.206 y la fila 2.0 obligan a una compuerta de ofuscación bloqueante al escribir en el framework. La evidencia del Product Owner no tiene esa compuerta.

**La tercera carpeta cambia el alcance (pregunta c).** `IA.SDD.Documentacion/Expedientes/` existe, está vacía y no está versionada: `git ls-tree -d main | grep -i expedient` devuelve vacío. Hay además precedente de hecho en ese repositorio: la mesa del 2026-09-12 declara *«Ubicación de los expedientes: `PROMPTs/Fixs/05-Fix-Reporte-27/OUTPUTs/Mesa-2026-09-12-Colision-Lexica/`»* (su `00-Contrato-De-Entrada.md`). Para el framework hay entonces dos candidatos legítimos. El texto literal del Product Owner elige `IA.SDD`, y tres reglas del framework apuntan a `IA.SDD.Documentacion`.

**Impacto.** La mesa puede normar una ubicación que viola la autosuficiencia en su primer ejemplar, o corregir al Product Owner sin decírselo.

**Dirección.**
- Partir P6 en tres: P6a para los destinos, P6b para el framework y P6c para orientarse según el rol del repositorio (ver N1-03).
- Llevar P6b como **escalada** de `Mesa-Rules.md` §7, disparador 7 si se sostiene como contradicción con una decisión cerrada, o disparador 1. Debe ir con opciones, propuesta y `SI NO RESPONDÉS`.
- La tercera carpeta se resuelve en la misma escalada.

---

### N1-03 · P1 · E2 — La tabla P1–P7 empaqueta pedidos, mezcla fines con requisitos y deja afuera lo que el Product Owner no dijo pero la figura necesita

**Ancla.** 001 §3, tabla de pedidos.

**Empaquetados que se tienen que separar**, con el criterio de `Root-Rules.md` §12.2 (*«Un ítem que empaqueta dos decisiones se difiere por partes»*):

| Pedido | Qué lleva adentro | Por qué se separa |
|---|---|---|
| **P1** «sistemática, como comportamiento y no hábito» | Un **fin**, no un requisito verificable | No dice **cuándo** se abre un expediente, y sin condición de apertura «sistemático» no se puede comprobar. Falta el pedido derivado: la condición de apertura y la de no apertura (Q2) |
| **P2 + P3** | (a) numeración; (b) un `README.md` que **describe el caso**; (c) apertura por presentación; (d) foliatura del tratamiento | (b) y (d) son dos piezas con dos lectores: carátula contra índice de actuaciones. El Product Owner no pidió inmutabilidad; la agregó la forma provisoria del `README.md` del expediente |
| **P5** «estándares de industria y academia» | Un **mandato a la mesa**, no un requisito de la figura | No tiene criterio de aceptación sobre el expediente. Es competencia de las variables V1 a V5 |
| **P6** | Ubicación en destino; ubicación en el framework; «saber dónde estás parado» | La tercera es **orientación**, una conducta del orquestador («confundirlos es el error más caro», `README.md`, modelo de tres repositorios), y no una ruta. Ver N1-02 |
| **P7** | (a) convocar mesa en vez de detenerse; (b) decidir si hay que preguntar o si es una mala interpretación; (c) analizar el conjunto del problema | (b) ya existe como pregunta previa y origen del hecho (`Master-Prompt.md` §8.1). (c) ya existe como autocorrección sobre el conjunto y lote de §7.0. Sólo (a) es nuevo. Ver N1-07 |

**Lo que falta en la tabla, y la figura lo necesita para cerrar:**
- la relación con `SDD/Docs/Audit/`;
- el tratamiento de lo ya escrito;
- el cierre y la continuación del caso;
- quién abre y quién folia.

El orquestador los puso en el `objeto` de 002 §2, pero no como pedidos con fuente. Hoy **no hay trazabilidad** entre los pedidos y las preguntas del dictamen.

**Dirección.** Reenunciar la tabla como una actuación nueva con pedidos atómicos, cada uno con:
- su pasaje fuente, o la marca «derivado por el orquestador»;
- su criterio de aceptación, marcado `[enumerable]` o `[interpretativo]`.

---

### N1-04 · P1 · E2 — P4 admite dos lecturas incompatibles, y la literal choca con el alcance de D9

**Ancla.** 001 §1.1: *«las pruebas que aporte yo o las que obtuviesen los agentes quedarían como parte de las especificaciones»*. P4 lo transcribe sin desambiguar.

`Deriva-Rules.md` §1, tabla de alcance: *«De especificación o de intención | No | "El sistema debe permitir cancelar un turno"»*. Y l.53 fija los tipos: *«`artefacto` […] `ejecucion` […] `humano` (una aprobación explícita registrada con fecha)»*.

Las dos lecturas:
- **(i) La evidencia es especificación.** Tendría peso normativo en el destino y entraría a la compuerta, al audit y al snapshot. Eso cambia el modelo de D9, que separa lo que se afirma que ya es de lo que se pide. Cae en **§III.7, modificar una invariante**, que es major y alcanza a todos los orquestadores.
- **(ii) La especificación cita la evidencia del expediente** como su respaldo D9, con enlace D6. No toca ninguna invariante.

Además, `Deriva-Rules.md` l.55 dice que no es evidencia *«una captura de una conversación»*. La presentación 001 es una transcripción del encargo, de modo que **es fuente de intención y no evidencia de estado**. Tampoco es del tipo `humano`: no es una aprobación.

**Impacto.** Con la lectura (i), la severidad del cambio pasa de minor a major. La mesa tiene que saber cuál diseña.

**Dirección.** Llevar la ambigüedad como escalada con disparador 1, con la lectura (ii) como `SI NO RESPONDÉS`. Declarar en la figura qué contenido del expediente es **fuente de intención** (presentación) y cuál es **evidencia** (salidas reproducibles).

---

### N1-05 · P2 · E1 — Identificadores: `0001` no cumple el ancho de D3, `ev-NN` colisiona con la familia `EV` en los dos destinos, y ninguno de los dos ámbitos de §9.1 cubre un expediente del framework

**Ancla.** `README.md` D3: *«cinco dígitos uniformes […] únicos en su ámbito declarado»*. `Root-Rules.md` §9.2: el ancho *«no se negocia por familia»*; l.443-445: *«Del producto: `NB`, […] `VER`, `EV`, `EVE` […] y equivalentes»*; §9.5: toda familia viva queda alcanzada o excluida con su motivo.

**Mediciones:**

```
== EXP- en framework, Documentacion, Lab-Geometria y RPI (ev-03):  0 / 0 / 0 / 0 / 0
== EV-<dígitos>, framework sin _legacy:                            0
== ev-NN minúscula, framework:                                     0
== EV- en Lab-Geometria main: git grep -cE '\bEV-[0-9]+' main | wc -l  → 9 archivos
     (EV-10 ×8, EV-01 ×5 …; incluye SDD/Docs/Audit/B2-Maqueta-GeometriaFactory-Web-r1.md,
      SDD/Docs/Audit/F26-Propagacion-r2.md y 03-UX-UI-DX/Linea-Base-Visual.md)
== EV- en RPI HEAD: git grep -cE '\bEV-[0-9]+' HEAD | wc -l          → 45 archivos (forma EV-00001)
```

**Qué se concluye:**
- `EXP-` está libre.
- `ev-01` tiene **la misma forma corta** que `EV-01` de `Lab-Geometria`, que ya vive en `SDD/Docs/Audit/`.
- La colisión efectiva, en el sentido de `Vocabulario-Rules.md` §9.2, **no se puede declarar todavía**: depende de la lista de insumos del lector del expediente, que ninguna regla declara. Se afirma **la presencia medida**, no la co-ocurrencia.
- El folio (`001`) es una posición dentro del expediente, como `FA-NN`, y cabe entre las exclusiones con su motivo.
- **Ámbito.** El de un expediente de destino es el producto. El de un expediente del framework no es el producto ni el conjunto normativo vigente: es un **tercer ámbito** que §9.1 no tiene.

**Dirección.**
- La regla que acuñe la figura declara prefijo, forma y ámbito, o la exclusión con su motivo (§9.5).
- El identificador de evidencia se elige con el comando de §9.4 a la vista y no reusa `EV`.
- Si el expediente del framework se queda en el framework, el ámbito nuevo se declara en §9.1. Eso es cambio de invariante D3: §III.7, major.

---

### N1-06 · P1 · E2 — Casi todo lo pedido ya existe en 13.16 con otro nombre, y un contenedor paralelo a `Audit/` repite el defecto que `Mesa-Rules.md` rechazó para el plan

**Qué existe hoy y qué nombre tiene:**

| Pieza pedida | Dónde existe en 13.16 |
|---|---|
| Presentación y contrato del caso | Contrato de entrada, `Mesa-Rules.md` §4 |
| Tratamiento registrado, aunque no encuentre nada | Registro de mesa, §2.1 y §2.2 (nueve secciones); informe de estado, `Master-Prompt-Reanudacion.md` §5 |
| Foliatura sin reescritura | Rondas de audit: *«el re-audit escribe su propio informe y no toca el anterior»* (`Master-Prompt.md` l.1512); intocabilidad (guía l.1016); `_legacy/` por carpeta (`Master-Prompt.md` l.360) |
| Punto de continuación | `Master-Prompt-Reanudacion.md` l.452 |
| Procedencia de lo diferido | Ciclo de origen, `Master-Prompt.md` §8.2; origen del hecho, §8.1 l.977 |
| Deuda y escaladas | Ítem diferido `Root-Rules.md` §12.2; `Decisiones-Pendientes.md` §7.0 |
| Evidencia con forma | D9, `Deriva-Rules.md` l.53 |

**Contra qué choca un contenedor nuevo.** `Mesa-Rules.md` l.164-168: *«El plan de cambios no es un artefacto propio, y es deliberado. […] un tercero obligaría a mantener sincronizados tres»*. Mudar o duplicar registros que las reglas ya ubican en `SDD/Docs/Audit/` produce exactamente eso.

**La carátula es una fuente declarativa.** `Estado: En trámite` quedará atrás sin avisar. La guía, Parte IV, pregunta si el dato puede salir *«de un subproducto del acto»*, y `Master-Prompt-Reanudacion.md` §1.1 dice lo mismo.

**Nota sobre el pendiente de nivel C de 002 §2.** `Root-Rules.md` no tiene §12.3: sus encabezados son §12, §12.1, §12.2 y §13. El pendiente real y escrito es el de §13: *«no fija un artefacto donde la resolución quede escrita […] queda como ítem diferido»*. Con eso asciende a E2 con otra ubicación.

**Dirección.** El expediente es **sobre e índice**:
- folia **por enlace** lo que las reglas ya ubican;
- sólo aloja lo que no tiene casa: la presentación literal, las providencias, la evidencia en bruto y el dictamen;
- el estado se **deriva** del tipo de la última actuación, no se declara;
- evaluar si el expediente es el artefacto que §13 difirió.

---

### N1-07 · P1 · E2 — P7 literal, «en vez de pararte», contradice detenciones que la norma declara bloqueantes y convoca la mesa fuera de su condición

**Anclas:**
- `Mesa-Rules.md` l.557-558, disparadores 2 y 3: *«§7.0, arbitraje. **Bloquea el ciclo**»*.
- `Master-Prompt.md` §7.0: *«Lo bloqueante son dos casos, y sólo dos»*.
- `Mesa-Rules.md` l.23-27, la condición: *«Hay corpus previo que no fue producido en esta corrida»*.
- l.100-102: *«la mesa mira lo que ya existía al abrir la corrida, nunca lo que la fase acaba de producir»*.
- l.655, anti-patrón `[enumerable]`: *«Convocar la mesa sobre un corpus que se está por generar»*.
- `Master-Prompt.md` §8.1 l.977-982: un hecho **de la corrida** va a autocorrección, no a pregunta ni a mesa.
- `Master-Prompt-Reanudacion.md` §0: *«Si el árbol se contradice, lo declara y se detiene»*.

**Por qué no se puede aplicar tal cual.** «Ante un problema, mesa» sin condición choca con cuatro cosas:
- convoca mesa sobre lo que la propia corrida produjo;
- duplica el audit de §10;
- no deja salida para el arbitraje, que por norma bloquea;
- con la reanudación, contradice su detención obligatoria.

**La lectura que sí se puede aplicar.** Antes de emitir cualquier detención, el orquestador corre este orden:
1. calcula el origen del hecho;
2. si es de la corrida, autocorrección sobre el conjunto;
3. si es ajeno, pregunta previa;
4. lo que sobrevive y **cumple §0.0** va a mesa;
5. lo que sale de la mesa va agrupado con `SI NO RESPONDÉS`;
6. sólo los dos bloqueantes salen en el momento.

Todo eso **ya existe por partes**. Lo que falta es **el orden como paso único y el cableado en los tres orquestadores**.

**Forma y severidad.** Por la guía, Parte IV, «paso o prosa», es **paso con su fundamento pegado**: se lee ejecutando, olvidarlo hace daño y se olvida, porque la memoria del Product Owner lo tuvo que pedir. Vive en `Master-Prompt.md` §8.1, que *«la leen los tres orquestadores»*, y no en una regla nueva. Es **minor**: agrega una obligación sin invalidar documentación emitida (guía §VI.5).

**Dirección.** Reformular P7 como «ninguna detención sale sin haber pasado el orden anterior», no como «nunca detenerse». Declarar la excepción de los bloqueantes en el mismo paso. Aplicar la pregunta del simétrico: qué pasa cuando la mesa misma no puede convocarse porque falta el estado leído (§0.0, cláusula 2).

---

### N1-08 · P2 · E1 + E4 — `SDD/Expedientes` no choca en ruta en el destino, pero cae fuera del layout, de la migración y de la reanudación, y choca con D5

**Colisión física: ninguna.**

```
git -C Lab-Geometria ls-tree --name-only main SDD/        → SDD/Docs SDD/Intake SDD/Maquetas SDD/README.md
git -C RPI.VideoControl ls-tree --name-only HEAD SDD/     → SDD/Docs SDD/Herramientas SDD/Intake SDD/Maquetas
grep -rnE 'SDD/\*\*|árbol `SDD/`|todo `SDD/`|bajo `SDD/`' SDD PROMPTS
   → sólo Bootstrap/Audit-Final.md:5 y Master-Prompt.md:364 (AGENTS.md)
```

Ninguna regla recorre `SDD/` entero. Los `_legacy/` del destino son hijos de carpetas de `SDD/Docs/` (28 según `ev-04`) y no alcanzan a una hermana de `Docs/`. `Master-Prompt.md` l.364 declara `AGENTS.md` como *«la única salida del orquestador que no vive bajo `SDD/`»*. Por eso **`SDD/Expedientes` es compatible**, y la carpeta `evidencia/` de la raíz de `Lab-Geometria` (`ev-03`) es la que no lo sería si se normara.

**Lo que sí queda sin cubrir:**
- **Layout.** No figura en el árbol canónico de `Master-Prompt.md` l.330-364. El `SDD/README.md` de `Lab-Geometria` enumera sólo tres hijas en su «Estructura». `RPI.VideoControl` ya tiene una hija no canónica (`SDD/Herramientas/`, con `.py`): hay precedente de deriva.
- **Migración.** M4 recorre sólo `SDD/Docs/` (`Master-Prompt-Migracion.md` §8), así que los expedientes quedan fuera. Es deseable para la inmutabilidad, pero hoy es silencio y no declaración (`Migracion-Rules.md` §2.2).
- **Reanudación.** Sus seis dimensiones (§1) leen `SDD/Docs/Audit/` y no leen expedientes, de modo que un caso abierto no aparece como pendiente en R0 paso 4.
- **D5** (`README.md`): *«Todo documento lleva su sección de control de cambios»*. Una actuación que no se reescribe no tiene versiones: aplicada literalmente, D5 le exige una sección vacía o inventada.
- **En el worktree de `Lab-Geometria`** la carpeta existe vacía y, al estar vacía, git no la versiona. Su «existencia» es sólo del sistema de archivos.

**Dirección.**
- Declarar `SDD/Expedientes/` en el layout canónico con su motivo.
- Declararla fuera del alcance de M4.
- Sumar los expedientes abiertos a R0 paso 4 de la reanudación.
- Declarar cómo aplica D5 a una actuación: el foliado reemplaza al control de cambios. Hay que decidir si eso es excepción declarada (minor) o reformulación de D5 (major, §III.7).

---

## 3. Respuestas a las preguntas del dictamen, desde el mandato de requisitos

**Q1 · Dónde vive.**
- **Destino: `SDD/Expedientes/`.** No colisiona (N1-08) y respeta la línea de l.364. No va en la raíz: la raíz queda reservada a `AGENTS.md`.
- **Framework: no está decidido, y no se puede decidir por el argumento de 001 §2.2, que es falso (N1-01).** Elegir la raíz de `IA.SDD` choca con la autosuficiencia, con §II.7 y con la ofuscación. `IA.SDD.Documentacion/Expedientes/` es coherente con el modelo de tres repositorios y con el precedente de la mesa del 2026-09-12. Contradice la letra del Product Owner, así que va como escalada (N1-02).
- **Sea cual sea la ubicación**, la entrada al snapshot se decide en la lista de §VI.5.

**Q2 · Cuándo se abre.** Como en `Mesa-Rules.md` §0.0, con una condición y no con una lista. El expediente se abre cuando se cumplen las tres:
1. hay un hecho **presentado**, por el Product Owner o por un agente, con su fuente;
2. su tratamiento **excede el acto que lo detectó**: convoca mesa, produce escalada o requiere más de una actuación;
3. produce o recibe **evidencia que otro artefacto va a citar**.

**Cuándo no, que es el umbral anti-burocracia:**
- una detención que la pregunta previa o la autocorrección cierran en la misma unidad;
- una ronda de audit, que ya tiene su registro `-r<N>`;
- un hecho de la corrida.

Los números del umbral son de la comisión Formal: solicitud en §5.

**Q3 · Forma mínima obligatoria y completa.**
- **Carátula**: número, título, objeto, origen con su fuente, partes, base con commit, apertura.
- **Estado derivado** de la última actuación, no declarado (N1-06).
- **Índice de actuaciones**: folio, tipo, fecha, autor, enlace. El conjunto de tipos es cerrado y lo declara la regla.
- **Índice de evidencia**: id, qué muestra, método reproducible, fecha o commit, integridad. Son las cuatro condiciones de D9.
- **Punto de continuación** con la definición de `Master-Prompt-Reanudacion.md` l.452.

Queda completa si además cumple cuatro separaciones:
- la presentación es fuente de intención y no evidencia (N1-04);
- lo foliado por enlace sigue viviendo donde su regla lo ubica;
- el cierre nombra a qué artefacto entregó el plan;
- las actuaciones no llevan control de cambios, por la excepción de N1-08.

**Q4 · Numeración e identificador.** Cinco dígitos por D3, o exclusión con motivo por §9.5. Falta declarar el ámbito: un expediente del framework cae en un ámbito que §9.1 no tiene. El folio es posición y cabe como excluido, igual que `FA-NN`. La evidencia no usa `ev-NN` ni `EV`: colisión de forma medida en 9 archivos de `Lab-Geometria` y 45 de `RPI.VideoControl`. `EXP-` está libre en los cinco árboles (N1-05).

**Q5 · Estados y ciclo de vida.**
- Conjunto cerrado mínimo: abierto, en trámite, cerrado por criterio, cerrado por decisión con lo abierto listado (`Mesa-Rules.md` §6.7).
- Cada estado se **deriva** del tipo de la última actuación.
- Reabrir es una actuación nueva, nunca un cambio de campo.
- La definición formal del conjunto va a Formal.

**Q6 · Inmutabilidad y foliatura.**
- Una actuación no se edita; su corrección es una actuación que nombra el folio que corrige. Es la razón de la guía l.1016.
- El único componente mutable es el índice del `README.md`, que es un **dato derivado** recalculable desde las actuaciones (`Root-Rules.md` §10).
- Choca con D5: hay que declararlo (N1-08).
- Las integridades por hash son diseño de verificación: fuera de mandato.

**Q7 · Evidencia.**
- Rige D9 tal como está: cuatro condiciones y cinco tipos.
- La palabra del Product Owner es **fuente**; sólo es `humano` si es una aprobación registrada.
- Los guiones y salidas sirven en un destino. En el repositorio del framework, un `.sh` con rutas absolutas incumple la autosuficiencia y el espíritu de §II.7, y la comprobación literal no lo ve (N1-02).
- La presencia de datos sensibles es de Seguridad: solicitud en §5.

**Q8 · De evidencia a especificación.**
- **Del expediente al artefacto**: el artefacto **cita** la evidencia con el formato `EV` de D9 y la declara upstream (D6). La evidencia no se vuelve especificación, salvo que el Product Owner elija la lectura (i) de N1-04, que es major.
- **Del artefacto al expediente**: la fila de control de cambios y el ciclo de origen (§8.2) nombran el expediente. Así se recorre desde el artefacto sin copiar.

**Q9 · Relación con `SDD/Docs/Audit/` y con la serie de reportes.**
- **Conviven, sin mudanza.** `Audit/` es fija (`Master-Prompt.md` l.362), la reanudación la lee y la intocabilidad impide mover 113 archivos de `Lab-Geometria` y 51 de `RPI.VideoControl`. El expediente folia por enlace (N1-06).
- En la serie de reportes, cada reporte es de hecho la **presentación** de un caso contra el framework, y su prompt `Fixs/NN` con `OUTPUTs/` es el tratamiento. Eso refuerza que el lugar natural para el framework es `IA.SDD.Documentacion`.

**Q10 · Retroactivo sin reescribir historia.**
- Rige hacia adelante, con el precedente de D9 (guía l.429).
- Lo ya escrito se alcanza con un expediente **índice** que folia por enlace, sin mover ni editar nada.
- Lo que no se puede reconstruir se marca «no derivable», con el patrón de `Migracion-Rules.md` §4.9.
- No se exige retroactivamente.

**Q11 · Mesa y no detención.** Ver N1-07. Es un **paso con fundamento** en `Master-Prompt.md` §8.1, que ya leen los tres orquestadores. Fija el orden: origen del hecho, luego autocorrección o pregunta previa, luego condición §0.0 y mesa, luego lote con `SI NO RESPONDÉS`. Los dos bloqueantes de §7.0 salen en el momento. No es regla transversal nueva (§III.8) ni punto de invocación nuevo: `Mesa-Rules.md` §0.0 ya rechazó la lista de puntos. Severidad **minor**.

**Q12 · Punto de continuación.** Se reusa la definición de `Master-Prompt-Reanudacion.md` l.452: etapa o fase concreta, puerta de entrada y documentos que la gobiernan. No hay que redefinirla. El expediente abierto aparece en R0 paso 4 como pendiente declarado (N1-08). Al cerrar, el punto de continuación apunta al artefacto que recibió el plan, y el expediente deja de ser fuente de estado.

**Dónde vive cada pieza, y con qué severidad (guía §VI.5):**

| Pieza | Artefacto | Severidad |
|---|---|---|
| Figura: carátula, actuaciones, evidencia, estados | Regla transversal `<Capacidad>-Rules.md` por §III.8. Atraviesa orquestadores y no categorías; su paso 3 casi no aplica y hay que declararlo | minor |
| Layout `SDD/Expedientes/` | `Master-Prompt.md`, layout | minor |
| Orden previo a toda detención | `Master-Prompt.md` §8.1 | minor |
| Expedientes abiertos en R0 paso 4 | `Master-Prompt-Reanudacion.md` §2 | minor |
| Fuera de alcance de M4 | `Migracion-Rules.md` §2.2 | minor |
| Exclusión o inclusión en el snapshot | Guía §VI.5 | patch o minor |
| Familia de identificador y tercer ámbito | `Root-Rules.md` §9.1 y §9.5 | major si toca D3 |
| Excepción de control de cambios para actuaciones | D5 | major si se reformula |
| Evidencia como especificación, lectura (i) | D9 | major, §III.7 |
| Guía de usuario | `SDD-User-Guide.md` (Parte V: *«Modificar la salida sin actualizar la guía de usuario»*) | minor |

---

## 4. Lo que revisé y está bien

1. **002 §1 declara con honestidad que el registro de `Mesa-Rules.md` §2.1 no tiene destino en el framework** (*«el repositorio del framework no es un destino y no tiene `SDD/Docs/`»*), y declara desde dónde convoca por la condición §0.0. Es la salida que l.29-32 prevé para un caso sin orquestador.
2. **`ev-02` y `ev-03` son reproducibles y dicen lo que miden.** El error de N1-01 no está en la evidencia sino en la premisa de 001 §2.2, que la evidencia refuta. La corrección a `grep -F` de `ev-05`, declarada en 002 §6.2 antes de citar, es el anti-patrón de `Mesa-Rules.md` §6.1 bien evitado.
3. **La separación de autoridad de 001 §2 y §3** (presentación literal, precisiones del orquestador, interpretación marcada como tal y corregible por actuación posterior) es exactamente lo que permite este informe. Es la distinción entre fuente y evidencia que Q7 pide normar.

---

## 5. Solicitudes de convocatoria

| Especialidad | Señal y ubicación | Qué no puedo afirmar sin ella |
|---|---|---|
| **Seguridad** (AG-00050, postergada por cupo en 002 §3.3) | La evidencia del Product Owner entra a un repositorio público sin compuerta de ofuscación (`Rules-Base-Conocimiento.md` l.206); el expediente 0001 ya publica rutas absolutas del usuario (`ev-01-base.sh` l.3 y los demás guiones) | Si la ubicación en el framework es admisible por exposición, y qué redacción exige la evidencia antes de foliarse |
| **Formal** (descartada en 002 §3.3 por «sin umbrales todavía») | Q2 y Q5 introducen un umbral de apertura y dos conjuntos cerrados (tipos de actuación, estados); N1-07 introduce un orden con cuantificador («ninguna detención sale sin…») | Si los conjuntos son cerrados y disjuntos, y si el umbral es decidible |
| **Verificación** (núcleo) | La comprobación de la Parte V `find SDD -type f -not -name '*.md'` devuelve `0` con 11 archivos no Markdown en `Expedientes/` de la raíz; el alcance de §10.0 es «el árbol de la fase» y no alcanza a `SDD/Expedientes/` | Cómo se extiende la verificación mecánica a la carpeta nueva sin cambiar su alcance declarado. Es diseño de verificación y está fuera de mi mandato |
