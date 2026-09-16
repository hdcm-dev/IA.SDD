| Campo | Valor |
|---|---|
| Tipo | informe |
| Fecha | 2026-09-16 |
| Autor | Comisión de Verificación / QA (primera ronda) |
| Corrige | — |

# Informe de la comisión de Verificación / QA

## 0. Qué revisé y con qué medio

| Qué | Medio | Base |
|---|---|---|
| Contrato de entrada, evidencias ev-01 y ev-02 del expediente 0003 | Lectura | `IA.SDD` rama `expediente-0003-…` sobre `main b8943c2` (13.19) |
| `Expediente-Rules.md` §3.2, §4, §5, §6 (A1–A12), §7; `Master-Prompt.md` §7 Fase I, §10, §10.0, §13.1; `Master-Prompt-Reanudacion.md` §1, §2 R0, §3 R1, §5, §6; `Rules-Backlog-Tecnico.md` §3.6; `Root-Rules.md` §12.2; `Catalogo-De-Criterios.md` §4; `Knowledge-Mesa-De-Expertos-A-Pedido.md` §6 | Lectura con línea | ídem |
| Los cuatro expedientes del destino, sus resoluciones y constancias de cierre; `docs/02_*`, `docs/06_*`, `Context/` | `git ls-tree`, `git grep`, `git show` sobre el commit `727655e` (medición, nunca árbol de trabajo) | destino `main 727655e`, sólo lectura |
| Prototipo de la compuerta (`compuerta-r.sh`, en mi scratchpad, no en ningún repositorio) | Corrido contra el destino (rojo) y contra un fixture git de cuatro expedientes (rojo → verde → no evaluable) | — |
| A3 y A4 de `Expediente-Rules.md` §6 sobre los expedientes del propio framework | Los comandos literales de §6 | `IA.SDD` |

No leí el informe de ninguna otra comisión.

## 1. Hallazgos

| Id | Nivel | Ancla | Hallazgo | Impacto si no se corrige | Dirección de la corrección |
|---|---|---|---|---|---|
| **QA-01** | **P1** | E1 | **La población «expediente cerrado» no es derivable por el estado de `Expediente-Rules.md` §3.2** (líneas 180–187: `resolucion` → resuelto, `archivo` → archivado). En el destino: `git ls-tree -r --name-only 727655e -- docs/experdientes/ \| grep -cE '/[0-9]{3}-archivo-'` → **`0`**. Los cuatro expedientes están aplicados y ninguno tiene folio `archivo`; 0002 y 0003 terminan en `constancia` (estado «en trámite» por la tabla) y 0004 termina en `016-cierre-del-expediente.md` con `Tipo \| cierre`, un tipo fuera del conjunto cerrado (A3 marca ese folio y dos más de 0001 con punto en el slug). | Una compuerta cuya población sea «archivado» corre sobre cero candidatos y **sale verde en el destino que originó el caso**. El verde vacío es peor que no tener compuerta: certifica. | La población es «tiene al menos un folio `resolucion`» (el plan existe), no «archivado». Y al revés: el folio `archivo` con `Motivo: aplicado y verificado` (línea 187) **exige la compuerta en verde antes de asentarse**, así el cierre queda subordinado a la reintegración y no al revés. |
| **QA-02** | **P1** | E1 + E4 | **La derivación que §5 ya describe (`Expediente-Rules.md:310–314`, `git grep -l` por ruta de carpeta) da falso rojo y falso verde a la vez.** Falso rojo: sobre 0001, por ruta sólo aparece `CU-03` (1 documento); por «expediente 0001» en prosa aparecen `CU-03`, `reglas-negocio` y `product-backlog` (3). El destino cita mayormente por número, no por carpeta. Falso verde: `product-backlog_v1.0.md:330` dice «**pendiente** (T-05.3 del expediente 0001)»: una cita que declara que **no** se reintegró satisface «está citado». Contrastado: en 0001 la cita **sí** está en filas de control de cambios (`^\| 2.5 \| 2026-09-14 …Expediente 0001`); en 0002–0004, cero filas. | Con el patrón de §5 tal cual, la compuerta reporta rojo donde hubo reintegración y verde donde sólo hubo una mención. Ninguna de las dos lecturas sirve para decidir. | La compuerta busca la cita **en la fila de control de cambios** del documento de 02 o 06 (patrón `^\| <versión> \| <fecha> \|.*<expediente>`), que es la única vía que §5 declara (línea 304–307). Fijar una forma de cita reconocible (la carpeta) y admitir «expediente NNNN» como transición declarada. |
| **QA-03** | **P1** | E4 + E1 | **El chequeo no tiene ejecutor, y el modelo que se propone copiar (A1–A12) hoy está en rojo en el propio framework.** `Master-Prompt.md:1287–1289`: la compuerta §10.0 lee los `[enumerable]` «del archivo de reglas de la categoría que la fase está generando»; la Fase I genera 10 y 11 (`Master-Prompt.md:730–732`), de modo que una fila `[enumerable]` en `Expediente-Rules.md` §7 **no la corre ninguna fase**. Los P0 propios de la Fase I (`:1466–1476`) no nombran la reintegración. Prueba de que un criterio sin ejecutor muere: A4 literal (`Expediente-Rules.md:366`, `^\| Tipo \| presentacion \|$`) contra `Expedientes/0002-*/` y `0003-*/` del framework → **17 folios `TIPO`** porque la práctica escribe `` | Tipo | `informe` | `` con acentos graves; A3 (`:360`) → 5 folios de 0002 sin tipo en el nombre. Nadie corrió A1–A12 desde que se publicaron. | La norma nueva declara un chequeo que ningún orquestador ejecuta; a la primera corrida en otro proyecto no ocurre, que es exactamente el defecto denunciado por el Product Owner. | Nombrar el ejecutor: un paso de la Fase I (junto al triaje del paso 3, `:733`) y R0 paso 4 de la reanudación. Que §10.0 incorpore la comprobación en su primer conjunto (las transversales, `:1287`) o extienda el segundo a las reglas transversales. Y **probar la compuerta en rojo y en verde contra un fixture** antes de publicarla, con la salida en la nota de coherencia. Corregir de paso A4 (admitir el acento grave) o la práctica. |
| **QA-04** | **P1** | E1 | **La constancia de cierre no se contrasta contra el plan de la resolución.** En 0002 del destino, la resolución 013 planifica `T-DOC.1` (glosario, REQ-23, contratos) y `T-DOC.2` («Wireframes de VIEW-07 y de las vistas nuevas»): `git grep -c "T-DOC" 727655e -- 'docs/experdientes/0002-*/actuaciones/0[12][0-9]-constancia-*'` → **vacío**. La constancia 024 declara «el plan del folio 013 §4 queda ejecutado en sus tramos 1 a 10» y su tabla lista tramos 1–11 sin ninguna tarea DOC. `wireframes-componente_v1.0.md` sigue en 3.3 del 2026-09-14 (ev-01). En 0003 el mismo cruce deja sólo `T7.1`, que el pase declara del Product Owner: el chequeo distingue. | El cierre puede decir «ejecutado» con tareas de documentación planificadas y no hechas, y nada lo detecta. La reintegración planificada se pierde en el mismo folio que la da por cumplida. | Criterio enumerable de cierre: todo identificador de tarea del plan de la última `resolucion` aparece en una `constancia` posterior o en el cierre como «no ejecutada» con motivo. Es un `grep` por identificador, como A5. |
| **QA-05** | **P2** | E1 + E4 | **El evento disparador que el framework ya tiene no es observable en el destino, ni siquiera donde hubo reintegración.** `Rules-Backlog-Tecnico.md:162–169` ancla la reapertura del backlog a «la entrada de control de cambios que el Product Owner asienta en el `PRODUCT-INTAKE`». En el destino no hay intake; su equivalente es `Context/acta_proyecto.md`: `git grep -n -iE "expediente" 727655e -- Context/acta_proyecto.md` → **vacío** (cero para los cuatro, incluido 0001); su última fila de control de cambios es del 31/08/2026 y la carta llega a `C-112` sin nombrar expedientes. Además el puntero está roto: `Master-Prompt.md:1847` y `:1958` remiten el evento a `Rules-Backlog-Tecnico.md` **§3.4**, que es «Vinculación cross-doc» (`:147`); el evento vive en **§3.6** (`:158`, `:162`). `Master-Prompt-Reanudacion.md:412` y `Rules-Contexto.md:110` sí citan §3.6. | Una compuerta anclada al evento (la fila del intake) sale roja para los cuatro y no distingue el reintegrado del no reintegrado: no mide lo que se quiere medir. Y quien siga el puntero de §13.1 cae en la sección equivocada. | La compuerta mide **el artefacto** (fila de control de cambios de 02/06), no el evento. Un segundo chequeo enumerable: la `resolucion` nombra la fila del intake o del acta que asienta el cambio de alcance, o declara que no lo hay. Corregir §3.4 → §3.6 en las dos líneas del `Master-Prompt.md` (errata, sin subir versión). |
| **QA-06** | **P2** | E1 | **Falsos positivos de la compuerta «02 o 06», medidos.** (a) 0004 del destino es un rediseño visual del editor: su resolución 014 aplica `escala.css`, clases del catálogo y tope de 760 px; su reintegración correcta es 03 (wireframes, VIEW), no un CU ni una US; la compuerta lo marca rojo por el objetivo equivocado. (b) Un expediente que sólo cataloga conocimiento (el 0002 del framework, «Conocimiento Bundle-JS») o que sólo corrige documentación no cambia el compromiso y no tiene por qué tocar 02 ni 06. Sin forma de declararlo, o se falsifica una US para poner la compuerta en verde, o se acepta el rojo permanente, que desactiva la compuerta (`Master-Prompt.md:1489–1493`, «un verificador que sobre-reporta entrena a ignorarlo»). | La compuerta o exige lo que no corresponde o se ignora. Las dos cosas la matan. | La exención se **declara en la `resolucion`** (el folio que decide), no en la carátula, que es fija desde la apertura (`Expediente-Rules.md:125–126`) y no sabe todavía qué toca. Forma: una fila `\| Reintegra \| 02, 06 \|` o `\| Reintegra \| ninguna: <motivo> \|`. **Sin declaración, el defecto es 02+06** (falso rojo antes que falso verde). La exención queda para el audit como `[interpretativo]`: el motivo se sostiene. Prototipado abajo: 0003 del fixture sale «exento, declarado en 002». |
| **QA-07** | **P2** | E1 + E4 | **La compuerta y R0 paso 4 asumen el layout canónico y en un destino que no lo sigue salen vacuamente verdes.** `Master-Prompt-Reanudacion.md:139–143` busca «los de `SDD/Expedientes/`»; el destino los tiene en `docs/experdientes/` (sic) y sus 02/06 en `docs/02_especificacion_funcional/` y `docs/06_plan_sprint/`. Con los parámetros canónicos, mi prototipo sobre el destino devuelve `NO EVALUABLE … no alcanza ningún documento` sólo porque le puse la guarda; sin ella, cero expedientes y cero documentos → verde. `Expediente-Rules.md:345–346` ya lo prescribe: «un comando que termina con error no es vacío: es no evaluable, y se declara». | El framework llevado a un destino con carpetas propias certifica reintegración sin haber mirado nada. Es el caso del pedido («cuando tome este framework … para otro proyecto»). | La compuerta toma **tres parámetros declarados por el destino** (carpeta de expedientes, ruta de 02, ruta de 06) desde un documento que la reanudación ya lee (el manifiesto o el informe de estado), y **distingue tres salidas**: verde, rojo y no evaluable. Cero candidatos nunca es verde. |

### Prototipo, corrido sobre el destino (rojo)

Script (sólo lectura; vive en mi scratchpad, no se escribió en ningún repositorio):

```bash
#!/usr/bin/env bash
# Compuerta R — reintegración de expedientes resueltos a la especificación y al backlog.
# Parámetros: B commit base · P carpeta de expedientes · SPEC patrones de 02 y 06 · MODE estricto|laxo
B=${B:-$(git rev-parse --abbrev-ref origin/HEAD | sed 's#^origin/##')}
P=${P:-SDD/Expedientes}; MODE=${MODE:-laxo}
[ -n "$SPEC" ] || SPEC='SDD/Docs/*/02-Especificacion-Funcional/* SDD/Docs/*/06-Backlog-Tecnico/*'
rc=0
ndoc=$(git grep -l -E . "$B" -- $SPEC 2>/dev/null | wc -l)
nexp=$(git ls-tree -d --name-only "$B" -- "$P/" 2>/dev/null | wc -l)
[ "$ndoc" -gt 0 ] || { echo "NO EVALUABLE: SPEC='$SPEC' no alcanza ningún documento en $B"; exit 2; }
[ "$nexp" -gt 0 ] || { echo "NO EVALUABLE: P='$P' no tiene expedientes en $B"; exit 2; }
printf '%-6s %-14s %-12s %-12s %s\n' EXP RESUELTO ALCANCE CITAS_02_06 VEREDICTO
for X in $(git ls-tree -d --name-only "$B" -- "$P/"); do
  n=$(basename "$X" | cut -c1-4)
  res=$(git ls-tree --name-only "$B" -- "$X/actuaciones/" | grep -cE '/[0-9]{3}-resolucion-')
  [ "$res" -gt 0 ] || { printf '%-6s %-14s %-12s %-12s %s\n' "$n" no - - "fuera de la población"; continue; }
  r=$(git ls-tree --name-only "$B" -- "$X/actuaciones/" | grep -E '/[0-9]{3}-resolucion-' | tail -1)
  alc=$(git show "$B:$r" | sed -nE 's/^\| Reintegra \| ([^|]+) \|.*/\1/p' | head -1 | sed 's/ *$//')
  [ -n "$alc" ] || alc='(sin declarar→02+06)'
  case "$alc" in ninguna*) printf '%-6s %-14s %-12s %-12s %s\n' "$n" sí "$alc" - "exento, declarado en $(basename "$r" | cut -c1-3)"; continue;; esac
  if [ "$MODE" = estricto ]; then pat="$(basename "$X")"; else pat="$(basename "$X")|[Ee]xpediente[[:space:]]+0*${n#000}([^0-9]|$)"; fi
  cites=$(git grep -l -E "$pat" "$B" -- $SPEC 2>/dev/null | sed "s/^$B://")
  c=$(printf '%s' "$cites" | grep -c .)
  if [ "$c" -gt 0 ]; then v="VERDE"; else v="ROJO: resuelto y sin cita desde 02 ni 06"; rc=1; fi
  printf '%-6s %-14s %-12s %-12s %s\n' "$n" sí "$alc" "$c" "$v"
  printf '%s\n' "$cites" | sed '/^$/d;s/^/       ↳ /'
done
exit $rc
```

Salida real sobre el destino (`B=727655e P=docs/experdientes SPEC='docs/02_especificacion_funcional/* docs/06_plan_sprint/*'`):

```text
EXP    RESUELTO       ALCANCE      CITAS_02_06  VEREDICTO
0001   sí            (sin declarar→02+06) 3            VERDE
       ↳ docs/02_especificacion_funcional/casos-de-uso/CU-03-definir-segmento_v1.0.md
       ↳ docs/02_especificacion_funcional/reglas-negocio_v1.0.md
       ↳ docs/06_plan_sprint/product-backlog_v1.0.md
0002   sí            (sin declarar→02+06) 0            ROJO: resuelto y sin cita desde 02 ni 06
0003   sí            (sin declarar→02+06) 0            ROJO: resuelto y sin cita desde 02 ni 06
0004   sí            (sin declarar→02+06) 0            ROJO: resuelto y sin cita desde 02 ni 06
exit=1
```

Con `MODE=estricto` (sólo la ruta de carpeta, como `Expediente-Rules.md` §5): 0001 baja a **1** cita (QA-02). Con los parámetros canónicos sin declarar: `NO EVALUABLE … no alcanza ningún documento en 727655e`, `exit=2` (QA-07). La línea para el bloque R1 de la reanudación se deriva de la misma salida: `… | grep ROJO | cut -c1-4` → `0002 0003 0004`.

Fixture (repositorio git efímero con cuatro expedientes: uno citado desde 06, uno no citado, uno con `| Reintegra | ninguna: … |` en su resolución, uno sin resolución):

```text
### ROJO (commit «rojo»)                                  ### VERDE (tras una fila de control de cambios en 06 que nombra 0002)
0001  sí  (sin declarar→02+06)  1  VERDE                  0001  sí  (sin declarar→02+06)  1  VERDE
0002  sí  (sin declarar→02+06)  0  ROJO: …                0002  sí  (sin declarar→02+06)  1  VERDE
0003  sí  ninguna: cataloga conocimiento…  -  exento…     0003  sí  ninguna: …  -  exento, declarado en 002
0004  no  -  -  fuera de la población                     0004  no  -  -  fuera de la población
exit=1                                                    exit=0
```

Chequeo de cierre (QA-04), salida real sobre 0002 del destino:

```text
T-DOC en la resolución 013 de 0002:
398:| T-DOC.1 | DOC | Glosario (marca = rótulo; alcance por suscripción; herencia no), REQ-23 corregido y `contr
399:| T-DOC.2 | DOC | Wireframes de VIEW-07 y de las vistas nuevas; deuda declarada D-1..D-9
T-DOC en las constancias 014-024:
(vacío = ninguna)
```

### Criterio de aceptación propuesto (forma de `Expediente-Rules.md` §6 y `Knowledge-Mesa-De-Expertos-A-Pedido.md` §6)

- [ ] **A13** `[enumerable]` Todo expediente con folio `resolucion` cuya última resolución no declare `| Reintegra | ninguna: <motivo> |` está nombrado en **una fila de control de cambios** de al menos un documento de cada categoría que declara (02 y 06 por defecto). Comando: el de arriba, con `P`, `SPEC` y `B` declarados por el destino. Salidas: vacío (verde) · lista de expedientes (rojo, **P1** en el audit de Fase I y línea `EXPEDIENTES RESUELTOS SIN REINTEGRAR` en R1) · `NO EVALUABLE` (se declara, nunca es verde).
- [ ] **A14** `[enumerable]` Todo identificador de tarea del plan de la última `resolucion` aparece en una `constancia` posterior, o en el folio de cierre como no ejecutada con motivo. Comando: `grep -oE '^\| T[-A-Z0-9.]+ \|'` sobre la resolución, cruzado con `git grep -F` sobre las constancias posteriores.
- [ ] **A15** `[enumerable]` El folio `archivo` con `Motivo: aplicado y verificado` existe sólo si A13 y A14 están en verde en el commit que lo asienta.
- [ ] **I6** `[interpretativo]` Toda exención `Reintegra: ninguna` se sostiene: el expediente no altera un CU, una RN, una US ni una BT vigente (el criterio de compromiso de `Rules-Backlog-Tecnico.md` §3.6, líneas 172–179).
- [ ] **I7** `[interpretativo]` La fila de control de cambios que satisface A13 describe lo que cambió, y no es una mención de paso ni un «pendiente».

Costo medido: un comando por expediente, menos de un segundo sobre cuatro expedientes y ~30 documentos; cabe en la compuerta §10.0 y en R0 sin pasada nueva.

## 2. Lo que revisé y está bien

| Qué | Dónde | Por qué está bien |
|---|---|---|
| La regla de «no evaluable» ya existe y es la correcta para esta compuerta | `Expediente-Rules.md:345–346` | Distingue error de vacío; la compuerta nueva sólo tiene que obedecerla (QA-07 es su aplicación, no una pieza nueva) |
| La dirección inversa (qué documentos citan un expediente) está declarada como derivación y no como tabla a mano | `Expediente-Rules.md:307–314` | El principio es correcto y es lo que hace posible una compuerta por `git grep`; lo que falla es el patrón y la ausencia de ejecutor, no la idea |
| R0 paso 4 ya lista expedientes abiertos con su pase y contrasta ítems diferidos vencidos | `Master-Prompt-Reanudacion.md:139–143`, `Root-Rules.md:748–756` | Es el lugar natural para sumar la línea de «resueltos sin reintegrar»: la reanudación ya lee el árbol entero y el costo marginal es cero, como el propio prompt argumenta (`:145–149`) |

## 3. Respuestas a las preguntas del caso

**Q4 — ¿Cómo se verifica mecánicamente que la reintegración ocurrió?** Con una compuerta enumerable sobre un commit, con tres salidas (verde, rojo, no evaluable), cuya población es «tiene folio `resolucion`» y cuyo objetivo es «una fila de control de cambios de 02 y de 06 nombra el expediente», salvo exención declarada en la resolución. Prototipada arriba: sobre el destino hoy da rojo en 0002, 0003 y 0004 y verde en 0001; sobre un fixture pasa de rojo a verde con una sola fila de control de cambios. Ejecutores: un paso de la Fase I antes del audit (y su P0/P1 en la lista de `Master-Prompt.md` §10) y R0 paso 4 de la reanudación, que imprime en R1 la línea `EXPEDIENTES RESUELTOS SIN REINTEGRAR: 0002 0003 0004`. La compuerta no puede vivir sólo como anti-patrón `[enumerable]` de `Expediente-Rules.md` §7, porque §10.0 no lee reglas transversales (QA-03). Se completa con A14 (el cierre cubre el plan) y A15 (el `archivo` exige A13 y A14 en verde). Se prueba en rojo contra el destino y en verde contra un fixture, y la salida de las dos corridas va en la nota de coherencia de la intervención.

**Q6 (mi parte) — ¿Cómo se aplica al destino y a destinos sin `PRODUCT-INTAKE`?** Al destino: la compuerta ya corre contra él con tres parámetros (`P=docs/experdientes`, y las dos rutas de 02 y 06) y devuelve exactamente los tres expedientes que el Product Owner denunció; la reintegración de cada uno se verifica cuando su fila de control de cambios aparece en `product-backlog`, `backlog-tecnico`, `especificacion-funcional` o `reglas-negocio` (y para 0004, si se declara `Reintegra: 03`, en `wireframes`). A destinos sin intake: la compuerta no puede anclarse al evento del intake (QA-05: cero filas en el acta del destino aun para 0001); mide el artefacto, y los tres parámetros de layout los declara el destino en un documento que la reanudación ya lee. Sin esa declaración la compuerta dice «no evaluable», nunca «verde».

## 4. Solicitudes de convocatoria

| # | Señal | Ubicación | Comisión que corresponde |
|---|---|---|---|
| SC-1 | El plan de la resolución de 0003 del destino no contiene **ninguna** tarea de documentación de 02/03/06 (26 identificadores `T*`, ninguno DOC); el de 0002 sí las tenía y no se ejecutaron. La compuerta detecta la ausencia a posteriori; que el plan **deba** llevar la tarea de reintegración es diseño de la norma (paso 10 del ciclo, `Knowledge-Mesa-De-Expertos-A-Pedido.md:81`; `Mesa-Rules.md` §6.7). | `docs/experdientes/0003-*/actuaciones/013-resolucion-*.md` §plan; `Expediente-Rules.md` §3 «resolución» (`:150–151`) | Diseño de la norma / Requisitos de la reintegración |
| SC-2 | El evento disparador vigente (`Rules-Backlog-Tecnico.md:162–169`) sólo existe para destinos con `PRODUCT-INTAKE` y la resolución de un expediente no es hoy un segundo disparador declarado. Si la mesa decide que lo sea, cambia dónde vive la regla (R3: un solo lugar). | `Rules-Backlog-Tecnico.md:162`; `Master-Prompt.md:1811–1858` (§13.1) | Diseño de la norma |
| SC-3 | La práctica del framework escribe el tipo de folio entre acentos graves y A4 no lo admite; A3 falla en 5 folios de `Expedientes/0002-*/`. No es de este caso, pero cualquier compuerta nueva que copie la forma de A1–A12 hereda un modelo que nadie ejecuta. | `Expediente-Rules.md:360`, `:366`; `Expedientes/0002-*/actuaciones/` | Consultor de documentación del framework (errata o cambio de práctica) |
