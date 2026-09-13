# Actuación 007 — Informe de la Comisión V5 — Metodología académica

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 007 |
| Tipo | `informe` |
| Fecha | 2026-09-13 |
| Autor | Comisión V5 — Metodología académica, primera convocatoria (actuación 002 §3), a ciegas |
| Despacho y entrega | Despachada 2026-09-13T12:15:56-03:00; informe final 2026-09-13T12:21:42-03:00 |
| Asentada por | Presidente de mesa, **por extracción mecánica** del último mensaje del subagente en su transcripción, sin edición. SHA-256 del cuerpo (desde la línea siguiente a la regla horizontal): `f1053368c67a4f1bf9c5494aecb6f36d7d2a7a60cffd6321cffc3e0e6b6e3716` |

---

# Informe de la Comisión V5: metodología académica

## 1. Cabecera

| Campo | Valor |
|---|---|
| Comisión | V5, metodología académica. Ad hoc con carta de mandato (`Mesa-Rules.md` §5.4) |
| Expediente | `0001`: expedientes como comportamiento del framework |
| Fecha | 2026-09-13 |
| Modo | A ciegas. No leí informes de otras comisiones. No escribí en ningún repositorio |
| Encargo | Refutar, no verificar |

**Base leída**

- Expediente `IA.SDD-exp1/Expedientes/0001-…`: `README.md`, las actuaciones `001` y `002`, y `evidencia/` completa (cinco guiones, cinco salidas y `SHA256SUMS`).
- `IA.SDD-exp1` (rama `expedientes/0001-caso`, sobre `8c55a1e`):
  - `README.md`
  - `SDD/Devs/Guides/Marco-Teorico-SDD.md` (índice, §9.7 y §14 Bibliografía)
  - `Mesa-Rules.md` §0 a §1.2, §3, §4 y §6.1
  - `Deriva-Rules.md` §0 y §1
  - `Master-Prompt.md` §8.1 (desde «Cómo se establece de qué lado cae») y §8.2
  - `Master-Prompt-Reanudacion.md` §1, §1.1 y §5
  - `Rules-Base-Conocimiento.md` §0.0 y §0.1
- `IA.SDD.Documentacion-exp1` (`9427b6b`):
  - `Reportes/README.md` (índice, «Cómo se usan» y desenlaces)
  - `Informes/Memoria-De-Antecedentes-Casos-Resueltos.md` (cabecera, resumen y §1)
  - `PROMPTs/Fixs/05-Fix-Reporte-27/OUTPUTs/Mesa-2026-09-12-Colision-Lexica/` (`00` completo y el índice de `06`)
- `Lab-Geometria` `main` (`b9675d8`), sólo por `git show` y `git ls-tree`: `evidencia/` (árbol completo, `2026-09-02-mesa-ux/README.md` y `2026-09-01-claves/README.md`) y `SDD/Docs/Audit/Mesa-2026-09-12.md` (§1).

**Fuentes externas**

| Fuente | Estado de la consulta |
|---|---|
| W3C, *PROV-Overview: An Overview of the PROV Family of Documents*, W3C Working Group Note, 30-04-2013. https://www.w3.org/TR/prov-overview/ | Consultada |
| W3C, *PROV-DM: The PROV Data Model*, W3C Recommendation, 30-04-2013. https://www.w3.org/TR/prov-dm/ | Consultada: definiciones de Entity, Activity, Agent, Generation, Usage, Derivation, Attribution, Association, Bundle, Revision, Quotation y Primary Source |
| Wilkinson, M. D. et al., «The FAIR Guiding Principles for scientific data management and stewardship», *Scientific Data* 3, 160018, 2016. https://doi.org/10.1038/sdata.2016.18 | El texto de los quince subprincipios lo tomé de GO FAIR, https://www.gofair.foundation/fair-principles, que cita ese artículo. **No pude abrir el artículo**: nature.com redirige a autenticación |
| Yin, R. K., *Case Study Research and Applications: Design and Methods*, 6.ª ed., SAGE, 2018 | **No la consulté en esta corrida.** La cito sin capítulo ni página, por sus nociones conocidas: protocolo del estudio de caso, base de datos del estudio de caso separada del informe, cadena de evidencia, triangulación de fuentes, generalización analítica frente a estadística, lógica de replicación |
| Kanare, H. M., *Writing the Laboratory Notebook*, American Chemical Society, 1985 | **No consultada.** La cito como obra de referencia de la práctica: registro fechado, no borrar, tachar y anotar |
| National Academies of Sciences, Engineering, and Medicine, *Reproducibility and Replicability in Science*, 2019 | **No consultada.** La cito sólo por la distinción entre reproducir (mismos datos y método) y replicar (datos nuevos) |

## 2. Hallazgos

### V5-01 · P1 · E2 + E4: el testimonio del PO se cita sin su fuente primaria, y el framework no tiene clase de evidencia para un testimonio

**Ancla**

- `001` l.10-11: *«Asentada por | Orquestador de la corrida (Claude Opus 5), por transcripción literal»*, *«Fuente | Encargo del Product Owner a la corrida, del 2026-09-13»*. No hay localizador ni hash del original.
- `Deriva-Rules.md` l.53 admite `humano` sólo como *«una aprobación explícita registrada con fecha»*. La l.55 excluye *«una captura de una conversación»*.
- `Lab-Geometria` `main:SDD/Docs/Audit/Mesa-2026-09-12.md` §1, `decisiones_cerradas`: *«el testimonio del Product Owner transcripto en la invocación de esta corrida, tratado como evidencia **E4**»*. Pero `Mesa-Rules.md` §6.1 define E4 como *«Regla declarada»*.

**Impacto**

- En PROV-DM, `001` es una *Quotation* de un *Primary Source*. Pero la fuente primaria no existe como entidad en el registro. La cita queda atribuida (`wasAttributedTo` al PO) y generada (`wasGeneratedBy` por una transcripción del orquestador), pero no derivada de nada verificable.
- Quien transcribe es la parte que tramita el caso, así que falla la condición 4 de D9 (independencia de quien afirma).
- Un testimonio no es una aprobación ni una regla. Hoy cada destino lo encaja donde puede, y `Lab-Geometria` ya lo metió en E4.
- El precedente de `Mesa-2026-09-12-Colision-Lexica/00` §2 tiene el mismo patrón: cita literal del PO sin fuente.

**Dirección de la corrección**

- Reconocer el testimonio como clase de evidencia propia, distinta de la aprobación.
- Que lleve fecha literal, canal, localizador del original o la declaración expresa de que el original no se conserva, e identidad de quien transcribe.
- Que admita una ratificación posterior del PO como actuación nueva.
- Declarar la correspondencia entre los tipos D9 y las anclas E1–E4/C, para que no convivan dos taxonomías de evidencia sin puente.

### V5-02 · P1 · E1: la evidencia del expediente no está fijada a la base que dice medir, y dos de sus salidas no son contemporáneas

**Ancla (comandos y salidas)**

- Fecha o commit dentro de cada salida, contados con `grep -c` sobre un patrón de fecha o de hash corto. Sólo `ev-01` abre con fecha (`2026-09-13T12:11:29-03:00`).

  | Salida | Primera línea | Líneas con fecha o commit |
  |---|---|---|
  | `ev-01-base.out` | `2026-09-13T12:11:29-03:00` | 9 |
  | `ev-02-snapshot.out` | `== raíz en main` | 1 |
  | `ev-03-colision.out` | `== EXP- como token, framework sin _legacy` | 8 (lo que cuenta son hashes y rutas, no la fecha de la corrida) |
  | `ev-04-inventario.out` | `== Lab-Geometria main: SDD/Docs/Audit` | **0** |
  | `ev-05-citas.out` | `== SDD/Devs/Rules/Mesa-Rules.md :: **Carpeta target:**` | **0** |

- Qué leen los guiones:
  - `ev-05-citas.sh` l.4: `cd /IA/SDD/IA.SDD`, y después `grep` sobre el **árbol de trabajo**. No usa `git show 8c55a1e:`.
  - `ev-03-colision.sh` l.4-6, 12-13: `grep -r` sobre los árboles de trabajo de `IA.SDD` e `IA.SDD.Documentacion`. Sólo `ev-02` fija `8c55a1e`, y sólo para `ls-tree`.
  - `ev-04` fija `main` de `Lab-Geometria`, pero cuenta `IA.SDD.Documentacion/PROMPTs/Fixs/*/OUTPUTs` con `find` sobre disco.
- `sha256sum -c SHA256SUMS`: los diez archivos dan «La suma coincide».

**Impacto**

- El hash prueba integridad del archivo, no correspondencia con la base de `002`. Un `grep` sobre un árbol con cambios sin commitear produce una salida íntegra y falsa respecto de la base.
- Si alguien reejecuta mañana y la salida difiere, no puede distinguir «el árbol avanzó» de «la evidencia estaba mal». Se confunden reproducir y replicar.
- Los guiones usan rutas absolutas del workspace de una persona. Otro agente no los corre sin editarlos, lo que va contra la condición 2 de D9 y contra el principio A1 de FAIR (recuperable por su identificador).

**Dirección de la corrección**

- Que toda salida de evidencia se describa a sí misma como actividad PROV: fecha de ejecución, comando, commits efectivamente usados (`used`) y agente ejecutor (`wasAssociatedWith`).
- Que los guiones lean de la base fijada y no del árbol de trabajo.
- Que la raíz del workspace sea un parámetro declarado.
- Separar en la forma la **verificación de integridad** (hash) de la **verificación de reproducibilidad** (reejecutar contra la misma base).

### V5-03 · P1 · E1: «esta actuación no se reescribe» es una declaración sin mecanismo, porque el expediente no está versionado

**Ancla**

- `git -C IA.SDD-exp1 status --short` → `?? Expedientes/`.
- `git log --oneline main..HEAD` → vacío.
- `001` l.13: *«Esta actuación no se reescribe.»*
- `SHA256SUMS` vive en la misma carpeta, lo escribió el mismo autor y se puede regenerar junto con lo que protege.

**Impacto**

- Del cuaderno de laboratorio, git aporta fecha, autor y un historial en el que sólo se agrega, pero **recién desde el commit**, y sólo mientras la rama no se reescriba (`rebase`, `push --force`) ni se borre.
- Hoy los folios 001 y 002, el índice y los hashes son editables sin rastro.
- Un conjunto de hashes guardado junto a los datos no ancla nada si no está fijado fuera de ellos, en un commit ya publicado o en una actuación posterior que lo transcriba.
- En el destino hay un indicio de fragilidad: `Mesa-2026-09-12.md` de `Lab-Geometria` cita un registro *«hoy sólo en `archivo/reanudacion-6-2026-09-12`, no en `main`»*. La rama existe (`git branch -a --list '*archivo*'` → local y `origin`), pero la integridad de ese registro depende de que nadie la borre.
- La memoria del orquestador registra una rama borrada con contenido. Es de segunda mano: nivel C, no la abrí.

**Dirección de la corrección**

- Que la foliatura sea un acto de commit: una actuación, un commit, o al menos un commit por asiento.
- Que el commit funcione como la fecha y la firma del cuaderno.
- Que la suma de integridad quede fijada por un commit anterior a su primera cita.
- Declarar qué rama es el archivo de registro del expediente y que esa rama no se reescribe ni se borra.

### V5-04 · P1 · E1 + E2: la cadena de evidencia de Yin necesita recorrerse en los dos sentidos, y la autosuficiencia del framework prohíbe uno

**Ancla**

- `IA.SDD/README.md` l.152: *«Ningún archivo de este repositorio referencia otro repositorio.»*
- Comando `grep -rn -o -E "IA\.SDD\.Documentacion…|Lab-Geometria…|RPI\.VideoControl" Expedientes/`. Salida:
  - `README.md:5` → `IA.SDD.Documentacion/PROMPTs/Fixs/09-Fix-Reporte-31/`
  - `README.md:21` → `IA.SDD.Documentacion`
  - `ev-01`, `ev-03` y `ev-04` referencian `Lab-Geometria` y `RPI.VideoControl`, siete líneas en total.
- Las salidas previstas del caso, el reporte `31` y el prompt `09`, viven en `IA.SDD.Documentacion` (README del expediente, fila «Salidas previstas»).

**Impacto**

- Yin exige que desde el informe se llegue a la base de datos del caso, de ahí a las fuentes, y también al revés.
- Con el expediente en `IA.SDD` y el informe en `IA.SDD.Documentacion`, el primer expediente ya viola la invariante de autosuficiencia. Si se la respeta, la cadena queda en un solo sentido.
- La tensión no está declarada. `002` §2 lista R1 a R6 como restricciones duras y ninguna es la autosuficiencia.

**Dirección de la corrección**

- Decidir en qué sentido se materializa la cadena y con qué identificador textual, nombrado y no enlazado, como ya dice la l.152 para los estándares: repositorio, commit y ruta como texto.
- O declarar que el expediente es un apartamiento de la autosuficiencia, con su motivo.
- En cualquier caso, que el reporte cite al expediente por identificador y commit, y que el expediente registre la emisión del reporte como actuación.

### V5-05 · P2 · E1 + E2: si el expediente vive en la raíz del framework, el snapshot lo duplica y rompe el identificador único

**Ancla**

- `ev-02-snapshot.out`: `_legacy/13.0` y `_legacy/13.15` copian `Conocimiento Examples PROMPTS README.md SDD Templates`, es decir, todo lo de la raíz salvo `CHANGELOG.md`, `_legacy`, `.gitignore` y `vs.bat`.
- La l.990 de la guía excluye sólo el `CHANGELOG`, `_legacy/` y la configuración del repositorio.
- `grep -n -i "expediente" SDD/Guides/SDD-Development-Guide.md` → sin salida.
- El criterio de inclusión (guía l.494) es *«sólo se excluye lo que no condiciona lo que el orquestador genera»*. Y P4 de `001` pide que la evidencia quede *«como parte de las especificaciones»*, o sea que la condicione.

**Impacto**

- Por la letra vigente, `Expedientes/` entraría en cada `_legacy/<N>/`.
- Cada versión publicada tendría otra copia de la base de datos del caso con otra ruta.
- Eso rompe el principio F1 de FAIR (*«globally unique and persistent identifier»*) y la separación de Yin entre una base de datos del caso y sus usos.
- Una cita a `Expedientes/0001/evidencia/ev-03` dejaría de ser unívoca.

**Dirección de la corrección**

- Decidir de forma explícita, en el criterio de exclusión del snapshot, si el expediente se copia.
- Recomiendo, desde FAIR, que no se copie: identificador único y persistente (número de expediente más ruta en `main`, más commit) y que las versiones lo citen, no lo dupliquen.

### V5-06 · P1 · E2: P4 confunde la evidencia de un caso con la especificación, y la serie de reportes ya generaliza desde un caso sin lógica de replicación declarada

**Ancla**

- `001` §1.1: *«las pruebas que aporte yo o las que obtuviesen los agentes quedarían como parte de las especificaciones»*.
- `Reportes/README.md`, «Cómo se usan»: *«**El patrón, enunciado** | Es lo que hay que corregir. Está escrito en forma general a propósito, para que la intervención no se limite al caso que lo reveló»*.
- En la misma serie, la generalización se corrigió al contrastarla:
  - `27`: *«Corrigió al propio reporte: los 118 … no eran tres recuentos inconexos»*
  - `26`: *«entró, pero no del snapshot que proponía»*
  - varios criterios quedaron *«sin veredicto hasta una corrida real»*.
- `Deriva-Rules.md` §1, tabla de alcance: las afirmaciones *«De especificación o de intención»* no llevan evidencia, llevan *«justificación»*.

**Impacto**

- En términos de Yin, un caso habilita **generalización analítica**, hacia una proposición teórica, y no estadística.
- Si la evidencia del caso pasa a ser texto de la especificación, pasa como hecho general, y la validez externa se da por supuesta.
- Por D9, la especificación es modo imperativo: la evidencia justifica la regla, pero no forma parte de ella.
- La serie ya muestra el costo: patrones enunciados en general que la aplicación tuvo que corregir.

**Dirección de la corrección**

- Que la evidencia entre a la especificación sólo como fundamento citado de una regla o criterio: la regla cita al expediente, el expediente no se vuelve regla.
- Que todo patrón generalizado declare cuántos casos lo sostienen y su estado de replicación: un caso; replicación literal (mismo resultado en otro caso); replicación teórica (resultado contrario, predicho por la regla).
- Formalizar como «replicación pendiente» lo que la serie ya llama «sin veredicto hasta una corrida real».

### V5-07 · P2 · E2: el expediente registra informes y errores, pero no tiene figura para el razonamiento descartado

**Ancla**

- Modelo positivo: `002` §6.2 asienta *«Error propio de la apertura … Se corrigió a `grep -F`, se volvió a correr y se re-hasheó antes de citar»*, y la nota queda también dentro de `ev-05-citas.sh` l.3.
- Cobertura parcial en `Mesa-Rules.md`: §3 P4 pide la *«lista de descartados con su motivo»*, pero sólo para roles del panel. §6.1 pide que un `C` que sobrevive dos ciclos *«se descarta y se registra como descartado»*.
- La lista de tipos de actuación que asoma en el índice del expediente es `presentacion`, `providencia`, `informe`, jurado y dictamen. Ninguno es para lo descartado.

**Impacto**

- Git conserva el resultado y el diff, pero no el razonamiento ni las alternativas que no llegaron a commit. Es la «vaporización del conocimiento» que la propia `Memoria-De-Antecedentes` §1 nombra.
- El cuaderno de laboratorio conserva lo tachado a la vista. El expediente, tal como está propuesto, conserva sólo lo que un autor decidió asentar, y §6.2 es un acto de disciplina, no de forma.

**Dirección de la corrección**

- Un tipo de actuación de constancia para hipótesis descartadas, rutas abandonadas y correcciones propias.
- Que nombre el folio o la evidencia que corrige y conserve la versión anterior citada: tachar y anotar, no borrar.
- Generalizar el patrón de `002` §6.2 en lugar de dejarlo a la disciplina.

### V5-08 · P2 · E2: el caso 0001 diseña la forma y al mismo tiempo es su única instancia de prueba, lo que es circular

**Ancla**

- `README.md` del expediente l.3-6: *«Este expediente es a la vez el caso y **el primer ejemplar vivo** de la forma que su mesa propone.»*
- Existen otras dos instancias previas, independientes, que la mesa tiene como dato:
  - `Mesa-2026-09-12-Colision-Lexica/` (según `002` §2).
  - `Lab-Geometria/evidencia/` (según `002` §6.3).

**Impacto**

- Validar una forma contra el mismo caso que la produjo es validez de constructo por construcción: el ejemplar cumple porque se escribió para cumplir.
- Yin pide triangular fuentes y, para proposiciones sobre un método, más de un caso.
- Hay dos casos preexistentes con forma de expediente que no se escribieron para esta forma, y la mesa no está obligada a probarla contra ellos.

**Dirección de la corrección**

- Que el criterio de aceptación de la forma se ejerza también sobre al menos una instancia que no se escribió para ella.
- Candidatos: el precedente de Colisión Léxica o una carpeta de `Lab-Geometria/evidencia/`, en lectura y sin reescribirlos.
- Que se registre qué de la forma esas instancias no cumplen y por qué.

## 3. Respuestas desde mi competencia

**Q1. Dónde vive.** La base de datos del caso vive donde ocurre el caso: el repositorio cuyos commits son la base de la evidencia. Así se minimiza el salto de procedencia (P6 de `001` es correcto desde PROV). En el framework hay dos condiciones: que no se duplique por el snapshot (V5-05) y que la cadena hacia el reporte se resuelva frente a la autosuficiencia (V5-04). Si la raíz o `SDD/` es mejor según la gestión documental: fuera de mi competencia.

**Q2. Cuándo se abre y cuándo no.**
- Se abre cuando hace falta una cadena de evidencia: hay afirmaciones de estado (alcance de D9) que sostienen una decisión que otra corrida va a heredar, o hay testimonio de una parte.
- No se abre cuando la decisión se sostiene con una cita literal del árbol y se consume en la misma corrida. Eso es trabajo propio según la pregunta previa de §8.1, y un registro de caso ahí es sobreingeniería.
- El número exacto del umbral no lo fijo: no tengo evidencia para una cifra.

**Q3. Forma mínima y completa.**
- **Mínima** (Yin y PROV):
  - Protocolo: las preguntas del caso y cómo se recoge la evidencia (el contrato de entrada de `002` lo cumple, ver §4).
  - Índice de entidades de evidencia, cada una con la actividad que la generó, los insumos usados con commit, el agente y la fecha.
  - Registro cronológico de actuaciones.
  - Punto de continuación.
- **Completa** suma: testimonios con su fuente (V5-01), constancias de lo descartado (V5-07), vínculo textual con el informe (V5-04) y estado de replicación de lo generalizado (V5-06).
- **Sobreingeniería desde FAIR:** serializar en PROV-O o RDF (I1 en sentido estricto), DOI por expediente (F1 global), registro externo de metadatos (F4 fuera del repositorio) y licencia por expediente. R1.1 queda cubierto por la licencia del repositorio.
- **Sí aplican, en forma liviana:** F2/F3 (la carátula nombra su número), A1 (git ya es un protocolo abierto y estándar), A2 (el índice sobrevive aunque falte una salida, si se declara) y, sobre todo, R1.2 (procedencia detallada).

**Q4. Numeración e identificador.** Desde FAIR alcanza con que el identificador sea único en su repositorio y persistente: no se recicla, y un expediente cerrado conserva su número. Se hace global por composición textual (repositorio, número y commit) sin infraestructura de DOI. La colisión del prefijo `EXP-` ya está medida en `ev-03` con cero ocurrencias, y no la reabro. El ancho y la familia de identificadores son de `Root-Rules.md` §9: fuera de mi competencia.

**Q5. Estados y ciclo de vida.** Metodológicamente hacen falta al menos tres momentos distinguibles:
- protocolo fijado, antes de recoger evidencia;
- evidencia en recolección;
- informe emitido, con la base de datos congelada.

La reapertura debe ser un acto nuevo y no una edición. La nomenclatura procesal de los estados («en trámite» y otros): fuera de mi competencia.

**Q6. Inmutabilidad y foliatura.** Ver V5-03. El cuaderno de laboratorio pide registro fechado, sin borrar y con correcciones tachadas y anotadas. Git lo da sólo si hay un commit por asiento y una rama de registro que no se reescribe. La foliatura como figura jurídica: fuera de mi competencia.

**Q7. Evidencia.**
- **Procedencia:** cada salida lleva dentro su actividad (fecha, comando, commits usados, agente); ver V5-02.
- **Hash:** sirve para integridad, no para correspondencia con la base. Tiene que quedar fijado en un commit anterior a su cita.
- **Testimonio del PO:** fecha literal tal como la dio el PO, canal, localizador del original o declaración de que no se conserva, quién transcribe, y ratificación opcional como actuación nueva (V5-01).
- **Medición en el destino** (heurística, sobre los README de `Lab-Geometria` `main:evidencia/`, con `grep` de hash corto, fecha y palabras de comando): `total=17 commit=4 fecha=7 comando=6`, y cero archivos de sumas de verificación. La procedencia del precedente es desigual. El recuento es por patrón y puede tener falsos positivos y negativos.

**Q8. Cómo pasa la evidencia a la especificación.** Por generalización analítica, nunca por transcripción. La regla o criterio cita al expediente como fundamento, y el patrón declara cuántos casos lo sostienen y su estado de replicación (V5-06). La evidencia no se copia a la especificación: se cita por identificador. Por D9, la especificación necesita justificación, y el expediente es donde esa justificación se puede auditar.

**Q9. Relación con `SDD/Docs/Audit/` y con la serie de reportes.**
- En términos de Yin, el **reporte** es el informe del estudio de caso y el **expediente** es su base de datos. Separarlos es correcto y es lo que Yin recomienda, siempre que la cadena se recorra en los dos sentidos (V5-04).
- El audit emite veredictos: es una clase de actuación u otra evidencia, no una base de datos del caso.
- Si el registro de mesa de §2.1 debe mudarse al expediente: la conveniencia documental está fuera de mi competencia. Desde mi competencia, lo que importa es que no queden dos copias del mismo registro.

**Q10. Retroactivo sin reescribir la historia.**
- No reescribir. Abrir expedientes nuevos cuya evidencia sea la cita, por commit, de los artefactos preexistentes (una *Revision* o *Quotation* en PROV, con `wasDerivedFrom` hacia el original en su commit).
- Declarar la procedencia faltante como faltante; ver el recuento de Q7 sobre `Lab-Geometria`.
- Es el mismo criterio que `Migracion-Rules.md` §4.9 aplica a los huecos anteriores al mecanismo, según lo resume el índice de reportes: derivar por `git log -S` o marcar `no derivable`. No leí esa sección directamente.

**Q11. Mesa, y no detención, con §8.1.** El origen del hecho de §8.1 es procedencia calculada: `wasGeneratedBy` contra la base. Sin conflicto metodológico. Lo que el expediente agrega es que el cálculo quede asentado como evidencia con su base, para que la decisión de no detenerse sea auditable después. La mecánica de la detención: fuera de mi competencia (ingeniería del método).

**Q12. Punto de continuación.** Corresponde a lo que Yin llama mantener el protocolo y la base de datos al día, para que otro investigador continúe. El bloque del README del expediente cumple. Le falta el commit de la última actuación asentada: sin eso, «dónde está el caso» no es contemporáneo (condición 3 de D9).

## 4. Lo que revisé y está bien

1. **Separación de autoridad en `001` §2 y §3.** Distingue con precisión la presentación literal (atribuida al PO), las precisiones del orquestador y la interpretación, esta última marcada como corregible por actuación posterior. En PROV son tres entidades con agentes distintos. Es exactamente la atribución que la procedencia exige.
2. **`002` §6.2 y la nota dentro de `ev-05-citas.sh` l.3.** El error propio se asentó antes de citar, se corrigió, se reejecutó y se re-hasheó, y la corrección quedó a la vista. Es la práctica de tachar y anotar del cuaderno de laboratorio, y es el modelo que V5-07 pide generalizar.
3. **Integridad y emparejamiento guion–salida.** `sha256sum -c SHA256SUMS` da coincidencia en los diez archivos, y cada salida está junto al guion que la generó. Es un `wasGeneratedBy` legible sin infraestructura. El defecto de V5-02 está en qué lee el guion, no en esta forma, que es correcta.

## 5. Solicitudes de convocatoria

1. **Datos personales o credenciales en evidencia aportada por el PO, dentro de un repositorio público** (`Rules-Base-Conocimiento.md` fila 2.0, repositorio público). FAIR A1.2 admite *«an authentication and authorisation procedure, where necessary»*, así que «accesible» no significa abierto. Pero decidir qué no puede publicarse, cómo se ofusca y qué retención legal aplica cae en seguridad y cumplimiento, fuera de mi competencia. Señal: la postergación de AG-00050 en `002` §3.3.
2. **Retención, disposición y la figura de foliatura.** V5-03 y V5-05 tienen un costado de gestión documental (qué se copia, cuánto se conserva) y de procedimiento (valor de la foliatura). Corresponde a V1 y V3. Lo marco para que el presidente verifique que esas comisiones lo cubren.
