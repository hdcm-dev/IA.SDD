# Actuación 006 — Informe de la Comisión V4 — Ingeniería de software y operación

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 006 |
| Tipo | `informe` |
| Fecha | 2026-09-13 |
| Autor | Comisión V4 — Ingeniería de software y operación, primera convocatoria (actuación 002 §3), a ciegas |
| Despacho y entrega | Despachada 2026-09-13T12:15:34-03:00; informe final 2026-09-13T12:21:00-03:00 |
| Asentada por | Presidente de mesa, **por extracción mecánica** del último mensaje del subagente en su transcripción, sin edición. SHA-256 del cuerpo (desde la línea siguiente a la regla horizontal): `80e9fcce4747d39894237e24076532e718737a37093e9237d58bc9f8e2b0f9c1` |

---

# Informe V4: Comisión de Ingeniería de software y operación

## 1. Cabecera

| Campo | Valor |
|---|---|
| Comisión | V4, Ingeniería de software y operación (ad hoc con carta, `Mesa-Rules.md` §5.4) |
| Expediente | `0001`, Expedientes como comportamiento del framework |
| Fecha | 2026-09-13 |
| Base leída | `IA.SDD-exp1` en `8c55a1e` (13.16); `Lab-Geometria` `main` en `b9675d8`; `RPI.VideoControl` `HEAD` en `9aabe5c`; `IA.SDD.Documentacion-exp1/Reportes/README.md` 1.32 y `30-*.md` |
| Leído entero | Actuaciones 001 y 002; `README.md`; `Mesa-Rules.md` 1.3; `Root-Rules.md` §9 a §13 |
| Leído por sección | `Master-Prompt.md` §7.0, §8.1, §8.2, §10, §10.0 (comprobaciones 7 y 8), §10.1 y §12.1. `Master-Prompt-Migracion.md` (M6 y la salida en `Audit/`). `Master-Prompt-Reanudacion.md` §5 y §5.1. `Rules-Arquitectura-Tecnica.md` §3.3, §4.3 y §6. `Rules-Calidad-Y-Pruebas.md` (lo que dice de ADR y de trazabilidad). `SDD-Development-Guide.md` §II.7, §VI.3, §VI.4 y §VI.5. `Deriva-Rules.md` §1 (D9). `Migracion-Rules.md` §4.8 y §4.9 |
| Leído en destinos, por `git show` | `Audit/Observacion-Ciclo-De-Correccion-Sin-Corte.md`, `Observacion-Alcance-Aguas-Arriba-De-ADR-08006.md`, `Cierre-De-Hallazgos-Abiertos-2026-08-17.md`, `Mesa-2026-09-12.md` (cabecera), `Mesa-2026-09-12-ciclo-2.md`; `Producto/Adrs/ADR-14004-*.md` y `ADR-08006-*.md` (secciones y control de cambios); `evidencia/2026-09-02-mesa-ux/README.md` |
| Fuentes externas consultadas | Nygard, «Documenting Architecture Decisions», 2011: https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions. MADR: https://adr.github.io/madr/. Google SRE Book, «Postmortem Culture»: https://sre.google/sre-book/postmortem-culture/. ISO 9001:2015, cláusula 10.2 «Nonconformity and corrective action», **leída sólo en fuentes secundarias**, no en el texto oficial: https://www.iso9001help.co.uk/10.2-Nonconformity-and-Corrective-Action.html. ISO/IEC/IEEE 29119-3:2021, **sólo la ficha pública**: https://www.iso.org/standard/79429.html |
| No consultadas | IEEE 1012 (V&V), ISO/IEC/IEEE 29148 y el método 8D. Donde las nombro las cito sin apartado y lo marco |

Lo medido para este informe:

- **Recuento de `Audit/`.** `git ls-tree -r --name-only HEAD SDD/Docs/Audit/ | wc -l` en VideoControl devuelve `51`. Sin `-r` devuelve `42`: nueve archivos están en `Audit/evidencia/`. En `Lab-Geometria` `main` son `113`, lo que confirma `ev-04`.

---

## 2. Hallazgos

### V4-01 · P1 · Ancla E2: en un destino, el expediente como «registro» sería una segunda declaración del registro de mesa

**Cita.**
- `Mesa-Rules.md` l.156: «Registro de mesa | `SDD/Docs/Audit/Mesa-<AAAA-MM-DD>[-ciclo-<N>].md` | Siempre que la mesa se convoca».
- `Mesa-Rules.md` l.164-167: «El plan de cambios no es un artefacto propio, y es deliberado. El método ya tiene dos contenedores de plan […] y un tercero obligaría a mantener sincronizados tres».
- Actuación 002 §1: «**Este expediente es el registro**, con las nueve secciones de §2.2 repartidas en actuaciones».

**Impacto.** En el repositorio del framework la sustitución está justificada: no hay `SDD/Docs/Audit/`. Pero si la figura se generaliza a los destinos tal como está en 002 §7, cada mesa deja **dos registros del mismo ciclo**: el `Mesa-*.md` que §2.1 y el criterio enumerable de §8 exigen, y las actuaciones del expediente. Es el defecto que `Root-Rules.md` §10 y `Master-Prompt.md` §8.2 previenen: «lo que se puede derivar del commit no se declara aparte». El destino ya muestra lo que pasa. `Mesa-2026-09-12-ciclo-2.md` transcribe «sin alteración» el informe del panel dentro del registro y le agrega una sección 8 propia. Con un expediente, esa transcripción tendría una tercera copia.

**Dirección.** Separar los dos casos.
- **Donde no hay `Audit/`** (el framework), el expediente puede ser el registro.
- **En un destino**, el expediente no copia el contenido de artefactos que ya tienen casa (registro de mesa, informe de audit, informe de estado, ADR). Lo que lleva es la **secuencia del caso**: qué entró, en qué orden, con qué autoridad. Los artefactos los cita por ruta e identificador.

La regla tendría que decir qué pieza es fuente única de cada sección de `Mesa-Rules.md` §2.2 cuando conviven.

### V4-02 · P1 · Ancla E1 + E2: lo que el expediente aporta de verdad no es el registro sino la unidad «caso», y hoy nadie la regula aunque los destinos la practican

**Evidencia.**
- `grep -rnE 'Observacion-|\`Cierre-' SDD PROMPTS Templates --include=*.md | wc -l` devuelve `0`: ninguna regla define esas piezas.
- `Lab-Geometria` tiene seis `Observacion-*` y dos `Cierre-*` en `Audit/`. Tienen forma de caso: origen, anomalía, medición, causa, qué se hizo, qué queda. `Observacion-Ciclo-De-Correccion-Sin-Corte.md` tiene los campos «Origen: Observación del Product Owner…» y «Relacionado».
- `Cierre-De-Hallazgos-Abiertos-2026-08-17.md` §0: «Los hallazgos abiertos vivían repartidos en tres informes de migración […] Para saber qué quedaba pendiente había que abrir los tres y cruzarlos a mano».
- `SDD-Development-Guide.md` §VI.3, comprobación 13, reconoce el objeto: «cuando la intervención declara un **origen** —un reporte, **un incidente**, un pedido—». Pero sólo para intervenciones sobre el framework, y exige traer los criterios «adentro» de la nota.

**Contraste con la industria.** El postmortem de Google SRE es una unidad de caso que atraviesa artefactos. Es «a written record of an incident, its impact, the actions taken to mitigate or resolve it, the root cause(s), and the follow-up actions», y se archiva en «a team or organization repository of past incidents». ISO 9001:2015 §10.2 (en fuente secundaria) pide conservar información documentada de «the nature of the nonconformities and any subsequent actions taken» y de «the results of any corrective action»: también es un registro por no conformidad, no por artefacto. **Ninguno de los contenedores del método tiene esa unidad**:

| Contenedor | Unidad |
|---|---|
| ADR | Una decisión |
| Informe de audit | Una ronda de fase |
| Registro de mesa | Un ciclo |
| Informe de estado | Una reanudación |
| `Decisiones-Pendientes.md` | Una pregunta |
| Ítem diferido | Un hueco |
| Control de cambios | Una versión de un archivo |

**Impacto.** Sin figura, cada destino inventa la suya (`Observacion-`, `Cierre-`, `evidencia/` en la raíz) con forma, estado y numeración distintos, que es el patrón del reporte `30`. Y la búsqueda de los pendientes de un caso vuelve a ser «cruzar a mano».

**Dirección.** Fundar la figura en **la unidad caso** (incidente, no conformidad o pedido que atraviesa más de un artefacto o más de una corrida), no en la forma procesal. Declarar que `Observacion-*` y `Cierre-*` son instancias previas de esa unidad, y dar el criterio para reconocerlas en migración (Q10).

### V4-03 · P1 · Ancla E2: la trazabilidad artefacto→expediente, hecha como campo nuevo, rompe la regla de no declarar lo derivable. Hay dos vías que ya existen

**Cita.**
- `Master-Prompt.md` §7.0: «**La fila no suma una columna de origen del hecho**, y es deliberado: el origen del hecho se recalcula […] y copiarlo sería mantener dos declaraciones en paralelo».
- `Master-Prompt.md` §8.2, l.386-387: el ciclo de origen escribe «“mesa” y su fecha si el hueco lo declara una mesa de evaluación».
- Precedente en el destino: la fila 1.1 del control de cambios de `ADR-08006` dice «La constancia está en [`../../Audit/Observacion-Alcance-Aguas-Arriba-De-ADR-08006.md`] **4.0** §2.3». Es un vínculo artefacto→caso **puesto en la fila del control de cambios**, sin columna nueva.

**Impacto.** Si cada ADR, ítem diferido o fila de control de cambios suma un campo «expediente», hay dos declaraciones del mismo vínculo: la del expediente, que lista lo que cambió, y la del artefacto. Se desincronizan igual que los recuentos de §10. Si no hay vínculo inverso, se pierde el sentido artefacto→expediente que P4 pide.

**Dirección.** Hacer la dirección **expediente→artefacto** declarada: la actuación que cierra nombra identificador, ruta y commit. Hacer la dirección **artefacto→expediente** **derivada**, reusando lo que ya viaja:
- el valor del ciclo de origen (`Master-Prompt.md` §8.2), que ya admite «mesa y su fecha» y podría admitir el identificador del expediente como fase;
- la cita en la fila de control de cambios, como hace `ADR-08006`;
- el mensaje de commit o de PR, que la T4 de §12.1 ya produce.

La regla nombra **cuál de esas vías es la obligatoria**, y la inversa se recalcula con `git log --grep` o `git grep`, sin campo propio.

### V4-04 · P1 · Ancla E1 + E4: la numeración `0001` no cumple el ancho de §9.2, y el expediente del framework no tiene ámbito en §9.1

**Cita.**
- `Root-Rules.md` §9.2: «cinco dígitos uniformes […] El ancho es del framework y no se negocia por familia». Alcanza a «Toda familia que catalogue elementos de una colección».
- `Root-Rules.md` §9.1: «Hay dos [ámbitos], y cada familia declara el suyo»: el producto y el conjunto normativo vigente.
- §9.5, por la fila 8.3 del control de cambios, obliga a clasificar toda familia viva como alcanzada o excluida.

**Medición.** `ls -d IA.SDD-exp1/Expedientes/*` devuelve `0001-Expedientes-Como-Comportamiento-Del-Framework`: cuatro dígitos. Colisión de `EXP-`, reproducida sobre la salida de `ev-03`: cero ocurrencias en el framework sin `_legacy`, en `_legacy`, en Documentación, en `Lab-Geometria` `main` y en VideoControl `HEAD`. En `Audit/` de `Lab-Geometria` no hay ninguna familia de hallazgo `EXP*`; las únicas cadenas `EXP[A-Z]*` son palabras (`EXPLORADOR`, `EXPONE`…). **`EXP-` no colisiona con ninguna familia de §9.2.** El prefijo más cercano es `EXT`, que es distinto.

**Impacto.**
- Un expediente de cuatro dígitos es una colección catalogada (se cita por número y se enlaza desde artefactos), así que queda **fuera de forma** en su primer uso. O se lo excluye con motivo, como `FA-NN`, lo que no corresponde porque no es una posición dentro de un documento.
- Un expediente en `IA.SDD/Expedientes/` no cataloga elementos «del producto» ni «del conjunto normativo vigente». Es un tercer ámbito que §9.1 no tiene.
- MADR usa `NNNN` local a la carpeta, pero el framework ya decidió en contra de negociar el ancho.

**Dirección.** Declarar la familia en §9.2 con prefijo, forma, ámbito y bloques, como se hizo con `AG`. Adoptar el ancho de cinco dígitos. Decidir el ámbito de forma explícita: por repositorio, ya que un expediente vive donde ocurre el caso (P6). Así un `EXP-00001` de `Lab-Geometria` y otro de `IA.SDD` no son el mismo, igual que dos productos. La regla de agotamiento y la estabilidad de §9.3 (el número no se recicla) se heredan tal cual.

### V4-05 · P2 · Ancla E1: `evidencia/ev-NN` choca de lectura con la familia `EV-XXXXX` de D9, que los dos destinos usan

**Evidencia.**
- `Root-Rules.md` l.445 incluye `EV` y `EVE` entre las familias alcanzadas.
- `Deriva-Rules.md` l.50 fija el formato de cita: `[EV-XXXXX | <tipo> | <ruta-o-comando> | <ubicación> | <fecha o commit>]`.
- Recuentos:
  - `git grep -nE '\bEV-[0-9]+' main -- . | wc -l` en `Lab-Geometria` devuelve `28`. Uno es de dos dígitos: `B2-Maqueta-GeometriaFactory-Web-r1.md:73`, «Citada como `EV-01` y `EV-09`».
  - El mismo comando en VideoControl `HEAD` devuelve `317`.
  - El expediente 0001 nombra su evidencia `ev-01-base.sh` … `ev-05-citas.sh`.

**Impacto.** En un destino, «`ev-01`» del expediente y «`EV-01`» de una línea de base leen igual, sobre todo en `Audit/`, donde las dos formas conviven. Además el expediente tendría **un segundo esquema de evidencia** en paralelo al de D9, con otros campos: hoy `SHA256SUMS` y guion+salida, contra tipo, ruta, ubicación y fecha.

**Dirección.** Tomar las cuatro condiciones de D9 (localizable, reproducible, contemporánea e independiente de quien afirma) y su **formato de cita** como forma de la evidencia del expediente, en vez de acuñar otra. Nombrar los archivos de evidencia como posición dentro del expediente, fuera del prefijo `EV`, o bien darles `EV-XXXXX` de verdad. Cualquiera de las dos, pero con la colisión medida en la regla.

### V4-06 · P1 · Ancla E2: P4 («las pruebas quedan como parte de las especificaciones») contradice dos decisiones cerradas si se toma literal

**Cita.**
- `Master-Prompt.md` §10.1: «un ensayo es una verificación, y **las verificaciones viven en `SDD/Docs/Audit/`**».
- `Deriva-Rules.md` §1: D9 acotada a afirmaciones sobre el estado del sistema. «Qué no es evidencia: […] una captura de una conversación».
- `Rules-Arquitectura-Tecnica.md` §4.3: el ADR ya tiene «8. Métricas de validación» y «9. Referencias», que es donde la evidencia pasa a sustentar una decisión.

**Contraste con la industria.**
- Nygard: el ADR guarda el contexto y las consecuencias, no la prueba.
- MADR tiene una sección opcional «Confirmation»: cómo se verifica la decisión.
- ISO 9001 §10.2 y SRE separan el **registro** (evidencia de la no conformidad y del resultado) de la **acción** que cambia el sistema o el procedimiento.
- ISO/IEC/IEEE 29119-3 trata el informe de incidente como documentación de prueba, no como especificación. Esto sólo por la ficha pública; el contenido de la plantilla no lo consulté.

**Impacto.** Si la evidencia del Product Owner o de los agentes se lee como especificación, sale una segunda fuente de requisitos fuera de las categorías 00 a 11 que nadie audita contra §6. Y una afirmación del PO «tipo conversación» pasaría por evidencia contra D9.

**Dirección.** Reformular P4 como **«la evidencia queda como sustento durable de la especificación»**: registro en el expediente, y efecto sólo a través del artefacto normativo que cambia (ADR, ítem diferido, fila de control de cambios, entrada al intake). La evidencia **humana** entra con el tipo `humano` de D9 («una aprobación explícita registrada con fecha»), que ya existe, y no como una categoría nueva.

### V4-07 · P2 · Ancla E2: el ciclo de vida del expediente no tiene criterio de cierre verificable, y el método ya tiene uno para reusar

**Cita.**
- `SDD-Development-Guide.md` §VI.3, comprobación 13: «Un veredicto por criterio. **Ningún origen se declara resuelto con un criterio sin contestar**».
- `Mesa-Rules.md` §6.6: la deuda declarada «entra como ítem diferido de `Root-Rules.md` §12.2 con sus cuatro campos».
- Contraejemplo del destino: `Observacion-Alcance-Aguas-Arriba-De-ADR-08006.md` está en **v5.0**, «Reabierta y vuelta a cerrar — el alcance era de cuatro afirmaciones y no de tres». Un caso se cerró con una categoría entera sin barrer y se reabrió 18 días después reescribiendo el documento.

**Contraste con la industria.** SRE hace de las «follow-up actions» parte del postmortem. CAPA (ISO 9001 §10.2, en fuente secundaria) exige revisar la **eficacia** de la acción correctiva, no sólo registrarla.

**Impacto.** Un expediente con estado «cerrado» se lee como caso resuelto aunque tenga acciones sin artefacto ni commit. Es la «promesa que se lee igual que el dato» de §12.2, en otra carpeta. Y si el caso se reabre reescribiendo el README, se pierde la historia que la regla «no se reescribe» de las actuaciones quería proteger.

**Dirección.**
- **Estado del expediente derivado** de su última actuación, no un campo que se edita a mano.
- **Cierre sólo por una actuación de cierre** que enumere los criterios del caso con un veredicto por criterio (forma de la comprobación 13). Cada acción queda con artefacto+commit o como ítem diferido §12.2 con su evento.
- **Reapertura por actuación nueva**, nunca por nueva versión del README, igual que un ADR pasa a `Superado por` sin editar su cuerpo (`Rules-Arquitectura-Tecnica.md` §3.3, puntos 3 y 4; Nygard: «Numbers will not be reused»; «superseded with a reference to its replacement»).

### V4-08 · P2 · Ancla E3: sin umbral de apertura, el expediente se abre para todo y ahoga la unidad que viene a dar

**Contraejemplo construido.** Con la presentación literal («los expedientes y casos que se armen se documenten de forma sistemática») serían casos:
- cada ronda `r<N>` de audit;
- cada `Mesa-*` (ocho en `Lab-Geometria`, siete en VideoControl);
- cada `Estado-Del-Destino-*` (seis y seis);
- cada detención de §8.1.

El resultado sería un expediente por artefacto de `Audit/`, que duplica la carpeta.

**Cita.**
- `Mesa-Rules.md` §9, anti-patrón «Convocar el panel completo “por las dudas”».
- `Root-Rules.md` §13, criterio de la 9.19: «un concepto más que mantener, en un método que declara que un procedimiento que crece deja de leerse, sólo se justifica si hace falta».

**Contraste con la industria.** SRE fija **disparadores observables** («User-visible downtime… beyond a certain threshold», «Data loss of any kind», «A monitoring failure») y además que «any stakeholder may request a postmortem».

**Impacto.** La figura compite con `Audit/` en vez de complementarla, y la unidad «caso» de V4-02 se diluye.

**Dirección.** Un umbral como condición (en la forma de §0.0 de la mesa), no como lista de puntos. Propuesta de disparadores en Q2. Ningún artefacto que ya tiene casa abre expediente por sí solo.

---

## 3. Respuestas desde mi competencia

**Q1. Dónde vive.**
- **En un destino**: `SDD/Expedientes/`, hermano de `SDD/Docs/` y no dentro de `Audit/`. El expediente es la unidad caso, que cita artefactos de `Audit/`, de `Producto/Adrs/` y de las categorías. Meterlo en `Audit/` lo mezclaría con las verificaciones de §10.1.
- **En el framework**: raíz (`IA.SDD/Expedientes/`). El fundamento de la actuación 001 §2.2 se sostiene con cita: `SDD-Development-Guide.md` §VI.5 copia «el conjunto normativo que queda superado» entero a `_legacy/<version>/`, con la intocabilidad «Una subcarpeta de versión, una vez creada, no se modifica nunca». Un expediente vivo dentro de `SDD/` quedaría congelado a medias en cada snapshot. **Pero choca con la autosuficiencia** (`README.md` l.152: «Ningún archivo de este repositorio referencia otro repositorio»): un expediente del framework que cita `Lab-Geometria` la rompe. Queda como pregunta para V1 y el refutador. Desde mi competencia: la evidencia externa se trae adentro, como exige la comprobación 13, no se enlaza.
- La tercera carpeta, `IA.SDD.Documentacion/Expedientes/`, está fuera de mi competencia (archivística).

**Q2. Umbral.** Se abre cuando se cumple al menos una de estas condiciones:
1. el caso **atraviesa más de un artefacto o más de una corrida**;
2. el Product Owner **presenta un caso con evidencia propia**;
3. se convoca una mesa **fuera de un orquestador** (la condición de §0.0 sin punto de invocación);
4. un hallazgo **se reabre** después de declararse cerrado (como `Observacion-…-ADR-08006`, v5.0).

No se abre por una ronda de audit, un ADR, un informe de estado ni una detención aislada: tienen casa.

**Q3. Forma mínima y completa.**
- **Mínima**: README con el objeto del caso, el disparador, el ámbito, el estado derivado y un índice de actuaciones; actuaciones foliadas e inmutables; evidencia con la forma de D9 (V4-05).
- **Completa**: además, una actuación de cierre con un veredicto por criterio y la lista de artefactos cambiados con su commit (V4-03 y V4-07).

La forma procesal de las actuaciones (tipos, autoridad) es competencia de V3.

**Q4. Numeración.** `EXP-` **no colisiona**: medido en V4-04, cero ocurrencias en los cinco espacios. Lo que no cumple es el ancho: `0001` tiene cuatro dígitos contra los cinco de §9.2. Dirección: familia declarada en §9.2, cinco dígitos, ámbito por repositorio, no reciclable (§9.3).

**Q5. Estados y ciclo de vida.** Conjunto cerrado y derivado de la última actuación, por ejemplo abierto, en tratamiento, cerrado por criterio, cerrado por decisión con lo abierto enumerado (la distinción de `Master-Prompt.md` §10.1) y reabierto. Se toma la advertencia de §11: sin estado explícito, «la tercera es indistinguible del olvido».

**Q6. Inmutabilidad y foliatura.** La inmutabilidad por actuación está alineada con el ADR del método (`Rules-Arquitectura-Tecnica.md` §3.3) y con Nygard. El README índice no puede ser a la vez inmutable y el lugar del estado: por eso el estado se deriva (V4-07). La foliatura como institución es de V3; la integridad por hash, de V2.

**Q7. Evidencia.** Condiciones y formato de D9 (`Deriva-Rules.md` §1), sin un esquema paralelo. Los guiones que corren para producirla se publican **dentro del texto** del expediente o como archivo citado con su salida. Queda por decidir si un `.sh` en `Expedientes/` del framework es «código distribuido» contra §II.7: la frontera que §II.7 fija es «un comando citado en la prosa que lo funda, sí; un artefacto ejecutable con versión propia, no». Los `ev-*.sh` de 0001 están del lado dudoso. Cadena de custodia: V2.

**Q8. De evidencia a especificación.**
- **Expediente→artefactos**: por la actuación que decide, que nombra el artefacto normativo que cambia: ADR (con Referencias y Métricas de validación), ítem diferido §12.2 con sus cinco campos, fila de control de cambios, entrada al intake o parche de mesa.
- **Artefacto→expediente**: derivado, sin campo nuevo (V4-03). Por el ciclo de origen de §8.2 (valor de fase = identificador del expediente), por la cita en la fila de control de cambios (precedente `ADR-08006` 1.1) o por el mensaje de commit o PR.

La evidencia no es especificación (V4-06).

**Q9. Relación con `Audit/` y con la serie de reportes.**
- `Audit/` sigue siendo el lugar de los veredictos y de los registros por instrumento. El expediente los agrupa por caso y los cita.
- La **serie de reportes** de `IA.SDD.Documentacion` es, de hecho, una serie de casos contra el framework con su «Cómo se resolvió» y un veredicto por criterio. Tiene la forma de postmortem más cercana del corpus. Un expediente del framework no debería **duplicar** un reporte: o el reporte es la actuación de presentación del expediente, o el expediente es la carpeta de la intervención (`PROMPTs/Fixs/NN/OUTPUTs/`, cuyo precedente `Mesa-2026-09-12-Colision-Lexica/` ya llama «Expediente 01…06» a sus piezas). Hay que elegir una, no tener las dos.

**Q10. Retroactivo.** Nada de los 113 archivos de `Lab-Geometria/SDD/Docs/Audit/` se mueve ni se reescribe: la intocabilidad de `SDD-Development-Guide.md` §VI.5 y la no retroactividad de D9 («D9 rige desde su incorporación hacia adelante») aplican por analogía. Se reconocen como **casos preexistentes** los que cumplen el umbral de Q2, por ejemplo los `Observacion-*` y `Cierre-*`. Para esos se abre, si hace falta, un expediente cuya primera actuación **cita** los documentos existentes por ruta y commit. Mismo patrón que `Migracion-Rules.md` §4.9: derivar con `git log -S` donde se pueda, y marcar «no derivable» como valor terminal donde no, sin elevar al humano. Los `OUTPUTs/` de las intervenciones reciben el mismo trato en `IA.SDD.Documentacion`.

**Q11. Mesa y no detención.** P7 es compatible con lo cerrado si se lee como **orden de pruebas** y no como abolición de la detención:
1. primero el origen del hecho (§8.1, calculado contra la base);
2. después la pregunta previa o la autocorrección;
3. después, si hay corpus y decisión de alcance (§0.0), la mesa;
4. y sólo lo que quede dentro de la lista cerrada de `Mesa-Rules.md` §7 sale al humano, en lote con `SI NO RESPONDÉS`.

Lo que P7 **no** puede desplazar son los disparadores bloqueantes 2 y 3 y el arbitraje de §7.0, que salen en el momento. El expediente es el lugar natural donde queda asentado ese lote y la respuesta. Si hace falta decidir si «ante la duda, se detiene» (§8.1) cede ante P7, eso es reapertura de una decisión cerrada y va por el disparador 7.

**Q12. Punto de continuación.** Toda actuación que no cierra termina con **«qué sigue»**: la próxima actuación esperada, quién la produce y qué la dispara. Tiene la forma de `Master-Prompt.md` §12.1 T4 («Qué sigue después del merge» no es opcional) y del bloque de continuación de `Master-Prompt-Reanudacion.md` §5. El README lo lee de la última actuación y no lo repite.

---

## 4. Lo que revisé y está bien

1. **Poner el expediente del framework en la raíz y no en `SDD/`.** Se sostiene con §VI.5 (snapshot entero e intocable de `SDD/`). Queda sólo la tensión con la autosuficiencia señalada en Q1.
2. **La providencia 002 declara sus propias limitaciones** en vez de simularlas: el jurado único con cinco mandatos (§6.4), la falta de compuerta del destino (§II.7) y el error propio del `grep` sin `-F`. Es lo que SRE llama *blameless*: «focus on identifying the contributing causes […] without indicting any individual». Coincide con la comprobación 14.
3. **Las actuaciones no se reescriben** y las correcciones entran como actuación nueva (001, nota inicial). Coincide con el ADR inmutable del método y con Nygard («Rather than modifying or deleting previous decisions… marked as superseded»).

---

## 5. Solicitudes de convocatoria

1. **Archivística y gestión de registros (V1 ya convocada, se lo señalo).**
   - *Señales*: la tercera carpeta `IA.SDD.Documentacion/Expedientes/` (002 §6.1), y la tensión entre el expediente del framework que cita destinos y `README.md` l.152 (autosuficiencia).
   - *Lo que no puedo afirmar*: qué repositorio es el custodio de un caso que atraviesa tres repositorios, ni la política de retención.
2. **Derecho procesal (V3 ya convocada).**
   - *Señal*: la tipología de actuaciones (`presentacion`, `providencia`, `informe`) y la foliatura (001 y 002).
   - *Lo que no puedo afirmar*: si esos tipos y la foliatura bastan o sobran para la forma procesal que el PO pide.
3. **Seguridad (postergada por cupo en 002 §3.3).**
   - *Señal*: evidencia del PO en un repositorio público (`Rules-Base-Conocimiento.md`, fila 2.0), y guiones de evidencia con rutas absolutas del workspace (`ev-03-colision.sh`, `W=/…/...`).
   - *Lo que no puedo afirmar*: si la evidencia versionada expone datos o credenciales.
