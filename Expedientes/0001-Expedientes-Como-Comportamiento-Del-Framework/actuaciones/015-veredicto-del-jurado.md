# Actuación 015 — Veredicto del jurado (asiento)

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 015 |
| Tipo | `veredicto` |
| Fecha | 2026-09-13 |
| Autor | Jurado de cinco funciones, en un solo agente (limitación declarada en el folio 002 §5) |
| Despacho y entrega | Despacho 2026-09-13T15:54:55.823Z (UTC). Veredicto final 2026-09-13T16:05:57.318Z (UTC) |
| Asentada por | Presidente de mesa, por extracción mecánica del último mensaje del subagente en su transcripción, sin edición. SHA-256 del cuerpo: `079752e685a019e107b52f3d1f9a4b553db380499a15406a4222d31af8e04161` |

---

# Actuación 015: veredicto del jurado

## 1. Cabecera

| Campo | Valor |
|---|---|
| Expediente | `0001`: expedientes como comportamiento del framework |
| Folio | 015 |
| Tipo | `veredicto` |
| Fecha | 2026-09-13 |
| Autor | Jurado de cinco funciones (`Mesa-Rules.md` §6.4) |
| Limitación declarada | Por folio 002 §5, un solo agente cumple las cinco funciones objetivo. Cada voto se razonó desde su función y no se promedió. La salvaguarda de homogeneidad se aplica en §8. No hubo perito: ningún ítem pidió un conocimiento que ninguna función tuviera |
| Base leída, framework | `IA.SDD-exp1`, rama `expedientes/0001-caso` en `b92c64b`, sobre `main` `8c55a1e` (13.16). `git diff --name-only 8c55a1e HEAD` sólo toca `Expedientes/`, así que ningún archivo normativo cambió respecto de la base |
| Base leída, expediente | README; folios 002, 012, 013 y 014 enteros; 006 V4-08; `ev-07`; `ev-08/01` |
| Base leída, norma 13.16 | `Mesa-Rules.md` §2.2, §6.4 a §6.7, §7, §7.1 y §8. `Master-Prompt.md` §8.1 (l.878-1092). `Root-Rules.md` §9.1, §9.2, §10, §11 y §12.2. `Deriva-Rules.md` §1. `README.md`: invariantes D1 a D9, reglas de intervención y l.152. Guía §II.7, §III.8, Parte IV (l.610-670) y §VI.5 |
| Base leída, otras | 13.17: `IA.SDD-kmesa` `cab03ed`, `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` l.117, l.159, l.224, l.229, l.252 y l.296. `Lab-Geometria-mig1316` en `f73588f` más su árbol de trabajo |
| Anclas del refutador que contrasté | `stat` de las tres carpetas `Expedientes`: 11:56:02, 11:58:27 y 11:59:10, anteriores a `ev-07` (12:03:02). `README.md` l.152 literal. `ADOLFO VERA` en 005 l.215-216. `/home/` en 94 líneas de 33 archivos a `b92c64b` (el refutador midió 25 en 14 a `3c2f401`). `curl` a `hdcm-dev/IA.SDD` y a `hdcm-dev/Lab-Geometria`: 200. Cero trailers `Expediente:` en los cuatro commits. `7301a8f` asienta los folios 003 a 011. `Master-Prompt.md` l.880-886 (cuatro familias) y T1 (l.1689-1691). `Rules-Devops.md` l.452 («merge por squash»). `Coherencia-Conformacion-Pull-Request-Manual.md` l.26-28. `Root-Rules.md` l.389 («Hay dos») y l.680 («se calcula, no se declara»). `EXP-` aparece en 4 archivos de `mig1316`. Los fragmentos «tenes el ok», «podes seguir migrando», «me centraria primero» y «arma una mesa» dan 0 en los folios 001 y 002 de `mig1316`. Su índice omite `E-006e` a `E-006h` y `E-009` a `E-014b`: la omisión creció desde la refutación |
| No re-corrido | Las pruebas en clon descartable de R-04 (MDR y R100). Las voto por su lógica, que se puede comprobar leyendo el criterio de Q6 |
| Notación | `R-NN` son los ataques de 014. Las raíces de 013 se citan como `013·R<n>` y las restricciones de 002 como `002·R<n>`. Así se evita la colisión que señala R-13 punto 3 |

## 2. Veredictos sobre los ataques R-01 a R-14

Clave de jueces: **Ev** evidencia, **Im** impacto, **CB** costo y beneficio, **CH** coherencia histórica, **Ri** riesgo e irreversibilidad.

| Ataque | Veredicto | Reparto | Fundamento por juez |
|---|---|---|---|
| **R-01** P1, la forma mínima no se llena en minutos y el README copia derivados | `PROCEDE` | 5-0 | **Ev**: el conteo de 47 campos es E3 construido. Lo que funda el voto es E1/E2: un commit no puede contener su propio hash (Q12 contra Q6), y el índice de `mig1316` omite evidencias medidas hoy. **Im**: el README desfasado repite la clase de 013·R1 (huellas falsas del índice) en cada expediente. **CB**: quitar campos derivados baja el costo y cumple el criterio rector de 013 l.71. **CH**: aplica `Root-Rules.md` §10 y guía l.630. No reabre ninguna decisión cerrada. **Ri**: la norma todavía no se escribió, así que es reversible |
| **R-02** P1, el umbral de Q2 no es decidible al abrir | `PROCEDE` | 5-0 | **Ev**: la condición (2) es una predicción (E2), y la rama «convoca una mesa» incluye cada `Mesa-*`, cosa que V4-08 (006) quería excluir. Verificado. **Im**: habría un expediente por cada `Mesa-*` y cada detención, duplicando `Audit/`, que es la trampa principal del encargo. **CB**: redactar una condición observable cuesta una oración. **CH**: mantiene la forma de condición de §0.0, que es decisión cerrada (002 §2). **Ri**: reversible |
| **R-03** P1, evidencia sensible ya sellada con destino a un repositorio público | `PROCEDE` | 5-0 | **Ev**: E1 contrastado (nombre en 005 l.215-216, rutas de host en 94 líneas, repositorio con 200). Si el nombre es de una persona real es `C`, y así queda. **Im**: después del primer push, retirarlo exige reescribir historia, y la base deja de ser calculable (`Master-Prompt.md` l.981). **CB**: antes del push cuesta una constancia. Después cuesta la base de la corrida. **CH**: 013 Q7 ya dice «antes de sellar», y B.2 lo contradice al postergarlo a la intervención 09. **Ri**: el daño de no corregir es irreversible y la corrección antes del push es reversible. No hay veto (P1). Ver escalada E-2 |
| **R-04** P1, la inmutabilidad de Q6 no cubre evidencia ni renombres y depende de la fusión | `PROCEDE` | 5-0 | **Ev**: el criterio `--diff-filter=MDR -- actuaciones/` no mira `evidencia/` por su propio texto. `Rules-Devops.md` l.452 manda squash y T1 deja la fusión al humano. Los cuatro commits dan cero trailers y `7301a8f` lleva nueve folios. Todo verificado. **Im**: se puede reemplazar evidencia sin que el control lo vea, que es el simétrico de guía l.662. **CB**: extender el control a la carpeta cuesta cambiar una ruta. **CH**: no reabre nada. El incumplimiento del primer ejemplar pesa poco, porque es provisorio (README), pero confirma el costo. **Ri**: reversible |
| **R-05** P1, las formas vivas no se alinean y el segundo ejemplar tiene el P0 de 013·R3 | `PROCEDE` | 5-0 | **Ev**: los cuatro fragmentos de `ev-07` dan 0 en los folios 001 y 002 de `mig1316`, que se titulan «literal». `EXP-` aparece en 4 archivos de esa rama. Verificado. **Im**: Q10 promete una alineación que Q6 impide, y «cero colisiones de `EXP-`» es falso sobre esa rama. **CB**: declarar forma histórica cuesta una línea. **CH**: V3-05 ya trató así el precedente. **Ri**: reversible. **Condición**: la constancia en `mig1316` no la puede ordenar este jurado, porque es otra corrida y el destino es sólo lectura (002·R2). Va a deuda D-1, no a escalada, porque el árbol ya la contesta: `Mesa-Rules.md` §6.1 obliga a esa corrida a contrastar su P0 |
| **R-06** P1, J-01 no lo contesta el árbol | `PROCEDE` | 4-1 | **Ev**: `README.md` l.152 dice «ningún archivo… referencia otro repositorio», y «se nombran, no se enlazan» vale sólo para estándares de industria. Q1(b) lee mal (E1). **Im**: la norma publicaría, sin declararlo, un expediente con referencias a otros repositorios en un repositorio que se declara autosuficiente. **CB**: cuesta una fila del lote con default igual a la propuesta. **CH, `NO_PROCEDE`**: `ev-07` fija la ruta `/IA/SDD/IA.SDD/Expedientes` en forma literal y el folio 012 §4 la hace regir. La intención de ubicación no es ambigua, y lo que queda (reformular l.152) es declaración, no escalada. **Ri**: la carpeta está en una rama sin push y es reversible hoy. Una vez que el reporte `31` la cite, no. Por eso conviene preguntar ahora. Además §6.3 manda consolidar «sin juzgar», y 013 decidió un ítem que el mismo presidente había elevado |
| **R-07** P1, Q7 clasifica mal el testimonio que contiene una aprobación | `PROCEDE` | 5-0 | **Ev**: `Deriva-Rules.md` §1 admite `humano` («aprobación explícita registrada con fecha») y excluye «una captura de una conversación». `ev-07` abre con «tenes el ok de la fase K». E1 textual. **Im**: el cierre de la fase `k` en `mig1316` (commit `7864428`) queda sin estatus de evidencia, o la regla D9 queda contradictoria. **CB**: clasificar por pasaje cuesta poco por testimonio y evita cierres sin evidencia. **CH**: los tipos de D9 son decisión cerrada (002 §2), y el ataque muestra con E1 que las dos oraciones chocan en este caso. Eso es el disparador 7 (escalada E-3). **Ri**: tocar D9 obliga a major (§VI.5). Como es P1, no hay veto, pero sí escalada |
| **R-08** P1, Q11 alcanza las cuatro familias de detención | `PROCEDE` | 5-0 | **Ev**: `Master-Prompt.md` l.880-886 nombra la confirmación de plan y T4 (E2 sobre texto literal). **Im**: cableado en los tres orquestadores, frenaría todo traspaso T4 y toda confirmación de plan de M1. **CB**: acotar son dos palabras. **CH**: T1 («el agente no fusiona») es norma vigente, y el ataque la protege. **Ri**: reversible |
| **R-09** P2, el ámbito «repositorio» modifica D3 | `PROCEDE` | 5-0 | **Ev**: `Root-Rules.md` l.389 dice «Hay dos», y D3 enumera producto y conjunto normativo (E1). **Im**: presentado como minor, sería un major sin su bloque de impacto (§VI.5). **CB**: la opción A cuesta cero en invariantes. **CH**: los ámbitos de §9 son decisión cerrada (002 §2), y la opción A no la reabre. **Ri**: ambas opciones son reversibles antes de aplicar, y la corrección no es irreversible, así que no hay veto |
| **R-10** P2, Q8 declara un dato en un campo calculado | `PROCEDE` | 5-0 | **Ev**: `Root-Rules.md` l.680 («el ciclo de origen se calcula, no se declara») y `Master-Prompt.md` l.1134 son E1. La parte de la cita compuesta es E2 más débil: l.457 habla de la forma del identificador, no de una cita. No cambia el voto. **Im**: un cuarto dato declarado en un campo congelado rompe la derivación de §8.2. **CB**: una sola vía declarada cuesta menos que dos. **CH**: el ciclo de origen congelado es decisión cerrada (002 §2), y el plan lo tocaba sin declararlo. **Ri**: reversible |
| **R-11** P2, el mapeo tipo→estado de Q5 no es total | `PROCEDE` | 5-0 | **Ev**: por enumeración sobre 013 Q5 y Q6, `testimonio` y `constancia` sin suspensión quedan sin estado (E1). **Im**: después del folio 012 de este mismo expediente el estado derivado es indefinido. **CB**: reducir tipos cuesta menos que mantener subtipos. **CH**: no reabre nada. **Ri**: reversible. **Condición**: la auditoría de Formal postergada (013 A.3) queda como deuda D-5 |
| **R-12** P2, la alineación con la 13.17 está subdeclarada | `PROCEDE` | 5-0 | **Ev**: la 13.17 dice «testimonio… E4» en l.159 y trae la forma en plano en l.117, l.224, l.229 y l.252. Su l.296 sólo promete reescribir §2.3. Verificado. **Im**: si se fusiona antes de la intervención 09, `main` publica una contradicción con Q7 y una cuarta forma. **CB**: listar cinco secciones cuesta cinco filas. **CH**: la fusión es del humano (T1). **Condición**: el jurado no condiciona la fusión. La declara como deuda D-3 y como capa a revalidar. **Ri**: reversible mientras no se fusione |
| **R-13** P2, sesgos de la Parte B escrita por el presidente | `PROCEDE` | 3-2 | **Ev**: seis de siete ítems J vienen decididos en la tabla Q, y la colisión de `R` dentro del expediente es E1 (002 l.39 contra 013). El punto 7 ya lo subsanó `ev-08` en `b92c64b`. **Im, `NO_PROCEDE`**: no hay daño sobre un artefacto normativo. 013 l.13 declara la parcialidad, 013 A.2 da las dos lecturas, `ev-08` asentó la carta, y el jurado elige igual. **CB, `NO_PROCEDE`**: renumerar raíces exige folio nuevo sobre folios inmutables, y el beneficio lo da citar con folio de origen, como hace este veredicto. **CH**: `Mesa-Rules.md` §6.3 manda consolidar «sin juzgar», y Q1 ratifica el acto propio, así que procede. **Ri**: el sesgo de ratificar el acto propio es la clase que la mesa existe para frenar, y la corrección es reversible |
| **R-14** P3, trailer obligatorio y secciones omitidas en B.1 | `PROCEDE` | 5-0 | **Ev**: `Coherencia-Conformacion-Pull-Request-Manual.md` l.27-28 dice que la convención de mensaje de commit «el framework no los fija». `Mesa-Rules.md` §8 criterio 1 exige el registro en `SDD/Docs/Audit/`. E1. **Im**: el criterio 1 da falso en el framework si se aplica Q9. **CB**: sumar filas a B.1 y volver opcional el trailer es trivial. **CH**: revierte una decisión sin declararla. Declararla o quitarla lo cura. **Ri**: P3 y reversible, así que el veto no aplica |

## 3. Veredictos sobre los ítems J-01 a J-07

| Ítem | Lectura elegida | Reparto | Fundamento por juez |
|---|---|---|---|
| **J-01** Dónde viven los expedientes del framework | **La de 014 (R-06, N1-02 de las dos convocatorias)**: va al lote por el disparador 1, con default `IA.SDD/Expedientes/` y exclusión del snapshot. Q1(b) se declara reformulación de l.152 | 4-1 | **Ev**: 013 funda en una lectura de l.152 que el texto no sostiene. **Im**: sin decisión explícita, la norma cambia una propiedad declarada. **CB**: una fila de lote cuyo default ya es la propuesta de 013. **CH, por la lectura de 013**: `ev-07` da la ruta literal y 012 §4 la hace regir. **Ri**: hoy es reversible y deja de serlo con el push y la cita del reporte `31` |
| **J-02** Hash propio | **La lectura común de 013 Q7 y 014** («resiste»): huella sólo para lo no versionado o lo que sale del repositorio | 5-0 | **Ev**: en `mig1316` las 9 huellas del índice coinciden, y el defecto medido es el índice escrito a mano, no el hash. **Im**: sin huella, lo exportado pierde integridad verificable. **CB**: sobre lo versionado, git ya da integridad, así que la huella no suma. **CH**: coincide con J-05 y R-01, que no quieren derivados a mano. **Ri**: reversible |
| **J-03** Clase del testimonio del Product Owner | **La de 014 (R-07)**: clasificar por contenido. La aprobación es `humano` de D9, el pedido es fuente de intención fuera de D9 y la afirmación de estado es `C` hasta que se corrobore. La oración de D9 se decide en la escalada E-3 | 5-0 | **Ev**: la letra de `Deriva-Rules.md` §1 sobre `humano` es E1, y la lectura de 013 la niega. **Im**: sin esto, el OK de la fase `k` no tiene estatus. **CB**: clasificar por pasaje cuesta minutos por folio. **CH**: aplica un tipo que ya existe, y sólo la oración nueva reabre (disparador 7). **Ri**: sin la oración es reversible. Con ella es major, y por eso escala |
| **J-04** Registro de mesa en un destino | **La lectura común de 013 Q9 y 014 («resiste»)**: el expediente folia por enlace y `Audit/` sigue siendo la fuente. Se descarta V3-05 réplica | 5-0 | **Ev**: la 13.17 l.123-126 dice lo mismo, y `Mesa-Rules.md` §2.1 está vigente. **Im**: mudar el registro duplica lo que lee la reanudación. **CB**: enlazar cuesta una constancia. **CH**: el registro en `Audit/` es decisión cerrada (002 §2), y V3-05 réplica lo reabre sin E1 de contradicción. **Ri**: no hay nada irreversible |
| **J-05** Artefactos que cambió el caso | **Derivada, sin tabla, con la variante de 014 (R-10 y J-05)**: una sola vía declarada (la fila de control de cambios nombra `<repositorio> <carpeta>`), inversa por `git grep` del nombre de carpeta y no por el trailer, con la condición S3 sobre la fusión | 5-0 | **Ev**: `mig1316` muestra que el índice a mano se desfasa (E1). **Im**: con squash (`Rules-Devops.md` l.452), la derivación por trailer se pierde y la búsqueda por ruta sobrevive. **CB**: `git grep` no cuesta nada. **CH**: coherente con `Root-Rules.md` §10 y con R-14. **Ri**: la variante por ruta es robusta a la estrategia de fusión |
| **J-06** Identificador y ámbito | **La de V5 Q4 y 014 R-09 opción A**: número local de cinco dígitos más repositorio, familia excluida con motivo, sin tocar D3 | 4-1 | **Ev**: D3 y l.389 dicen «hay dos» ámbitos. **Im, por la lectura de 013**: sin prefijo, la cita entre repositorios no es un identificador bien formado en el sentido de `Root-Rules.md` §9.1 y §10 R5, y `EXP-NNNNN` sí lo sería. **CB**: la opción A evita un major y el barrido de D3. **CH**: la opción A no reabre §9. **Ri**: la opción A es reversible, y además `EXP-0001` de cuatro dígitos ya existe en `mig1316`, así que la familia `EXP` ya nace inconsistente |
| **J-07** Severidad | **La de 014**: no queda abierto y se decide junto con J-06 y la forma aprobada (ver §7) | 5-0 | **Ev**: §VI.5 es explícita sobre invariantes. **Im**: un major no declarado deja a los destinos sin bloque de impacto. **CB**: decidirlo ahora cuesta una línea. **CH**: se atan J-06 y E-3. **Ri**: la severidad se revisa si la escalada E-3 se contesta con la oración de D9 |

## 4. Forma aprobada por pregunta

| Q | Forma aprobada | Reparto | Fundamento por juez |
|---|---|---|---|
| **Q1** | **Plan 013 con estos cambios de 014**: el destino queda como en 013. En el framework rige el default de la escalada E-1 (`IA.SDD/Expedientes/`). La condición (a), exclusión del snapshot, se mantiene (014 §4.2). La condición (b) se declara **reformulación** de `README.md` l.152, no lectura. La condición (c) queda como en 013 | 4-1 | **Ev**: (a) está fundada en §VI.5 («no condicionan lo que el orquestador genera») y (b) no. **Im**: sin declarar la reformulación, l.152 queda falsa. **CB**: declarar cuesta una fila. **CH, plan 013 sin escalada**: el literal de `ev-07` rige. **Ri**: reversible antes del push |
| **Q2** | **Plan 013 con estos cambios de 014 (R-02)**: condición observable al abrir (el caso atraviesa más de una corrida o más de un repositorio, o entra material externo al árbol). Se excluyen la mesa con registro en `Audit/` y la detención que se contesta en el lote. La custodia del original de un testimonio no depende de que se abra un expediente | 4-1 | **Ev**: la predicción de 013 no es observable. **Im**: sin exclusiones, habría un expediente por cada `Mesa-*`. **CB, por la misma forma sin la rama «entra material externo»**: esa rama abre un expediente por cada mensaje del Product Owner, y la custodia ya la cubre la cláusula final. **CH**: mantiene la condición de §0.0. **Ri**: reversible |
| **Q3** | **Alternativa 014 §5**: README de 5 campos; índice igual al listado de `actuaciones/`; cabecera de 4 campos; pase de 1 campo; original literal dentro del folio que lo presenta; evidencia con 3 campos; forma completa según 014 §5 | 4-1 | **Ev**: 18 campos contra 47, sin derivados a mano (R-01). **Im, por plan 013 con el punto de continuación en el README**: quien no estuvo tiene que abrir el último folio, y la lección del folio 003 pide ver el estado sin abrir nada. **CB**: la forma entra en minutos y se verifica enumerando, que es el criterio rector. **CH**: `Root-Rules.md` §10. **Ri**: reversible |
| **Q4** | **Plan 013 con estos cambios de 014 (R-09 opción A, R-10, R-05)**: número local de cinco dígitos más repositorio, sin familia `EXP`, excluido con motivo. Cita desde afuera como `<repositorio> <carpeta>`, con el folio en la prosa. La evidencia se nombra `NNN-<slug>` como en 013. La intervención mide la colisión con §9.4 **incluyendo la rama `migracion/a-13.16`** | 4-1 | Mismo reparto y fundamentos que J-06 |
| **Q5** | **Alternativa 014 §5**: seis tipos con mapeo total. Suspensión como campo «Suspende hasta: artefacto §». `archivo` con «Motivo:». La reapertura es una `presentacion` posterior a una `resolucion`. Condición: deuda D-5 (Formal) | 5-0 | **Ev**: el mapeo de §5 es total por enumeración. **Im**: sin eso, el estado derivado es indefinido en los dos ejemplares. **CB**: menos tipos. **CH**: cubre suspensión, desistimiento y reapertura (V3-06). **Ri**: reversible |
| **Q6** | **Alternativa 014 §5 (S1 y S3)**, conservando de 013 Q6 que la corrección es un folio nuevo que nombra el que corrige (campo «Corrige») y que antes del primer push la inmutabilidad se declara no observable. Sin folio por commit y sin trailer obligatorio | 5-0 | **Ev**: R-04 y R-14 son E1. **Im**: con S1 se cubren evidencia y renombres. **CB**: se quita trabajo. **CH**: se respeta `Coherencia-Conformacion-Pull-Request-Manual.md` l.28 y T1. **Ri**: S3 cubre el squash de destino |
| **Q7** | **Plan 013 con estos cambios de 014**: se mantienen las dos clases, medición y observación, de 013. Huella sólo para lo no versionado (J-02). Clasificación del testimonio por contenido (J-03), con la oración de D9 sujeta a E-3. El original va dentro del folio (§5). Compuerta **S2 antes del primer push**, con constancia de redacción, huella del original y custodia (R-03) | 5-0 | **Ev**: R-03 y R-07 son E1. **Im**: evita sellar datos personales. **CB**: la compuerta antes del push es barata. **CH**: J-02 y J-03. **Ri**: S2 es la única ventana reversible |
| **Q8** | **Plan 013 con estos cambios de 014 (R-10)**: la evidencia funda y no se vuelve especificación. Una sola vía declarada: la fila de control de cambios del artefacto nombra `<repositorio> <carpeta>`. El ciclo de origen no se toca. La inversa se deriva con `git grep` de la carpeta. Se conserva de 013 «cuántos casos sostienen el patrón» | 5-0 | **Ev**: `Root-Rules.md` l.680. **Im**: protege la derivación de §8.2. **CB**: una vía en lugar de dos. **CH**: ciclo de origen congelado (002 §2). **Ri**: reversible |
| **Q9** | **Plan 013**, sumando a B.1 `Mesa-Rules.md` §8 criterio 1 (R-14) | 5-0 | **Ev**: R-14 es E1. **Im**: sin eso, el criterio da falso en el framework. **CB**: una fila. **CH**: J-04. **Ri**: sin riesgo |
| **Q10** | **Plan 013 con este cambio de 014 (R-05)**: los adelantos (`IA.SDD` 0001 y `Lab-Geometria` `EXP-0001`) se declaran **forma histórica**, como V3-05 hizo con el precedente, en lugar de prometer una alineación. Se descarta el renombre único antes del push. Lo demás de 013 Q10 (no reescribir, incorporar antecedentes por `ruta@commit`) queda como estaba | 4-1 | **Ev**: R-04 punto 2 muestra que alinear rompe Q6. **Im**: sin declarar, quedan cuatro formas vivas sin nombre. **CB, por el renombre único antes del push de 014**: en el repositorio del framework cuesta poco hoy e imposible mañana, y evita una forma histórica permanente. **CH**: precedente V3-05. **Ri**: la forma histórica no toca los 284 enlaces y rutas que ya citan `0001` |
| **Q11** | **Plan 013 con estos cambios de 014 (R-08)**: acotado a ambigüedad (§9) y arbitraje (§7.0). La confirmación de plan y T4 quedan excluidas por nombre. El cableado en `Master-Prompt-Migracion.md` l.46 se declara **modificación** de «no la reconvoca dos veces», con su motivo | 5-0 | **Ev**: l.880-886 y l.46 son E1. **Im**: evita frenar traspasos. **CB**: dos exclusiones. **CH**: respeta T1. **Ri**: reversible |
| **Q12** | **Plan 013 con estos cambios de 014 (R-01)**: el pase vive en el último folio y el README remite sin copiar commit ni estado. En la forma mínima, el pase es «Sigue: acto · quién» (§5). Los demás contenidos de 013 Q12 (insumos, qué se invalida, «comprobar si el despacho anterior terminó», escaladas con su default) van a la forma completa. La reanudación lee expedientes abiertos en R0 paso 4 | 5-0 | **Ev**: la imposibilidad del hash propio es E1. **Im**: la lección del folio 003 se conserva donde hubo despacho. **CB**: la forma mínima queda en un campo. **CH**: `Master-Prompt-Reanudacion.md` l.452. **Ri**: reversible |

## 5. Escaladas que sobreviven

Hay tres, agrupadas. Ninguna es de tipo 2 ni 3, así que ninguna bloquea el ciclo.

### E-1 · Disparador 1 · Dónde viven los expedientes del framework

```text
DETENCIÓN — Ambigüedad (§9), por Mesa-Rules §7 disparador 1 · ¿los expedientes del framework viven en IA.SDD/Expedientes/, reformulando la autosuficiencia de README.md l.152, o en IA.SDD.Documentacion/Expedientes/?

  QUÉ PASÓ
    ev-07 da la ruta literal «/IA/SDD/IA.SDD/Expedientes» y llama al caso «expediente de reportes»;
    los reportes viven en IA.SDD.Documentacion. README.md l.152 declara que ningún archivo del
    repositorio referencia otro repositorio. El expediente 0001 ya tiene 284 líneas que nombran
    otros repositorios (R-06). Las tres carpetas Expedientes son anteriores al mensaje (stat).

  ORIGEN DEL HECHO
    Valor:      de la corrida (por cálculo parcial y por duda)
    Cómo:       l.152 está en la base 8c55a1e sin cambios (git diff --name-only 8c55a1e HEAD sólo
                toca Expedientes/): ajeno. El mensaje del Product Owner no vive en ningún repositorio:
                no calculable, se trata como de la corrida (Master-Prompt.md l.981). Las referencias
                a otros repositorios las agregaron e8c84d9..b92c64b: de la corrida.
    Por qué la autocorrección no alcanzaba: cerrarlo exige intención de producto que ninguna
                fuente contiene (l.998): si el pedido del dueño modifica una propiedad que él mismo
                declaró.

  ESTADO DE AVANCE
    Hecho:      14 folios y ev-01 a ev-08 en IA.SDD/Expedientes/, en una rama sin push.
    Falta:      folios 015 a 017, reporte 31 y prompt 09 (ninguno cita todavía la ruta publicada).
    ¿Lo que falta es vital? Sí: el reporte 31 fija la ruta citada.

  OPCIONES
    A. IA.SDD/Expedientes/ con exclusión del snapshot (§VI.5) y l.152 reformulada en forma
       declarada. Se conserva todo lo hecho.
    B. IA.SDD.Documentacion/Expedientes/. Se conserva el contenido y se mueve la carpeta antes
       del push. l.152 queda intacta. Se descartan las rutas ya escritas en los folios, que
       pasan a forma histórica.

  PROPUESTA — A
    Por qué:    es el literal de ev-07, que rige (folio 012 §4), y la reformulación queda declarada.
    Alternativa razonable: B, si el dueño quiere que IA.SDD siga clonándose sin referencias ajenas.

  SI NO RESPONDÉS
    Rige A. La intervención 09 declara la reformulación de l.152 en su nota de coherencia.
    No se bloquea nada.

  QUÉ NECESITO DE VOS
    Elegir A o B.
```

### E-2 · Disparador 5 · Dato personal en evidencia de repositorios públicos

```text
DETENCIÓN — Detención con propuesta, por Mesa-Rules §7 disparador 5 · ¿«ADOLFO VERA» es un dato personal real, y qué se hace con su fuente pública en Lab-Geometria?

  QUÉ PASÓ
    El folio 005 (l.215-216) copia verbatim un nombre propio que sale de
    Lab-Geometria main:evidencia/2026-09-02-mesa-ux/README.md:14. Los dos repositorios responden
    200 en GitHub. El expediente además tiene rutas del directorio personal del host en 94 líneas
    de 33 archivos.

  ORIGEN DEL HECHO
    Valor:      mixto, calculado.
    Cómo:       la fuente está en la base de Lab-Geometria b9675d8, sin cambios por esta corrida:
                ajena. La copia en IA.SDD entró por 7301a8f, y las rutas de host por e8c84d9..b92c64b,
                commits de esta corrida, ausentes en 8c55a1e: de la corrida.
    Qué no escala: la copia y las rutas de host. Son de la corrida y se cierran por autocorrección
                sobre el conjunto (Q7, compuerta S2, antes del primer push), porque no cambian una
                decisión del humano. «Nunca reescritas» es forma provisoria (README del expediente)
                y no está en ev-07.
    Por qué la autocorrección no alcanzaba, para lo que sí escala: si el nombre es de una persona
                real no tiene cita posible en el árbol (C), y su fuente vive en un destino ajeno,
                sólo lectura para esta corrida (002·R2), con consecuencia externa.

  OPCIONES
    A. Tratarlo como dato personal: la copia se redacta antes del push, con constancia, huella
       del original y custodia fuera del repositorio (R-03), y la fuente en Lab-Geometria la trata
       la corrida de ese destino. Se conserva todo el expediente, con una pieza derivada declarada.
    B. Dato de prueba ficticio: la copia puede quedar. Las rutas de host igual se redactan por S2.

  PROPUESTA — A
    Por qué:    el daño de publicar es irreversible y la redacción previa es reversible.
    Alternativa razonable: B, si confirmás que el nombre es ficticio.

  SI NO RESPONDÉS
    Rige A para la copia en IA.SDD. La fuente en Lab-Geometria no se toca y queda sin tratar.
    Queda bloqueado el push de expedientes/0001-caso hasta que corra S2, que por el encargo
    ya no se hace.

  QUÉ NECESITO DE VOS
    Decir si es dato real o ficticio, y si Lab-Geometria debe tratar su fuente.
```

### E-3 · Disparador 7 · La aprobación por conversación frente a D9

```text
DETENCIÓN — Arbitraje (§7.0), por Mesa-Rules §7 disparador 7 · ¿Se agrega a D9 una oración que diga cuándo un asiento literal con original y huella deja de ser «captura de una conversación»?

  QUÉ PASÓ
    ev-07 abre con «tenes el ok de la fase K». Lab-Geometria-mig1316 (7864428) lo usó para cerrar
    la fase k. Deriva-Rules.md §1 admite `humano` («aprobación explícita registrada con fecha») y
    excluye «una captura de una conversación». Para este caso, las dos oraciones chocan (E1).
    Los tipos de D9 son decisión cerrada (002 §2).

  ORIGEN DEL HECHO
    Valor:      ajeno a la corrida.
    Cómo:       Deriva-Rules.md está en 8c55a1e sin cambios (git diff --name-only 8c55a1e HEAD no
                lo lista). El choque ya existía antes de la corrida: la 13.17 l.159 y mig1316 lo
                enfrentaron por su cuenta.
    Pregunta previa: no hay cita que desempate, y README.md «Reglas de intervención» exige
                «decisión explícita del responsable» para modificar D1 a D9.

  OPCIONES
    A. Agregar la oración a D9. La aprobación por conversación con original y huella es `humano`.
       Sube el conjunto a major (§VI.5) con bloque de impacto. Se conserva la clasificación por
       contenido de J-03.
    B. D9 intacta, y declarar que una aprobación por conversación no es evidencia D9. El salto
       queda minor. Los cierres por esa vía, como la fase k, quedan declarados como tales.

  PROPUESTA — A
    Por qué:    ev-07 pide que «las pruebas que aporse yo» queden como parte de las
                especificaciones, y la aprobación es la prueba más frecuente del dueño (R-02).
    Alternativa razonable: B, si preferís no tocar una invariante en este salto.

  SI NO RESPONDÉS
    Rige B, porque una invariante no se modifica sin decisión explícita (README.md). El salto es
    minor (§7). No se bloquea nada. El cierre de la fase k en mig1316 queda sin estatus D9 y
    lo declara esa corrida.

  QUÉ NECESITO DE VOS
    Elegir A o B.
```

**No escalan:**
- **J-06**: el árbol la contesta con §9.1 y D3.
- **R-05**: la contestan `Mesa-Rules.md` §6.1 y 002·R2. Va a deuda D-1.
- **R-12**: la fusión es del humano por T1, y queda como deuda D-3 más capa a revalidar.
- **Rutas de host de R-03**: se cierran por autocorrección.
- **R-13**: sin disparador.
- **Veto**: no hubo veto de riesgo.

## 6. Deuda declarada

Forma de `Root-Rules.md` §12.2. Ciclo de origen de todas: mesa del 2026-09-13, expediente `0001` folio 015, base `8c55a1e`.

| Id | Qué falta | Por qué no hoy | Quién lo cierra | Evento de cierre |
|---|---|---|---|---|
| **D-1** (R-05) | Contrastar los folios 001 y 002 de `Lab-Geometria` `SDD/Expedientes/0001-Migracion-Normativa-A-13.16/` contra el original, y el índice de evidencia contra `evidencia/` | Es otra corrida. El destino es sólo lectura (002·R2) y este jurado no escribe ahí | Orquestador de la corrida de migración de `Lab-Geometria` (worktree `Lab-Geometria-mig1316`) | Una actuación de constancia que corrija los folios 001 y 002, visible en el índice de actuaciones de ese `README.md`, antes del push de `migracion/a-13.16` |
| **D-2** (013·R14, B.2, R-13 punto 6) | La regla de seguridad para evidencia (datos personales, credenciales, rutas de host) juzgada por Seguridad (AG-00050) | Postergada por cupo (`Mesa-Rules.md` §5.5, 013 A.3) | Presidente de mesa (AG-00970) de la intervención 09 | Tabla de veredictos del registro de mesa de la intervención 09 (`IA.SDD.Documentacion` `PROMPTs/Fixs/09-Fix-Reporte-31/`), con Seguridad entre los convocados **antes de aprobar el parche de S2** |
| **D-3** (R-12) | Alinear la 13.17 en §2.3, §3.2, §5.2, §5.3 y §6 con la forma aprobada | Está en la rama `conocimiento/mesa-de-expertos-a-pedido` (`cab03ed`), fuera de `main`, y esta corrida no modifica el conjunto normativo (002·R1) | La intervención que aplique el plan. La fusión de la 13.17 es de la organización dueña del repositorio (T1) | Fila de control de cambios de `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` que registre la alineación de esas cinco secciones |
| **D-4** (R-13 punto 3) | Citar sin ambigüedad `013·R1–R18`, `002·R1–R6` y `R-NN` | Los folios 002 y 013 son inmutables | Presidente de mesa | Folio 016 (dictamen), en su tabla de hallazgos, citando cada raíz con su folio de origen |
| **D-5** (R-11, 013 A.3) | Auditar el conjunto cerrado de tipos y el mapeo tipo→estado de Q5 | Formal está postergado por cupo | Presidente de mesa de la intervención 09 | Tabla de veredictos del registro de mesa de la intervención 09, con Formal convocada |
| **D-6** (013 A.3) | Medir identificadores y enlaces entre expedientes, con Trazabilidad documental (AG-00110) | Postergada por cupo | Presidente de mesa de la intervención 09 | Tabla de veredictos del registro de mesa de la intervención 09, con AG-00110 convocado |

**Fuera de la lista de voto.** 013·R15 (disposición y excepción a la guía l.145) no se sometió como ítem y ningún ataque lo tocó. El jurado no vota sobre él. Lo completa el dictamen.

## 7. Severidad del salto (J-07)

**Minor, con condición.**

- Con la forma aprobada:
  - J-06 opción A no toca D3.
  - El control de cambios no toca D5, por precedente medido: el registro de mesa de `Mesa-Rules.md` §2.2 tiene nueve secciones sin control de cambios, y es norma vigente.
  - Q11 y Q12 modifican el comportamiento de orquestadores sin volver incumplido un documento ya generado.
  - Todo entra como regla transversal nueva (guía §III.8) y secciones que suben minor.
- §VI.5: «**minor**: alguna regla o plantilla sube minor y ninguna sube major».
- **Pasa a major** si la escalada E-3 se contesta con A. §VI.5: «**major**: … o se modifica una invariante D1-D9». En ese caso, la entrada del `CHANGELOG.md` lleva el bloque «Impacto sobre destinos existentes».

## 8. Homogeneidad

| Base | Ítems 5-0 | Porcentaje |
|---|---|---|
| Hallazgos votados con `PROCEDE`/`NO_PROCEDE` (R-01 a R-14 y J-01 a J-07) | 17 de 21 | **81,0 %** |
| Todos los ítems votados (sumando Q1 a Q12) | 24 de 33 | 72,7 % |

**Supera el 80 % sobre la base de hallazgos, y se declara el ciclo sospechoso de homogeneidad** (`Mesa-Rules.md` §6.4). Tomo la base conservadora, y la limitación de folio 002 §5 lo vuelve esperable.

**Revisión de los `NO_PROCEDE`.** Ningún ítem salió `NO_PROCEDE`. Revisé los votos individuales en contra y las lecturas rechazadas:

- **R-13, jueces de impacto y de costo**: se sostienen. `ev-08` subsanó el punto 7, y renumerar sobre folios inmutables no suma.
- **R-06 y J-01, juez de coherencia**: se sostiene como disidencia. La escalada E-1 da la misma ubicación por default.
- **J-06 y Q4, juez de impacto**: se sostiene. Queda condicionado a que `<repositorio> <carpeta>` se cite como ruta que resuelve.
- **Lecturas de 013 rechazadas en J-01, J-03, J-05 (mecanismo) y J-06, y V3-05 réplica en J-04**: rechazos sostenidos por anclas E1 citadas en §3.

**Pedido.** §6.4 manda que la revisión la haga **el refutador**, no el jurado. Por eso se pide al presidente que la despache antes del dictamen, o que el dictamen declare por qué no.

## 9. Bloque de cierre

```text
CIERRE DE MESA — IA.SDD (repositorio del framework), expediente 0001, 2026-09-13

  PANEL
    Convocados:     N1 Requisitos, N2 Verificación, N3 Lector sin contexto, V1 Gestión documental,
                    V2 Evidencia digital, V3 Procedimiento de expediente, V4 Ingeniería de software,
                    V5 Metodología académica, Refutador. Hallazgos procedentes por rol: lo completa
                    el dictamen. Refutador: 14 de 14 ataques PROCEDE (folio 015 §2)
    Descartados:    Cumplimiento (AG-00010): sin obligación legal de retención medida (002 §3.3).
                    Operación y entrega (AG-00090): sin señal (002 §3.3)
    Ad hoc:         V1 a V5 con carta de mandato (§5.4, 002 §3.2): lo que aportó cada una, lo
                    completa el dictamen
    Postergados:    Seguridad (AG-00050), Trazabilidad documental (AG-00110, con el motivo de
                    descarte corregido en 013 A.3) y Formal, los tres por cupo (§5.5)
    Aporte nulo:    lo completa el dictamen

  HALLAZGOS
    Detectados: lo completa el dictamen (réplica: 64 encabezados según 014 l.30; primera
                convocatoria sin conteo en este folio)
    Procedentes: lo completa el dictamen (en este folio: R-01 a R-14 y la lectura elegida de
                J-01 a J-07)
    Con parche: 0 con texto exacto (§6.5 no corrió: no hay cuerpo de parches; lo aprobado
                es la forma por pregunta de §4)
    Descartados por C: lo completa el dictamen

  COMPUERTA (§10.0)
    Resultado:      no aplica en el framework (002 §1). En su lugar, ev-01 a ev-05
    No mirado:      huellas truncadas de ev-02 y ev-05 en el índice (013·R1), a corregir en el
                    folio 017. Pruebas en clon de R-04, no re-corridas por este jurado

  ENTREGA AL ORQUESTADOR
    Parches:            0 con texto exacto. Las capas donde aplicar la forma aprobada son las de
                        013 B.1 más las de R-14
    Deuda declarada:    6 (D-1 a D-6), cada una con su evento de cierre
    Capas a revalidar:  Master-Prompt.md §3.5, §8.1, §8.2 (no se toca, R-10) y §12.1 T1;
                        Master-Prompt-Migracion.md M4 y l.46; Master-Prompt-Reanudacion.md §2 y §5;
                        Mesa-Rules.md §0.0, §2.1 y §8 criterio 1; Migracion-Rules.md §2.2;
                        SDD-Development-Guide.md §VI.5; README.md l.152; Rules-Base-Conocimiento.md
                        (compuerta de ofuscación); SDD-User-Guide.md;
                        Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md (13.17);
                        Deriva-Rules.md §1 (sólo si E-3 se contesta A)
    Escaladas:          3, agrupadas (E-1 disparador 1, E-2 disparador 5, E-3 disparador 7);
                        ninguna bloqueante

  CIERRE
    Contador declarado: el de este ciclo de mesa (ronda 1), no el de audit.
    Por criterio §10.1: no alcanzable en esta ronda (hay hallazgos interpretativos procedentes).
    Por decisión: lo completa el dictamen, con lo que quedó abierto: E-1, E-2, E-3; D-1 a D-6;
    homogeneidad sospechosa (81,0 %) con revisión del refutador pedida; 013·R15 sin votar.
```
