# Actuación 016 — Dictamen

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 016 |
| Tipo | `dictamen` |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa. **Redacta lo que el jurado aprobó en el folio 015, y no vota.** Lo que agrega por cuenta propia va marcado **[presidente]** |
| Base | `IA.SDD` `8c55a1e` (13.16). Rama `expedientes/0001-caso` |
| Citas | `002·R<n>` son las restricciones duras del folio 002. `013·R<n>`, las raíces de la consolidación. `R-NN`, los ataques de la refutación del folio 014. `J-NN`, los ítems del jurado. `E-n`, las escaladas. `D-n`, la deuda |

> **El dictamen no es norma.** Es el plan que la intervención `IA.SDD.Documentacion/PROMPTs/Fixs/09-Fix-Reporte-31/` tiene que aplicar, verificar y, si el uso lo desmiente, corregir. Se numera **como la siguiente a la vigente cuando se aplique**. Hoy la vigente en `main` es la 13.16, y la 13.17 está preparada en `conocimiento/mesa-de-expertos-a-pedido` (`cab03ed`), así que lo probable es la **13.18**.

---

## 1. El caso, en una línea

El Product Owner pidió que los casos se expedienten de forma sistemática y que la evidencia forme parte de la especificación (`ev-07`). **La mesa concluye** que la figura hace falta, porque ningún artefacto del método tiene la unidad «caso» que atraviesa corridas y repositorios (013·R8, R16). Tiene que ser **mínima**: dieciocho campos, sin datos derivados escritos a mano. Tiene que **reutilizar** lo que ya existe (git, `Audit/`, D9, §8.1, §12.2). Y la evidencia **funda** la especificación: no se convierte en especificación.

## 2. Respuestas a las preguntas del caso

| # | Pregunta | Respuesta | Fundamento |
|---|---|---|---|
| **Q1** | **Dónde vive** | **Destino:** `SDD/Expedientes/<NNNNN>-<Titulo>/`, hermana de `Docs/`. Queda fuera del alcance de M4 y de la compuerta de fase. **Framework:** `IA.SDD/Expedientes/` **en la raíz**, y no dentro de `SDD/` (default de la escalada E-1). **La raíz no evita la copia al snapshot por sí sola.** Lo que la evita es una **exclusión explícita en la guía §VI.5**, con el motivo de `CHANGELOG.md`: es acumulativo y no condiciona lo que el orquestador genera. La premisa «`SDD/` se copia entero, la raíz no» **era falsa**: `ev-02` muestra que se copian `Conocimiento/` y `Examples/`. `README.md` l.152 (autosuficiencia) se **reformula declarándolo**: un expediente del framework nombra otros repositorios. Ningún archivo ejecutable suelto: la evidencia lleva su comando dentro del archivo (§II.7). `IA.SDD.Documentacion/Expedientes/` **no se usa** salvo que el Product Owner elija la opción B de E-1 | 013·R2, R13; R-06; 015 Q1, J-01 (4-1) |
| **Q2** | **Cuándo se abre, y cuándo no** | **Condición observable al abrir**, no una lista de puntos. Se abre cuando **el caso atraviesa más de una corrida o más de un repositorio**, o **entra al árbol material externo**: testimonio, captura o archivo aportado. **No se abre** para una mesa que ya tiene registro en `Audit/`, una detención que se contesta en el lote, una autocorrección, un audit de fase, un ítem diferido en forma, ni lo que se resuelve con un comando. **La custodia del original de un testimonio no depende de que se abra un expediente**: rige donde se asiente | R-02; 015 Q2 (4-1) |
| **Q3** | **Forma mínima y forma completa** | **Mínima, 18 campos en un caso de dos folios** (014 §5): `README.md` con 5 campos (número, título, apertura, origen, base) y la remisión «índice: `actuaciones/`; estado y qué sigue: el pase del último folio»; `actuaciones/NNN-<tipo>-<slug>.md` con **4 campos de cabecera** (tipo, fecha, autor, corrige) y **1 de pase** («Sigue: acto · quién»); si el folio asienta palabras del Product Owner, **bloque literal byte a byte** más canal, fecha y hora con zona, y huella (3 campos); `evidencia/` opcional, con cada archivo abriendo con método o comando, base o fecha y hora, y quién (3 campos). **Completa**, además: la carta de cada despacho en `evidencia/` **antes** de despachar; una constancia que folia por `ruta@commit` los artefactos de `Audit/`; una resolución con veredicto por criterio; y, cuando hubo despacho, en el pase: insumos, qué se invalida si se corta, «comprobar si el despacho anterior terminó» y escaladas con su default | R-01; 015 Q3 (4-1), Q12 |
| **Q4** | **Numeración e identificador** | **Número local de cinco dígitos, correlativo por repositorio y nunca reciclado** (`Root-Rules.md` §9.2 ancho, §9.3 estabilidad), declarado **familia excluida con motivo** (§9.5). **No se acuña `EXP-`** y no se agrega un tercer ámbito a §9.1, **para no tocar D3**. Se cita desde afuera como `<repositorio> <carpeta>`, y el folio va en la prosa. **Colisión medida:** `EXP-` da 0 en `main` de los cuatro repositorios (`ev-03`), pero **4 archivos en la rama `migracion/a-13.16`** usan `EXP-0001`; `EV-` está vivo en `Lab-Geometria` y `RPI.VideoControl`, así que la evidencia **no usa `ev-` ni `EV-`** y se nombra `NNN-<slug>`. La intervención vuelve a medir con `Vocabulario-Rules.md` §9.4, **incluida esa rama** | R-09 opción A, R-10, R-05; 015 J-06, Q4 (4-1) |
| **Q5** | **Estados y ciclo de vida** | **Se derivan del tipo del último folio y nunca se escriben a mano.** Conjunto cerrado de **seis tipos con mapeo total**: `presentacion` → abierto, o reabierto si hay una resolución anterior; `providencia` o `informe` → en trámite (la refutación y el veredicto son `informe` con autor declarado); `constancia` → en trámite, o **suspendido** si lleva «Suspende hasta: artefacto §»; `resolucion` → resuelto; `archivo` → archivado, con «Motivo:» (aplicado y verificado, cerrado por decisión con lo abierto enumerado, o desistido). Reapertura sólo con ancla E1 o E2 | R-11; 015 Q5 (5-0); D-5 |
| **Q6** | **Inmutabilidad y foliatura** | **S1:** ninguna pieza de la carpeta —actuaciones, evidencia, renombres— se modifica, borra ni renombra **después del primer push**; se comprueba con `git log -M --diff-filter=MDR` sobre la carpeta **contra la rama principal ya fusionada**. **S3:** la rama que lleva un expediente **no se fusiona aplastando la historia**, o la foja se declara no observable. **Folio asignado al incorporar**, contiguo desde 001. **Toda corrección es un folio nuevo con «Corrige: NNN».** Antes del primer push la inmutabilidad se declara **no observable**. **Sin folio por commit y sin trailer obligatorio**: el framework no fija la convención de mensajes de commit (`Coherencia-Conformacion-Pull-Request-Manual.md` l.28) | R-04, R-14; 015 Q6 (5-0) |
| **Q7** | **Evidencia** | **Dos clases.** *Medición:* fijada a commit (`git show`, `git grep`, `git ls-tree` sobre un commit, nunca sobre el árbol de trabajo) y reproducible. *Observación:* estado vivo o captura; no se reproduce, **se preserva** con fecha, hora y zona. **Huella SHA-256 sólo para lo no versionado o lo que sale del repositorio.** Sobre lo versionado, git ya da integridad, y el índice no transcribe huellas (J-02). **Una corrida descartada se conserva.** **Testimonio del Product Owner: se clasifica por contenido.** La **aprobación** es `humano` de D9, con el original preservado. El **pedido** es fuente de intención, fuera de D9. La **afirmación de estado** es `C` hasta corroborarla. **No es E4 por sí mismo.** Pasa a E4 cuando se asienta como decisión cerrada o restricción del contrato de entrada. **S2:** antes del primer push, compuerta de credenciales, datos personales y rutas de host; lo que se redacta deja constancia con la huella del original y su custodia fuera del repositorio | R-03, R-07; 015 J-02, J-03, Q7 (5-0); E-2, E-3; 012 |
| **Q8** | **Cómo la evidencia pasa a formar parte de la especificación** | **La funda; no se vuelve especificación.** **Una sola vía declarada:** la **fila de control de cambios** del artefacto que cambia (ADR, intake, regla, ítem diferido) nombra `<repositorio> <carpeta del expediente>`, y el folio va en la prosa. **La dirección inversa se deriva** con `git grep` del nombre de la carpeta, sin tabla escrita a mano; sobrevive a un squash. **El ciclo de origen de §8.2 no se toca**: se calcula y no se declara. Todo patrón generalizado desde un caso declara **cuántos casos lo sostienen** | R-10; 013 Q8; V5-06; 015 J-05, Q8 (5-0) |
| **Q9** | **Relación con `SDD/Docs/Audit/` y con la serie de reportes** | **Conviven y nada se muda.** En un destino, el registro de mesa y los informes de migración, de estado y de audit **siguen en `Audit/`**, donde la norma los ubica; el expediente los folia **por enlace**, en una constancia con `ruta@commit`. En el framework, que no tiene `Audit/`, **el expediente es el registro** (declararlo en `Mesa-Rules.md` §8 criterio 1). La **serie de reportes** es el pase del caso a la intervención: el reporte cita el expediente, y el expediente folia el reporte por nombre | 015 J-04, Q9 (5-0); R-14 |
| **Q10** | **Tratamiento retroactivo** | **No se reescribe nada.** Los 113 archivos de `Lab-Geometria/SDD/Docs/Audit/`, los 51 de `RPI.VideoControl`, los `OUTPUTs/` de las intervenciones y el precedente `Mesa-2026-09-12-Colision-Lexica/` quedan como están. **Los dos adelantos** —este `0001` y el `EXP-0001` de la migración— se declaran **forma histórica**, como V3-05 hizo con el precedente, y no se alinean renombrando. Un caso **vivo** que cumpla Q2 abre un expediente nuevo con una constancia de **incorporación de antecedentes** por `ruta@commit`, que declara que antes no tuvieron custodia | R-05; 015 Q10 (4-1); D-1 |
| **Q11** | **«Ante un problema, mesa y no detención»** | **Un paso con su fundamento en `Master-Prompt.md` §8.1**, acotado a **las dos familias que preguntan**: ambigüedad (§9) y arbitraje (§7.0). **Quedan fuera, por nombre, la confirmación de plan y el traspaso T4.** Ninguna detención de esas dos familias sale sin este orden: (1) origen del hecho; (2) de la corrida → autocorrección, ajeno → pregunta previa; (3) lo que sobrevive y cumple `Mesa-Rules.md` §0.0 → **una mesa por lote de fase**, no una por problema; (4) lo que sale de la mesa → lote de §7.0 con `SI NO RESPONDÉS`; (5) sólo salen en el momento los bloqueantes de §7.0 y los disparadores 2 y 3. **Cableado** en `Master-Prompt-Migracion.md` M4 (l.291) y **modificación declarada** de l.46 («no la reconvoca dos veces»), y en la reanudación | R-08; N3-05; 015 Q11 (5-0) |
| **Q12** | **Punto de continuación** | **Vive en el pase del último folio.** El `README.md` remite a él sin copiar ni el commit ni el estado, porque un commit no puede contener su propio hash. Forma mínima: «Sigue: acto · quién». Forma completa: lo de Q3. **`Master-Prompt-Reanudacion.md` R0 paso 4 lee los expedientes abiertos** como pendientes declarados | R-01; N1-02; 015 Q12 (5-0) |

## 3. Criterios de aceptación de la forma mínima

Salen de N2 (folio 010) adaptados a la forma aprobada. Cada comando entra en el texto normativo que lo funda (§II.7). `$X` es la carpeta de un expediente.

| # | Criterio | Clase | Comando |
|---|---|---|---|
| A1 | Carpeta de cinco dígitos, sin números repetidos | `[enumerable]` | `ls SDD/Expedientes \| grep -vcE '^[0-9]{5}-'` → `0` · `ls SDD/Expedientes \| cut -c1-5 \| uniq -d` → vacío |
| A2 | El README tiene los 5 campos de la carátula | `[enumerable]` | `for c in Número Título Apertura Origen Base; do grep -q "^\| $c \|" $X/README.md \|\| echo FALTA $c; done` → vacío |
| A3 | Foliatura contigua desde 001 | `[enumerable]` | `i=1; for f in $(ls $X/actuaciones \| sort); do [ $((10#${f%%-*})) -eq $i ] \|\| echo SALTO $f; i=$((i+1)); done` → vacío |
| A4 | Cabecera de 4 campos y tipo del conjunto cerrado | `[enumerable]` | `grep -h '^\| Tipo \|' $X/actuaciones/* \| grep -vcE 'presentacion\|providencia\|informe\|constancia\|resolucion\|archivo'` → `0`, y cada folio tiene Fecha, Autor y Corrige |
| A5 | Todo «Corrige: NNN» nombra un folio existente | `[enumerable]` | `grep -ho '^\| Corrige \| [0-9]\{3\}' $X/actuaciones/* \| awk '{print $4}' \| while read n; do ls $X/actuaciones/$n-* >/dev/null \|\| echo $n; done` → vacío |
| A6 | El último folio lleva pase, salvo que sea `archivo` | `[enumerable]` | `f=$(ls $X/actuaciones \| sort \| tail -1); grep -q '^Sigue:' $X/actuaciones/$f \|\| grep -q '\| Tipo \| archivo' $X/actuaciones/$f` |
| A7 | S1: nada se modificó después del primer push | `[enumerable]` | `git log -M --diff-filter=MDR --format=%h <commit-publicado>..main -- $X` → vacío |
| A8 | Todo testimonio asentado verifica su huella | `[enumerable]` | Extraer el bloque literal y correr `sha256sum` → igual al campo Huella |
| A9 | Cada evidencia abre con método, base y quién | `[enumerable]` | `for f in $X/evidencia/*; do head -3 $f \| grep -qiE 'método\|comando' \|\| echo $f; done` → vacío |
| A10 | Toda fila de control de cambios que nombra un expediente resuelve | `[enumerable]` | `git grep -ohE 'Expedientes/[0-9]{5}-[A-Za-z0-9-]+' -- SDD \| sort -u \| while read d; do [ -d "SDD/$d" ] \|\| echo $d; done` → vacío |
| I1 | El umbral de Q2 se aplicó bien | `[interpretativo]` | — |
| I2 | El pase es veraz | `[interpretativo]` | — |
| I3 | El testimonio se clasificó por contenido | `[interpretativo]` | — |
| I4 | La evidencia es pertinente a la afirmación que la cita | `[interpretativo]` | — |

## 4. Deuda declarada

Viene de 015 §6: **D-1 a D-6**, sin cambios. **Se agrega D-7 [presidente]:**

| Id | Qué falta | Por qué no hoy | Quién lo cierra | Evento de cierre |
|---|---|---|---|---|
| **D-7** (013·R15, V1-05) | Decidir la **disposición** de los expedientes. Propuesta: conservación permanente, con excepción declarada a la guía l.145 («cuando su contenido queda íntegramente absorbido … se elimina») | Ningún ataque lo sometió y el jurado no lo votó (015 §6, al pie) | Presidente de mesa de la intervención `09` | Tabla de veredictos del registro de mesa de la intervención `09` |

## 5. Lote al Product Owner

Son las tres escaladas de 015 §5 (**E-1**, **E-2** y **E-3**), con el formato de `Master-Prompt.md` §8.1 y su `SI NO RESPONDÉS`. **No se transcriben de nuevo**: la fuente es el folio 015 §5. Ninguna bloquea el ciclo.

## 6. Homogeneidad (`Mesa-Rules.md` §6.4)

- El jurado midió **81,0 %** de ítems 5-0 sobre la base de hallazgos y declaró el ciclo **sospechoso de homogeneidad**.
- La salvaguarda manda que el refutador revise los `NO_PROCEDE`. **No hubo ningún `NO_PROCEDE`** (015 §8), de modo que la revisión no tiene objeto y **no se reconvocó**. Se declara acá, como pide 015 §8.
- **[presidente]:** la homogeneidad es la esperable de un jurado de un solo agente que votó contra un refutador que ya había hecho el trabajo de disentir. El control real de este ciclo fue **la réplica** (`ev-06`), que encontró de forma independiente el único P0 (013·R3). La intervención `09` convoca un jurado de **cinco agentes distintos**.

## 7. Cierre de mesa (`Mesa-Rules.md` §6.7)

```text
CIERRE DE MESA — IA.SDD (repositorio del framework), expediente 0001, 2026-09-13

  PANEL
    Convocados:     N1, N2, N3, V1–V5 (primera convocatoria: folios 004–011; réplica: ev-06), Refutador (014)
                    Procedentes: 14/14 ataques del refutador (015 §2); las 18 raíces de 013 entran al plan
    Descartados:    Cumplimiento (AG-00010), Operación y entrega (AG-00090): sin señal (002 §3.3)
    Ad hoc:         V1–V5, con carta asentada en ev-08; aportes en 013 A.1
    Postergados:    Seguridad (AG-00050), Trazabilidad documental (AG-00110), Formal — por cupo (§5.5) → D-2, D-6, D-5
    Aporte nulo:    ninguno

  HALLAZGOS
    Detectados: 64 (primera convocatoria, 8×8) + 64 (réplica) + 14 (refutación)
                Consolidados en 18 raíces (013 A.1) y 7 ítems J
    Procedentes: 14 ataques + 7 lecturas J elegidas (015)
    Con parche: 0 con texto exacto — lo aprobado es forma por pregunta (§2); el texto lo escribe la intervención 09
    Descartados por C: 0

  COMPUERTA (§10.0)
    Resultado:      no aplica en el framework (002 §1); en su lugar ev-01..ev-08
    No mirado:      pruebas en clon de R-04, sin re-correr por el jurado; ev-01 no reproducible (observación)

  ENTREGA AL ORQUESTADOR
    Parches:            0 con texto exacto; capas en §8
    Deuda declarada:    7 (D-1..D-7), con su evento de cierre
    Capas a revalidar:  las de §8
    Escaladas:          3, agrupadas (E-1 disp. 1, E-2 disp. 5, E-3 disp. 7), ninguna bloqueante

  CIERRE
    Contador: este ciclo de mesa, ronda 1.
    Por decisión, y no por criterio §10.1 (hay hallazgos interpretativos procedentes en la única ronda).
    Queda abierto: E-1, E-2, E-3; D-1..D-7; S2 sobre este expediente antes de cualquier push (E-2).
```

## 8. Capas que la intervención tiene que tocar, y severidad

**Minor**, salvo que E-3 se conteste con la opción A, en cuyo caso es **major** con su bloque de impacto (015 §7).

- **Regla transversal nueva** por la guía §III.8. La colisión de su nombre se mide antes de escribirla.
- `Master-Prompt.md`: §3.5 (layout), §8.1 (Q11) y §12.1 T1 (S3).
- `Master-Prompt-Migracion.md`: M4 y l.46.
- `Master-Prompt-Reanudacion.md`: §2 (R0 paso 4) y §5.
- `Mesa-Rules.md`: §0.0, §2.1 y §8 criterio 1.
- `Migracion-Rules.md` §2.2.
- `Root-Rules.md` §9.2 y §9.5: exclusión del número de expediente y del folio.
- `SDD-Development-Guide.md` §VI.5: exclusión del snapshot. La guía l.145 queda sujeta a D-7.
- `README.md` l.152: reformulación declarada, sujeta a E-1.
- La compuerta de ofuscación de `Rules-Base-Conocimiento.md`, extendida a la evidencia de expediente (S2), sujeta a D-2.
- `SDD-User-Guide.md`.
- `Deriva-Rules.md` §1, sólo si E-3 = A.
- **`Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` (13.17): §2.3, §3.2, §5.2, §5.3 y §6** (D-3).

**No se toca:** `Master-Prompt.md` §8.2 ni `Root-Rules.md` §12, el ciclo de origen (R-10).

## 9. Resolución

**No hay resolución en este expediente.** El órgano que resuelve es la intervención `09`: aplica la norma, convoca la mesa de su propio ciclo con Seguridad, Formal y Trazabilidad, y cierra D-2, D-5, D-6 y D-7. **Hasta que la aplique, la forma de este expediente sigue siendo provisoria.** Cuando la aplique, este expediente queda como **forma histórica** (Q10).

Sigue: constancia de corrección del índice (folio 017) · presidente de mesa
