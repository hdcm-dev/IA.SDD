# Actuación 014 — Refutación del plan compuesto

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 014 |
| Tipo | `refutacion` |
| Fecha | 2026-09-13 |
| Autor | Refutador. Núcleo permanente, entra último con los folios 001 a 013, `ev-06` y `ev-07` a la vista |
| Despacho y entrega | Despacho 2026-09-13T15:38:09.622Z (UTC). Informe final 2026-09-13T15:53:15.622Z (UTC) |
| Asentada por | Presidente de mesa, por extracción mecánica del último mensaje del subagente en su transcripción, sin edición. SHA-256 del cuerpo: `feb032e64e191c9da2b3de4d14eed8234ed06b11dd03da1b58ade4b33e116fbf` |

---

# Informe del Refutador: ataque al plan compuesto de la actuación 013

## 1. Cabecera

| Campo | Valor |
|---|---|
| Expediente | `0001`: expedientes como comportamiento del framework |
| Rol | Refutador, núcleo permanente (`Mesa-Rules.md` §5.1). Entra último y ataca el plan **por su aplicación** |
| Fecha | 2026-09-13 |
| Modo | Sólo lectura en todos los repositorios. Usé dos temporales, los dos en `scratchpad/refutador/`: `caso-chico/`, el caso construido de R-01, y `q6/`, un clon descartable para la prueba de R-04 |
| Base leída, framework | `IA.SDD-exp1`, rama `expedientes/0001-caso` en `3c2f401`, sobre `main` `8c55a1e` (13.16). Sin upstream, con `origin` en `github.com/hdcm-dev/IA.SDD` |
| Base leída, 13.17 | `cab03ed:Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md`. No está en `main`: `merge-base --is-ancestor` da «no» |
| Base leída, destinos | `Lab-Geometria` `main` `b9675d8`. Worktree `Lab-Geometria-mig1316`, rama `migracion/a-13.16` en `f73588f`, con 8 archivos sin commitear. `RPI.VideoControl` sólo a través de los informes |
| Base leída, documentación | `IA.SDD.Documentacion-exp1` |
| Leído entero | README del expediente, actuaciones 001 a 013, `ev-01` a `ev-05` con guiones y salidas, `ev-07` con su `.meta.txt` y sus manifiestos, y la 13.17 |
| Leído en parte, `ev-06` | Los encabezados de los 64 hallazgos de la réplica. En extenso: N1-01, N1-08 y Q1–Q12 de N1; V2-01, V2-02 y V2-07; V3-05, V3-06 y Q1–Q3 de V3 |
| Leído en parte, norma | Las secciones pedidas por el encargo, más las que se citan con línea en cada ataque |
| Prefijo de este informe | `R-NN`. Da 0 en el expediente y 0 en la norma sin `_legacy`, y 63 en `Lab-Geometria` `SDD/Docs/Audit/`, que es otro contexto de lectura. **No confundir con `R1`–`R18`** (raíces de 013) **ni con `R1`–`R6`** (restricciones de 002): ver R-13 |

---

## 2. Ataques

### R-01 · P1 · E3 + E1: la forma mínima de Q3+Q6+Q7+Q12 no se llena en minutos, y el README vuelve a copiar a mano datos derivados

**Qué ataqué.** El criterio rector de la Parte B: «una forma mínima que se completa en minutos» (013 l.71). Lo contrasté con el principio del framework: *«Sin ese filtro el procedimiento crece hasta dejar de leerse»* (guía l.618). Y con el presupuesto: *«¿El procedimiento pasa de nueve pasos? Entonces o se parte… o el ítem de menor daño vuelve a prosa. Agrandarlo no es una opción»* (guía l.630). La 9.19 lo usa como criterio de rechazo (`Root-Rules.md` l.809; también `Coherencia-La-Pregunta-Previa.md` l.55).

**El caso chico, construido.** Un pedido del Product Owner reabre una decisión cerrada, que es una de las condiciones de Q2, y se resuelve en el acto: dos folios, presentación y resolución. Lo escribí aplicando Q3, Q5, Q6, Q7 y Q12 al pie de la letra en `scratchpad/refutador/caso-chico/`:

```
./00007-Enlace-Roto-En-Roadmap/README.md
./00007-Enlace-Roto-En-Roadmap/actuaciones/001-presentacion-enlace.md
./00007-Enlace-Roto-En-Roadmap/actuaciones/002-resolucion-corregir.md
./00007-Enlace-Roto-En-Roadmap/evidencia/001-presentacion-original.txt
archivos: 4 · 45 líneas
```

| Pieza | Campos que exige el plan | Fuente |
|---|---|---|
| Carátula | 6: número, título, apertura, origen, objeto, base | Q3 |
| Índice | 5 × 2 = 10: folio, tipo, fecha, autor, enlace | Q3 |
| Punto de continuación | 10: último folio, **su commit**, próximo acto, quién, folio que le toca, insumos, base, qué se invalida, comprobar despacho, escaladas con su default | Q12 |
| Cabecera de actuación | 5 × 2 = 10 | Q3 |
| Pase | 2 × 2 = 4 | Q3 |
| Original del testimonio | 7: método, base, fecha-hora, quién, canal, huella, transformación de la versión legible | Q7 |
| **Total** | **47 campos, 4 archivos** | |

**Commits.**
- Q6 pide «un folio por commit», y Q12 pide que el README lleve «último folio **y su commit**».
- Un commit no puede contener su propio hash. Entonces:
  - `c1` asienta el folio 001;
  - `c2` asienta el folio 002, con el README todavía apuntando a 001;
  - `c3` actualiza el README con el hash de `c2`.
- Mínimo **N+1 commits para N folios**, y **el README queda desfasado un commit por construcción**, que es exactamente lo que C11 de N2 mide.

**Pasos para abrir y cerrar el caso: 12.**
1. Evaluar Q2.
2. Tomar el número.
3. Crear la carpeta.
4. Preservar el original byte a byte con su huella.
5. Correr la compuerta «antes de sellar».
6. Escribir el folio 001.
7. Commit con trailer.
8. Escribir carátula e índice.
9. Escribir el punto de continuación con el hash.
10. Escribir el folio 002 y su commit.
11. Actualizar el README y su commit.
12. En un destino, verificar MDR contra la rama publicada.

**12 pasos pasan el presupuesto de nueve** (guía l.630).

**Contra qué se compara.** Hoy la misma decisión es una fila de `Decisiones-Pendientes.md`, con seis campos (`Master-Prompt.md` l.617 y siguientes), más la fila de control de cambios del artefacto. El plan multiplica eso por ocho.

**Y reintroduce la raíz R1 por la puerta de atrás.**
- Q6 declara el README «índice derivado y mutable», pero **nada lo deriva**: §II.7 prohíbe el script.
- Un dato derivado que se escribe a mano es la clase que `Root-Rules.md` §10 describe.
- Es la misma clase que produjo las dos huellas falsas del índice (R1).
- El segundo ejemplar ya lo muestra, medido: el índice de `Lab-Geometria-mig1316` omite 6 evidencias que existen (`diff` de `ls evidencia` contra el índice: `E-006e`, `E-006f`, `E-009`, `E-010`, `E-011`, `E-012`).

**Qué cambiaría.**
- El README deja de copiar lo derivable: ni índice escrito a mano, ni estado, ni commit del último folio.
- El índice es el listado de `actuaciones/`, y el punto de continuación es el pase del último folio, **al que el README remite sin copiarlo**.
- El original de un testimonio va **dentro del folio de presentación**, no como pieza aparte.
- «Un folio por commit» sale de la forma mínima (ver R-04).
- Forma alternativa en §5.

---

### R-02 · P1 · E3 + E2: el umbral de Q2 no es decidible al abrir, y en la práctica abre un expediente por cada mesa y por cada detención

**Qué ataqué.** Q2 abre el expediente cuando se cumplen dos condiciones:
- (1) el hecho no se cierra en la unidad donde apareció, «**o** convoca una mesa, **o** reabre una decisión cerrada»;
- (2) produce «evidencia o decisiones que otra corrida va a citar».

**Por qué no es decidible.**
- **(2) es una predicción.** Toda decisión que se asienta en un artefacto vivo, sea un ADR, una fila de control de cambios o un intake, **la cita otra corrida**: para eso se asienta. Con cualquier decisión, (2) da verdadero.
- **(1) tiene una rama de convocatoria que no filtra nada.**
  - Una migración convoca mesa en M1 siempre que no llega con registro (`Master-Prompt-Migracion.md` l.46).
  - La reanudación la convoca en R1.5.
  - `Lab-Geometria` tiene 8 `Mesa-*.md` y 6 `Estado-Del-Destino-*` (`ev-04`; V4-08), y VideoControl, 7 y 6 (V4-08).
  - Con Q2 hay un expediente por cada una.
- **La otra rama de (1)**, «sobrevivió al origen del hecho, a la pregunta previa y a la autocorrección», **es la definición de toda detención legítima** de §8.1.

**Contraejemplo.** V4-08 enumeró como el ahogo exactamente estas dos cosas, «cada `Mesa-*`» y «cada detención de §8.1», y Q2 cita a V4-08 como fundamento. **El umbral incluye lo que su fuente quería excluir.**

**El simétrico, que tampoco está.**
- Q2 no abre expediente para una detención resuelta en el lote.
- Pero una **aprobación del Product Owner** que se asienta en la misma unidad, como el OK de la fase `k` (`mig1316` folio 002), queda debajo del umbral.
- Entonces Q7, la custodia del original, **no la alcanza**.
- P4, «las pruebas que aporte yo», queda sin cauce justo para la prueba más frecuente del Product Owner.

**Qué cambiaría.**
- La condición tiene que ser **observable al abrir**, no una predicción.
- Excluir expresamente la mesa que ya tiene registro en `Audit/` y la detención que sale y se contesta en el lote.
- Abrir sólo cuando el caso **atraviesa más de una corrida o más de un repositorio**, o cuando **entra material externo al árbol**: testimonio, captura o archivo del Product Owner.
- La custodia del original de un testimonio no puede depender de que se abra un expediente: tiene que valer donde se asiente (ver R-07).

---

### R-03 · P1 · E1: postergar Seguridad no es neutral, porque el expediente ya selló evidencia sensible destinada a un repositorio público

**Evidencia, con comando y salida.**

```
$ curl -s -o /dev/null -w '%{http_code}' https://github.com/hdcm-dev/IA.SDD   → 200
  (y 200 para hdcm-dev/Lab-Geometria y hdcm-dev/IA.SDD.Documentacion)
$ git -C IA.SDD-exp1 branch -vv   → * expedientes/0001-caso 3c2f401 …   (sin upstream; origin = github.com/hdcm-dev/IA.SDD)
$ grep -rcF '/home/' <expediente> | suma                 → 25 líneas en 14 archivos
$ git -C IA.SDD-exp1 grep -cF '/home/' HEAD -- Expedientes → 25 líneas en HEAD
$ grep -rnF '[nombre de cuenta redactado]' <expediente>
  actuaciones/005-informe-evidencia-digital.md:215-216   (y está en HEAD)
```

**Qué se ve.**
- El nombre propio salió de una captura de `Lab-Geometria` y **ya se copió a un segundo repositorio público**, dentro de un informe que se asienta «verbatim».
- Si es una persona real o un dato de prueba no lo sé: **eso es `C`**. La presencia es E1.
- Además hay 25 líneas con la ruta del directorio personal del host. `ev-07.meta.txt` l.7 lo revisó solo el presidente: «nombra repositorios y rutas del workspace».

**Por qué la postergación rompe.**
- Q7 dice «**antes de sellar** en un repositorio público no entran credenciales, datos personales ni rutas de host».
- Pero **ya está sellado**, en tres commits: `e8c84d9`, `7301a8f` y `3c2f401`.
- B.2 fija como evento de cierre de R14 la intervención `09`, que es posterior al push que el reporte `31` va a necesitar para citar el expediente.
- Q6 prohíbe modificar folios.
- Cuando la rama se publique, retirar el dato **exige reescribir historia**, y eso rompe la base de la corrida (`Master-Prompt.md` l.980: «el historial se reescribió» → no calculable).
- **La única ventana barata es antes del primer push**: el propio Q6 declara la inmutabilidad «no observable» mientras tanto.
- Además, datos personales es el **disparador 5** de `Mesa-Rules.md` §7, «Dominio con consecuencia externa: … datos personales». La norma no lo trata como deuda: lo trata como escalada con propuesta.

**Qué cambiaría.**
- **Sacar R14 de la deuda y llevarlo al lote ahora**, como disparador 5.
- Default propuesto: antes de cualquier push, reescribir la rama local con una constancia foliada que declare la redacción, el hash del original y dónde queda custodiado fuera del repositorio.
- Para un informe «verbatim», la pieza pública lleva la transformación declarada (V2-07 réplica).
- Que Seguridad entre en la intervención `09` sirve para la regla. **No sirve para este expediente.**

---

### R-04 · P1 · E1: la inmutabilidad de Q6 no cubre su simétrico, depende de una estrategia de fusión que la norma no fija, y el primer ejemplar la incumple

**1. El simétrico.** El criterio de Q6 es `git log --diff-filter=MDR -- actuaciones/`. Q7 promete que «una corrida descartada se conserva, no se sobrescribe». Probé en un clon descartable (`scratchpad/refutador/q6`):

```
git rm evidencia/ev-03-colision.sh evidencia/ev-03-colision.out ; commit
MDR sobre actuaciones/:  0          ← el criterio de Q6 no ve nada
MDR sobre evidencia/:    2
```

**La evidencia se puede borrar o reemplazar sin que el control de inmutabilidad lo vea.** Es el defecto de forma que la guía nombra: «¿Cuál es el simétrico? Si la regla protege un lado…» (l.662).

**2. El renombre.** Probé también llevar la carpeta a cinco dígitos, como pide Q4:

```
git mv Expedientes/0001-… Expedientes/00001-… ; commit
estado de actuaciones en ese commit: 13 × R100
```

- Todo renombre de carpeta dispara Q6.
- Entonces **ningún adelanto puede tomar la forma de Q4** sin violar Q6, y Q10 («se alinean con una actuación nueva») no se puede aplicar. Sigue en R-05.

**3. La foja depende de cómo se fusiona.**
- `Master-Prompt.md` l.1691: «La fusión y el borrado de la rama son del humano».
- `Rules-Devops.md` l.452, la regla que el framework da para los productos: «merge por **squash**».
- Con squash y la rama borrada, **los commits de alta por folio desaparecen de todo lo publicado** y «contra la rama publicada» deja de tener contra qué evaluarse.
- `IA.SDD` fusiona con merge commit (64 en `main`), así que en el framework funciona. En un destino que siga su propio `Rules-Devops`, no.

**4. El primer ejemplar.**

```
e8c84d9  A 001, A 002
7301a8f  A 003 … A 011   (nueve folios en un commit)
3c2f401  A 012, A 013
trailers «Expediente:» en los mensajes: 0
```

El expediente que propone «un folio por commit» y el trailer **no cumple ninguna de las dos cosas en ninguno de sus tres commits**, incluido el que asienta la propuesta.

**Qué cambiaría.**
- El control de inmutabilidad corre sobre **la carpeta entera**: actuaciones, evidencia y renombres.
- Se evalúa **contra la rama principal después de la fusión**, no contra una rama de trabajo que T1 manda borrar.
- «Un folio por commit» deja la forma mínima. Lo que protege la foja es «ninguna pieza cambia después del primer push».
- La norma declara que **la fusión de una rama con expediente no se aplasta**, o bien que la foja no depende del commit de alta.

---

### R-05 · P1 · E1: el plan no deja coherente lo ya escrito; consolida cuatro formas vivas y deja al segundo ejemplar con el mismo defecto que el primero

**Las formas que ya existen, medidas.**

| Forma | Identificador | Piezas | Evidencia | Estado | Commits |
|---|---|---|---|---|---|
| `IA.SDD-exp1` 0001 | carpeta `0001-` (4 dígitos) | `actuaciones/NNN-tipo-slug.md`, cabecera en tabla | `ev-NN` `.sh` + `.out`, `SHA256SUMS` | a mano, «En trámite» | 3 commits, 13 folios, 0 trailers |
| `Lab-Geometria-mig1316` | `EXP-0001` (4 dígitos): `git grep EXP- migracion/a-13.16` da 8 ocurrencias en 4 archivos | cabecera en negritas, tipos `presentacion`, `testimonio`, `informe` y un tipo `mesa` anunciado (su 001 §2, P-3) | `E-NNN` `.txt` y **`.py`**, huella completa en el índice (9/9 coinciden), 6 evidencias sin indexar y sin commitear | a mano, «abierto» con el último folio `informe` | conventional commits, sin trailer |
| 13.17 §2.3 | ninguno | `00-Contrato-De-Entrada.md`, `NN-Informe-<Comision>.md`, `NN-Plan-Y-Cierre.md`, en plano | `evidencia/` libre | no hay | — |
| `Documentacion` `Mesa-2026-09-12-Colision-Lexica/` | ninguno | `00`…`06`, cada pieza titulada «Expediente NN» (`grep '^# Expediente [0-9]+'` → 6) | — | — | — |

**Por qué Q10 no las alinea.**
- Q10 dice que los dos adelantos «se alinean con una actuación nueva». Una actuación nueva **no puede**:
  - renombrar la carpeta a cinco dígitos: R-04 punto 2 muestra 13 × R100;
  - cambiar el tipo de un folio ya asentado: `testimonio` no tiene estado en Q5 (R-11), y `mesa` no está entre los 11 tipos de Q6;
  - renombrar `E-NNN` o `ev-NN` a `NNN-<slug>.txt`.
- Resultado: los adelantos quedan **permanentemente fuera de forma**, más la norma nueva y la 13.17 si se fusiona antes. Son cuatro formas vivas, no una.
- **«Cero colisiones de `EXP-`» ya no es cierto.** Q4 lo afirma con `ev-03`, que corrió sobre `main`. En la rama de la migración vive `EXP-0001` de cuatro dígitos, y al fusionarla va a convivir con el `EXP-00001` que Q4 prescribe.

**El segundo ejemplar tiene el P0 de R3 y 013 no lo dice.** Contrasté sus folios «literales» contra `ev-07`, que el presidente tenía en la mano:

```
fragmento del original             ev-07  mig001  mig002
'podes seguir migrando'              1      0       0
'me centraria primero'               1      0       0
'y todo lo demas hace lo vos'        1      0       0
'arma una mesa'                      1      0       0
'tenes el ok'                        1      0       0
mig001 l.12 «## 1. El pedido, literal» · mig002 l.12 «## 1. El testimonio, literal»
```

- El 001 de la migración normaliza, reordena, **funde en un solo pasaje** tres párrafos del original y omite «y todo lo demas hace lo vos, pero con una excepción».
- 013 lo usa como «segundo ejemplar» (l.10) y B.2 lo propone como instancia de prueba, **sin haberlo contrastado**.

**Qué cambiaría.**
- Q10 declara los adelantos **forma histórica**, como V3-05 hizo con el precedente, en lugar de prometer una alineación que Q6 impide.
- O bien habilita **un único renombre antes del primer push**, con constancia.
- El lote suma **una constancia en `mig1316`** (rama sin push) que declare que sus folios 001 y 002 no son literales y preserve el original, antes de que esa rama se publique.

---

### R-06 · P1 · E2 + E1: J-01 no lo contesta el árbol; el presidente evitó una escalada que el origen del hecho manda

**El fundamento de Q1(b) lee mal la línea que cita.**
- `README.md` l.152 dice: *«Ningún archivo de este repositorio **referencia** otro repositorio. […] los **estándares de industria** se nombran, no se enlazan.»*
- «Se nombran, no se enlazan» vale para los estándares de industria. Para otros repositorios la línea prohíbe **referenciarlos**, y nombrar un repositorio es referenciarlo.
- Medido: `grep -rnoE 'IA\.SDD\.Documentacion|Lab-Geometria|RPI\.VideoControl' <expediente>` da **284 líneas**.
- La propiedad ya estaba erosionada: 17 líneas de la norma nombran `IA.SDD.Documentacion` (`grep -rnoF … | wc -l` → 17, que coincide con N1-08 réplica). Pero Q1(b) **cambia el enunciado de una propiedad declarada** sin decirlo.

**Hay un hecho que 013 no mira.**

```
stat -c '%y %n'
2026-09-13 11:56:02  IA.SDD.Documentacion/Expedientes
2026-09-13 11:58:27  IA.SDD/Expedientes
2026-09-13 11:59:10  Lab-Geometria/SDD/Expedientes
ev-07: mensaje del Product Owner 2026-09-13T12:03:02-03:00
```

- Las tres carpetas son **anteriores** al mensaje, y la de documentación fue la primera. Quién las creó no lo sé (`C`).
- El literal del Product Owner llama a lo del framework «expediente **de reportes**», y los reportes viven en `IA.SDD.Documentacion`.
- Son dos lecturas legítimas que ningún ancla desempata: es el disparador 1 de `Mesa-Rules.md` §7.

**El origen del hecho, aplicado.**
- La carpeta y el mensaje no viven en ningún repositorio, así que el hecho «se trata como de la corrida» (`Master-Prompt.md` l.980) y se evalúa contra la autocorrección.
- Pero la autocorrección se detiene igual si cerrarlo exige «**intención de producto que ninguna fuente contiene**» (l.998).
- Dónde quiere el dueño los casos del framework frente a su propia regla de autosuficiencia es exactamente eso.
- Y si hubiera duda, la mesa «aplica el criterio por defecto y **lo registra en la deuda declarada**» (l.576). 013 l.75 dice «No se escala J-01» **y no registra nada**.
- Además, el presidente decidió un ítem que él mismo elevó al jurado (A.2). §6.3 le manda consolidar «sin juzgar» (l.416).

**Qué cambiaría.** J-01 va al **lote**, disparador 1:
- opciones: `IA.SDD/Expedientes/` o `IA.SDD.Documentacion/Expedientes/`;
- `SI NO RESPONDÉS`: la propuesta de Q1, raíz de `IA.SDD` con exclusión del snapshot;
- además, **declarar como reformulación** de l.152 lo que Q1(b) hace.

El costo es una fila del lote. El beneficio es no normar sobre una intención inferida.

---

### R-07 · P1 · E2 + E1: Q7 clasifica mal el testimonio que contiene una aprobación, y no resuelve la exclusión de D9

**Qué dice Q7.** El testimonio «funda intención y alcance y no estado del sistema», y por eso «no se agrega un tipo a D9».

**Por qué no alcanza.**
- `ev-07` abre con «tenes el ok de la fase K». Eso **no es intención: es la aprobación** del punto de control.
- `mig1316` folio 002 la usó para cambiar el **estado** del roadmap: la fila `k` pasó de «punto de control pendiente» a «cerrada», en `Roadmap-Producto.md` 1.12 → 1.13.
- Por la letra de D9, eso es tipo `humano`: *«una aprobación explícita registrada con fecha»* (`Deriva-Rules.md` l.53).
- Q7 le negaría a esa pieza la condición de evidencia justo donde D9 la exige.
- Y el choque que V2-04 y V2-02 réplica pidieron resolver **en la norma** sigue abierto: l.55 excluye «una captura de una conversación», y `ev-07` es, literalmente, una extracción de la transcripción de una conversación. **Q7 no dice qué la saca de esa exclusión.**

**Contra la 13.17.** §3.2 (l.159) dice «El testimonio de quien pidió es evidencia E4». Q7 lo contradice, y B.1 lo anota para alinear. Ver R-12.

**Qué cambiaría.**
- Clasificar **por lo que contiene cada pasaje**, no por el canal:
  - la aprobación entra como `humano` de D9, con el original preservado;
  - el pedido es fuente de intención, fuera de D9;
  - la afirmación de estado queda en `C` hasta que la corrobore un `artefacto` o una `ejecucion`.
- Agregar a D9 **una oración que diga cuándo un asiento literal con original y huella deja de ser «captura de conversación»**.
  - Eso modifica el texto de una invariante: se declara en J-07.
  - La alternativa es dejar D9 intacta y aceptar que las aprobaciones por chat no son evidencia, **y decirlo**.

---

### R-08 · P1 · E2: Q11 dice «ninguna detención», y §8.1 gobierna cuatro familias, dos de las cuales no se pueden reemplazar por una mesa

**Qué ataqué.** Q11: «Ninguna detención sale sin pasar este orden: (1) origen del hecho… (3) … una mesa por lote de fase».

**Contra qué choca.**
- `Master-Prompt.md` l.880: «Esta sección gobierna **las cuatro familias** de detención».
- l.884: dos de ellas son la **confirmación de un plan** y el **traspaso de §12.1 T4**.
- El T4 es la detención por la que el agente no fusiona (l.1691). **No hay mesa que la reemplace.** Pasarla por un orden de mesa no tiene sentido y, cableado en los tres orquestadores, frena todo traspaso.
- La confirmación del plan de M1 es la aprobación humana de `Master-Prompt-Migracion.md` §3 («Sí: presenta el plan completo y espera aprobación»).

**Qué cambiaría.**
- Acotar Q11 a **las dos familias que preguntan**: ambigüedad de §9 y arbitraje de §7.0.
- Excluir por nombre la confirmación de plan y T4.
- Que el «cableado en l.46» se declare como **modificación** de «no la reconvoca dos veces», con su motivo. No como simple cita.

---

### R-09 · P2 · E2 + E1: el ámbito «repositorio» de Q4 modifica D3, no la extiende; J-07 no puede quedar abierto con Q4 así escrito

**Evidencia.**
- `Root-Rules.md` l.389: «Todo identificador declara en qué ámbito es único. **Hay dos**».
- `README.md` l.113, D3: los identificadores son únicos en su ámbito declarado, «el **producto** … y el **conjunto normativo vigente**».
- Agregar un tercero **reescribe el texto de D3**, y la guía §VI.5 dice que tocar una invariante es major.

**Qué hace B.1.**
- Deja la severidad de «`EXP` y el ámbito repositorio» como pregunta al jurado.
- Pero declara minor la regla que la contiene.
- Q6, además, crea actuaciones sin control de cambios, contra D5 («Todo documento lleva su sección de control de cambios», README l.113 y siguientes).

**Qué cambiaría.** Hay dos caminos, y los dos son legítimos:
- **Opción A.** Tomar la lectura de V5 Q4 (013 A.2, J-06): **número local más repositorio, familia excluida con motivo**. No toca D3, y el salto sigue siendo minor.
- **Opción B.** Mantener `EXP-NNNNN` alcanzada y **declarar el major**, con su bloque de impacto.

Lo que no resiste es presentar la opción B como minor.

---

### R-10 · P2 · E2: Q8 mete el expediente en un campo que la norma declara calculado, y la cita compuesta `EXP-NNNNN/NNN` no tiene precedente

**1. El ciclo de origen.**
- `Master-Prompt.md` §8.2 fija un campo con **tres datos calculados y congelados**: fase o «mesa y su fecha» (l.1115), unidad de trabajo y base corta.
- Q8 propone que el artefacto cite `<repo> EXP-NNNNN/NNN` «en su motivo **o en su ciclo de origen**».
- Eso agrega un **cuarto dato declarado** a un campo que §12 dice que «**se calcula, no se declara**».
- Y el propio §8.2 cierra: «lo que se puede derivar del commit no se declara aparte». Con el trailer de Q6, el expediente **ya es derivable** del commit que escribió el hueco.
- B.1 no lista ni `Master-Prompt.md` §8.2 ni `Root-Rules.md` §12.

**2. La cita compuesta.**
- `grep -rnoE '\b[A-Z]{2,5}-[0-9]{5}(/[0-9]+| (FA|CA)-[0-9]{2})' SDD PROMPTS` → 0.
- `Root-Rules.md` l.457 declara para `AG` que la relación va «en el número en lugar de en un **sufijo compuesto, que §9.2 no admite**».
- Q4 excluye el folio como posición, pero Q8 lo **cita desde afuera del expediente** a través de repositorios. Por §9.1, eso es precisamente «el motivo del ámbito propio».

**Qué cambiaría.**
- El ciclo de origen no se toca.
- **Una sola vía declarada**: la fila de control de cambios del artefacto nombra el expediente, como el precedente `ADR-08006` 1.1 (V4-03).
- La cita apunta a la **carpeta** del expediente, y el folio va en la prosa.
- La dirección inversa se deriva con `git grep` del nombre de la carpeta.

---

### R-11 · P2 · E1: el mapeo tipo → estado de Q5 no es cerrado, y los dos ejemplares ya caen en sus huecos

**Enumeración sobre el texto de 013 l.79-80.**

| Tipos de Q6 | Estado según Q5 |
|---|---|
| `presentacion` | abierto |
| `providencia`, `informe`, `refutacion`, `veredicto`, `dictamen` | en trámite |
| `constancia` | suspendido, **sólo si es de suspensión** |
| `resolucion` | resuelto |
| `archivo` | archivado, con **tres sentidos**: aplicado, cerrado por decisión o desistido |
| `reapertura` | reabierto |
| **`testimonio`** | **sin estado** |
| **`constancia` que no suspende** (003, 012) | **sin estado**, o «suspendido» falso |

**Aplicado a los ejemplares.**
- Después del folio 012 de este expediente, que es una constancia de corrección, el estado derivado sería indefinido o «suspendido».
- `mig1316` después de su 002 (`testimonio`): indefinido.
- `mig1316` después de su 003 (`informe`): «en trámite», pero su README dice «abierto».
- Además, «derivado del tipo» no alcanza para el estado suspendido: exige un **subtipo** de constancia.

**Qué cambiaría.**
- Menos tipos, con mapeo total y verificado por enumeración antes de normarlo.
- La suspensión como **campo** de la constancia («Suspende hasta: artefacto §»), no como tipo.
- Un tipo terminal con su motivo en un campo, no tres sentidos en una palabra.
- Formal, postergada, es quien tendría que auditar esto **antes** de que la intervención lo aplique (ver R-13).

---

### R-12 · P2 · E1: la alineación con la 13.17 está subdeclarada, y el orden de fusión decide si queda una contradicción publicada

**Evidencia.** B.1 nombra sólo §2.3 y §3.2 de la 13.17. La forma que Q3 reemplaza aparece además en otros cuatro lugares:

```
l.117-120  §2.3  tabla de piezas
l.224      §5.2  «Escribís tu informe verbatim en {{RUTA}}/{{NN}}-Informe-{{COMISIÓN}}.md»
l.229-238  §5.3  árbol de la carpeta
l.252      §6    criterio [enumerable] «tiene README.md, 00-Contrato-De-Entrada.md…»
```

**Por qué importa el orden.**
- La 13.17 §8 sólo promete reescribir §2.3. Nada obliga a tocar §5.2, §5.3 ni §6.
- La 13.17 no está en `main`. Si se fusiona antes de la intervención `09`, `main` publica:
  - «el testimonio es E4», que Q7 contradice y que `Lab-Geometria` ya usó así (V5-01);
  - un esqueleto de despacho que produce la cuarta forma de R-05.

**Qué cambiaría.**
- Alinear §2.3, §3.2, §5.2, §5.3 y §6.
- **Condicionar la fusión de la 13.17**: o se corrige su §3.2 antes de fusionar, o su propio §8 declara también §3.2 y §5 como deuda del artefacto.
- B.1 lista las cinco secciones.

---

### R-13 · P2 · E1 + E2: dónde se nota que la Parte B la escribió el presidente sin cuerpo de parches

1. **Seis de los siete ítems del jurado ya vienen decididos en la Parte B.**
   - J-01 en Q1, J-02 en Q7, J-03 en Q7, J-04 en Q9, J-05 en Q8 y J-06 en Q4. Sólo J-07 queda abierto.
   - El jurado recibe «contradicciones elevadas» junto con la propuesta de quien las elevó ya puesta como plan.
   - La declaración de límites de l.13 lo reconoce en general, pero **la tabla Q no muestra la lectura rechazada ni el motivo del rechazo**.
   - N1-02, de las dos convocatorias, propuso escalar J-01 y no aparece en la columna «Fundamento».
2. **Q1 ratifica el acto propio.** Propone la ubicación donde el presidente ya escribió este expediente, con un fundamento que no resiste (R-06).
3. **El presidente midió `J-` y no `R`.**
   - 013 l.11 midió `\bJ-[0-9]{2}\b` → 0. Lo repetí en la norma, `Lab-Geometria`, Documentación y VideoControl: 0, 0, 0 y 0.
   - Pero `R1`–`R18` (raíces, 48 tokens en 013) **colisionan dentro del mismo expediente** con `R1`–`R6` de 002 l.39 (restricciones duras) y con `R0` de la reanudación, que 013 cita en l.86 y l.95.
   - «R3» es la raíz del testimonio en 013 y la neutralidad de stack en 002.
   - Es el defecto de `Mesa-Rules.md` §2.2 punto 1: `M-01` con cuatro significados.
4. **La réplica pudo haber sido Seguridad.**
   - Seguridad la pidieron seis comisiones en las dos convocatorias (A.3). Hay 13 menciones en 004 a 011 y la réplica.
   - La segunda convocatoria nació de un error del presidente (003).
   - Por `Mesa-Rules.md` §5.5, «Empate en la convocatoria: se convoca» (l.341). Re-despachar un panel idéntico en lugar de sumar la señal más pedida fue una elección, y no quedó registrada como tal.
5. **El segundo ejemplar se usó sin contrastarlo** con `ev-07`, que ya estaba en la mano (R-05).
6. **La deuda de seguridad cierra en la misma intervención que aplica el plan** (B.2). Quien diseña fija como control la etapa que ya da por aprobada.
7. **El conjunto de preguntas Q1–Q12 no está asentado antes de 013.** `grep -cE '\bQ[0-9]+\b'` sobre 001 y 002 da 0 y 0. Las preguntas salen de la carta no asentada (R11): el jurado vota respuestas a preguntas cuya formulación original no está en el expediente.

**Qué cambiaría.**
- Que la tabla Q presente, por cada J, **las dos lecturas con su fundamento y la recomendación marcada como del presidente**, sin darla por plan.
- Que las raíces se renumeren con un prefijo medido.
- Que la carta se asiente como evidencia antes del veredicto, reconstruida mecánicamente de la transcripción como se hizo con `ev-07`, y no de memoria.

---

### R-14 · P3 · E2: el trailer obligatorio fija una convención que el framework declaró no fijar, y B.1 omite secciones que el plan toca

**1. El trailer.**
- `Coherencia-Conformacion-Pull-Request-Manual.md` l.28: quedan afuera «la convención de nombre de rama y **de mensaje de commit** […] **El framework no los fija**».
- Hacer obligatorio `Expediente:` en el mensaje revierte esa decisión.
- `Lab-Geometria` usa conventional commits: 84 de los últimos 200 asuntos.
- No choca con la neutralidad de stack (ver §4), pero **es una decisión nueva y tiene que declararse como tal**.

**2. Secciones que el plan toca y B.1 no lista.**

| Sección | Por qué la toca el plan |
|---|---|
| `Mesa-Rules.md` §8, criterio 1 (l.609) | «El registro de mesa existe en `SDD/Docs/Audit/…`» da falso en el framework si Q9 dice que el expediente es el registro |
| `Master-Prompt.md` §8.2 y `Root-Rules.md` §12 | Por Q8 (R-10) |
| `README.md` l.152 | Por Q1(b) (R-06) |
| `Master-Prompt.md` §12.1 T1 | Por la estrategia de fusión (R-04) |
| La compuerta de ofuscación | Hoy alcanza sólo a `Conocimiento/` (`Rules-Base-Conocimiento.md` l.162). Q7 la extiende a la evidencia sin artefacto que la aloje |

**Qué cambiaría.**
- El trailer pasa a opcional, o se declara como decisión con su motivo.
- B.1 suma esas filas.

---

## 3. Tabla de impacto sobre el plan

| Ítem | Veredicto | Motivo |
|---|---|---|
| **Q1** | cambiar | En destino resiste. En el framework, J-01 va al lote con default (R-06), y (b) se declara reformulación de l.152 |
| **Q2** | cambiar | No es decidible al abrir, y abre por toda mesa y toda detención (R-02) |
| **Q3** | cambiar | 47 campos, 4 archivos, N+1 commits y 12 pasos. El README copia datos derivados (R-01) |
| **Q4** | cambiar | El ámbito «repositorio» modifica D3, `EXP-0001` ya existe en un destino, y la cita es compuesta (R-09, R-10, R-05) |
| **Q5** | cambiar | Mapeo no cerrado: `testimonio` y constancias sin estado (R-11) |
| **Q6** | cambiar | No cubre evidencia ni renombres, depende del merge, y el ejemplar lo incumple (R-04) |
| **Q7** | cambiar | La aprobación contenida en un testimonio es `humano` de D9, l.55 sigue sin resolver, y «antes de sellar» llega tarde (R-07, R-03) |
| **Q8** | cambiar | No tocar el ciclo de origen, una sola vía declarada, citar la carpeta (R-10) |
| **Q9** | resiste | Conviven sin mudanza. Sólo falta sumar `Mesa-Rules.md` §8 a B.1 (R-14) |
| **Q10** | cambiar | Alinear los adelantos por actuación nueva es imposible con Q6: forma histórica o un renombre antes del push (R-05) |
| **Q11** | cambiar | Acotar a ambigüedad y arbitraje. T4 y la confirmación de plan quedan fuera (R-08) |
| **Q12** | cambiar | Pase en el folio. El README remite y no copia el commit (R-01) |
| **J-01** | cambiar | Escalar por disparador 1 con default. No lo contesta el árbol (R-06) |
| **J-02** | resiste | «Hash sólo para lo no versionado o exportado». `mig1316` muestra que la huella completa verifica (9/9) y que el problema es el índice a mano, no el hash |
| **J-03** | cambiar | Ninguna de las dos lecturas del plan: clasificar por contenido (aprobación `humano`, pedido intención, estado `C`) y decidir la oración de D9 (R-07) |
| **J-04** | resiste | «El expediente folia por enlace y `Audit/` sigue siendo la fuente», con la 13.17 l.123-126 y V4-01 |
| **J-05** | resiste con condición | Derivar sin tabla, siempre que la fusión no aplaste la historia y la derivación use la ruta y no sólo el trailer (R-04, R-14) |
| **J-06** | cambiar | Preferir número local más repositorio como familia excluida (V5 Q4). Evita tocar D3 (R-09) |
| **J-07** | cambiar | No puede quedar abierto: con Q4 y Q6 como están es major, y con la opción A de R-09 y la forma de §5 es minor. Decidir junto con J-06 |

---

## 4. Lo que ataqué y resiste

1. **La convivencia sin mudanza con `Audit/` (Q9) y la no retroactividad sobre los 113 + 51 archivos.** La ataqué contra `Mesa-Rules.md` §2.1, contra los informes de migración y de estado en `Audit/` (`Master-Prompt-Migracion.md` l.330; `Master-Prompt-Reanudacion.md` §5) y contra la intocabilidad (guía l.1016). No hay choque: nada se mueve y nada se duplica, y la 13.17 l.123-126 dice lo mismo («la carpeta lo enlaza, no lo duplica»).
2. **La exclusión del snapshot con el motivo de `CHANGELOG.md` (Q1a).** El criterio de l.990 es «no condicionan lo que el orquestador genera». Ningún orquestador lee `IA.SDD/Expedientes/`, porque la lectura de R0 de Q12 es sobre expedientes de destino. La exclusión se funda con cita y no por la carpeta, que era el error de 001 §2.2.
3. **Hablar de commits y de `git` en una regla no rompe la neutralidad de stack.** La norma ya lo hace: `Migracion-Rules.md` l.678 (`git log -S`) y l.682 («la fecha y el mensaje del commit dan la fase»), `Master-Prompt.md` l.1131 (`git show`). La guía recomienda el «mensaje de confirmación» como **subproducto del acto** (l.596). El reporte `30` §3.1 veta nombres de un ecosistema de construcción (`.csproj`, `wwwroot`), no el control de versiones que el método ya asume. Lo que no resiste del trailer es otra cosa (R-14).
4. **Q11 respeta el origen del hecho; no lo invierte.** El orden de Q11 es el de `Master-Prompt.md` l.977-998: primero el origen, después autocorrección o pregunta previa. Coincide con `Mesa-Rules.md` §7, «Antes de la lista, el origen del hecho». La falla de Q11 es de alcance (R-08), no de orden.
5. **El prefijo `J-` de los ítems del jurado.** Da 0 en la norma sin `_legacy`, en `Lab-Geometria` `main`, en `IA.SDD.Documentacion-exp1` y en `RPI.VideoControl` `HEAD`, y 013 lo midió antes de usarlo. Es la conducta que R-13 punto 3 le pide también para `R`.

---

## 5. Forma mínima alternativa

**Principio.** Nada que se pueda leer del árbol o de git se escribe a mano. El control de inmutabilidad cubre la carpeta entera. El original de un testimonio viaja con el folio que lo presenta.

```text
SDD/Expedientes/<NNNNN>-<Titulo>/            (en el framework: la ubicación que resuelva J-01)
├── README.md
│     Número · Título · Apertura · Origen (folio 001) · Base          → 5 campos
│     «Índice: el listado de actuaciones/. Estado y qué sigue: el pase del último folio.»
├── actuaciones/NNN-<tipo>-<slug>.md
│     Cabecera: Tipo · Fecha · Autor · Corrige (folio o —)               → 4 campos
│     (expediente y folio se leen de la ruta: son derivados, Root-Rules §10)
│     Pase, última línea: «Sigue: <acto> · <quién>»                      → 1 campo
│     Si el folio asienta palabras del Product Owner:
│       bloque literal byte a byte + Canal · Fecha-hora con zona · Huella → 3 campos
│       (la versión legible es opcional y declara su transformación)
└── evidencia/                                (sólo si hay)
      cada archivo abre con: Método o comando · Base o fecha-hora · Quién → 3 campos
```

**Tipos, en conjunto cerrado de seis, con mapeo total a estado.**

| Tipo | Estado |
|---|---|
| `presentacion` | abierto, o reabierto si hay una resolución anterior |
| `providencia`, `informe` | en trámite |
| `constancia` | en trámite, o suspendido si lleva «Suspende hasta: artefacto §» |
| `resolucion` | resuelto |
| `archivo` | archivado, con «Motivo:» en un campo |

La refutación y el veredicto son `informe` con autor declarado.

**Reglas de sellado.**

| Regla | Qué pide |
|---|---|
| **S1** | Ninguna pieza de la carpeta, sea actuación o evidencia, se modifica, borra o renombra **después del primer push**. Se comprueba con `log -M --diff-filter=MDR` sobre la carpeta, contra la rama principal ya fusionada |
| **S2** | Antes del primer push corre la compuerta de datos personales, credenciales y rutas de host. Lo que se redacta deja una constancia con la huella del original y su custodia |
| **S3** | La rama que lleva un expediente no se fusiona aplastando la historia, o la foja se declara no observable |

Sin commit por folio, sin trailer obligatorio y sin manifiesto de hashes. El hash sólo para lo no versionado, que es J-02.

**Vínculo con la especificación.** Una sola vía declarada: la fila de control de cambios del artefacto nombra `<repositorio> <carpeta del expediente>`. La inversa se deriva con `git grep` del nombre de la carpeta.

**Conteo, sobre el mismo caso de R-01.**

| | Plan Q3+Q6+Q7+Q12 | Alternativa |
|---|---|---|
| Campos | 47 | **18**: README 5; folio 001, 4 + 1 + 3; folio 002, 4 + 1 |
| Archivos | 4 | **3** |
| Commits mínimos | N+1 = 3 | **1** (T3: una unidad) |
| Pasos | 12 | **5**: evaluar el umbral, crear carpeta y README, asentar 001 con su original, asentar 002, correr S2 antes del push |
| Datos derivados escritos a mano | índice, estado, commit del último folio | **ninguno** |

**Completa, cuando corresponde.**
- Carta de cada despacho en `evidencia/`, antes de despachar.
- Una constancia que folia por `ruta@commit` el registro de mesa, el informe de estado o el de migración en `Audit/`.
- Una resolución con veredicto por criterio.
