# Actuación 004 — Informe de la Comisión V1 — Gestión documental y de registros

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 004 |
| Tipo | `informe` |
| Fecha | 2026-09-13 |
| Autor | Comisión V1 — Gestión documental y de registros, primera convocatoria (actuación 002 §3), a ciegas |
| Despacho y entrega | Despachada 2026-09-13T12:14:25-03:00; informe final 2026-09-13T12:20:05-03:00 |
| Asentada por | Presidente de mesa, **por extracción mecánica** del último mensaje del subagente en su transcripción, sin edición. SHA-256 del cuerpo (desde la línea siguiente a la regla horizontal): `a158d2ad08f568bb7df7c4a3bbf8955c28093a8b1566c4dd920352d36da13b77` |

---

# Comisión V1 — Gestión documental y de registros · Informe

## 1. Cabecera

| Campo | Valor |
|---|---|
| Comisión | V1 — Gestión documental y de registros (ad hoc, carta de 002 §3.2) |
| Fecha | 2026-09-13 |
| Modo | A ciegas. Sólo lectura: no se escribió ningún archivo |
| Base leída | Expediente `IA.SDD-exp1/Expedientes/0001-…`: `README.md`, actuaciones 001 y 002, `evidencia/*` (`sha256sum -c SHA256SUMS`: los diez archivos coinciden). `Mesa-Rules.md` §0-§4, §6.1, §6.7 y §11. `SDD-Development-Guide.md` §I (l.136-145) y §VI.4-§VI.5 (l.928-1016). `Root-Rules.md` §9.1, §11 y §12. `Master-Prompt.md` §8.1, §8.2 y §9. `Master-Prompt-Reanudacion.md` §5 y §5.1. `Deriva-Rules.md` §1. `Migracion-Rules.md` l.131 y l.660-675. `README.md` del framework, l.30-50 y l.137-160. `Lab-Geometria` por `git ls-tree/log/show main`. `IA.SDD.Documentacion` `main:Reportes/README.md` y `PROMPTs/Fixs/05-…/OUTPUTs/` |

**Fuentes externas**

| Fuente | URL | Cómo se consultó |
|---|---|---|
| ISO 15489-1:2016, *Information and documentation — Records management — Part 1: Concepts and principles* | https://www.iso.org/standard/62542.html | La página de catálogo respondió HTTP 403. Título, año y alcance confirmados por búsqueda web (catálogo ISO, DCC https://dcc.ac.uk/guidance/briefing-papers/standards-watch-papers/iso-15489). **No se leyó el texto de la norma**; se cita sin apartados |
| ISO 23081-1:2017, *Information and documentation — Records management processes — Metadata for records — Part 1: Principles* | https://www.iso.org/standard/73172.html | HTTP 403. Título y alcance confirmados por búsqueda web (ANSI webstore, ICA Records in Context). Confirmada por revisión en 2023. Sin apartados |
| ICA, ISAD(G): *General International Standard Archival Description*, 2.ª ed., 2000 | https://www.ica.org/resource/isadg-general-international-standard-archival-description-second-edition/ | Ubicada por búsqueda web; el PDF no se descargó. Se usa sólo por sus niveles de descripción (fondo, serie, expediente o *file*, unidad documental), que conozco de la norma y no verifiqué en línea |

---

## 2. Hallazgos

### V1-01 · P1 · E1 — El primer ejemplar vivo tiene mal dos de las cinco huellas de su índice de evidencia

**Ancla.** Comparé cada huella abreviada de la tabla «Índice de evidencia» del `README.md` del expediente (l.39-43) con `sha256sum` sobre cada `.out`:

```
ev-02 readme=dcf82b62…2fdd3   real=dcf82b62…904a2b7a        NO-COINCIDE
ev-05 readme=29417eca…4d34042 real=29417eca…c6901d34042     NO-COINCIDE
ev-01, ev-03, ev-04                                          COINCIDE
```

`SHA256SUMS` sí verifica los diez archivos. Lo que está mal es el metadato de integridad que ve el lector: el README dice que la verificación se hace con `sha256sum -c` (l.34), y lo que la tabla muestra no coincide con esa verificación. Además, el cierre `…2fdd3` que figura para ev-02 es casi idéntico al cierre real de ev-03 (`…5fdd3`). Parece un error de copia; no lo puedo afirmar.

**Impacto.** ISO 15489-1:2016 pide que un registro sea íntegro y fiable, y su metadato también. El primer ejemplar de la figura ya tiene dos copias del mismo dato de fijeza, y ya divergieron. Las abreviaturas con «…» no se pueden verificar leyendo: el que compara ve un prefijo que coincide y da la huella por buena. Como el expediente es «propuesta en uso» (README l.3-6), va a ser el modelo que se copie.

**Dirección.** Una sola fuente del dato de fijeza: el índice remite a `SHA256SUMS` y no repite la huella, o la repite entera y la verifica un chequeo. Ese control tiene que cubrir también las actuaciones, no sólo `evidencia/` (ver V1-08).

---

### V1-02 · P1 · E1 + E2 — Poner el expediente en la raíz no lo saca del snapshot; la afirmación a verificar es falsa en su segunda mitad

**Ancla.**
- `ev-02-snapshot.out` l.6 y l.8: `_legacy/13.0` y `_legacy/13.15` contienen `Conocimiento` y `Examples`. Las dos son carpetas de la raíz, no de `SDD/`.
- Guía §VI.5, l.988: *«Se copia el conjunto entero»*.
- Guía §VI.5, l.990: *«Quedan fuera del snapshot el propio `CHANGELOG.md` […], la carpeta `_legacy/` misma, y los archivos de configuración del repositorio»*. La lista de exclusiones está cerrada.
- Guía l.494 y `Rules-Base-Conocimiento.md` l.532: *«sólo se excluye lo que no condiciona lo que el orquestador genera»*.

**Impacto.** La primera mitad se sostiene: en `SDD/Expedientes` el expediente se copiaría con cada versión, porque `SDD/` está en todos los snapshots (ev-02 l.4-8). La segunda mitad no se sostiene: «en la raíz lo evita» contradice la regla escrita y el precedente medido de `Conocimiento/`. Con la norma 13.16 tal como está, un `Expedientes/` en la raíz entra al snapshot.

Y hay algo peor. P4 de la actuación 001 pide que la evidencia quede «como parte de las especificaciones». Si es especificación, condiciona lo que se genera, y por el criterio de l.494 **tiene** que copiarse. P4 y la exclusión se contradicen, y la mesa tiene que resolverlo.

Desde retención, copiar un expediente por versión rompe la unicidad del registro: el mismo folio existiría N veces, cada una con su ruta.

**Dirección.** Clasificar el expediente como **registro de la actividad** y no como **conjunto normativo**, y declararlo en la lista cerrada de l.990 como exclusión con su motivo. El vínculo de «parte de la especificación» se resuelve por referencia (ver Q8), no por pertenencia.

---

### V1-03 · P1 · E1 — En el destino, el registro de mesa ya es un documento vivo que se corrige; eso choca con la inmutabilidad que la figura promete

**Ancla.** `git -C Lab-Geometria log --numstat main -- SDD/Docs/Audit/Mesa-2026-09-12.md`:

```
4f1be95 2026-09-12 docs(audit): Mesa ciclo 1 1.2, la fila de deuda D-01 queda marcada como cerrada   3 2
5843e72 2026-09-12 §9: E-02, E-04 y E-05 pasan a RESPONDIDA …                                       31 1
ae705af 2026-09-12 Séptima reanudación: informe de estado y registro de mesa                        332 0
```

- El diff de `4f1be95` reescribe una fila de §8 (`- | **D-01** · …` / `+ | **D-01** · … — **CERRADO el 2026-09-12**`) y sube la versión del documento a 1.2.
- Los ocho `Mesa-*.md` del destino tienen entre 2 y 3 commits cada uno.
- En cambio, los siete archivos de `Mesa-2026-09-12-Colision-Lexica/` de `IA.SDD.Documentacion` tienen 1 commit cada uno.
- Contraste normativo, guía l.1016: *«un registro que se corrige después deja de ser un registro»*. Actuación 001, l.13: *«Esta actuación no se reescribe»*.

**Impacto.** En el mismo registro conviven dos regímenes. Uno es **fijo**: hallazgos, veredictos y el cierre de §10, que el propio control de cambios 1.1 declara que *«no se reescribe»*. El otro es **vivo**: la tabla de deuda de §8 y las escaladas de §9, que se cierran en el mismo lugar. El destino lo resolvió con cuidado, sin borrar campos. Pero la norma no distingue las dos cosas, y si se adopta el expediente con actuaciones inmutables, el `Mesa-*.md` queda ambiguo: no se sabe si es un folio o un registro de seguimiento. ISO 15489-1:2016 separa el registro, fijo como evidencia de una transacción, de los controles y metadatos que lo gestionan a lo largo del tiempo.

**Dirección.** Declarar por pieza a qué régimen pertenece. Lo que documenta un acto se fija al asentarse. Lo que sigue el estado (deuda abierta, escaladas respondidas, punto de continuación) va a una pieza de seguimiento con historia propia, o se asienta como actuación nueva que nombra el folio que afecta. Nunca como edición del folio.

---

### V1-04 · P2 · E1 + E2 — La serie de registros de mesa ya divergió de su propio esquema de nombres

**Ancla.**
- `git -C Lab-Geometria ls-tree -r --name-only main SDD/Docs/Audit | grep Mesa-` devuelve, entre otros, `Mesa-2026-08-31-B.md`, `Mesa-2026-09-01-C.md` y `Mesa-2026-09-12-ciclo-2.md`.
- `Mesa-Rules.md` l.156 fija `Mesa-<AAAA-MM-DD>[-ciclo-<N>].md`.
- `ev-01-base.out` l.15-18: hay tres carpetas `Expedientes` en el workspace, y una de ellas (`IA.SDD.Documentacion/Expedientes`) no la nombra nadie (002 §6.1).

**Impacto.** Una serie documental con dos sufijos para lo mismo (`-B` y `-ciclo-2`) no se ordena ni se cuenta de manera mecánica, y no hay comprobación que lo detecte. Mesa-Rules l.177-178 admite que *«La comprobación mecánica no puede verlo»* para las familias de hallazgo. Si la numeración de expedientes se apoya sólo en la disciplina, va a divergir igual. Para Q4, el dato que importa es que ya pasó en la serie más parecida.

**Dirección.** Un identificador de expediente con ámbito declarado (por repositorio), que no se reusa, que no depende de la fecha y que se puede contar por comprobación. Además, decidir la carpeta sobrante del workspace en el dictamen, no por omisión.

---

### V1-05 · P1 · E2 — No hay regla de disposición para expedientes, y la única vigente los eliminaría

**Ancla.**
- Guía l.145: *«Un registro histórico se conserva mientras alguien lo cite […]. Cuando su contenido queda íntegramente absorbido —la propuesta está implementada, el audit cerró aprobado— y ningún archivo vivo lo referencia, se elimina y su existencia queda registrada en el `CHANGELOG.md`»*.
- `grep -rn -i 'retenci\|disposici\|conservaci' SDD --include=*.md` no devuelve ninguna regla de retención de registros de caso. Sólo aparece `Rules-Devops.md` l.164, sobre artefactos de build, y `Mesa-Rules.md` l.296 como señal de la comisión de Cumplimiento.
- 002 §3.3 descartó Cumplimiento con el argumento de que *«la retención como diseño la cubre V1»*.

**Impacto.** Un expediente resuelto cumple exactamente la condición de l.145: su propuesta queda implementada por la intervención `09` y nadie lo vuelve a citar. La norma vigente manda eliminarlo del árbol. Eso contradice P4, porque la evidencia desaparecería de lo que se considera especificación, y contradice la intocabilidad de l.1016.

La dirección contraria tiene su propio problema. En un repositorio público, con evidencia que aporta el PO, **una disposición real es imposible**: el historial de git conserva lo borrado. Sin tabla de retención, ISO 15489-1:2016 trata la disposición como un control obligatorio del sistema de registros, y acá no hay ni autoridad de disposición ni clase de retención.

**Dirección.** Declarar una clase de retención propia para expedientes, exceptuada de l.145 o con evento de disposición explícito, y quién la autoriza. Declarar también la consecuencia de git sobre la evidencia que no debería quedar. Esto último es de otra competencia (ver solicitudes).

---

### V1-06 · P2 · E2 — La tipología documental no tiene clase para el testimonio del PO, y la primera actuación ya muestra por qué hace falta

**Ancla.**
- `Deriva-Rules.md` l.53 admite sólo cinco tipos de evidencia; el tipo `humano` es *«una aprobación explícita registrada con fecha»*.
- `Deriva-Rules.md` l.55: no es evidencia *«una captura de una conversación»*.
- Actuación 001 l.10-11: *«Asentada por: Orquestador […] por transcripción literal · Fuente: Encargo del Product Owner a la corrida»*. No hay copia del original ni huella de ella.
- Actuación 001 §2 punto 2 (l.60-62) presenta como *«precisión del orquestador que no es del Product Owner»* que el expediente del framework vaya en la raíz. Pero el pasaje literal del PO, §1.2 l.38, ya dice `/IA/SDD/IA.SDD/Expedientes`, es decir, la raíz.

**Impacto.**
- **Autenticidad.** ISO 15489-1:2016 define un registro auténtico como el que es lo que dice ser y fue creado por quien dice. Acá el único testimonio del caso es una transcripción del agente interesado, sin original conservado. Bajo D9 no llega a evidencia: no es una aprobación y se parece a una captura de conversación.
- **Atribución.** El único folio «que no se reescribe» ya trae un error de autoría: le atribuye al orquestador algo que el PO escribió literalmente. Sólo se puede corregir con una actuación nueva, que es el primer uso real del mecanismo y conviene que el dictamen lo haga.
- **Metadatos.** ISO 23081-1:2017 trata al agente como entidad de metadatos. La figura necesita separar autor, asentador y fuente, y la cabecera de 001 lo hace bien. Lo que falta es la clase del documento.

**Dirección.** Una tipología cerrada de actuaciones y de piezas de evidencia que incluya el testimonio o presentación, con fecha literal, medio y conservación del original o su huella. Distinguir «aprobación» de «declaración». Qué alcanza como prueba es de V2.

---

### V1-07 · P2 · E1 + E2 — Dos registros con autoridad para el mismo acto, y agregaciones repartidas entre repositorios

**Ancla.**
- `Mesa-Rules.md` l.156 fija el registro de mesa como archivo único en `SDD/Docs/Audit/`, y es decisión cerrada (002 l.40).
- 002 l.26-27: *«Este expediente es el registro, con las nueve secciones de §2.2 repartidas en actuaciones»*.
- `git -C Lab-Geometria show main:evidencia/2026-09-02-mesa-ux/README.md` l.3-4: *«Registros que fundan el ciclo […] (expediente en `Lab-Geometria.Documentacion/PROMPTs/Fixs/01-Ajuste-UX/OUTPUTs/`)»*. La evidencia está en un repositorio y su expediente en otro.
- `Reportes/README.md` l.226: *«Sus expedientes, verbatim, quedan en `PROMPTs/Fixs/05-Fix-Reporte-27/OUTPUTs/`»*.

**Impacto.** En un destino, una mesa con expediente produciría dos registros del mismo acto: `Audit/Mesa-*.md`, por decisión cerrada, y `SDD/Expedientes/NNNN/`, por P2. Cada uno tendría su historia, y ninguno sabría cuál manda.

El precedente del destino ya separó el agregado (evidencia en un repositorio, expediente en otro, piezas en un tercero). El principio de procedencia y los niveles de ISAD(G) (fondo, serie, expediente) piden que la unidad documental «expediente» reúna sus piezas, o las referencie de forma estable, dentro del fondo donde se produjo el caso. Esto es P6: «donde ocurre el caso».

No reabro la decisión cerrada. Señalo que convive con la figura nueva sin regla de precedencia, y que es el pendiente de `Root-Rules.md` §13 que declara 002 l.42.

**Dirección.** Declarar una sola pieza con autoridad por acto y que la otra sea índice o puntero. Declarar que la evidencia de un expediente vive dentro de su carpeta, o se cita con `ruta@commit` cuando no puede moverse.

---

### V1-08 · P2 · E1 — Folios «nunca reescritos» sin control que lo sostenga, y un estado declarado a mano en la pieza que sí se reescribe

**Ancla.**
- `git -C IA.SDD-exp1 status --short` devuelve `?? Expedientes/`. Nada del expediente está versionado.
- `SHA256SUMS` lista sólo `evidencia/*`: diez entradas, ninguna actuación y el README tampoco.
- README l.14 declara el campo «Estado: **En trámite**». README l.45 y siguientes contienen el «Punto de continuación» en prosa.
- Sólo `ev-01-base.out` lleva fecha adentro (l.1). ev-03 y ev-04 leen árboles de trabajo de `IA.SDD.Documentacion` sin fijar commit (`ev-03-colision.sh` l.6 y l.13; `ev-04-inventario.sh` l.11).

**Impacto.** «Foliadas y nunca reescritas» (README l.25) es hoy una declaración sin control. Nada impide ni detecta reescribir 001 o 002, y la carátula (estado, índice, continuación) es la pieza que se reescribe siempre y no tiene historia propia.

ISO 23081-1:2017 pide metadatos de historia de eventos: quién hizo qué y cuándo sobre el registro. Un campo de estado que se sobreescribe la borra. Es el defecto que el framework ya nombra para otras fuentes declarativas (`Master-Prompt-Reanudacion.md` §7, citado en `Mesa-Rules.md` l.25: *«confiar en la fuente declarativa sin contrastarla»*).

**Dirección.**
- Que el estado del expediente se **derive** del índice de actuaciones (tipo y fecha del último folio) y no se declare. Es el mismo principio de «se calcula, no se declara» de `Root-Rules.md` §12 y `Master-Prompt.md` §8.1.
- Que el asiento de cada folio sea un acto verificable: commit, y fijeza de la actuación.
- Que la fecha viaje dentro de cada salida de evidencia y que las lecturas se fijen a commit. Este último punto se señala a V2.

---

## 3. Respuestas desde mi competencia

**Q1 — Dónde vive.**
- **En el destino.** `<repo>/SDD/Expedientes/` es coherente con P6 y con el principio de procedencia: el fondo es el repositorio donde ocurre el caso. Los destinos no toman un snapshot de `SDD/` entero: archivan documento por documento en el `_legacy/` de su carpeta (`Migracion-Rules.md` l.131). Por eso ahí no hay duplicación por versión. Sí hay que excluir expresamente los expedientes del árbol de migración, porque no se migran ni se renumeran: son registros.
- **En el framework.** Verifiqué la afirmación. «En `SDD/` se duplicaría con cada snapshot» es **cierta** (ev-02, guía l.988). «La raíz lo evita» es **falsa con la 13.16**: `Conocimiento/` y `Examples/` están en la raíz y se copian (ev-02 l.6 y l.8), y la exclusión de l.990 es cerrada (V1-02). La raíz sirve **sólo si** la guía §VI.5 suma la exclusión con su motivo.
- **Atribución.** La raíz para el framework ya está en el literal del PO (001 l.38), no sólo en la precisión del orquestador (V1-06).

**Q2 — Cuándo se abre y cuándo no.** Desde registros, el criterio no es la importancia del caso sino **si hay un requisito de registro que ninguna serie existente satisface**. Propongo, para que el refutador lo ataque: se abre expediente cuando el caso (a) atraviesa más de un acto o ciclo, o (b) incorpora evidencia o testimonio externo al árbol que tiene que sobrevivir a la corrida. No se abre para una autocorrección (§8.1, tabla), para un audit de fase (§10) ni para una mesa de un solo ciclo sin evidencia externa, que sigue con su `Mesa-*.md`. Si hubiera un expediente por cada mesa, se multiplicarían dos registros por acto (V1-07).

**Q3 — Forma mínima y completa.** Mínima: carátula con metadatos derivables (V1-08), índice de actuaciones, índice de evidencia remitido a la fijeza (V1-01), y estado derivado. Completa: suma tipología de actuaciones (V1-06), clase de retención (V1-05), y vínculos salientes y entrantes (Q8). La forma de 0001 es buena base con esas correcciones.

**Q4 — Numeración e identificador.** Cuatro dígitos por repositorio alcanzan; `EXP-` no colisiona (ev-03 l.1-10: 0 en los cinco repositorios medidos, comando incluido). Que no dependa de la fecha, que no se reuse (un expediente anulado conserva su número) y que se pueda comprobar por conteo. Si se lo trata como familia de `Root-Rules.md` §9, el ancho de cinco dígitos (§9.2) choca con `0001`; se decide ahí, no por costumbre. Aviso medido: la serie hermana ya divergió de su esquema (V1-04).

**Q5 — Estados y ciclo de vida.** Conjunto cerrado, como el de §11 punto 5, **derivado del último folio y no escrito a mano**. Abierto = hay presentación. En trámite = hay providencia. Suspendido = actuación de suspensión con evento de reanudación que se pueda abrir (§12.2 punto 4). Resuelto = dictamen. Archivado = cierre más fijeza completa; **no implica mover la carpeta**, porque mover rompe las citas. Reabierto = actuación nueva que nombra el dictamen, nunca editar el estado.

**Q6 — Inmutabilidad y foliatura.**
- Folios contiguos que no se reusan. Una corrección o anulación es un folio nuevo.
- Fijeza que cubra actuaciones y evidencia, y un commit por asiento. Hoy no hay ninguna de las dos cosas (V1-08).
- La única pieza mutable es el README-índice, con historia propia.
- Las piezas de seguimiento vivo (deuda, escaladas) no van en folios (V1-03).

**Q7 — Evidencia.** Desde registros: metadatos de procedencia por pieza (agente, fecha literal, medio, base o commit, guion). Testimonio del PO como clase propia, con su original o su huella (V1-06). La huella abreviada es mala práctica (V1-01). Si la huella y la cadena bastan como prueba, y cómo se trata la transcripción, **es de V2**.

**Q8 — De la evidencia a la especificación.** Por **referencia bidireccional, no por copia ni por pertenencia**. Copiar crea segunda fuente (`Root-Rules.md` §12.1), y la pertenencia arrastra el snapshot (V1-02) y la regla de eliminación (V1-05).
- Del expediente a los artefactos: el dictamen lista cada artefacto tocado con su ruta y el commit de aplicación.
- De los artefactos al expediente: la fila de control de cambios del artefacto cita `Expediente NNNN, folio FFF`. Un campo de estructura ya similar al ciclo de origen (§8.2) es candidato; no se diseña acá.

**Q9 — Relación con `SDD/Docs/Audit/` y la serie de reportes.** `Audit/` es la serie de veredictos y registros de actos del destino, y queda como está. El expediente es una **agregación de nivel superior** (expediente según ISAD(G)) que referencia esas piezas, y hay que fijar cuál tiene autoridad para cada acto (V1-07). La serie de `Reportes/` de `IA.SDD.Documentacion` es un fondo distinto: el reporte `31` es un **producto derivado** del expediente 0001 y lo cita. No es su registro. La carpeta vacía `IA.SDD.Documentacion/Expedientes` crearía un tercer lugar; el dictamen tiene que decidirla.

**Q10 — Tratamiento retroactivo sin reescribir historia.** Nada se mueve ni se renombra: los 113 archivos de `Audit/` de Lab-Geometria, los 51 de VideoControl y las nueve carpetas `OUTPUTs/` (ev-04) quedan donde están. Si se quiere agregar lo previo, se abre un expediente de reconstrucción que **indexa** piezas por `ruta@commit` y declara que es reconstrucción. El framework ya tiene los dos precedentes de no retroactividad: `Deriva-Rules.md` l.61 y `Root-Rules.md` §12 para los huecos anteriores a 8.7. La restitución de la guía l.1009-1012 no autoriza reordenar.

**Q11 — «Ante un problema, mesa y no detención».** Desde registros, sólo esto: cada mesa que reemplaza una detención deja registro (`Mesa-Rules.md` §2.2, «se escribe siempre»). El lote con `SI NO RESPONDÉS` y la respuesta del PO se asientan como actuaciones con fecha y texto literal, no editando la escalada. Lab-Geometria lo resolvió agregando la respuesta a continuación (control de cambios 1.1 de `Mesa-2026-09-12.md`), que es la dirección correcta pero dentro de un registro que se edita (V1-03). La integración con el origen del hecho de §8.1 está **fuera de mi competencia**.

**Q12 — Punto de continuación.** Ya existe en `Master-Prompt-Reanudacion.md` §5 (l.452) dentro del informe de estado. En el expediente no debería ser una segunda declaración en prosa: debería **derivarse** del último folio y de lo que la última providencia o dictamen manda. La reanudación (R0) debería leer los expedientes no archivados como `pendientes_declarados`. Hoy vive en la carátula mutable (V1-08).

---

## 4. Lo que revisé y está bien

1. **Separación de autoridad en la actuación 001.** La presentación literal (§1), las precisiones del orquestador (§2) y la interpretación (§3, l.68: *«Esto es interpretación y no presentación»*) están separadas. Eso es buen control de autenticidad y de atribución de agente, aun con el error puntual de V1-06.
2. **Evidencia con guion, salida y fijeza.** `sha256sum -c SHA256SUMS` coincide en los diez archivos. 002 §6.2 declara su propio error de `grep` sin `-F` y lo corrigió **antes de citar**. Es un registro que documenta su propia corrección en vez de ocultarla.
3. **Guía §VI.5, l.1009-1016.** Distingue restituir un registro que nunca se escribió de editarlo, y funda la intocabilidad en que *«un registro que se corrige después deja de ser un registro»*. Es un principio sano y alineado con ISO 15489-1:2016, y es la base correcta para la foliatura.

---

## 5. Solicitudes de convocatoria

| # | Para | Señal y ubicación | Qué no puedo afirmar |
|---|---|---|---|
| S1 | **V2 — Evidencia y custodia** | Huellas del índice que no coinciden (V1-01); `Expedientes/` sin versionar (`git status`: `?? Expedientes/`); `SHA256SUMS` en la misma carpeta y hecho por el mismo agente que la evidencia; ev-03 y ev-04 leen árboles de trabajo sin commit fijo | Si una huella autoemitida sin anclaje externo alcanza como cadena de custodia, y si la reproducibilidad de ev-03 y ev-04 alcanza para D9 punto 2 |
| S2 | **V2 / V3** | Actuación 001 l.10-11: el testimonio del PO sólo existe como transcripción del orquestador, y D9 excluye la «captura de una conversación» (`Deriva-Rules.md` l.55) | Si la transcripción es prueba admisible, y qué forma procesal tiene la corrección del error de atribución (001 §2.2 frente a §1.2) |
| S3 | **Seguridad (AG-00050, postergada)** | Repositorio público (`Rules-Base-Conocimiento.md` fila 2.0) más evidencia del PO que puede traer datos personales o credenciales, más imposibilidad de disposición real en git (V1-05) | Qué hacer con evidencia sensible ya commiteada, y si hace falta una compuerta antes del asiento |
