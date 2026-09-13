# Actuación 010 — Informe de la Comisión N2 — Verificación

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 010 |
| Tipo | `informe` |
| Fecha | 2026-09-13 |
| Autor | Comisión N2 — Verificación, primera convocatoria (actuación 002 §3), a ciegas |
| Despacho y entrega | Despachada 2026-09-13T12:16:43-03:00; informe final 2026-09-13T12:23:04-03:00 |
| Asentada por | Presidente de mesa, **por extracción mecánica** del último mensaje del subagente en su transcripción, sin edición. SHA-256 del cuerpo (desde la línea siguiente a la regla horizontal): `b71cb697dde181f6fc5ef6a46bc28b65de8c057531f10e8c8e82b87100f354b0` |

---

# Informe — Comisión N2, Verificación

## 1. Cabecera

| Campo | Valor |
|---|---|
| Comisión | N2 — Verificación (núcleo permanente, `Mesa-Rules.md` §5.1) |
| Fecha | 2026-09-13 |
| Expediente | `0001` — Expedientes como comportamiento del framework |
| Base leída | `IA.SDD-exp1`, rama `expedientes/0001-caso`, commit `e8c84d9` (2026-09-13T12:17:33-03:00), apoyado sobre `main` `8c55a1e` (13.16). El expediente completo: `README.md`, `actuaciones/001`, `actuaciones/002`, `evidencia/` con sus diez archivos y `SHA256SUMS`. Norma: `Mesa-Rules.md` §0.0, §5.4, §6.1 y §8; `Master-Prompt.md` §10.0 y §10.1; `SDD-Development-Guide.md` §II.7, Parte IV y §VI.3; `Catalogo-De-Criterios.md` §3 y §4; `Deriva-Rules.md` §1; `Root-Rules.md` §9.1, §9.2, §10 y §13. Destinos, sólo lectura: `Lab-Geometria` por `git grep main`, `RPI.VideoControl` por `git grep HEAD` |
| Cómo trabajé | A ciegas. Los guiones corrieron contra el expediente real. Las pruebas que tenían que ver fallar algo corrieron en una copia bajo `scratchpad/n2/repo`. No escribí ningún archivo en ningún repositorio |
| Constancia de tiempo | Cuando empecé, el expediente **no estaba versionado**: `git ls-files --error-unmatch README.md` devolvió «no concordó con ningún archivo conocido por git», y `git status` mostraba `?? ../`. Mientras yo trabajaba se commiteó `e8c84d9`. Las comprobaciones de git de este informe corren sobre ese commit |

---

## 2. Hallazgos

### N2-01 — P1 — E1: dos de los cinco hashes abreviados del README no coinciden con `SHA256SUMS`

**Ancla.** `README.md` l.40 declara `dcf82b62…2fdd3` y l.43 declara `29417eca…4d34042`. Comando:

```bash
grep -E '^\| `ev-' README.md | sed -E 's/^\| `(ev-[0-9]+)`.*\(evidencia\/([^)]+\.out)\).*`([0-9a-f]+)…([0-9a-f]+)` \|$/\2 \3 \4/' \
 | while read f h t; do full=$(awk -v f="$f" '$2==f{print $1}' evidencia/SHA256SUMS); \
   [[ $full == $h* && $full == *$t ]] && echo "ok $f" || echo "FALLA $f: declarado $h…$t, real ${full:0:8}…${full: -${#t}}"; done
```

```
ok ev-01-base.out
FALLA ev-02-snapshot.out: declarado dcf82b62…2fdd3, real dcf82b62…a2b7a
ok ev-03-colision.out
ok ev-04-inventario.out
FALLA ev-05-citas.out: declarado 29417eca…4d34042, real 29417eca…1d34042
```

Los dos errores ya están en el commit: `git show e8c84d9:<E>/README.md | sed -n '40p;43p'` devuelve `dcf82b62…2fdd3` y `29417eca…4d34042`.

**Dos defectos más en la misma columna:**
- **El largo de la cola varía sin regla**: 4, 5, 5, 3 y 7 caracteres.
- **La abreviatura no se puede verificar con la herramienta que el propio README nombra.** `sha256sum -c` (l.34) no acepta un hash truncado.

Dos observaciones que no fundan nada:
- La cola falsa de ev-02 (`2fdd3`) comparte cuatro caracteres con la cola real de ev-03 (`5fdd3`). Sugiere que se transcribió a mano, pero es **conjetura, nivel `C`**.
- `SHA256SUMS` sí verifica: `sha256sum -c --quiet SHA256SUMS` sale sin error, y el recálculo sobre los blobs de `e8c84d9` da `ok` en los diez archivos.

**Impacto.**
- La columna copia a mano un dato de `SHA256SUMS`, que es el defecto que `Root-Rules.md` §10 l.553 y siguientes describe para los datos derivados.
- Se lee igual de firme que si fuera cierta. Una integridad que se afirma y no verifica es lo que `Deriva-Rules.md` l.57 llama «simula verificación».
- 002 l.105 declara que se «re-hasheó antes de citar». El re-hash se hizo; la copia al README quedó mal.

**Dirección de la corrección.**
- El índice **no transcribe hashes**: `SHA256SUMS` es la única fuente.
- Si se decide conservarlos, van **completos**, y el criterio C9 de §3 corre como compuerta.
- Nunca se abrevian a ojo.

### N2-02 — P1 — E1: `ev-01` no se reproduce, y ev-03 y ev-05 dependen de un working tree en lugar del commit declarado

**Ancla.**
- `Deriva-Rules.md` l.43 exige que la evidencia sea reproducible: «obtiene lo mismo».
- `README.md` l.34 afirma que «cada salida se obtuvo corriendo su guion […] contra la base de la actuación 002».

Volví a correr los cinco guiones a las 12:17 y comparé con `cmp` contra los `.out` asentados:

```
ev-02-snapshot: reproduce idéntico
ev-03-colision: reproduce idéntico
ev-04-inventario: reproduce idéntico
ev-05-citas: reproduce idéntico
ev-01-base: DIFIERE
1c1
< 2026-09-13T12:11:29-03:00
---
> 2026-09-13T12:17:33-03:00
4,5c4,6
…
> /home/fernando/workspaces/workspace-dev/IA/SDD/IA.SDD-kmesa  8c55a1e [conocimiento/mesa-de-expertos-a-pedido]
17a19
> /home/fernando/workspaces/workspace-dev/PROG2/Geometria/Lab-Geometria-mig1316/SDD/Expedientes  entradas=1
```

**Qué no está fijado a la base:**
- `ev-01` mide el estado del workspace (`date`, `worktree list`, `find`). Ese estado cambia en minutos.
- `ev-03` hace `grep -r $W/IA/SDD/IA.SDD`.
- `ev-05` hace `cd …/IA.SDD` y lee con `grep`.

Ambos leen el **working tree** de `main`, no `8c55a1e`. Hoy reproducen porque `main` sigue en ese commit. El día que avance, dejan de reproducir, aunque el guion diga «IA.SDD main 8c55a1e» (ev-05 l.2).

**Impacto.**
- La propiedad «reproducible» queda sin distinguir de «contemporánea» (l.44).
- ev-01 cumple la segunda y no la primera, y el índice no lo dice.
- Una evidencia cuyo comando no reproduce es `P0` según `Deriva-Rules.md` l.57. La bajo a `P1` porque ev-01 sólo sostiene la base, y la base se puede volver a obtener por `git rev-parse` de los cuatro commits nombrados en 002 l.10.

**Dirección de la corrección.**
- Toda evidencia de corpus se toma **sobre objetos inmutables**: `git grep <sha>`, `git ls-tree <sha>`, `git show <sha>:<ruta>`.
- La evidencia de estado del ambiente se marca en el índice como **no reproducible, contemporánea**, con su fecha.
- Así el criterio «reproduce idéntico» se aplica sólo a la primera clase y es enumerable.

### N2-03 — P1 — E1: «foliadas y nunca reescritas» sólo se puede verificar desde el commit de alta, y 0001 dio de alta los dos folios en el mismo commit, en una rama sin publicar

**Ancla.** `README.md` l.25 dice «Foliadas y nunca reescritas». La carátula dice «Sin push ni PR». Comandos sobre el repositorio real:

```
## append-only (MDR sobre actuaciones)
(fin)                                   ← vacío: nada modificado después del alta
## altas por folio
e8c84d9 2026-09-13T12:17:33-03:00
…/actuaciones/001-presentacion-del-product-owner.md
…/actuaciones/002-providencia-convocatoria-de-mesa.md
## rama / remoto
* expedientes/0001-caso  e8c84d9 …      ← sin upstream
```

`stat` muestra 001 escrito a las 12:12:09, 002 a las 12:13:16 y el README a las 12:13:57. El commit es de las 12:17:33.

En la copia de prueba el criterio sí discrimina: reescribí 001 y commiteé, y `git log --diff-filter=MDR` devolvió `commit cff835b …/001-presentacion-del-product-owner.md`.

**Impacto.** El criterio mecánico existe y funciona, pero en 0001 no dice nada:
- **Antes del commit** no hay registro. Lo que pasó entre 12:12 y 12:17 queda fuera de toda verificación.
- **Con un solo commit para 001 y 002**, git no puede atestiguar que 001 existió antes que 002, ni que 002 no reescribió 001.
- **En una rama local sin publicar**, `git commit --amend` o un rebase borran la evidencia y el criterio vuelve a dar vacío.

**Dirección de la corrección.**
- **Un commit de alta por actuación**: el único archivo con estado `A` bajo `actuaciones/` en ese commit es ese folio.
- El criterio de inmutabilidad se evalúa **contra una referencia publicada** (rama remota o fusión).
- Mientras la rama es local, el expediente declara que la inmutabilidad es declarativa y todavía no observable.

### N2-04 — P2 — E1: `sha256` sobre archivos versionados no detecta nada que git no detecte

**Ancla.** Prueba en la copia: modifiqué `ev-01-base.out`, recalculé su línea en `SHA256SUMS` y commiteé los dos juntos.

```
sha256sum -c: pasa (no detecta)
commit d851051
…/evidencia/SHA256SUMS
…/evidencia/ev-01-base.out
```

`git log --diff-filter=M` sí lo muestra.

**Qué no cubre `SHA256SUMS`:**
- No está hasheado en ningún lado.
- No cubre `README.md` ni `actuaciones/`.
- No hay firma.

**Qué sí agrega, y es poco:**
- **Integridad fuera de git**: una copia suelta del directorio, o un snapshot que `README.md` l.40 del framework dice que sirve para reconstruir «sin recurrir al control de versiones».
- **SHA-256 frente a SHA-1**: `git rev-parse --show-object-format` devuelve `sha1`.
- **Lo que no se puede versionar**. Evidencia del Product Owner con credenciales o datos personales, que 002 l.73 señala para un repositorio público: el hash es el único vínculo entre el expediente y un archivo que se queda afuera.

**Impacto.** Si la forma mínima exige `SHA256SUMS`, suma un paso y no suma verificación. El criterio «que se llene en minutos» paga ese costo sin recibir nada a cambio.

**Dirección de la corrección.**
- Sacar el hash de la forma mínima.
- Exigirlo **sólo** para evidencia no versionada o que sale del repositorio, con un criterio que nombre los dos lados: el hash en el expediente y el archivo en su custodia.
- Para la evidencia versionada, el criterio es el de git (N2-03).

### N2-05 — P2 — E1: los identificadores de 0001 colisionan con familias vivas y no declaran ámbito ni ancho

**Anclas.**
- `Deriva-Rules.md` l.50 define la cita D9 como `EV-XXXXX`.
- `Root-Rules.md` l.430 exige «cinco dígitos uniformes».
- `Root-Rules.md` §9.1 l.389 exige que «todo identificador declara en qué ámbito es único».

Mediciones:

```
== EV-NN exacto (dos dígitos) en Lab-Geometria main, por archivo
main:SDD/Docs/Audit/B2-Maqueta-GeometriaFactory-Web-r1.md:2
main:SDD/Docs/Audit/F26-Propagacion-r2.md:2
main:SDD/Docs/Unidades-Entrega/GeometriaFactory-Web/03-UX-UI-DX/Contrato-Datos-Maqueta.md:6
main:SDD/Docs/Unidades-Entrega/GeometriaFactory-Web/03-UX-UI-DX/Linea-Base-Visual.md:5
…(9 archivos)
== EV- en RPI.VideoControl HEAD
582
== ev-<n> minúscula en framework sin _legacy ni Expedientes
0
== nombres de expediente en otros worktrees
0001-Migracion-Normativa-A-13.16                     (Lab-Geometria-mig1316/SDD/Expedientes)
0001-Expedientes-Como-Comportamiento-Del-Framework   (IA.SDD-exp1/Expedientes)
```

**Impacto.**
- **`ev-01` del expediente y `EV-01` de la línea de base** de `Lab-Geometria` difieren sólo en mayúsculas. Los dos viven en el destino al que la presentación manda los expedientes (001 §1.2), y cualquier `grep -i` los mezcla.
- **`0001` ya existe en dos repositorios.** «Expediente 0001» no identifica nada si no se declara el ámbito.
- **Tres anchos distintos en una sola forma**: 4 dígitos el expediente, 3 el folio, 2 la evidencia. Ninguno es el de §9.2, y no hay apartamiento declarado.

**Dirección de la corrección.**
- Prefijo propio **medido sin colisión** con el comando de ev-03, extendido a `-i` y a `EV-`.
- Ámbito declarado: el repositorio.
- Ancho decidido explícitamente: o §9.2, o apartamiento con motivo.

La elección del prefijo no es de mi competencia; ver §6.

### N2-06 — P2 — E1: la carta que se despachó no está en el expediente, así que el re-despacho que promete el punto de continuación no se puede reproducir

**Anclas.**
- 002 l.83: «Cada comisión recibe: la actuación 001, esta providencia, las rutas de la base, y su carta.»
- `README.md` l.54: «Se vuelven a despachar con la carta de 002 §3».
- `Mesa-Rules.md` l.330 exige que la carta de mandato declare «la única pregunta que responde».

002 §3.1 le da a Verificación **una sola pregunta de dos oraciones**. La carta que recibió esta comisión trae además Q3 a Q12, el «encargo: refutar», el «criterio decisivo», los destinos y la forma del informe:

```
grep -rnE '\bQ[0-9]+\b' Expedientes/ | wc -l
0
```

**Impacto.**
- Un segundo despacho «con la carta de 002 §3» sería **otra carta**, y sus informes no serían comparables con los de este.
- El criterio `[enumerable]` de `Mesa-Rules.md` §8, «todo agente ad hoc tiene carta de mandato», no se puede evaluar **desde el expediente** para V1 a V5: sólo hay una fila de tabla.

**Dirección de la corrección.**
- La carta despachada se asienta **verbatim y antes del despacho**, como folio o como evidencia.
- Criterio: todo folio `informe` nombra el folio o la evidencia de su carta, y esa referencia resuelve.

### N2-07 — P2 — E2: el estado y el punto de continuación afirman un acto que ningún folio registra

**Ancla.**
- `README.md` l.14: «Estado | En trámite — mesa convocada, panel despachado».
- `README.md` l.47: «ocho comisiones despachadas a ciegas y en paralelo».

002 es la **convocatoria**: su §4 describe cómo trabaja el panel, no que se lo haya despachado. No hay folio del despacho. Dos cosas más:
- Las dos afirmaciones entraron en `e8c84d9`, el mismo commit que 002.
- `Master-Prompt-Reanudacion.md` es el único lugar de la norma que define «Punto de continuación» (`grep -rnF 'Punto de continuación' … | wc -l` → 1).

**Impacto.** El estado es una fuente declarativa sin contraste, que es lo que la Parte IV de la guía, l.596, manda evitar: «¿Podés obtener el mismo dato de un subproducto del acto…?». Un lector sin contexto no puede saber si el despacho ocurrió.

**Dirección de la corrección.**
- El estado se **deriva del tipo del último folio**, desde un conjunto cerrado de tipos.
- El punto de continuación **nombra el último folio**. Eso es enumerable (C11).
- Lo que no tenga folio no se afirma en la carátula.

### N2-08 — P3 — E1: una cita apunta a evidencia que no contiene lo citado

**Ancla.** 002 l.16 dice «(l.23 y l.29-32, `evidencia/ev-05-citas.out`)».

```
grep -cE '^(29|3[0-2]):' evidencia/ev-05-citas.out
0
```

`ev-05` sólo recoge l.23. El texto de l.29-32 existe en `Mesa-Rules.md` (lo leí: «Los puntos de invocación … se convoca igual»), pero la evidencia nombrada no lo sostiene.

**Impacto.** Menor: la cita es cierta. Pero muestra que el vínculo entre la afirmación y la evidencia **no se verifica en el sentido afirmación→evidencia**.

**Dirección de la corrección.** Criterio C13 de §3: toda cita `l.N` que nombra un `.out` tiene que aparecer como `^N:` en ese `.out`.

---

## 3. Criterios de aceptación propuestos para la forma mínima

**Cómo corren.** Todos los comandos corren desde el directorio del expediente, `$E`. Cada uno es una línea publicable en la prosa que lo funda (`SDD-Development-Guide.md` l.298): no es código distribuido.

**Qué es forma mínima:**
- **Mínima**: C1 a C5, C11 y C12.
- **Si hay evidencia**: C6 a C10 y C13.
- **Si hay evidencia no versionada**: C6 y C7.

### Criterios `[enumerable]`

| # | Criterio | Comando (resumido) | Salida sobre 0001 |
|---|---|---|---|
| C1 | Existen `README.md`, `actuaciones/` y, si hay evidencia, `evidencia/` | `for p in README.md actuaciones evidencia; do [ -e $p ] \|\| echo FALTA $p; done` | los tres `ok` |
| C2 | La carátula tiene sus campos: Número, Título, Estado, Apertura, Partes, Objeto, Origen, Versión del framework | `grep -qE "^\| $c \|"` por cada campo | los diez `ok` (incluye repositorio y sección de continuación) |
| C3 | Foliatura contigua desde 001, sin saltos ni repetidos | `i=1; for f in $(ls actuaciones\|sort); do [ $((10#${f%%-*})) -eq $i ] \|\| echo SALTO $f; i=$((i+1)); done` | `ok 001`, `ok 002` |
| C4 | El índice enumera **todas** las actuaciones del directorio **y nada más**, y el folio de la fila coincide con el del enlace | `diff <(grep -oE '\]\(actuaciones/[^)]+\)' README.md\|sed …\|sort) <(ls actuaciones\|sort)` | `ok índice = directorio`; `ok 001 001`, `ok 002 002` |
| C5 | Cada actuación declara Expediente, Folio (igual al prefijo del archivo), Tipo, Fecha y Autor | `grep -qE "^\| Folio \| $fo \|" $f` y los demás campos | todos `ok` |
| C6 | Los hashes verifican | `(cd evidencia && sha256sum -c --quiet SHA256SUMS)` | `ok` |
| C7 | `SHA256SUMS` cubre todo `evidencia/` y nada más | `diff <(awk '{print $2}' evidencia/SHA256SUMS\|sort) <(ls evidencia\|grep -vx SHA256SUMS\|sort)` | `ok cubre todo y nada más` |
| C8 | El índice de evidencia enlaza cada archivo de `evidencia/` y nada más | `diff` de enlaces `](evidencia/…)` contra `ls` | `ok` |
| C9 | Todo hash transcripto en el README es idéntico al de `SHA256SUMS` (**mejor aún: que no se transcriba**) | el de N2-01 | **FALLA** ev-02 y ev-05 |
| C10 | Todo **enlace markdown** a `evidencia/` resuelve | `grep -ohE '\]\(evidencia/[^)]+\)' … \| while read p; do [ -e "$p" ] …` | `ok` × 11. **Nota**: la versión sin restringir a enlaces dio un falso positivo, `NO RESUELVE evidencia/2026-09-02-mesa-ux`, que es la carpeta de `Lab-Geometria` citada en 002 l.109. Por eso el criterio va **sólo sobre enlaces** |
| C11 | El punto de continuación nombra el último folio | `last=$(ls actuaciones\|sort\|tail -1\|cut -c1-3); sed -n '/^## Punto de continuación/,$p' README.md \| grep -q "$last"` | `ok nombra 002` |
| C12 | Append-only: ninguna actuación modificada, borrada ni renombrada después de su alta, **evaluado contra una referencia publicada** | `git log --diff-filter=MDR --name-only --format=%h <ref> -- actuaciones/` → vacío | vacío, pero **no dice nada** (N2-03). En la copia, con 001 reescrito, lista `cff835b` |
| C12b | Una alta por commit | `git log --diff-filter=A --name-only --format=%h -- actuaciones/` → un folio por commit | **FALLA**: `e8c84d9` da de alta 001 y 002 |
| C12c | El README se tocó en o después del alta del último folio | `[ $(git log -1 --format=%ct -- README.md) -ge $(git log -1 --format=%ct --diff-filter=A -- actuaciones/) ]` | `ok` (mismo commit) |
| C13 | Toda cita `l.N` que nombra un `.out` aparece como `^N:` en él | `grep -cE '^N:' <out>` | **FALLA** 002 l.16 → `0` (N2-08) |
| C14 | La evidencia marcada reproducible reproduce | `bash ev-NN.sh \| cmp - ev-NN.out` | ev-02 a ev-05 `idéntico`; **ev-01 DIFIERE** (N2-02) |
| C15 | Todo folio `informe` nombra una carta asentada que resuelve | `grep` del folio o evidencia de la carta en cada `informe` | no evaluable: no hay informes ni cartas (N2-06) |

### Criterios `[interpretativo]`

Siguen la política de «ante la duda se marca interpretativo» de la guía, l.533.

| # | Criterio |
|---|---|
| I1 | La presentación está transcripta **literal**. El original no está en el repositorio; a lo sumo se contrasta contra un registro `humano` con fecha |
| I2 | La interpretación del orquestador está separada y rotulada como tal (001 §2 y §3 lo hacen) |
| I3 | El punto de continuación es **veraz** sobre el estado del caso, no sólo presente (N2-07) |
| I4 | Cada evidencia es **pertinente** a la afirmación que la cita: dice lo que el que cita afirma |
| I5 | La evidencia es **independiente de quien afirma** (`Deriva-Rules.md` l.45). Los cinco guiones de 0001 los escribió y corrió el mismo orquestador que redacta 002 |
| I6 | El objeto de la carátula delimita el caso |
| I7 | Una actuación nueva que «corrige» un folio corrige de verdad lo que nombra |

**Tiempo de llenado.** C1 a C5, C11 y C12 piden una carátula de ocho campos, una tabla y un archivo por actuación con una cabecera de cinco campos. Eso se llena en minutos. Lo que no cabe en minutos es el hash transcripto (C9) y la reproducibilidad de la evidencia de ambiente (C14); por eso los saco de la forma mínima.

---

## 4. Respuestas

**Q3 — Forma mínima y completa.**
- **Mínima**: `README.md` con carátula, índice de actuaciones y punto de continuación, más `actuaciones/NNN-<tipo>-*.md` con cabecera. Se verifica con C1 a C5, C11 y C12.
- **Completa**: suma `evidencia/` (C8, C10, C13 y C14). El manifiesto de hashes entra sólo si hay evidencia no versionada (C6 y C7).
- Todo lo que sostiene la forma mínima es enumerable. Lo interpretativo (I1 a I7) es de contenido, no de forma.

**Q4 — Numeración e identificador.** Colisión medida en N2-05:
- `EV-NN` en 9 archivos de `Lab-Geometria` y 582 ocurrencias de `EV-` en `RPI.VideoControl`.
- `0001` repetido en dos repositorios.
- Tres anchos distintos, fuera de `Root-Rules.md` §9.2.

Lo que se puede verificar:
- La contigüidad (C3).
- La unicidad dentro del repositorio: `ls Expedientes | cut -c1-4 | uniq -d` vacío.

No se puede verificar la unicidad entre repositorios si no se declara el ámbito.

**Q5 — Estados.**
- **Verificable**: que el estado declarado sea **función del tipo del último folio**. Es enumerable si los tipos forman un conjunto cerrado y la tabla tipo→estado está escrita en la norma.
- **Enumerable también**: que un estado terminal («cerrado») tenga como último folio un `dictamen` o equivalente, y que no haya folios posteriores.
- **Interpretativo**: que el estado describa lo que realmente pasó. En 0001, «panel despachado» no tiene folio (N2-07).

**Q6 — Inmutabilidad y foliatura.**
- **Foliatura**: C3 y C4, con `ls` y `diff`, sin git.
- **Inmutabilidad**: sólo git (C12 y C12b), y con tres condiciones:
  - un commit de alta por folio;
  - evaluación sobre una referencia publicada o protegida;
  - que el período anterior al primer commit se declare no observable.

  0001 no cumple las dos primeras (N2-03).
- **No verificable nunca**: que el texto commiteado sea el que se escribió primero. El intervalo entre 12:12 y 12:17 no deja rastro.

**Q7 — Integridad por hash.** Sobre archivos versionados no agrega nada que el commit no dé: la prueba de N2-04 pasa `sha256sum -c` y git lo detecta. Agrega en tres casos: la copia fuera de git, la evidencia que no se versiona y la resistencia frente a SHA-1. **La transcripción abreviada en el README resta**: introdujo dos datos falsos (N2-01).

**Q8 — Vínculo evidencia↔especificación en los dos sentidos.**
- **Evidencia→afirmación**: C8 y C10 garantizan que toda evidencia está indexada y todo enlace resuelve.
- **Afirmación→evidencia**: C13, la línea citada existe en el `.out` citado. En 0001 falla una vez (N2-08).
- **Interpretativo**: que la evidencia sostenga la afirmación (I4).
- Hacia la especificación de un destino: el vínculo es enumerable sólo si la especificación cita con la forma D9 (`Deriva-Rules.md` l.50) una ruta del expediente que resuelve. Ese formato hoy colisiona con `ev-NN` (N2-05).

**Q12 — Punto de continuación verificable.**
- **Enumerable**: que nombre el último folio (C11: `ok 002`).
- **Enumerable, por git**: que no sea anterior al último folio (C12c: `ok`).
- **Interpretativo**: que «qué sigue» sea correcto (I3). Además, el re-despacho que promete no es reproducible, porque la carta no está asentada (N2-06).

**Q1, Q2, Q9, Q10 y Q11**: mi mandato no tiene nada que agregar.

---

## 5. Lo que revisé y está bien

1. **`SHA256SUMS` es íntegro y completo.** `sha256sum -c` pasa. Los diez blobs de `e8c84d9` recalculan igual. C7 confirma que cubre todo `evidencia/` y nada más.
2. **Foliatura, índice y cabeceras son coherentes.** C3, C4 y C5 dan `ok` en los dos folios. Ninguna actuación fue modificada después de su alta (C12 vacío), dentro del límite de N2-03.
3. **ev-02 a ev-05 reproducen idénticos hoy.** La constancia de 002 l.105, el `grep` sin `-F` corregido antes de citar, está asentada dentro del propio guion. Es el comportamiento que un expediente tiene que tener.

---

## 6. Solicitudes de convocatoria

1. **Trazabilidad documental (AG-00110).** 002 l.74 la descartó con el motivo «no hay corpus de expedientes con enlaces que medir». La colisión de N2-05 sí es medible hoy: `EV-NN` en `Lab-Geometria` y en `RPI.VideoControl`, y `0001` repetido entre repositorios. La elección de prefijo, ámbito y ancho es de su competencia, no de la mía.
2. **Seguridad (AG-00050).** Se postergó por cupo (002 l.73). N2-04 concluye que el hash sólo tiene sentido para evidencia **no versionada**, que es justamente la que puede traer credenciales. Qué se custodia afuera del repositorio público, y cómo, es su pregunta.
