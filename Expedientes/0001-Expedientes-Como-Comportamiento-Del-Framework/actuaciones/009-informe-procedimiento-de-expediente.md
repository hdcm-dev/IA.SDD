# Actuación 009 — Informe de la Comisión V3 — Procedimiento de expediente

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 009 |
| Tipo | `informe` |
| Fecha | 2026-09-13 |
| Autor | Comisión V3 — Procedimiento de expediente, primera convocatoria (actuación 002 §3), a ciegas |
| Despacho y entrega | Despachada 2026-09-13T12:15:10-03:00; informe final 2026-09-13T12:22:37-03:00 |
| Asentada por | Presidente de mesa, **por extracción mecánica** del último mensaje del subagente en su transcripción, sin edición. SHA-256 del cuerpo (desde la línea siguiente a la regla horizontal): `44839b53dbbed564705c81ecae3ec4e84e5bec3b226c6e9101d88aa2ad411289` |

---

# Informe — Comisión V3 · Procedimiento de expediente

## 1. Cabecera

| Campo | Valor |
|---|---|
| Comisión | V3 — Procedimiento de expediente (judicial, administrativo y de comisión investigadora). Ad hoc, con la carta de mandato de la actuación 002 §3.2 |
| Fecha | 2026-09-13 |
| Encargo | Refutar, no verificar |
| Tope | 8 hallazgos, más hasta 3 «lo que revisé y está bien» |

### Base leída

- **Expediente 0001, leído entero**: `README.md`, `actuaciones/001-presentacion-del-product-owner.md` y `actuaciones/002-providencia-convocatoria-de-mesa.md`. También leí `evidencia/ev-03-colision.sh` con su `.out` y `ev-05-citas.out`. La integridad de las diez sumas se comprobó con `sha256sum -c SHA256SUMS`, y las diez dieron «La suma coincide».
- **`Mesa-Rules.md` 1.3**, entero.
- **`Master-Prompt.md`**: §7.0 (l.596-743) y §8.1 (l.878-1095).
- **`Master-Prompt-Reanudacion.md`**: §5 (l.434-469) y §5.1.
- **Precedente**: `IA.SDD.Documentacion-exp1/PROMPTs/Fixs/05-Fix-Reporte-27/OUTPUTs/Mesa-2026-09-12-Colision-Lexica/`, piezas `00`, `05` y `06` enteras, más un `grep` sobre las siete. Leí también `Reportes/README.md` 1.32.
- **Destino `Lab-Geometria`**, leído con `git show main:`: `SDD/Docs/Audit/Mesa-2026-09-12.md` 1.2 (cabecera, §1-§4 y control de cambios) y `Mesa-2026-09-12-ciclo-2.md` 1.1 (§0-§2 y §8). Historial con `git log main`.

### Fuentes externas

Todas se consultaron en línea con una herramienta de lectura que devuelve la página procesada. Donde pedí transcripción literal lo marco «literal». Donde la herramienta resumió, lo marco «resumen», y en esos casos **no cito texto entre comillas como si fuera de la norma**.

| Norma | URL | Qué se obtuvo |
|---|---|---|
| **Decreto 894/2017**, texto ordenado del Reglamento de Procedimientos Administrativos (Decreto 1759/72) | https://www.argentina.gob.ar/normativa/nacional/norma-285797/texto | Arts. 7, 9, 10 y 63: **literal**. Arts. 15, 16, 80 y 105: **resumen** |
| **Ley 19.549**, texto actualizado | https://servicios.infoleg.gob.ar/infolegInternet/anexos/20000-24999/22363/texact.htm | Art. 1 bis, incs. b, e, g.vii y k; art. 7: **resumen con fragmentos entrecomillados**. No verifiqué qué norma dio la redacción vigente |
| **Decreto 561/2016** (GDE) | https://servicios.infoleg.gob.ar/infolegInternet/anexos/260000-264999/260145/norma.htm | Art. 1, **fragmento literal** |
| **Ley 39/2015** (España), art. 70 | https://www.iberley.es/legislacion/articulo-70-ley-39-2015-procedimiento-administrativo-comun-administraciones-publicas | **Resumen por apartados, de fuente secundaria**. El BOE (https://www.boe.es/buscar/act.php?id=BOE-A-2015-10565) llegó truncado antes del art. 70; de ahí sólo obtuve el art. 17 (archivo), en resumen |
| Ley 39/2015, art. 57 (acumulación) | — | **No consultado**: la fuente devolvió 403. No lo cito |

**No consultadas**: reglamentos de comisiones investigadoras parlamentarias y códigos procesales (Código Procesal Civil y Comercial de la Nación, CPCCN). **No afirmo nada de ellos.**

---

## 2. Hallazgos

### V3-01 · P1 · E1 + E2 — La foliatura declarada no tiene sello, y el precedente muestra que se pierde

**Ancla.**
- `README.md` l.25: *«**Foliadas y nunca reescritas.** Una corrección es una actuación nueva que nombra el folio que corrige.»*
- Estado del árbol, con comando y salida:
  - `git -C IA.SDD-exp1 status --short` → `?? Expedientes/`
  - `git ls-files Expedientes | wc -l` → `0`
  - `git log --all --oneline -- Expedientes` → sin salida
- Precedente, `06-Plan-Y-Cierre.md` l.202-203: dos filas de control de cambios, `1.0` («la refutación quedaba en curso») y `2.0` («Entra la refutación… cierra `ESC-1`»). Pero `git log -- …/06-Plan-Y-Cierre.md` → **un solo commit**, `eff6729 2026-09-12 14:53:31`.

**Impacto.**
- La versión 1.0 del cierre del precedente, que llevaba `ESC-1` «escrita y lista para salir al Product Owner», **no existe en ningún objeto de git**: la pieza se reescribió antes del primer commit.
- Git es de sólo agregado para lo que está commiteado, no para el árbol de trabajo. **Un expediente que se commitea al cerrar se aplasta**, y la garantía de «nunca reescritas» queda en declaración.
- El expediente 0001 está hoy en esa condición: sus tres archivos se modificaron entre las 12:12 y las 12:13 y ninguno está versionado.

**Fuente procesal.**
- Dec. 1759/72 t.o. 2017, art. 9 inc. b (literal): *«todas las actuaciones deberán foliarse por orden correlativo de incorporación»*.
- Ley 39/2015, art. 70.3 (resumen): el expediente se remite foliado y con un índice autentificado que garantiza integridad e inmutabilidad.

La foliatura existe para que **incorporar sea un acto datado e irreversible**, no para numerar hojas.

**Dirección de la corrección.**
- El equivalente de la foja es **el commit que incorpora la actuación**: se asienta una actuación y se hace un commit.
- El índice lleva el folio junto con el commit que lo incorporó.
- La carpeta del expediente queda fuera de toda operación que reescriba historia (squash o rebase antes de fusionar).
- **Sin commit, no hay folio.** Lo que esté en el árbol sin commitear no es actuación.
- La numeración de página no aporta nada sobre git y **no se adopta**.

### V3-02 · P2 · E2 — La tipología de actuaciones no separa trámite de decisión, y la providencia decide

**Ancla.**
- 002 l.27: *«**Este expediente es el registro**, con las nueve secciones de §2.2 repartidas en actuaciones»*. Esto aparta de hecho a `Mesa-Rules.md` §2.1 (l.156: registro en `SDD/Docs/Audit/Mesa-<AAAA-MM-DD>.md`), que el mismo contrato de 002 declara `decisiones_cerradas`.
- 002 §6.1 (l.102-104): *«**No se escribe en ella**»*, sobre la tercera carpeta.
- Autor de 002: el presidente, que por `Mesa-Rules.md` l.116-118 *«No emite hallazgos, no vota y no diseña parches»*.
- Precedente, `06-Plan-Y-Cierre.md` l.3-6: lo escribe el orquestador, y su tabla asigna «Aprobado» y «Se corrige» a partes del plan.

**Impacto.**
- Una decisión de forma (dónde vive el registro), una de alcance (qué pasa con la tercera carpeta) y una de trámite (convocar) llegan **con el mismo tipo `providencia` y el mismo autor sin voto**.
- En el precedente, **el que no vota resolvió**.
- Un lector posterior no puede saber qué del expediente es decisión revisable y qué es impulso.

**Fuente procesal.**
- Ley 19.549, art. 7 (resumen): el acto que decide exige causa (hechos y antecedentes) y motivación expresa.
- Dec. 1759/72 t.o. 2017, art. 80 (resumen): los informes y dictámenes son medidas preparatorias y no deciden.

La práctica procesal separa el **impulso** (providencia de trámite) del **informe o dictamen** (preparatorio) y de la **resolución** (decide, motivada, dictada por quien tiene competencia).

**Dirección de la corrección.**
- **Tipología cerrada de actuaciones, atada a quién puede dictar cada una**:
  - presentación: la parte;
  - providencia: el presidente, sólo trámite;
  - informe: el panel;
  - veredicto: el jurado;
  - resolución: el órgano que §7 designe, jurado o Product Owner;
  - constancia: hechos y errores propios.
- Cuando una providencia necesita tomar una decisión de forma para poder seguir, la declara **como supuesto provisorio** (el mecanismo ya existe: `Mesa-Rules.md` l.234-236, «un supuesto declarado») y la resolución final la confirma o la revoca.

### V3-03 · P2 · E2 — La carátula mezcla identidad inmutable con estado mutable y no registra movimientos

**Ancla.**
- `README.md` l.14: `| Estado | **En trámite** — mesa convocada, panel despachado |`
- `README.md` l.45-56: «Punto de continuación», dentro del mismo archivo que la carátula y los índices.
- El README no tiene folio ni control de cambios.

**Impacto.**
- Cada asiento reescribe el estado. El expediente dice **dónde está** pero no **cuándo pasó de un estado a otro ni por qué acto**.
- La pieza que un lector sin contexto abre primero es justamente la única que no tiene historia propia dentro del caso.
- Además, el campo «Estado» se puede desincronizar del último folio y nada lo detecta.

**Fuente procesal.**
- Dec. 1759/72 t.o. 2017, art. 7 inc. g (literal): *«La identificación con que se inicie un expediente será conservada a través de las actuaciones sucesivas»*.
- Art. 7 inc. c (literal): el sistema realiza *«la caratulación, numeración, seguimiento y registro de movimientos»*.
- Dec. 561/2016, art. 1: la misma fórmula.

La identidad es fija; **el estado es un registro de movimientos, no un campo**.

**Dirección de la corrección.**
- Los campos de identidad de la carátula quedan **fijos desde la apertura**: número, título, apertura, presentante, objeto, origen.
- **Cada actuación declara el estado en que deja el caso y su «pase»**: qué acto sigue y a cargo de quién.
- El estado y el punto de continuación del README se **derivan del último folio** y se declaran vista regenerable, no evidencia.

### V3-04 · P3 · E2 + E3 — Folios preasignados, en lugar de asignados al incorporar

**Ancla.**
- `README.md` l.50-51: *«asentar cada informe **verbatim** como actuación `informe` (folios 003 a 010, en el orden de la tabla de 002 §3)»*.
- `README.md` l.54-56: *«los informes que no estén asentados no existen para el expediente. Se vuelven a despachar […] y el expediente declara la segunda convocatoria en una actuación nueva.»*

**Contraejemplo (E3).**
1. Se asientan V1 y V2.
2. V3 se corta y se vuelve a despachar.
3. La constancia de segunda convocatoria tiene que ir en un folio.

Si 005 estaba reservado para V3, la constancia queda **después** de un informe que todavía no existe, o el orden de folios contradice el orden real de incorporación.

**Impacto.** El índice deja de reflejar la secuencia de hechos, que es lo único que la foliatura garantiza.

**Fuente procesal.** Dec. 1759/72 t.o. 2017, art. 9 inc. b (literal): *«por orden correlativo de incorporación»*.

**Dirección de la corrección.**
- El folio se asigna **al asentar**: es el siguiente libre.
- El orden de las comisiones es contenido de la providencia, no numeración.

### V3-05 · P2 · E1 + E2 — «Expediente» ya nombra tres cosas distintas en el corpus

**Ancla, con comando y salida** (`grep -rn -i 'expediente'` sobre la carpeta del precedente):
- `05-Informe-Refutador.md:1: # Expediente 05 — Refutación del plan compuesto`, y lo mismo en `01` a `04` y `06`: **cada pieza se llama «expediente»**.
- `00-Contrato-De-Entrada.md:9: | Ubicación de los expedientes |` y `:68: ## 5. Los expedientes`: **el conjunto se llama «los expedientes»**.

Y en `ev-03-colision.out`, íntegro (`sha256sum -c` → coincide):
- `Migracion-Rules.md:669: …en el expediente de la intervención que escribió esta sección…`: **la carpeta de una intervención**.
- `EXP-` como token: `0` en los cuatro repositorios.

**Impacto.** La figura que la mesa propone usa «expediente» para el **caso entero** y «actuación» para la **pieza**. El precedente, que 002 l.37 cita como antecedente de forma, usa «expediente» para la pieza.

Un agente que lea el precedente como modelo va a producir **un expediente por informe**. Ese es el error que el art. 7 del reglamento excluye por definición.

**Fuente procesal.**
- Dec. 1759/72 t.o. 2017, art. 7 inc. a (literal): *«el conjunto ordenado de documentos y actuaciones»*.
- Art. 7 inc. b (literal): *«se formarán mediante la agregación ordenada de los documentos, pruebas, dictámenes, informes…»*.
- Ley 39/2015, art. 70.1 (resumen): la misma definición.

**Dirección de la corrección.**
- Fijar el sentido procesal: **expediente es el conjunto, actuación es la pieza**.
- Declarar los usos anteriores como sentido histórico **sin reescribirlos** (V3-01).
- La desambiguación con `Vocabulario-Rules.md` §9 no es de mi competencia: ver solicitud S3.

### V3-06 · P2 · E2 + E3 — El ciclo de vida no tiene suspensión, desistimiento ni paralización

**Ancla.**
- `Mesa-Rules.md` l.490-495: la mesa cierra *«por criterio»* o *«por decisión»*. No hay otra forma de conclusión.
- `README.md` l.14 (`En trámite`) y l.54-56: el corte de la corrida resuelve qué pasa con los informes perdidos, pero **no qué estado queda declarado**.

**Contraejemplo (E3).** La corrida termina con escaladas enviadas al Product Owner y sin respuesta. El README sigue diciendo «En trámite» indefinidamente. Nadie impulsa, y el caso no es distinguible de uno activo.

**Fuente procesal.**
- Dec. 1759/72 t.o. 2017, art. 63 (literal): *«Los trámites administrativos concluyen por resolución expresa o tácita, por caducidad o por desistimiento del procedimiento o del derecho.»*
- Ley 19.549, art. 1 bis inc. b (fragmento): *«la Administración deberá impulsar e instruir de oficio»*.
- Ley 19.549, art. 1 bis inc. k (resumen): caducidad tras una paralización imputable al interesado, con aviso previo.

**Qué traslado y qué no.**
- **Sirve** la idea de que el caso tiene dueño del impulso y que la paralización se declara.
- **Es ceremonia** la caducidad por plazos en días hábiles: acá quien impulsa es siempre el orquestador, y el Product Owner ya tiene su default en `SI NO RESPONDÉS`.

**Dirección de la corrección.**
- **Conjunto cerrado de estados**: abierto, en trámite, suspendido, resuelto, archivado, desistido y reabierto. **Cada transición es una actuación.**
- `suspendido` lleva **el evento que lo reanuda**, con la forma del punto 4 de `Root-Rules.md` §12.2: artefacto y sección, no fecha.
- Una corrida que termina sin que el próximo acto esté en curso deja **constancia de suspensión** como último folio.
- `reabierto` sólo con ancla E1 o E2 de contradicción, igual que `decisiones_cerradas` (`Mesa-Rules.md` l.249-251).

### V3-07 · P2 · E2 — Vinculación entre casos y desglose sin forma, con casos reales ya resueltos a mano

**Ancla.**
- `Lab-Geometria`, `Mesa-2026-09-12.md` 1.2, control de cambios l.362: *«§9: `E-02`, `E-04` y `E-05` pasan a RESPONDIDA […] El texto original de las tres escaladas **no se borra**: la respuesta se agrega a continuación»*. El ciclo 2 es otro registro que tramita las escaladas del ciclo 1.
- `Mesa-2026-09-12-ciclo-2.md` §8: `D-01` queda *«Registrado también en `Mesa-2026-09-12.md` §8»*.
- El caso 0001 abarca tres repositorios: expediente en `IA.SDD`, reporte `31` y prompt `09` en `IA.SDD.Documentacion` (README l.21).
- Criterio de acumulación que ya existe de hecho: `05-Informe-Refutador.md`, ataque 4, *«corrida compartida **AND** artefacto compartido»*, para decidir entre reporte nuevo y arista de uno abierto.

**Impacto.**
- Sin forma de vinculación, cada caso inventa la suya: anotar la respuesta dentro del registro anterior, duplicar la fila de deuda en dos registros, o citar en prosa.
- La continuación del ciclo 1 **vive dentro del ciclo 1 y del ciclo 2 a la vez**.

**Fuente procesal.**
- Dec. 1759/72 t.o. 2017, art. 10 inc. c (literal), cuatro modalidades:
  - asociación: *«sólo como consulta»*;
  - fusión: *«Los expedientes fusionados pierden su individualidad»*;
  - tramitación conjunta: *«sin que pierdan su individualidad […] quedando constancia del inicio y del fin»*;
  - agregados en papel.
- Art. 10 inc. d (literal): *«Desgloses […] quedará registro en el orden que corresponda del expediente electrónico dejándose constancia de la autoridad que lo dispuso»*.

**Dirección de la corrección.**
- **Admitir asociación y tramitación conjunta; excluir la fusión**, que rompe la identificación conservada del art. 7 inc. g.
- La vinculación se declara **por actuación en los dos casos**, con identificador calificado por repositorio.
- El **desglose** —una pieza que sale del caso, por ejemplo evidencia que pasa a una especificación— deja constancia foliada de adónde fue.
- El criterio del ataque 4 es candidato natural a regla de acumulación.

### V3-08 · P1 · E2 — «Parte de las especificaciones» se lee como que el expediente es especificación; procesalmente es fundamento

**Ancla.**
- 001 l.25-32 (presentación, literal): *«las pruebas que aporte yo o las que obtuviesen los agentes quedarían como parte de las especificaciones»*.
- 001 l.76, P4, reenunciado por el orquestador sin crítica.
- Contra eso, `Mesa-Rules.md` l.164-168: *«El plan de cambios no es un artefacto propio, y es deliberado. […] un tercero obligaría a mantener sincronizados tres.»*

**Impacto.** Si el expediente **es** especificación, cada caso crea una segunda fuente de lo que el intake, los ADR o las reglas declaran. Lo que el expediente contenga y el artefacto afectado no recoja queda vigente en dos lugares. Si en cambio no es nada, P4 queda sin cumplir.

**Fuente procesal.**
- Ley 39/2015, art. 70.1 (resumen): el expediente es el antecedente y fundamento de la resolución.
- Dec. 1759/72 t.o. 2017, art. 7 inc. a (literal): *«que sirven de antecedente y fundamento al acto administrativo»*.
- Ley 19.549, art. 7 (resumen): el acto se sustenta en esos antecedentes y se motiva.
- Ley 39/2015, art. 70.4 (resumen): se **excluye** la información auxiliar o de apoyo (notas, borradores, opiniones, juicios de valor), **salvo los informes solicitados antes de la resolución**.

**Dirección de la corrección.**
- La evidencia **pasa a la especificación por la motivación, no por copia**: la resolución modifica el artefacto normal, y ese artefacto cita expediente y folio en su control de cambios.
- El expediente queda como fundamento consultable.
- **Definir qué no se incorpora**: borradores de subagentes, conversaciones y opiniones no pedidas. Los informes de la mesa sí se incorporan, porque son informes solicitados.

---

## 3. Respuestas desde mi competencia

**Q1 · Dónde vive.**
- Procesalmente, el expediente vive en el órgano que tramita, y **conserva su identificación cuando pasa a otro** (art. 7 inc. g): «saber dónde estás parado» es eso.
- Un caso de destino se abre en el destino. Un caso sobre el framework, en su repositorio.
- Lo que sale hacia otro repositorio, como el reporte, es un **pase con identificación conservada**, no un expediente nuevo.
- Si va en la raíz o en `SDD/` depende de `_legacy/` y es archivística: fuera de mi competencia.

**Q2 · Cuándo se abre, y el umbral anti-burocracia.**
- Se abre cuando se cumple la condición de `Mesa-Rules.md` §0.0 **y además** va a haber una resolución que modifique un artefacto normativo o de especificación, o que reabra una decisión cerrada. Es decir: cuando hace falta **fundamento que sobreviva a la corrida**.
- **No se abre** para la autocorrección de §8.1 (tabla de l.945 en adelante), para una ronda de audit de §10, ni para una detención que se contesta con el árbol.
- El principio de informalismo apoya el umbral: Ley 19.549, art. 1 bis inc. e (fragmento), *«excusación de la inobservancia […] de exigencias formales no esenciales»*.
- **Ceremonia que nadie completaría y no se adopta**: plazos en días hábiles, notificaciones, vistas con suspensión de plazos (art. 1 bis inc. g.vii), cuerpos, anexos con foliatura independiente, mesa de entradas y firma conjunta.

**Q3 · Forma mínima y completa.**
- **Mínima**: carátula con identidad fija (V3-03), índice de folios con su commit (V3-01), y actuaciones con cabecera de folio, tipo, fecha, autor y pase (V3-02 y V3-03).
- **Completa**: además, resolución motivada que cite folios (V3-08), constancias de error y de suspensión, vinculaciones y desgloses (V3-07), y acto de archivo.
- El README y las dos actuaciones del 0001 **ya tienen la mínima, salvo el pase por actuación y el sello**.

**Q4 · Numeración e identificador.**
- Correlativo por repositorio. Cuando se cita desde otro repositorio, **calificado por repositorio** (V3-07).
- Por el art. 7 inc. g, **el identificador no cambia en todo el trámite**, aunque el título se precise.
- `EXP-` no colisiona: `0` en los cuatro repositorios, según `ev-03`.
- No verifiqué el formato de numeración del GDE y no lo propongo como modelo.

**Q5 · Estados.** Ver V3-06. Cada transición es una actuación, y la reapertura exige ancla E1 o E2.

**Q6 · Inmutabilidad y foliatura.**
- **Sí tiene sentido en git, pero la foja no es la página: es el commit de incorporación** (V3-01).
- Git es de sólo agregado para lo commiteado. El precedente prueba que **no lo es** para lo que se commitea al cerrar.
- Si `SHA256SUMS` es redundante con los hashes de git: fuera de mi competencia (S1).

**Q7 · Evidencia y testimonio del Product Owner con fecha literal.**
- El escrito de parte lleva la firma del interesado: Dec. 1759/72 t.o. 2017, arts. 15 y 16 (resumen).
- 001 lo asienta un tercero, con fuente *«Encargo del Product Owner a la corrida, del 2026-09-13»* (l.11) y sin localizador del original. **Procesalmente es un acta labrada por quien tramita, no un escrito de parte.**
- La separación de 001 §2 y §3 está bien (ver §4).
- Falta **ratificación**: una actuación del propio Product Owner, o su confirmación explícita asentada, que convierta el acta en presentación.
- El valor probatorio frente a D9 (`Deriva-Rules.md` l.55, *«una captura de una conversación»* no es evidencia) es de V2: fuera de mi competencia.

**Q8 · Cómo la evidencia pasa a especificación.** Por la motivación de la resolución, que cita folios, y no por copia (V3-08).

**Q9 · Relación con `SDD/Docs/Audit/` y con la serie de reportes.**
- El registro de mesa en `Audit/` es **decisión cerrada** (002 l.40). Desde mi competencia no hay contradicción E1 o E2 que la reabra.
- La relación procesal es de **agregación por referencia**: el expediente folia una constancia que apunta al registro y a su commit, y el registro cita el número del expediente. Es la analogía del art. 10 inc. c.4: constancia del expediente agregado, sin duplicar su contenido.
- El reporte de la serie es el **pase a otro órgano**: la intervención sobre el framework. Cita expediente y folio.
- 002 l.27 («este expediente es el registro») es un apartamiento que debió declararse como supuesto (V3-02).

**Q10 · Retroactivo sin reescribir historia.**
- Analogía directa con el Dec. 1759/72 t.o. 2017, art. 7 incs. d y e (literal): los expedientes anteriores al GDE *«podrán continuar su tramitación en soporte papel, pero las actuaciones que en ellos se produzcan […] deberán instrumentarse en formato electrónico»*, y *«podrán digitalizar»*.
- Aplicado acá: los `Mesa-*.md` y el precedente **quedan donde están y como están**.
- Si un caso viejo necesita un acto nuevo, se abre un expediente que lo **asocia** con ruta y commit, sin moverlo ni renombrarlo.
- El uso de «expediente» del precedente queda como sentido histórico (V3-05).

**Q11 · Mesa en lugar de detención, y §8.1.**
- El análogo procesal es la **impulsión de oficio** (Ley 19.549, art. 1 bis inc. b): el órgano que tramita no espera a la parte para instruir.
- La convocatoria de mesa es la providencia que reemplaza la detención.
- Lo que sobrevive a la lista cerrada de `Mesa-Rules.md` §7 (l.554-562) sale como actuación de **requerimiento al Product Owner**, con la forma de §8.1 y su `SI NO RESPONDÉS`, que funciona como traslado con efecto por defecto. La respuesta entra como folio propio.
- Si §8.1 debe cambiar su texto: fuera de mi competencia.

**Q12 · Punto de continuación.**
- Tiene análogo exacto en el **pase** y en el **registro de movimientos** (Dec. 561/2016, art. 1; Dec. 1759/72 t.o. 2017, art. 7 inc. c): qué órgano tiene el expediente y para qué acto.
- `Master-Prompt-Reanudacion.md` l.452 ya pide lo mismo: *«La etapa o fase concreta que sigue, su puerta de entrada y los documentos que la gobiernan»*.
- **Dirección**: cada actuación termina con su pase, y el punto de continuación del README es el pase del último folio (V3-03).

---

## 4. Lo que revisé y está bien

1. **001 separa el escrito de parte de lo que agrega quien tramita.** §1 transcribe «sin editar», §2 aparta las *«tres precisiones del orquestador […] para no confundir su autoridad»*, y §3 declara *«**Esto es interpretación y no presentación**»*. Es la distinción procesal entre lo que aporta el interesado y lo que actúa el órgano, y está bien hecha.
2. **La reconstrucción sin inventar contenido.** `README.md` l.54-56 dice que los informes no asentados *«se vuelven a despachar […] —no se reconstruyen de memoria—»* y que la segunda convocatoria se declara en una actuación nueva. Coincide en espíritu con la reconstrucción del art. 105 del reglamento (resumen: con copias de lo existente y constancia de lo tramitado, no con recuerdos).
3. **La agregación sin reescritura ya se practica en el destino.** `Lab-Geometria`, `Mesa-2026-09-12.md`, control de cambios 1.1 (l.362): la respuesta *«se agrega a continuación»* y *«No se toca §10 […] que es el registro de cómo cerró la corrida del ciclo 1 y no se reescribe con información posterior»*. Cada agregado está en un commit propio (`5843e72`, `4f1be95`). **Es la práctica de V3-01 aplicada bien**, y sirve de modelo mejor que el precedente de `Documentacion`. Del mismo tipo es 002 §6.2, que deja constancia del error propio de `ev-05` antes de citar.

---

## 5. Solicitudes de convocatoria

| # | Especialidad | Señal y ubicación | Qué no puedo afirmar sin ella |
|---|---|---|---|
| S1 | **V2 — Evidencia digital y cadena de custodia** | `evidencia/SHA256SUMS` con hashes de `.sh` y `.out` que git todavía no versiona (`git ls-files Expedientes` → `0`); testimonio del Product Owner asentado por un tercero sin localizador (001 l.11) | Si los hashes propios agregan integridad sobre los objetos de git una vez commiteado, y si el acta del orquestador sin ratificación alcanza el tipo `humano` de D9 (`Deriva-Rules.md` l.53) |
| S2 | **V1 — Gestión documental** | Qué pasa con el expediente al archivarse, frente a `_legacy/` (002 l.37 y `ev-02`) | Retención y archivo definitivo del expediente cerrado, y si la carpeta entra o no en el snapshot |
| S3 | **Terminología** (el titular que corresponda por `Vocabulario-Rules.md`) | Tres referentes de «expediente» (V3-05, con comando y salida) | Cómo aplica §9 de `Vocabulario-Rules.md` a un término del framework que colisiona con un uso previo del propio corpus. **Yo sólo fijo el sentido procesal** |
| S4 | **Seguridad** (postergada por cupo en 002 §3.3) | La evidencia del Product Owner iría a un repositorio público; Ley 39/2015 art. 70.4 excluye del expediente la información auxiliar, pero no resuelve qué se ofusca | Qué contenido de una presentación o de una evidencia no puede foliarse en un repositorio público, y cómo se desglosa sin romper la foliatura |
