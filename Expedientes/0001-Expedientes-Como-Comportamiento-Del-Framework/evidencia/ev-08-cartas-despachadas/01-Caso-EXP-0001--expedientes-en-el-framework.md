Abrís y tramitás el **primer expediente del repositorio del `Framework SDD`**: el caso que diseña **cómo el framework adopta los expedientes como comportamiento propio**. Producís el expediente con su mesa, un reporte y un prompt de intervención. **No modificás el conjunto normativo** (`IA.SDD/SDD/`, `PROMPTS/`, `Templates/`, `CHANGELOG.md`): otra corrida está migrando un destino contra la 13.16 y la norma no se mueve hasta que se aplique la intervención que vos dejás lista. Español rioplatense neutro técnico, con la voz del corpus.

## Worktrees, obligatorio
```
git -C /IA/SDD/IA.SDD worktree add /IA/SDD/IA.SDD-exp1 -b expedientes/0001-caso main
git -C /IA/SDD/IA.SDD.Documentacion worktree add /IA/SDD/IA.SDD.Documentacion-exp1 -b reportes/31-expedientes main
```
Trabajá SÓLO ahí. **NO push, NO PR, NO merge.** Commits por lote coherente, terminados en `Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>`; stageá archivo por archivo. Framework **13.16**. No toques ningún destino (sólo lectura: `/PROG2/Geometria/Lab-Geometria`, `/Repos-RPIs/RPI.VideoControl`; en Lab-Geometria otra corrida escribe en un worktree: leelo por `git show main:<ruta>`).

## El caso: presentación literal del Product Owner (2026-09-13)

> *«Vamos a adoptar como parte del `Framework SDD` que los expedientes y casos que se armen se documenten de forma sistemática dentro de lo que sería `<repo>/SDD/Expedientes`, donde cada caso se vaya numerando, y dentro se ubique un README.md que describa el caso tratado, tal como se hacen en los juicios, mesas o comisiones de investigaciones, partiendo de informes que presentan el caso y luego se va expedientando todo su tratamiento — eso quiero que sea parte del comportamiento del `Framework SDD` — de esta manera, las pruebas que aporte yo o las que obtuviesen los agentes quedarían como parte de las especificaciones — arreglá esa idea y mejorala en base a los estándares de la industria y la academia.»*

> *«Acordate en saber dónde estás parada — para el caso de migrar `Lab-Geometria`, llevá tus expedientes dentro de una carpeta numerada en `/PROG2/Geometria/Lab-Geometria/SDD/Expedientes` — ahora si planteaste una mesa en `IA.SDD`, llevá su expediente de reportes `/IA/SDD/IA.SDD/Expedientes` de igual manera con su caso en una carpeta numerada.»*

> *«Cuando te encuentres con un problema, en vez de pararte, armá una mesa adecuada para llegar a una conclusión, evaluá realmente si necesitás preguntarme algo o es una mala interpretación analizando todo el conjunto del problema.»*

Las dos carpetas `Expedientes` existen y están **vacías**. **En el repositorio del framework va en la raíz** (`IA.SDD/Expedientes/`), no dentro de `SDD/`: el orquestador sostiene que `SDD/` es el conjunto normativo y se copia **entero** a `_legacy/<versión>/` en cada publicación (`SDD-Development-Guide.md` §VI), así que los expedientes adentro se duplicarían con cada salto. **Verificalo y decidilo en la mesa**; no lo heredes.

## Qué armar

**1. El expediente `IA.SDD/Expedientes/0001-Expedientes-Como-Comportamiento-Del-Framework/`**, que es a la vez tu caso y **el primer ejemplar vivo** de la forma que la mesa proponga (llevalo con la forma que se va decidiendo, y declarando que es provisoria hasta la intervención):
- `README.md`: carátula (número, título, estado, apertura, partes, objeto, origen), índice foliado de actuaciones, índice de evidencia con procedencia, **punto de continuación**, y al cerrar la resolución.
- `actuaciones/001-presentacion-…md` con la presentación literal de arriba; `002-providencia-convocatoria-de-mesa` (contrato de entrada y panel, `Mesa-Rules.md` §4 y §5); una actuación `informe` por comisión (**verbatim**); `refutacion`; `dictamen` (plan); y los testimonios que surjan. Foliadas y **nunca reescritas**: una corrección es actuación nueva.
- `evidencia/` con salidas de comandos.

**2. La mesa** (`Mesa-Rules.md`: leela entera; núcleo permanente + variable). Convocá comisiones **a ciegas y en paralelo** (subagentes), con estas especialidades o las que la naturaleza pida, cada una **con fuentes citables** (nombre y número de norma o publicación, URL si es pública; **no inventes cláusulas**: si no estás seguro del número de un apartado, citá la norma sin apartado):
- **Gestión documental y de registros**: ISO 15489-1 (records management: autenticidad, fiabilidad, integridad, disponibilidad), ISO 23081 (metadatos de registros), ciclo de vida del registro, retención.
- **Evidencia digital y cadena de custodia**: ISO/IEC 27037 (identificación, recolección, adquisición y preservación de evidencia digital), NIST SP 800-86; integridad por **hash**, procedencia, registro de quién tocó qué.
- **Procedimiento de expediente** (judicial / administrativo / comisión investigadora): carátula, **foliatura**, providencias, informes periciales/dictámenes, resolución, reapertura; el expediente como unidad documental ordenada y **append-only**.
- **Ingeniería de software y operación**: Architecture Decision Records (Nygard; MADR), **postmortems sin culpa** (Google SRE Book), acciones correctivas y preventivas (ISO 9001 «información documentada» y **CAPA/8D**), documentación de V&V y de pruebas (IEEE 1012; ISO/IEC/IEEE 29119-3), trazabilidad de requisitos.
- **Metodología académica**: estudio de caso (Yin), **procedencia** (W3C PROV), principios **FAIR** para datos de investigación, cuaderno de laboratorio.
- **Núcleo**: requisitos, verificación, lector sin contexto, y un **refutador** que ataque el plan **por su aplicación**: ¿cuánta burocracia agrega a una corrida chica? («un procedimiento que crece deja de leerse» es principio del framework: buscalo); ¿choca con `Mesa-Rules.md` §2.1 (registro en `SDD/Docs/Audit/`), con `Master-Prompt-Migracion.md` (informes en `Audit/`), con `Deriva-Rules.md` (tipos de evidencia D9), con `Root-Rules.md` §9 (familias de identificadores: ¿colisiona `EXP-`?) y §12 (**ciclo de origen**: ¿puede citar el expediente?), con el **origen del hecho** (`Master-Prompt.md` §8.1), con `Conocimiento/` y la neutralidad de stack? ¿Qué pasa con los 113 archivos de `Lab-Geometria/SDD/Docs/Audit/` y los expedientes de mesa que ya existen en `IA.SDD.Documentacion/PROMPTs/Fixs/*/OUTPUTs/`?

**Preguntas que el dictamen tiene que contestar, una por una**: dónde vive (destino y framework; ¿`SDD/Expedientes` o raíz?); cuándo se abre un expediente (condición, no lista de puntos, como `Mesa-Rules.md` §0.0) y cuándo **no** hace falta (umbral para no burocratizar); forma mínima obligatoria y forma completa; numeración e identificador (colisión medida con comando); estados y ciclo de vida (abierto, en trámite, suspendido, resuelto, archivado, reabierto); inmutabilidad y foliatura; evidencia (procedencia, integridad por hash, testimonio del PO como evidencia de primer orden con su fecha literal); **cómo la evidencia pasa a ser parte de la especificación** (vínculo expediente → artefactos que cambió, y artefacto → expediente que lo fundó: ADR, diferido con ciclo de origen, control de cambios); relación con `SDD/Docs/Audit/` (¿el registro de mesa y los informes se mudan, se foliar por enlace, o conviven?) y con la serie de reportes; **tratamiento retroactivo** de lo ya escrito (sin reescribir historia); **«ante un problema, mesa y no detención»** como comportamiento del orquestador, y cómo se integra con §8.1, el origen del hecho y el lote con `SI NO RESPONDÉS`; y el **punto de continuación** («saber dónde estás parado»).

**3. El reporte `31`** en `IA.SDD.Documentacion-exp1/Reportes/31-<slug>.md`, con la forma de los reportes `25`–`30` (leelos), cuyo origen es este expediente (citalo por ruta), y su fila en `Reportes/README.md` con fila de control de cambios. **Verificá el estado real del índice antes** (versión, última fila).

**4. El prompt de intervención `09`** en `IA.SDD.Documentacion-exp1/PROMPTs/Fixs/09-Fix-Reporte-31/Fix-Analizar-Reporte-31.md`, con la forma de los `03`–`08` (leelos: permisos, trampas nombradas, solicitudes numeradas, decisión de fondo primero, criterios de §7, cierre documental, snapshot entero, comandos al lado), y su fila en `PROMPTs/Fixs/README.md`. **La trampa principal que tiene que nombrar**: convertir un buen hábito en una ceremonia que nadie completa; el criterio es que la forma mínima de un expediente se pueda llenar en minutos y que su verificación sea enumerable.

## Reglas
- No inventar. Toda afirmación sobre el framework o los destinos, con archivo y sección o comando y salida; toda afirmación de industria/academia, con fuente.
- Ante un tropiezo propio: mesa, no detención; preguntas al PO sólo las que sobrevivan, en lote, formato §8.1 con `SI NO RESPONDÉS`.
- **Mantené el punto de continuación del README al día**: si la corrida se corta, quien retome tiene que saber dónde estás.

## Qué devolver
1. Worktrees, ramas, commits y archivos. 2. El índice del expediente (actuaciones y evidencia) y su punto de continuación. 3. Las comisiones convocadas y lo esencial de cada informe, con sus fuentes. 4. Qué atacó el refutador y qué cambió. 5. **El dictamen**: la respuesta a cada pregunta de arriba, en una tabla. 6. Reporte `31` y prompt `09`: rutas y resumen. 7. Preguntas al PO en formato §8.1, o «ninguna». 8. Lo no verificado.
