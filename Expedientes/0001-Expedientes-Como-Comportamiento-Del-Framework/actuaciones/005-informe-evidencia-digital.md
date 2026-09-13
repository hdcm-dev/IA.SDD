# Actuación 005 — Informe de la Comisión V2 — Evidencia digital y cadena de custodia

| Campo | Valor |
|---|---|
| Expediente | `0001` |
| Folio | 005 |
| Tipo | `informe` |
| Fecha | 2026-09-13 |
| Autor | Comisión V2 — Evidencia digital y cadena de custodia, primera convocatoria (actuación 002 §3), a ciegas |
| Despacho y entrega | Despachada 2026-09-13T12:14:48-03:00; informe final 2026-09-13T12:20:26-03:00 |
| Asentada por | Presidente de mesa, **por extracción mecánica** del último mensaje del subagente en su transcripción, sin edición. SHA-256 del cuerpo (desde la línea siguiente a la regla horizontal): `c61bf2a43cb20f9967f0d458a159e756b4ce47862d6e84d135732a71050f8a37` |

---

# Informe de la Comisión V2: evidencia digital y cadena de custodia

## 1. Cabecera

| Campo | Valor |
|---|---|
| Comisión | V2, evidencia digital y cadena de custodia. Ad hoc con carta de mandato (`Mesa-Rules.md` §5.4) |
| Expediente | `0001`, expedientes como comportamiento del framework |
| Fecha | 2026-09-13 |
| Modo | A ciegas. Sólo lectura: no escribí ni modifiqué ningún archivo. Las re-corridas de los guiones salieron al scratchpad de la sesión, fuera de todo repositorio |
| Base leída | `IA.SDD` `8c55a1e` (13.16), worktree `IA.SDD-exp1` en la rama `expedientes/0001-caso` · `IA.SDD.Documentacion-exp1` en `reportes/31-expedientes` (`9427b6b`) · `Lab-Geometria` `main` `b9675d8`, leído con `git show`/`git ls-tree`/`git grep` · `RPI.VideoControl` `HEAD` `9aabe5c` |
| Leído entero | Actuaciones 001 y 002, `README.md` del expediente, los cinco guiones con sus salidas y `SHA256SUMS`. `Mesa-Rules.md` §4 y §6.1. `Deriva-Rules.md` §1 (l.22-59). `Master-Prompt.md` §8.1 (l.960-1010), §8.2 (l.1096-1150) y §12.1 T0 (l.1644-1675). `Root-Rules.md` §9 (l.380-450). `SDD-Development-Guide.md` §II.7 (l.273-293). `Rules-Base-Conocimiento.md` §2.2 (l.155-170) |

**Fuentes externas**

| Fuente | URL | ¿Consultada en línea? |
|---|---|---|
| NIST SP 800-86, *Guide to Integrating Forensic Techniques into Incident Response* (Kent, Chevalier, Grance, Dang; agosto 2006), DOI 10.6028/NIST.SP.800-86 | https://csrc.nist.gov/pubs/sp/800/86/final · PDF: https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-86.pdf | **Sí.** Leí el texto del PDF. Cito §3.1.2 «Acquiring the Data» y §4.2.2 «Data File Integrity» |
| ISO/IEC 27037:2012, *Guidelines for identification, collection, acquisition and preservation of digital evidence* | https://www.iso.org/standard/44381.html | **No.** La página del catálogo devolvió 403. Sólo vi los datos del catálogo por buscador: vigente, confirmada en 2018, roles DEFR/DES. **La cito sin apartados y no afirmo nada de su texto** |
| RFC 3227 / BCP 55, *Guidelines for Evidence Collection and Archiving* (febrero 2002) | https://www.rfc-editor.org/rfc/rfc3227 | **Sí.** Cito §4.1 «Chain of Custody» y §4.2 «Archiving» |
| RFC 3161, *Time-Stamp Protocol (TSP)* (agosto 2001) | https://www.rfc-editor.org/rfc/rfc3161 | **Sí** |
| Git, *hash-function-transition* | https://git-scm.com/docs/hash-function-transition | **Sí** |

---

## 2. Hallazgos

### V2-01 · P1 · Ancla E1: el índice de evidencia del expediente transcribe mal el hash de `ev-02`

**Qué muestra la ejecución.**

```
$ grep -o 'dcf82b62[^`]*' README.md
dcf82b62…2fdd3
$ grep ev-02-snapshot.out evidencia/SHA256SUMS
dcf82b62238a8dfd6f6e583e3b9fe01f155f0d3a018ad642f8f6f05d904a2b7a  ev-02-snapshot.out
```

- El final `…2fdd3` no es de `ev-02`. Es el final del hash de `ev-03` (`…539c5fdd3`), trasladado de fila.
- En paralelo, `sha256sum -c SHA256SUMS` da las diez sumas correctas.
- El índice del `README.md` es una **fuente declarativa**. Nadie la contrastó contra su observable, que es el anti-patrón nombrado en `Mesa-Rules.md` §6.1: «afirmaciones sobre el trabajo y no el trabajo».
- Los hashes truncados («`61bb3917…f86a`») **no se pueden verificar**: un lector no puede comprobar un prefijo más un sufijo con ninguna herramienta estándar.

**Impacto.**
- El primer ejemplar vivo de la forma propuesta ya tiene una integridad declarada que no coincide con la integridad medida.
- Por `Deriva-Rules.md` l.57, una evidencia que «no resuelve» es **P0 porque simula verificación**. Si la forma se normaliza tal cual, cada expediente carga dos declaraciones del mismo hash que se van a desincronizar.

**Dirección.**
- Una sola fuente de integridad, la de máquina (`SHA256SUMS` o equivalente). El índice legible remite a ella y no transcribe digests, ni completos ni truncados.
- Si la forma quiere un digest en el índice, tiene que ser completo y salir mecánicamente del archivo de sumas. No se escribe a mano.

### V2-02 · P1 · Ancla E1: «reproducible» no se sostiene; los guiones leen el disco del momento, no un commit

**Qué muestra la ejecución.** Re-corrí los cinco guiones a las 12:15:59, cuatro minutos después de la adquisición:

```
== ev-01-base: bf7ef89aa0ee vs 61bb39175577
> /home/fernando/.../IA.SDD-kmesa  8c55a1e [conocimiento/mesa-de-expertos-a-pedido]
> /home/fernando/.../Lab-Geometria-mig1316/SDD/Expedientes  entradas=1
== ev-02-snapshot: dcf82b62238a vs dcf82b62238a
== ev-03-colision: 239f1971ebe9 vs 239f1971ebe9   (idem ev-04, ev-05)
```

**Por qué pasa.**
- `ev-01` ya no reproduce. Aparecieron un worktree nuevo y una carpeta `Expedientes` con contenido, justo lo que la actuación 001 §2.1 afirma que está vacío.
- `ev-03` y `ev-05` hacen `grep` sobre el **árbol de trabajo** de `IA.SDD`, no sobre `8c55a1e`.
- `ev-04` cuenta archivos con `find` sobre el árbol de trabajo de `IA.SDD.Documentacion`. `git status` muestra ahí `?? PROMPTs/Analisis/03-Extraccion-Concepto-Base-Proyecto-Bundle-JS/`: no está limpio.
- Hoy coinciden **por casualidad, no por construcción**.
- `Lab-Geometria/evidencia/2026-09-02-mesa-ux/README.md` declara como método «el medio A de `/IA/PROMPTs/IA.Prompts/Base/Medios.md`». Es una ruta fuera del repositorio, que un lector del destino no puede localizar.

**Contra qué choca.**
- `Deriva-Rules.md` l.44 (condición 2): «otro agente o el humano puede volver a obtenerla siguiendo el método declarado, **y obtiene lo mismo**».
- NIST SP 800-86 §3.1.2 distingue la adquisición de datos de su posterior verificación. Lo que se reproduce es la verificación de la copia, no la observación de un sistema vivo.

**Impacto.**
- La figura promete, por D9, una reproducibilidad que la mitad de la evidencia real no puede dar. Hay dos clases:
  - **observaciones de un estado en un instante**: el disco, un sitio publicado, una captura de pantalla;
  - **derivaciones de un commit**.
- Tratarlas igual lleva a una de dos fallas: se «reproduce» y da distinto (falso P0), o se asume reproducible sin poder serlo.

**Dirección.**
- La forma distingue las dos clases de evidencia.
- Para la derivación: método anclado a un commit (`git show`/`git grep <commit>`) y condición 2 de D9 plena.
- Para la observación: **no se exige reproducibilidad, se exige preservación**. Se guarda el objeto adquirido, con su momento y su integridad. La condición que rige es la 3 (contemporánea), no la 2.

### V2-03 · P1 · Ancla E1 + E2: no hay cadena de custodia; el hash certifica el estado final, no la adquisición

**Qué se ve.**
- `git -C IA.SDD-exp1 status --short` devuelve `?? Expedientes/`. **Nada del expediente está versionado.**
- `SHA256SUMS` vive en la misma carpeta que los archivos que protege, con el mismo `mtime` (12:11) y sin ancla externa. Cualquiera que modifique una salida puede regenerarlo.
- **El propio expediente lo hizo, de buena fe.** Actuación 002 §6.2: `ev-05` «se corrigió a `grep -F`, se volvió a correr y **se re-hasheó** antes de citar». La primera adquisición no está preservada: queda la nota, no el objeto.
- Sólo `ev-01` registra hora. `ev-02` a `ev-05` no dicen cuándo corrieron, ni quién, ni en qué máquina. La tabla dice «el 2026-09-13».
- En las intervenciones previas, `ls PROMPTs/Fixs/0[4678]-*/OUTPUTs/evidencia | grep -i sum` sale **vacío**: ninguna tiene archivo de sumas.
- `Lab-Geometria/evidencia/` no tiene hashes de evidencia. La única mención a SHA-256 en `main` es un sello de caché de un bundle.

**Qué dicen las fuentes.**
- NIST SP 800-86 §3.1.2: la cadena de custodia implica «keeping a log of every person who had physical custody of the evidence, documenting the actions that they performed on the evidence and at what time, [...] making a copy of the evidence and performing examination and analysis using only the copied evidence, and verifying the integrity of the original and copied evidence».
- NIST SP 800-86 §4.2.2: el digest del original se calcula «before the image is performed» y «all results should be documented».
- RFC 3227 §4.1 pide documentar «Where, when, and by whom was the evidence discovered and collected» y «handled or examined». §4.2 pide que «It should be possible to detect unauthorised access».

**Impacto.**
- Hoy un hash sólo prueba que la salida no cambió **desde que alguien calculó las sumas por última vez**, y esa persona puede ser la misma que la cambió.
- Una corrección como la de `ev-05`, que acá fue honesta, queda indistinguible de una manipulación.
- Pedir «las pruebas quedan como especificación» sin custodia convierte en especificación objetos cuya historia no se puede reconstruir.

**Dirección.**
- La integridad se fija **en el acto de adquisición**, en un soporte que quien la manipula después no pueda reescribir sin dejar rastro: commit empujado, folio posterior que la cite, o sello de tiempo de terceros (RFC 3161).
- Cada acto de custodia (adquirir, re-adquirir, redactar, mover) queda como asiento con quién, cuándo, dónde y qué.
- Una re-adquisición **no reemplaza** a la anterior: se agrega y la anterior se conserva o se declara perdida.

### V2-04 · P1 · Ancla E2: el testimonio del Product Owner no tiene tipo en D9, y tal como se asienta cae en lo que D9 excluye

**Qué dice D9.**
- `Deriva-Rules.md` l.53: `humano` es «una aprobación explícita registrada con fecha».
- l.55: no es evidencia «una captura de una conversación».
- l.46 (condición 4): «no vale como evidencia la propia afirmación reformulada, ni el resumen que produjo el mismo agente en el mismo paso».

**Qué es la actuación 001.**
- No es una aprobación: es un **pedido**.
- Su «Fuente» es «Encargo del Product Owner a la corrida», es decir, una conversación.
- La asentó «el orquestador [...] por transcripción literal», que es el mismo agente que después la interpreta (§3). No hay objeto original preservado (id de sesión, export, hash del mensaje), sólo la transcripción.
- La fecha es el día, sin hora.

**Hay un precedente que sí funciona, y justo por ser una aprobación.** `RPI.VideoControl` en `HEAD`:
- `Linea-Base-Visual.md:35`: `[EV-00001 | humano | 03-UX-UI-DX/Bitacora-Validacion-Maqueta.md | §2, entrada «Aprobación de la maqueta»: «si aprobada» | 2026-08-11]`
- La bitácora (l.86) asienta el literal **junto con la pregunta exacta que se le hizo**.

**Impacto.**
- Por la letra de D9, el testimonio del PO es hoy **o no es evidencia** (captura de conversación) **o se fuerza al tipo `humano`** sin ser aprobación.
- Las dos salidas son malas. La primera deja sin respaldo el origen de todo el caso. La segunda le da peso de aprobación a un pedido.
- Además, un testimonio **prueba que la persona dijo X en tal momento, no que X sea cierto**. Si se mezcla con la evidencia de estado del sistema, se pierde esa distinción.

**Dirección.**
- Un tipo o figura de **testimonio** distinto de `humano`/aprobación, con lo mínimo de custodia:
  - literal sin editar;
  - lo que se le preguntó, si respondía a una pregunta;
  - fecha y hora literales;
  - quién lo asienta y desde qué soporte;
  - referencia localizable al original, o constancia de que el original no se preserva.
- Su alcance probatorio queda declarado: prueba la manifestación, no el hecho.
- El roce con «captura de una conversación» se resuelve en la norma: qué hace que un asiento literal fechado deje de ser una captura. No se resuelve por interpretación.

### V2-05 · P1 · Ancla E2: «las pruebas quedan como parte de las especificaciones» mezcla dos modos que D9 separa a propósito

**Qué dice D9.**
- `Deriva-Rules.md` l.34-38: las afirmaciones «De especificación o de intención» y «De diseño o de decisión» → «¿Aplica D9? **No**».
- l.40: «Lo que se decide o se pide no necesita evidencia, se necesita justificación. Lo que se afirma que ya es, sí».
- l.45 (condición 3): «Una evidencia sin fecha no dice nada sobre el presente».

**Contra qué choca el pedido P4** (actuación 001 §3). La evidencia es por naturaleza **indicativa y fechada**: vale para el instante en que se obtuvo. La especificación es **imperativa y vigente**: rige hasta que se la cambia. Una prueba que «queda como especificación» envejece sin que nada lo marque.

`ev-01` lo muestra en cuatro minutos: la «carpeta vacía» ya tiene contenido (V2-02).

**Impacto.**
- Un agente posterior lee una salida de hace meses como si describiera el presente.
- Peor aún, puede leer el literal del PO como requisito vigente cuando era una manifestación de ese día.

**Dirección.**
- La evidencia **no se convierte en especificación: la especificación la cita**, con el formato de D9 y su fecha, como fundamento de una decisión o como respaldo de una afirmación de estado.
- El vínculo va en los dos sentidos: cada pieza de evidencia registra qué afirmaciones o decisiones funda.
- Un cambio posterior de la especificación no toca la evidencia. Deja una cita nueva.

Así P4 se cumple en su intención («queden como parte») sin romper la separación de modos.

### V2-06 · P2 · Ancla E1: segundo esquema de identificador para evidencia, al lado de la familia `EV` ya acuñada

**Qué muestra la ejecución.**

```
$ git -C RPI.VideoControl grep -nE '\[EV-[0-9]' HEAD -- SDD | wc -l
62
$ git -C Lab-Geometria grep -nE '\[EV-[0-9]' main -- SDD | wc -l
0
$ grep -n '`EV`' IA.SDD/SDD/Devs/Rules/Root-Rules.md
445:`VER`, `EV`, `EVE`, `ISSUE`, `OPS`, `EXT`, `STAGE`, `ENV`, `DOD` y equivalentes.
```

- El expediente numera su evidencia `ev-01` … `ev-05`, en minúscula, con dos dígitos y ámbito del expediente.
- D9 (`Deriva-Rules.md` l.48-51) fija `EV-XXXXX` y una cita de cinco campos.
- `Root-Rules.md` l.443-445 ya declara `EV` como **familia del producto**.
- Con estos comandos no afirmo que `ev-NN` colisione léxicamente con otro uso. **Sí afirmo que es un segundo esquema para el mismo concepto**, y que un destino que ya usa `EV-00001` (VideoControl) va a tener los dos.

**Impacto.**
- Hay ambigüedad de referencia: `ev-01` del expediente 0001 contra `ev-01` del 0002 contra `EV-00001` del producto.
- Una especificación que cite evidencia de expediente no puede usar el formato obligatorio de D9 sin mapear.
- Esto rompe el vínculo de V2-05.

**Dirección.** Decidir si la evidencia de expediente **es** evidencia D9, con la misma familia y un ámbito declarado, o una familia distinta con prefijo propio y regla de cita. No se admiten dos esquemas para lo mismo. La forma del identificador corresponde a Requisitos y a V1; mi competencia es que la cita sea localizable y única.

### V2-07 · P2 · Ancla E1: evidencia con datos personales e identidades locales en repositorios públicos

**Límite de mandato.** Esto pertenece a Seguridad, que fue postergada (actuación 002 §3.3). Lo señalo sólo en lo que toca a preservación contra publicación de evidencia, no como evaluación de seguridad.

**Qué muestra la ejecución.**

```
$ curl -s -o /dev/null -w '%{http_code}' https://api.github.com/repos/<repo>
hdcm-dev/IA.SDD 200 · hdcm-dev/IA.SDD.Documentacion 200 · hdcm-dev/Lab-Geometria 200 · HDCM-Infra/RPI.VideoControl 404
$ grep -rl "/home/fernando" IA.SDD.Documentacion-exp1/PROMPTs/Fixs/0[4678]-*/OUTPUTs/evidencia | wc -l
21
$ git -C Lab-Geometria grep -n "ADOLFO VERA" main
main:evidencia/2026-09-02-mesa-ux/README.md:14:| `adm-cuentas-1440.png` | «ADOLFO VERA» en versalitas grises; ...
```

- Un 200 anónimo indica repositorio público. El 404 puede ser privado o inexistente.
- Los guiones y las salidas del expediente, destinados a vivir en `IA.SDD`, llevan rutas absolutas con el usuario local y la topología del workspace.
- `Lab-Geometria` publica capturas de un «panel de cuentas» con un nombre propio. **No puedo determinar si es un dato real o un dato de prueba**, y lo dejo declarado.
- La compuerta de ofuscación (`Rules-Base-Conocimiento.md` l.162-166: «`IA.SDD` es un repositorio público. Ningún documento puede llevar [...] datos reales») **alcanza a `Conocimiento/`**. No hay regla que la extienda a evidencia de expediente.

**Impacto.**
- La tensión es propia de la evidencia digital: la integridad pide no alterar el objeto y la publicación pide redactarlo.
- En git, además, retirar algo ya empujado exige reescribir historia. Eso rompe la base de la corrida (`Master-Prompt.md` §8.1: «el historial se reescribió» → no se puede calcular) y todos los hashes y citas posteriores.

**Dirección.**
- Separar **preservación** (el original, donde corresponda su acceso) de **publicación** (una copia redactada, declarada como derivada, con su propio hash y referencia al original).
- La compuerta de publicación corre **antes del primer commit de la evidencia**, no después.
- Solicito que Seguridad lo trate (§5).

### V2-08 · P3 · Ancla E1 + E2: el hash propio no es redundante con git, pero lo que agrega depende de dónde y cuándo se ancla

**Qué muestra la ejecución.**

```
$ git -C IA.SDD rev-parse --show-object-format      → sha1
$ git -C Lab-Geometria rev-parse --show-object-format → sha1
```

**Lo que dicen las fuentes y el framework.**
- La documentación de git (*hash-function-transition*) dice que SHA-1 «is still weak», aun con la implementación endurecida posterior a SHAttered, y que «it's considered prudent to move past any variant of SHA-1».
- Las fechas de autor y de commit las declara quien commitea: **git no prueba tiempo**. RFC 3161 existe justamente para probar que «a datum existed before a particular time».
- `Master-Prompt.md` §8.1 ya prevé que el historial se reescriba.

**Cuándo agrega y cuándo no.**
- **Mientras la evidencia no está commiteada**, que es el estado actual del expediente (V2-03), `SHA256SUMS` es la **única** integridad que hay. Pero no está anclada.
- **Una vez commiteada y empujada**, sobre archivos de texto versionados agrega poco para detectar cambios: el árbol del commit ya los fija.
- Aporta cuando:
  - la evidencia sale del repositorio (se exporta, se adjunta, se redacta, V2-07);
  - es binaria y va por LFS o por un almacenamiento aparte;
  - se quiere independencia del algoritmo de git;
  - el digest se sella fuera del repositorio.

**Impacto.** Si la norma exige hash «porque sí» se vuelve ceremonia, y si lo prohíbe «porque git ya lo hace» deja sin integridad el tramo previo al commit y toda copia exportada.

**Dirección.**
- La norma declara **qué propiedad pide** (integridad desde la adquisición, prueba de existencia en el tiempo, verificabilidad fuera de git) y **qué mecanismo la da en cada tramo**, en lugar de fijar un archivo de sumas como obligación de forma.
- Advierto que NIST SP 800-86 (2006) recomienda SHA-1 y MD5 en §4.2.2. En ese punto está desactualizada y no conviene citarla para el algoritmo.

---

## 3. Respuestas desde mi competencia

**Q1. Dónde vive.**
- Sobre la ubicación documental: fuera de mi competencia.
- Desde custodia: la evidencia vive **donde se pueda preservar con acceso y control adecuados**. Eso no siempre coincide con donde vive el expediente cuando el repositorio es público (V2-07).
- Si el expediente del framework va en la raíz de `IA.SDD`, sus guiones son scripts en un repositorio cuyo `SDD-Development-Guide.md` §II.7 l.275-276 dice «No hay binarios, ni scripts». Si esa sección alcanza al repositorio o sólo al conjunto normativo lo decide otra comisión (§5).

**Q2. Cuándo se abre.** Fuera de mi competencia. Desde evidencia, un solo criterio: si hay evidencia de **observación** que no se va a poder volver a obtener (V2-02), hay algo que preservar, y eso empuja a registrar.

**Q3. Forma mínima.** Desde mi competencia, cada pieza de evidencia lleva:
1. identificador único citable (V2-06);
2. clase: derivación de commit, observación de instante o testimonio;
3. método: comando anclado a commit, o medio de adquisición localizable desde el repositorio;
4. momento con fecha y hora;
5. quién adquirió y dónde;
6. integridad registrada en el acto;
7. asientos de custodia posteriores;
8. qué afirmaciones o decisiones funda.

**Q4. Numeración.** La del expediente, fuera de mi competencia. La de la evidencia, ver V2-06.

**Q5. Estados y ciclo de vida.** Fuera de mi competencia, salvo esto: el cierre del expediente no debe cerrar la evidencia. La evidencia citada por especificación vigente sigue viva mientras la cita exista.

**Q6. Inmutabilidad y foliatura.**
- Una actuación no reescrita no alcanza para ser inmutable: hace falta que su integridad quede fijada fuera del alcance de quien la escribe (commit empujado u otra ancla, V2-03).
- La corrección de una evidencia es una **re-adquisición asentada**, nunca un reemplazo con re-hash (caso `ev-05`).

**Q7. Evidencia.**
- **Procedencia**: método localizable **desde el repositorio**. El medio A citado por ruta externa no cumple (V2-02).
- **Integridad**: se fija en la adquisición y se ancla (V2-03, V2-08). Nunca se transcribe a mano (V2-01).
- **Testimonio del PO**: evidencia de primer orden **de lo que el PO manifestó**, no del estado del sistema. Va con literal, pregunta, fecha y hora, quién asienta y referencia al soporte original o constancia de que no se preserva (V2-04).
- Con D9 tal como está hoy, no encaja: no es aprobación y se acerca a la «captura de una conversación». Hace falta que la norma lo resuelva.
- **Datos personales**: V2-07, con convocatoria.

**Q8. Paso a especificación.** La evidencia no se convierte en especificación. La especificación la cita con el formato D9 y su fecha, y la evidencia registra a qué afirmaciones o decisiones sostiene. Vínculo en los dos sentidos, sin copiar contenido (V2-05).

**Q9. Relación con `SDD/Docs/Audit/` y reportes.** Desde evidencia, D9 ya admite el tipo `audit` (l.53). Un hallazgo de audit que cite evidencia de expediente debe poder hacerlo con la misma cita. El resto, fuera de mi competencia.

**Q10. Retroactivo sin reescribir historia.**
- Lo previo **se referencia por commit, no se re-hashea ni se mueve**. Mover rompe la localización de citas existentes.
- Una incorporación retroactiva es un acto de custodia nuevo con su fecha. No simula haber adquirido antes.
- D9 l.59 ya fija el criterio de no retroactividad.
- **Advertencia**: retirar retroactivamente datos personales ya publicados (V2-07) sí obliga a reescribir historia y rompe §8.1. Se decide con Seguridad.

**Q11. Mesa y no detención.** Fuera de mi competencia. Anoto una sola cosa: el origen del hecho de §8.1 se calcula contra la base de la corrida, y la evidencia de observación no vive en ningún commit. §8.1 ya lo resuelve («se trata como de la corrida»).

**Q12. Punto de continuación.** Fuera de mi competencia. Desde custodia: el punto de continuación debería declarar qué evidencia está **adquirida pero no anclada**, porque es la que se pierde si la corrida se corta. Hoy es todo `evidencia/` (V2-03).

---

## 4. Lo que revisé y está bien

1. **La integridad verifica y la mayor parte reproduce.** `sha256sum -c SHA256SUMS` da 10/10 correctas. `ev-02` a `ev-05` reprodujeron el mismo digest cuatro minutos después.
2. **La actuación 002 §6.2 declara su propio error de adquisición** (`grep` sin `-F`) en lugar de ocultarlo, y deja la nota dentro del guion. Es la conducta correcta. Lo que falta es preservar el objeto superado (V2-03).
3. **Separaciones y precedente bien hechos.**
   - La actuación 001 separa el literal del PO (§1) de las precisiones del orquestador (§2) y de su interpretación (§3), cada una con su autoridad.
   - El precedente de VideoControl (`EV-00001`, bitácora l.86) asienta la aprobación con su pregunta y su fecha. Es un buen modelo para el asiento humano.

---

## 5. Solicitudes de convocatoria

1. **Seguridad (AG-00050).** Datos personales, identidades locales y posibles credenciales en evidencia de repositorios públicos: 21 archivos con rutas de usuario en `IA.SDD.Documentacion`, el nombre propio en `Lab-Geometria/evidencia/2026-09-02-mesa-ux/`, y los guiones del expediente destinados a `IA.SDD`. Incluye el dilema redactar o reescribir historia contra integridad y base de la corrida (V2-07).
2. **V1 y V4 (o quien tenga la competencia).** Si `SDD-Development-Guide.md` §II.7 («No hay binarios, ni scripts») alcanza a los guiones de evidencia en `Expedientes/` en la raíz de `IA.SDD`, y si esa carpeta entra o no en el snapshot `_legacy/` según §VI.5.
