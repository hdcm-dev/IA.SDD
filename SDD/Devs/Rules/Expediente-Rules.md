# Reglas constructivas — Expediente de caso

**Carpeta target:** `SDD/Expedientes/` del repositorio destino; `Expedientes/` en la raíz del repositorio del framework
**Nivel de aplicación (`Vocabulario-Rules.md` §4 R3):** Framework
**Agente target:** los tres orquestadores y AG-00970 (Presidente de mesa) en tiempo de ejecución; quien interviene el framework cuando el caso es del framework
**Versión de las reglas:** 1.0

---

## 0. El problema que resuelve, y qué no

**El método tiene un contenedor por artefacto y ninguno para el caso que los atraviesa.** Un ADR guarda
una decisión; un informe de audit, una ronda; el registro de mesa, un ciclo; el informe de estado, una
reanudación; el ítem diferido, un hueco; la fila de control de cambios, una versión de un archivo. Un
**caso** —un pedido, un incidente, una contradicción— atraviesa varios de ésos, a veces varias corridas y
a veces más de un repositorio, y no tenía dónde quedar entero. Medido sobre un destino real: reconstruir
el estado de una fase exigió abrir nueve archivos de tres directorios y una rama, siguiendo
identificadores con `grep`, y el desenlace estaba en el roadmap y no en `Audit/`. El mismo día en que el
Product Owner pidió la figura, **dos corridas la inventaron con dos formas distintas**, y otras dos ya
existían en el corpus con otro nombre.

**Tampoco tenía dónde quedar la evidencia que funda una decisión**, y menos la palabra del Product Owner:
el primer expediente del framework presentó como literal un pedido que estaba normalizado, reordenado y
recortado, y lo descubrió una réplica, no la primera lectura.

**Lo que esta regla no hace:**

| No hace | Por qué |
| --- | --- |
| **No muda nada de `SDD/Docs/Audit/`** | El registro de mesa y los informes de migración, de estado y de audit siguen donde `Mesa-Rules.md` §2.1, `Migracion-Rules.md` §2.1 y `Master-Prompt-Reanudacion.md` §5 los ubican. El expediente los folia por enlace (§5) |
| **No convierte la evidencia en especificación** | D9 separa lo que se afirma que ya es de lo que se pide (`Deriva-Rules.md` §1). La evidencia **funda** la especificación, y el artefacto que cambia la cita (§5) |
| **No toca D9 ni el ciclo de origen** | §3.3 aplica el tipo `humano` que D9 ya tiene; `Master-Prompt.md` §8.2 y `Root-Rules.md` §12 se calculan y no reciben un dato declarado |
| **No es una ceremonia** | La forma mínima son **diecinueve campos** en un caso de dos folios (§3), ninguno derivable del árbol o del control de versiones, y se verifica enumerando (§6). El primer plan de la figura pedía cuarenta y siete campos y doce pasos, y el ejemplar que lo proponía no cumplía dos de sus reglas en ninguno de sus commits |
| **No fija la convención de mensajes de commit** ni exige un commit por folio | El framework no la fija (`Coherencia-Conformacion-Pull-Request-Manual.md` §2), y un commit por folio se pierde con una fusión que aplasta la historia |
| **No distribuye código** | Cada comando de verificación vive en §6, en el texto que lo funda (`SDD-Development-Guide.md` §II.7) |
| **No es retroactiva** | Lo escrito antes de esta regla queda como está (§5.1) |

**De dónde toma su forma.** De la práctica de los expedientes administrativos y judiciales (conjunto
ordenado de actuaciones foliadas por orden de incorporación, carátula con identificación que se conserva,
correcciones por actuación nueva), de la gestión documental (ISO 15489-1: un registro es íntegro y no se
corrige después) y de la evidencia digital (ISO/IEC 27037, RFC 3227: integridad desde la adquisición y
asiento de cada acto de custodia). Las comisiones que la diseñaron las nombran con su alcance en el
expediente `0001` del framework, folios 004 a 011.

---

## 1. Cuándo se abre un expediente, y cuándo no

**Es una condición que se observa al abrir.** Se abre un expediente cuando se cumple **alguna** de las dos
ramas **y ninguna** de las exclusiones describe al caso entero:

1. **El caso atraviesa más de una corrida o más de un repositorio, y la presentación lo muestra**: pide
   un acto que esta corrida no ejecuta —una intervención sobre el framework, otra migración, una decisión
   del Product Owner que no llega en esta corrida— o el hecho nació en otro repositorio que el que lo trata.
2. **Entra al árbol material externo que funda una decisión**: un testimonio, una captura o un archivo que
   aporta el Product Owner o que obtuvo un agente fuera del repositorio.

**Exclusiones.** No se abre cuando el caso entero es:

- una **mesa** que ya deja su registro en `SDD/Docs/Audit/` (`Mesa-Rules.md` §2.1);
- una **detención** que sale en el lote de `Master-Prompt.md` §7.0 y se contesta ahí;
- una **autocorrección** (`Master-Prompt.md` §8.1), un **audit de fase** (§10) o un **ítem diferido** en
  forma (`Root-Rules.md` §12.2);
- lo que **se contesta con un comando** y una cita del árbol.

Si el caso cumple una rama y además contiene una mesa o una detención, se abre, y esas piezas se folian
por enlace (§5).

**Dónde se radica.** En el repositorio **donde corre la corrida que trata el caso**. El otro repositorio
se nombra en la carátula (`Origen`) y, si también tiene expediente sobre el mismo caso, cada uno cita al
otro por su cita calificada (§3.1).

**La custodia de un testimonio no depende de que se abra un expediente.** La forma de §3.3 rige en el
expediente y en los **dos lugares donde la aprobación se produce**: la respuesta al lote de
`Master-Prompt.md` §7.0 y la respuesta a una escalada de `Mesa-Rules.md` §7.1. Rige desde esta regla hacia
adelante.

---

## 2. Dónde vive

| Repositorio | Carpeta | Por qué ahí |
| --- | --- | --- |
| **Destino** | `SDD/Expedientes/<NNNN>-<Titulo>/`, hermana de `SDD/Docs/` | No es prosa generada por una categoría: es registro, como `SDD/Maquetas/` es material del humano (`Master-Prompt.md` §3.5) |
| **Framework** | `Expedientes/<NNNN>-<Titulo>/`, en la raíz | Es la ruta que fijó el Product Owner. El framework no tiene `SDD/Docs/`, y su `SDD/` es el conjunto normativo que se archiva entero por versión |

**Tres exclusiones, declaradas y no deducidas de la carpeta:**

- **Del snapshot `_legacy/<versión>/`** (`SDD-Development-Guide.md` §VI.5): un expediente es acumulativo,
  su historia es su contenido y no condiciona lo que el orquestador genera. Estar en la raíz no alcanza:
  `Conocimiento/` y `Examples/` también están en la raíz y entran.
- **De la migración normativa** (`Migracion-Rules.md` §2.2): no se migra, no se renumera, no se re-expresa.
- **De la compuerta de fase** (`Master-Prompt.md` §10.0) y del audit: lo verifican los criterios de §6.

**Se conserva siempre.** Un expediente no se elimina cuando su propuesta queda aplicada: es la excepción a
la eliminación de registros absorbidos de `SDD-Development-Guide.md` §I.2.

**Autosuficiencia.** Un expediente del framework nombra otros repositorios **públicos** como texto, sin
enlaces; los privados se ofuscan (§4, S2). El `README.md` del framework lo declara.

---

## 3. La forma mínima, y la completa

**Nada que se pueda leer del árbol o de git se escribe a mano.** El índice es el listado de
`actuaciones/`; el estado se deriva de los folios (§3.2); el punto de continuación es el pase del último
folio.

```text
<NNNN>-<Titulo>/
├── README.md                    carátula: Número · Título · Objeto · Apertura · Origen · Base        → 6 campos
│                                y la línea de remisión (abajo)
├── actuaciones/
│   └── NNN-<tipo>-<slug>.md     cabecera: Tipo · Fecha · Autor · Corrige                             → 4 campos
│                                última línea no vacía, el pase: «Sigue: <acto> · <quién>»             → 1 campo
│                                si asienta palabras de una parte: bloque literal + Canal · Fecha-hora · Huella → 3 campos
└── evidencia/                   sólo si hay
    └── NNN-<slug>.<ext>         abre con: Método (o Comando o Medio) · Base (o Fecha-hora) · Quién  → 3 campos
```

**Contados sobre un caso de dos folios** —una presentación con el testimonio del Product Owner y una
resolución—: README 6, folio 001 con 4 + 1 + 3, folio 002 con 4 + 1: **diecinueve campos y tres
archivos**. Lo que no está en esta lista no es obligatorio.

**La carátula.** Seis filas de una tabla de dos columnas, **fijas desde la apertura**: número; título;
**objeto** —de una a tres oraciones que dicen de qué trata el caso—; fecha de apertura; origen (quién
presentó, por qué vía, y el folio); base (el commit corto del repositorio al abrir). Un objeto mal escrito
se rectifica con una `constancia` con `Corrige`, nunca editando la carátula. Después de la tabla, esta
línea y nada más:

```text
Índice: `ls actuaciones/`. Fecha y autor: `grep -h '^| Fecha |\|^| Autor |' actuaciones/*.md`. Estado y qué sigue: el pase del último folio.
```

**La actuación.** Un archivo por folio. Cuatro filas de cabecera en tabla —`Tipo` de §3.2, `Fecha`,
`Autor` (un rol, nunca un nombre propio) y `Corrige` (el folio que corrige, o `—`)— y, como **última línea
no vacía**, el pase: `Sigue: <acto> · <quién>`. Si el acto que sigue tiene un evento observable que lo
cierra, el pase lo nombra: `Sigue: <acto> · <quién> · Cierra con: <artefacto §sección>`. El número de
expediente y el de folio no se declaran: se leen de la ruta. **Un folio `archivo` no lleva pase.**

**Lo que se asienta verbatim, y dónde.** En el **framework**, que no tiene `Audit/`, el expediente es el
registro de la mesa: cada informe de comisión, de refutador, de jurado o de auditor entra como folio
`informe` **sin editar**. En un **destino**, los informes viven en el registro de `Audit/` y el
expediente los folia con **una** constancia `ruta@commit` (§5); copiarlos es el anti-patrón de §7.

**La forma completa**, sólo cuando corresponde:

- la **carta de cada despacho** en `evidencia/`, antes de despachar (§3.5);
- la **constancia** que folia por `ruta@commit` los artefactos de `Audit/` que el caso produjo (§5);
- una **resolución** con un veredicto por criterio del caso, con la forma de la comprobación 13 de
  `SDD-Development-Guide.md` §VI.3;
- en el pase del folio que despachó: los insumos, qué se invalida si la corrida se corta, y las escaladas
  abiertas con su `SI NO RESPONDÉS`.

### 3.1 Número, folio y cómo se cita

**El número es local al repositorio: cuatro dígitos, correlativo, nunca reciclado.** `0001`, `0002`. La
carpeta es `<NNNN>-<Titulo>`, con el título en Título-Con-Guiones (D3) que admite un punto interno entre
dígitos o letras (`Migracion-A-13.18`). **La carpeta no se renombra nunca.** El folio son tres dígitos
contiguos desde `001`, asignados **al incorporar**: el siguiente libre, nunca uno reservado.

**No se acuña un prefijo de familia.** El número y el folio son **familias excluidas** del sistema de
identificadores (`Root-Rules.md` §9.2): no se citan desnudos, su identidad es la carpeta —inmutable por S1
y única por A1— y por eso no toman ámbito de §9.1. Medido antes de decidirlo: un prefijo `EXP-` de cuatro
dígitos ya vive en un destino público, y `ev-`/`EV-` para la evidencia colisiona con la familia `EV` de
D9. La evidencia se nombra `NNN-<slug>`, por posición.

**Cómo se cita.** Desde el mismo repositorio, por la ruta de la carpeta —`SDD/Expedientes/<NNNN>-<Titulo>/`,
o `Expedientes/<NNNN>-<Titulo>/` en el framework—, con el folio en la prosa («folio 004») y la evidencia
como «evidencia 003». Desde otro repositorio, la **cita calificada**: el nombre del repositorio remoto
(`basename -s .git "$(git remote get-url origin)"`), una barra y la ruta:
`<repositorio>/SDD/Expedientes/<NNNN>-<Titulo>/`. Nunca una ruta relativa ni una ruta absoluta del host.
**Toda ruta ilustrativa en una regla o un ejemplo lleva `<Titulo>`**, nunca un título concreto.

### 3.2 Tipos de actuación y estado derivado

**Seis tipos, conjunto cerrado.** El tipo va en la cabecera y en el nombre del archivo, y A4 comprueba
que coincidan.

| Tipo | Qué es | Estado en que deja el expediente |
| --- | --- | --- |
| `presentacion` | Una parte presenta el caso | **abierto**; **reabierto** si su `Corrige` nombra una `resolucion` o un `archivo` |
| `providencia` | Impulso del trámite: convoca, despacha, ordena | **en trámite** |
| `informe` | Comisión, refutador, jurado, auditor u orquestador, verbatim y con autor | **en trámite** |
| `constancia` | Un hecho, una corrección propia, una incorporación de antecedentes, una redacción S2 | **en trámite**; **suspendido** si lleva `Suspende hasta: <artefacto §sección>` |
| `resolucion` | Decide, motivada, con veredicto por criterio | **resuelto** |
| `archivo` | Cierra, con `Motivo: <aplicado y verificado \| cerrado por decisión, con lo abierto enumerado \| desistido>` | **archivado** |

**El estado se deriva de la secuencia, no del último folio a secas:**

1. Se recorren los folios en orden. **Un folio con `Corrige` distinto de `—` no cambia el estado**, salvo
   la reapertura: una errata posterior a una resolución no reabre el caso.
2. **Reabrir** es una `presentacion` cuyo `Corrige` nombra la `resolucion` o el `archivo` que reabre, y
   sólo con un ancla E1 o E2 de contradicción (`Mesa-Rules.md` §6.1).
3. **Después de un `archivo`** sólo caben una reapertura o una `constancia` con `Corrige` (errata).
4. **`Suspende hasta:` rige hasta el folio siguiente**; si la suspensión sigue, ese folio repite la línea.

### 3.3 El testimonio de una parte

**El original es la pieza; toda versión legible es derivada y declara qué transformó.** Un folio que
asienta palabras del Product Owner —o de cualquier parte cuya palabra funda algo— lleva **un solo** bloque:

1. el **literal byte a byte** entre una línea que dice exactamente ` ```testimonio ` y una línea que dice
   exactamente ` ``` `: sin corregir la ortografía, sin reordenar, sin recortar. Si el original es un
   archivo, además va a `evidencia/` y el folio lo cita;
2. tres filas de tabla: `Canal` (por dónde llegó, y la pregunta exacta si respondía a una), `Fecha-hora`
   con zona, y `Huella`: el SHA-256 **del bloque tal como lo extrae A8** —líneas terminadas en LF, con el
   salto final—, escrito entre acentos graves. Esa huella es distinta de la del archivo original cuando
   éste no termina en salto de línea, y la del archivo va en su pieza de `evidencia/`.

**Se clasifica por lo que contiene cada pasaje, no por el canal:**

| El pasaje es… | Qué es para el método |
| --- | --- |
| una **aprobación** («está aprobado», «tenés el OK») | Evidencia de tipo `humano` de D9. **El asiento con literal, canal, fecha-hora y huella es la «aprobación explícita registrada con fecha» de `Deriva-Rules.md` §1**; lo que D9 excluye como «captura de una conversación» es la cita sin ese registro |
| un **pedido** o una **intención** | Fuente de intención, fuera de D9. Pasa a ancla E4 cuando queda asentado como decisión cerrada o restricción del contrato de entrada de una mesa |
| una **afirmación sobre el estado del sistema** | Ancla `C` hasta que la corrobore un `artefacto` o una `ejecucion`: prueba que la parte lo dijo, no que sea cierto |
| una **declaración del dueño sobre la visibilidad** de un destino | Excepción fechada de S2 para ese destino (§4) |

**Si hubo que redactar el testimonio por S2**, la marca de redacción es la única transformación admitida;
`Huella` es la del bloque publicado y se agrega la fila `Huella del original`.

### 3.4 La evidencia

| Clase | Qué es | Qué se le exige |
| --- | --- | --- |
| **Medición** | Una derivación de un commit: `git show`, `git grep` o `git ls-tree` sobre un commit, nunca sobre el árbol de trabajo | Reproducible contra la misma base (condición 2 de D9) |
| **Observación** | Un estado vivo o una captura: una sonda de red, un sitio publicado, una pantalla | Se preserva con fecha, hora, zona y medio; no se le exige reproducir (condición 3 de D9) |

Cada pieza **abre con tres líneas**: `Método:` (o `Comando:` o `Medio:`), `Base:` (o `Fecha-hora:`) y
`Quién:` (un rol). Una pieza que no admite texto al inicio —una imagen— lleva al lado `NNN-<slug>.txt`
con esas tres líneas. **Ninguna pieza es ejecutable**: un guion se asienta como texto, sin permiso de
ejecución. **Huella sólo para lo que no está versionado o sale del repositorio**; sobre lo versionado, git
ya da integridad y una huella copiada a mano se desincroniza. **Una corrida descartada se conserva**, con
una constancia que diga por qué.

### 3.5 La carta de un despacho

Cuando un folio despacha agentes, **el texto que se despacha se asienta en `evidencia/` antes de
despachar**, verbatim, y el pase nombra el despacho abierto. Un despacho que no quedó asentado no se puede
repetir igual, y dos paneles con cartas distintas no son comparables.

---

## 4. Los tres momentos, y el sellado

**Abrir**, antes del primer folio:

1. Evaluar la condición de §1, con su precedencia.
2. **Verificar la visibilidad de cada repositorio que el caso nombra** (S2) y asentarla en el folio 001:
   pública, privada o pública por declaración del dueño.
3. Crear `<NNNN>-<Titulo>/` con el siguiente número libre y la carátula de seis campos.
4. Asentar el folio 001 con su testimonio, redactado por S2 **antes** de asentarlo.

**Despachar**, cada vez que un folio convoca agentes:

1. **Comprobar que no queda vivo un despacho anterior del mismo rol.** Leer la ausencia de un informe
   como ausencia de trabajo ya produjo un panel duplicado.
2. Asentar la carta en `evidencia/`.
3. Escribir la providencia con el pase que nombra los despachos abiertos.

**Publicar o cerrar**:

1. **Antes de cada push que toque la carpeta**, correr A11. La compuerta corre siempre, sea el destino
   público o privado.
2. Correr A1 a A10 y A12.
3. En un destino, foliar por `ruta@commit` los registros de `Audit/` que el caso produjo.
4. Cuando lo resuelto quedó aplicado y verificado, asentar el `archivo` con su `Motivo`.

**S1 · Nada cambia después del primer push.** Ninguna pieza de la carpeta —actuación, evidencia, README—
se modifica, se borra ni se renombra después de publicarse; se comprueba contra la rama principal (A7).
Una corrección es un folio nuevo con `Corrige`. **Única excepción: la redacción S2** de un dato que no
debía publicarse, con un folio `constancia` que lleva la línea `Redacción S2:` y que registra las piezas
redactadas, su huella antes y después, los manifiestos regenerados y dónde queda custodiado el original
fuera del repositorio. Esa constancia declara además lo que la redacción **no** hace: **lo empujado no se
retira**; los commits anteriores siguen accesibles por su identificador y por el pedido de fusión que los
contiene, aunque la fusión aplaste la historia.

**S2 · La compuerta de datos que no se publican.** Corre al asentar cada pieza y, como A11, antes de cada
push. Distingue tres clases, cada una con su respuesta:

| Clase | Ejemplos | Respuesta |
| --- | --- | --- |
| **Secreto** | Credencial, token, clave, contraseña | **Revocar o rotar, siempre**, y después redactar. Redactar solo no alcanza: lo empujado no se retira |
| **Dato de un repositorio privado** | Su nombre, su organización, su dominio, su cliente; y de su infraestructura: direcciones, hosts, puertos, usuarios, dispositivos, topología, accesos. Un dato personal de una persona identificable | **No se asienta.** Del repositorio se usa el concepto de diseño con una descripción («un destino privado», «detalles de infraestructura, no transcriptos»). Si ya llegó, redacción S2 con constancia |
| **Dato del entorno de quien trabaja** | La ruta del directorio personal del host y su usuario, en cualquier codificación | Se redacta siempre, antes de asentar |

**Qué es público, verificado y no supuesto.** Un repositorio es **público** si se lee sin credenciales:
`env -u GIT_ASKPASS GIT_TERMINAL_PROMPT=0 git -c credential.helper= ls-remote <url-sin-credenciales> HEAD`
termina en cero. Es una **observación**: se asienta una vez por repositorio, con fecha y hora, y se repite
sólo si cambia el remoto. Un repositorio también es público de consulta **por declaración fechada de su
dueño**, asentada como testimonio (§3.3). El contenido que proviene de un repositorio público o declarado
así **no se redacta**, salvo secretos y datos del entorno. **La visibilidad decide sólo qué se responde;
nunca si la compuerta corre**, porque la visibilidad cambia y el expediente no.

**S3 · La rama que lleva un expediente no se fusiona aplastando la historia**, o se declara que el orden de
incorporación de los folios no es observable. S1 no depende de esto; lo que se pierde es la fecha de cada
incorporación, y quien fusiona decide sabiéndolo (`Master-Prompt.md` §12.1 T1).

---

## 5. El vínculo con la especificación, con `Audit/` y con lo ya escrito

**La evidencia funda la especificación; no se vuelve especificación.** Una decisión que el caso produce
cambia un artefacto normal —un ADR, una regla, el intake, un ítem diferido— y **la fila de control de
cambios de ese artefacto nombra la carpeta del expediente**, con el folio en la prosa, **o nombra la fila
del plan o del registro de `Audit/` que a su vez la nombra**. Es la única vía declarada. La dirección
inversa se deriva en dos pasos, sin tabla a mano:

```bash
d='Expedientes/<NNNN>-<Titulo>'
git grep -l "$d" -- . ':!*_legacy*' ':!'"$d"                                   # citas directas
git grep -l "$d" -- SDD/Docs/Audit | while read a; do git grep -l "$(basename "$a")" -- . ':!*_legacy*' ':!SDD/Docs/Audit'; done   # a través de Audit/
```

Todo patrón que una regla generalice desde un caso declara **cuántos casos lo sostienen**.

**`Audit/` sigue siendo la fuente de cada acto.** El expediente de un destino folia el registro de mesa y
los informes de migración, de estado y de audit con una constancia que cita `ruta@commit`: la ruta desde la
raíz y un commit **ancestro de la rama principal** (`git merge-base --is-ancestor <commit> <principal>`),
que se lee con `git show <commit>:<ruta>` aunque el archivo cambie después. Si la rama del caso se fusionó
aplastando la historia, los `ruta@commit` a commits de esa rama se re-folian al commit de la fusión con una
constancia. El registro de mesa nombra la carpeta del expediente en su cabecera (`Mesa-Rules.md` §2.2).
En el repositorio de documentación, un reporte es **el pase** del caso a una intervención: cita el
expediente con su cita calificada, y el expediente folia el reporte por nombre.

### 5.1 Lo ya escrito no se reescribe

Queda donde está y como está lo escrito antes de esta regla: los informes de `Audit/` de los destinos, las
carpetas `OUTPUTs/` de las intervenciones, las citas de palabras del Product Owner en cualquier artefacto,
y los **expedientes de forma histórica**, los que se abrieron antes de esta regla:
`Expedientes/0001-Expedientes-Como-Comportamiento-Del-Framework/` en el framework y
`Lab-Geometria/SDD/Expedientes/0001-Migracion-Normativa-A-13.16/` en un destino. Su nombre ya es conforme;
su contenido no se alinea, no se les exigen A2 a A12 —A10 los excluye de su búsqueda— y la reanudación no
los cuenta como pendientes. **Se les puede agregar folios**, que es alta y no modificación. Un caso **vivo**
con antecedentes anteriores abre su expediente con una constancia de **incorporación de antecedentes** por
`ruta@commit`, que declara que antes de esa fecha no tuvieron custodia.

---

## 6. Criterios de aceptación

Cada comando corre desde la raíz del repositorio, con `P` la carpeta padre (`SDD/Expedientes` o
`Expedientes`), `X` la carpeta de un expediente y `B` la rama principal:
`B=$(git rev-parse --abbrev-ref origin/HEAD | sed 's#^origin/##')`. Un comando que termina con error no es
«vacío»: es **no evaluable**, y se declara.

```bash
B=$(git rev-parse --abbrev-ref origin/HEAD | sed 's#^origin/##')     # rama principal; P y X los fija quien corre

# A1 · carpetas de cuatro dígitos, título conforme, sin números repetidos        → vacío
ls "$P" | grep -vE '^[0-9]{4}-[A-Za-z0-9][A-Za-z0-9.-]*[A-Za-z0-9]$'; ls "$P" | cut -c1-4 | sort | uniq -d

# A2 · carátula de seis campos, cada uno una vez, y el número igual al de la carpeta   → vacío
for c in Número Título Objeto Apertura Origen Base; do [ "$(grep -c "^| $c |" "$X/README.md")" = 1 ] || echo "CARÁTULA $c"; done
grep -q "^| Número | $(basename "$X" | cut -c1-4) |" "$X/README.md" || echo "NÚMERO"

# A3 · nombres de folio conformes y foliatura contigua desde 001                  → vacío
ls "$X/actuaciones" | grep -vE '^[0-9]{3}-(presentacion|providencia|informe|constancia|resolucion|archivo)-[a-z0-9-]+\.md$'
i=1; for f in $(ls "$X/actuaciones" | sort); do [ "$((10#${f%%-*}))" -eq "$i" ] || echo "SALTO $f"; i=$((i+1)); done

# A4 · cabecera de cuatro campos, cada uno una vez, y el tipo igual al del nombre   → vacío
for f in "$X"/actuaciones/*.md; do
  for c in Tipo Fecha Autor Corrige; do [ "$(grep -c "^| $c |" "$f")" = 1 ] || echo "CABECERA $c $f"; done
  grep -qE "^\| Tipo \| $(basename "$f" | cut -d- -f2) \|$" "$f" || echo "TIPO $f"
done

# A5 · todo Corrige nombra un folio anterior que existe                          → vacío
for f in "$X"/actuaciones/*.md; do
  c=$(sed -nE 's/^\| Corrige \| ([^ |]+) \|$/\1/p' "$f"); [ "$c" = "—" ] && continue
  { echo "$c" | grep -qxE '[0-9]{3}' && [ "$c" \< "$(basename "$f" | cut -c1-3)" ] && ls "$X/actuaciones/$c"-*.md >/dev/null 2>&1; } || echo "CORRIGE $f"
done

# A6 · el último folio termina con su pase, salvo el archivo, que no lo lleva       → vacío
f=$(ls "$X"/actuaciones/*.md | sort | tail -1); u=$(grep -v '^[[:space:]]*$' "$f" | tail -1)
if grep -qE '^\| Tipo \| archivo \|$' "$f"; then case "$u" in Sigue:*) echo "ARCHIVO CON PASE";; esac
else case "$u" in Sigue:*) ;; *) echo "SIN PASE $f";; esac; fi

# A7 · S1: nada cambió después de publicarse, salvo lo nombrado en una constancia S2 → vacío
p=$(git log --format=%H --diff-filter=A "$B" -- "$X/README.md" | tail -1)
if [ -z "$p" ]; then echo "NO EVALUABLE: $X no está en $B"; else
  git log -M --format= --name-status "$p..$B" -- "$P" | grep -E '^(M|D|R)' | grep -F "$(basename "$X")/" | awk '{print $NF}' | sort -u |
  while read r; do c=$(grep -lE '^Redacción S2:' "$X"/actuaciones/*.md 2>/dev/null); { [ -n "$c" ] && grep -qF "${r#"$X"/}" $c; } || echo "$r"; done
fi

# A8 · un solo bloque testimonio por folio, con cerco exacto y huella que verifica  → vacío
for f in "$X"/actuaciones/*.md; do
  n=$(tr -d '\r' < "$f" | grep -cE '^(```|~~~)[[:space:]]*testimonio'); [ "$n" -le 1 ] || echo "BLOQUES $f"; [ "$n" = 0 ] && continue
  grep -qx '```testimonio' "$f" || { echo "CERCO $f"; continue; }
  h=$(awk '/^```testimonio$/{b=1;next} /^```$/{b=0} b' "$f" | sha256sum | cut -c1-64)
  grep -qE "^\| Huella \| .$h. \|$" "$f" || echo "HUELLA $f"
done

# A9 · toda pieza de evidencia abre con sus tres líneas y no es ejecutable          → vacío
find "$X/evidencia" -type f 2>/dev/null | while read f; do
  case "$f" in *.txt|*.md|*.out|*.sh|*.py|*.json|*.diff|*.log) m="$f";; *) m="${f%.*}.txt";; esac
  { [ -f "$m" ] && [ "$(head -3 "$m" | grep -ciE '^(# |// )?(Método|Comando|Medio|Base|Fecha-hora|Quién):')" = 3 ]; } || echo "$f"
done
git ls-tree -r "$B" -- "$X" | grep -v '^100644 blob'

# A10 · toda cita local a un expediente resuelve (las calificadas y las históricas se excluyen)   → vacío
git grep -ohE '(^|[^/A-Za-z0-9._-])(SDD/)?Expedientes/[0-9]{4}-[A-Za-z0-9][A-Za-z0-9.-]*[A-Za-z0-9]' -- . ':!*_legacy*' ':!Expedientes/0001-*' ':!SDD/Expedientes/0001-*' |
  sed -E 's#^[^SE]*##' | sort -u | while read d; do [ -d "$d" ] || echo "$d"; done

# A11 · S2 sobre lo que se va a empujar: rutas y usuario del host, y nombres privados declarados en PRIV   → vacío
git log -p --format= "origin/$B..HEAD" -- "$P" | grep -E '^\+' | grep -iE "(/|-)home[/-][a-z0-9_]+|/Users/[A-Za-z]|C:\\\\Users|$(id -un)${PRIV:+|$PRIV}"

# A12 · todo registro de Audit/ que cita el expediente está foliado por ruta@commit (sólo en destino)   → vacío
git grep -l "Expedientes/$(basename "$X")" -- SDD/Docs/Audit 2>/dev/null | while read a; do grep -rqF "$a@" "$X/actuaciones" || echo "$a"; done
```

**A11 localiza sin decidir.** `PRIV` es la alternancia de los nombres de repositorios privados y sus
organizaciones que la verificación de visibilidad del paso 2 de «Abrir» asentó; vacía si no hay. Los
secretos no admiten un patrón universal y los mira I5.

- [ ] **A1** a **A12** `[enumerable]`, con los comandos de arriba.
- [ ] **I1** `[interpretativo]` La condición de §1 se aplicó con su precedencia: un expediente por cada mesa o por cada detención es el anti-patrón.
- [ ] **I2** `[interpretativo]` El pase del último folio es veraz: nombra el acto que sigue y quién lo hace, y no afirma un acto que ningún folio registra.
- [ ] **I3** `[interpretativo]` El testimonio se clasificó por contenido (§3.3).
- [ ] **I4** `[interpretativo]` Cada evidencia es pertinente a la afirmación que la cita.
- [ ] **I5** `[interpretativo]` Ninguna pieza lleva un secreto, y lo que viene de un repositorio privado es concepto y no infraestructura.

---

## 7. Anti-patrones

| Situación | Problema | Solución | Detección |
| --- | --- | --- | --- |
| El `README.md` lleva estado, índice de folios, commit del último folio o huellas | Datos derivados a mano que se desincronizan; el primer expediente tuvo dos huellas falsas en su índice | La carátula de seis campos y la línea de remisión | `[enumerable]`: `grep -cE '^\| (Estado\|Folio\|Huella) \|' "$X/README.md"` → `0` |
| Un folio se edita después de publicado | Deja de ser registro | Folio nuevo con `Corrige`; la única excepción es S2 con constancia | `[enumerable]`: A7 |
| Se abre un expediente por cada mesa, ronda de audit o detención | Duplica `Audit/` y diluye la unidad «caso» | La condición y las exclusiones de §1 | `[interpretativo]` |
| La presentación de una parte se transcribe «literal» normalizada, reordenada o recortada | El origen del caso deja de ser verificable; pasó en los dos primeros ejemplares | Bloque literal byte a byte con huella | `[enumerable]`: A8 |
| En un destino, los informes de la mesa se copian como folios | Dos registros del mismo acto | Una constancia `ruta@commit` del registro | `[enumerable]`: `grep -lE '^\| Tipo \| informe \|$' SDD/Expedientes/*/actuaciones/*.md \| xargs -r grep -l 'lo que revisé y está bien'` → vacío |
| Se acuña un prefijo para el número de expediente | Colisiona con familias vivas | Número local y cita por ruta | `[enumerable]`: `grep -cE '^\| Número \| [A-Z]+-' "$X/README.md"` → `0` |
| La evidencia se toma con `grep` sobre el árbol de trabajo y se declara reproducible | Reproduce hoy por casualidad | Medición sobre un commit; observación preservada | `[interpretativo]` |
| Se despacha sin carta asentada, o se vuelve a despachar sin comprobar el anterior | Un re-despacho es otro despacho; un panel duplicado | Los pasos de «Despachar» | `[interpretativo]` |
| El expediente entra al snapshot o a la migración | Se duplica por versión y se renumera | Las exclusiones de §2 | `[enumerable]`: `ls _legacy/<N>/ \| grep -c Expedientes` → `0` |
| Se redacta una credencial empujada y no se la revoca | Sigue comprometida | S2: revocar siempre | `[interpretativo]` |
| Se supone la visibilidad de un repositorio | Se publica infraestructura privada o se ofusca de más | La sonda o la declaración del dueño | `[interpretativo]` |
| El ciclo de origen de un hueco cita el expediente | Un dato declarado en un campo calculado | La fila de control de cambios | `[interpretativo]` |

---

## 8. Prompt-snippet sugerido

```text
Expediente (Expediente-Rules.md). Abrí uno sólo si el caso atraviesa corridas o repositorios, o si entra
material externo que funda una decisión, y ninguna exclusión de §1 lo describe entero. Se radica donde
corre la corrida que trata el caso.

Abrir: verificá la visibilidad de cada repositorio que el caso nombra (ls-remote sin credenciales, o
declaración del dueño); carpeta <NNNN>-<Titulo> con la carátula de seis campos; folio 001 con el
testimonio byte a byte, redactado por S2 antes de asentarlo.
Despachar: comprobá que no quede vivo el despacho anterior; carta en evidencia/ antes; providencia con
el pase que nombra los despachos abiertos.
Publicar o cerrar: A11 antes de cada push; A1 a A12; en un destino, Audit/ por ruta@commit; archivo al
aplicar.

Nada derivado a mano. Un secreto se revoca; lo de un repositorio privado es concepto y no infraestructura;
la ruta del host se redacta siempre. Después del primer push nada se toca: una corrección es un folio
nuevo con Corrige, y una redacción S2 lleva su constancia y declara que lo empujado no se retira.
```

---

## 9. Control de cambios

| Versión | Fecha | Cambios | Autor |
| --- | --- | --- | --- |
| 1.0 | 2026-09-13 | Emisión inicial (framework 13.18). Regula **el expediente de caso**. Nace del expediente `0001` del framework —ocho comisiones a ciegas, una réplica, un refutador, un jurado y un dictamen— y de la mesa de la intervención del reporte `31`, que atacó el plan con Seguridad, Formal, Trazabilidad documental, Requisitos, Verificación, Lector sin contexto y un refutador, y lo votó un jurado de cinco agentes distintos (diecisiete ítems, 5-0). Fija la condición de apertura con precedencia y la radicación (§1); dónde vive, con tres exclusiones y conservación permanente (§2); **la forma mínima de diecinueve campos** con carátula que describe el caso, estado derivado de la secuencia y pase como punto de continuación (§3); número local de **cuatro dígitos** sin prefijo (§3.1); seis tipos (§3.2); el testimonio clasificado por contenido, donde **la aprobación asentada con literal, canal, fecha-hora y huella es la aprobación registrada de D9, sin modificar D9** (§3.3); los **tres momentos de uso**, S1 desde el primer push con la redacción S2 como única excepción, **S2 por clase de dato con la visibilidad verificada o declarada por el dueño**, y S3 (§4); el vínculo directo o a través de `Audit/` y `ruta@commit` (§5); y los expedientes de forma histórica (§5.1). Doce criterios enumerables con su comando en el texto (§6). **Rechazó, con medición**: cuarenta y siete campos, un folio por commit, el trailer en el mensaje, el manifiesto de sumas obligatorio, el prefijo `EXP-`, cinco dígitos, un tercer ámbito en `Root-Rules.md` §9.1, una oración nueva en D9 y un dato más en el ciclo de origen. | Intervención del reporte `31` |
