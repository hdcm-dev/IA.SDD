# Nota de coherencia — La afirmación de colisión léxica, su medición y el contexto de lectura de cada lector

**Documento:** Coherencia-Colision-Lexica.md
**Versión:** 1.0
**Fecha:** 2026-09-12
**Conjunto resultante:** SDD **13.12**
**Origen:** Reporte `28` de `IA.SDD.Documentacion/Reportes/` —la afirmación de colisión léxica no tiene compuerta, ni regla que la alcance—, evaluado contra SDD 13.10
**Base de la corrida:** `9dc8ded` (publicación de la 13.11)

## 1. Alcance

**Qué se corrige.** Cuatro huecos de `Vocabulario-Rules.md`, encadenados: la regla no aportaba ningún criterio
`[enumerable]`; la exigencia de medir una colisión antes de afirmarla estaba recortada a la invariante declarada, y
la de la guía de desarrollo rige al cerrar una intervención, cuando la afirmación ocurre antes; el contexto de
lectura estaba declarado para un solo lector; y §8 contradecía al resto del archivo sobre qué términos gobierna.

**Qué NO se toca, y se declara porque el origen lo delimita.** No se crea un registro de términos acuñados. No se
mecanizan los otros doce criterios de §10. La compuerta no decide colisiones: localiza. `Root-Rules.md` §13 no
aplica. `Migracion-Rules.md` y `Master-Prompt-Migracion.md` no cambian. El reporte `11` no se reabre. Los nombres de
los campos de los reportes `26` y `27` son de sus intervenciones.

## 2. La decisión que ordena el resto: qué gobierna la regla

### 2.1 La contradicción, con sus citas

| Dónde | Qué decía en la base | Lectura |
|---|---|---|
| Cabecera, `Archivo target` | *«todo artefacto del framework y toda documentación que el framework genera»* | Amplia |
| §9, primer párrafo | *«Esta fija cómo se decide, en cualquier documentación que el framework genere, si un término con más de un referente es un defecto»* | Amplia |
| §4 R6 y §9.6 | Regla de uso y familia calificada sobre «migración», que no es ninguno de los seis, con una colisión de framework contra framework | Amplia, ejercida |
| `Master-Prompt.md` §10, «Polisemia gobernada» | *«todo término con más de un referente dentro de la fase»* | Amplia, auditada |
| **§8**, párrafo «Alcance de esta regla, declarado» | *«gobierna los términos del framework que colisionan con el vocabulario del dominio de un cliente: los seis de §2, con su precedencia de §6 y su criterio de desambiguación de §9. No gobierna el resto del vocabulario propio del framework»* | **Acotada, sola** |

### 2.2 Por qué se resolvió sin detener

**Origen del hecho: ajeno a la corrida, calculado.** El párrafo está en la base y la 13.11 no tocó el archivo:
`git diff 476f927 9dc8ded -- SDD/Devs/Rules/Vocabulario-Rules.md | wc -l` → **0**. Por `Master-Prompt.md` §8.1 va
entonces a la pregunta previa, y **tiene respuesta en el árbol con cita literal**: cuatro textos del framework, dos
de ellos en otro archivo, contra un párrafo. Es trabajo propio. `Root-Rules.md` §13 no alcanzaba —no hay dos reglas,
hay un párrafo contra su archivo— y no hizo falta.

**El argumento que se traía, verificado y no heredado.** La mesa que originó el reporte lo resolvió con §9.6 y
declaró que §8 había quedado *«desactualizado por la práctica posterior del propio archivo»*. **La cronología es
falsa**: el control de cambios del archivo fecha §9.6 en la **2.1, 2026-07-29**, y el párrafo de §8 en la **2.2,
2026-08-15** (`grep -n '^| 2\.1 | \|^| 2\.2 | ' SDD/Devs/Rules/Vocabulario-Rules.md`). El párrafo se escribió contra
una sección que ya estaba. **La conclusión se sostiene igual**, por las cuatro citas de §2.1 y no por una fecha.

### 2.3 §15, y por qué el reporte `11` no se reabre

El `11` fijó, en la 2.2 de la regla, **dónde se define** el vocabulario del método: en `Master-Prompt.md` §15, y no
en los glosarios del producto. Eso sigue en pie. Lo que se corrige es que ese mismo párrafo le negó a §9 la
colisión de esos términos. **§15 define; §9 decide la colisión.** §15 define además «colisión de sentidos» y
«contexto de lectura» y los remite a §9: no decide casos, y no se le agrega criterio.

## 3. Las otras cuatro preguntas

| Pregunta del origen | Desenlace | Dónde |
|---|---|---|
| El criterio enumerable | **Entra**, con comando reproducible obligatorio. Decide la presencia de la medición y no la colisión, y rige desde la 3.3. Remitir con su sección a una resolución ya escrita no es afirmar de nuevo | `Vocabulario-Rules.md` §9.4 y §10 |
| Dónde corre | **En tres lugares**, uno por acto: la documentación generada y migrada (auditor y regla), la mesa (§6.1: sin comando es `C`), y la intervención, incluidas su verificación previa y lo que trae su origen | `Vocabulario-Rules.md` §10, `Mesa-Rules.md` §6.1 y §8, guía §VI.3 comprobación 14 |
| El contexto de lectura por lector | **Se declara leyendo los insumos de cada lector**, con dos consecuencias opuestas y la aclaración de que la suma de lo que un lector recibe no es un contexto | `Vocabulario-Rules.md` §9.2, `Master-Prompt.md` §15 |
| La mitad mecánica en la compuerta | **Entra como comprobación 7**, que localiza por sección y por archivo y no emite hallazgo. Los términos se calculan contra la base de la corrida | `Master-Prompt.md` §10.0 |

**Por qué el comando y no una prosa, verificado.** La fila 6 del cuadro del origen —«16 + 19»— resultó ser un
recuento de líneas: `grep -c procedencia` da **16** en `Migracion-Rules.md` y **19** en
`Master-Prompt-Migracion.md`, y `grep -o procedencia | wc -l` da **23** y **22**. Con el comando al lado, la
diferencia se ve al releer. Y un octavo caso lo confirma del otro lado: sin distinguir mayúsculas,
`grep -oi procedencia SDD/Devs/Orchestrator/Master-Prompt-Migracion.md | wc -l` da **24**. El número depende del
comando, y **sólo el comando lo deja a la vista**.

## 4. Inventario de archivos tocados

| Archivo | Antes | Después | Qué cambió |
|---|---|---|---|
| `SDD/Devs/Rules/Vocabulario-Rules.md` | 3.2 | **3.3** | §8 alcance; §9.2 contexto por lector; §9.4 toda afirmación con su comando; §9.6 cita de §9.2; §10 primer `[enumerable]`; §11 fila |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.15 | **8.16** | §10.0 comprobación 7; §10 polisemia; §15 tres entradas; §16 fila |
| `SDD/Devs/Rules/Mesa-Rules.md` | 1.2 | **1.3** | §6.1 ancla de una afirmación de colisión; §8 criterio; §11 fila |
| `SDD/Guides/SDD-Development-Guide.md` | 1.29 | **1.30** | §VI.3 comprobación 14 y su fundamento; §II.7 dos recuentos; registro **reordenado** y fila |
| `SDD/Guides/SDD-User-Guide.md` | 1.20 | **1.21** | Glosario «Contexto de lectura»; registro **reordenado** y fila |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | 1.16 | **1.17** | §3 una situación nueva, dos reapuntadas; §6 fila |
| `CHANGELOG.md` | — | — | Entrada **13.12** |
| `_legacy/13.11/` | ausente | **tomado** | §VI.5, antes de editar |
| Esta nota | — | 1.0 | — |

**Nada fuera de esta lista fue modificado** (comprobación 7).

## 5. Barrido por concepto (§VI.3.2)

| Concepto | Forma anterior (patrón literal) | Forma vigente |
|---|---|---|
| El contexto de lectura, para un solo lector | `es la sección, no el documento` · `para un subagente es la sección` | `la sección cuando la nombra, el archivo cuando lo nombra sin sección` |
| El alcance acotado de la regla | `No gobierna el resto del vocabulario propio` · `gobierna seis palabras` | La tabla de §8 |
| El recuento de comprobaciones | `trece comprobaciones` | `catorce comprobaciones` |

**Corrida sobre todo el árbol vivo, cercos incluidos**
(`grep -rnF --include='*.md' --exclude-dir=_legacy "<patrón>" .`):

- `para un subagente es la sección`, `No gobierna el resto del vocabulario propio` y `gobierna seis palabras`:
  **cero** fuera de esta nota.
- `es la sección, no el documento`: **dos**. Una en la entrada 2.0 del `CHANGELOG.md` —clase estable, entradas
  publicadas— y una en `Vocabulario-Rules.md` §9.2, que **cita la forma de la 3.2 para declarar que cambió**:
  exclusión propia del caso, por el mismo motivo que la clase «renombres declarados».
- `trece comprobaciones`: **siete**, todas en notas de coherencia anteriores —clase estable—.

**Residuo: cero fuera de las exclusiones.** Esta nota y la entrada 13.12 escriben las formas anteriores como
patrón: clase estable «la declaración de la propia intervención».

**La regla 4 sobre el texto propio encontró el defecto que la intervención corrige, tres veces**, y se corrigió antes
de verificar: la guía afirmaba *«una colisión que no existía»* sin comando; §10.0 publicaba dos recuentos sin
anclar y decía que la salida del comando declaraba lo que no mira, cuando el comando publicado no lo hace; y §8
decía que §15 no tiene criterio de colisión, cuando §15 define «colisión de sentidos». **Las tres líneas agregadas
que mencionan un término concreto y su colisión** —«migración» en §8 y en §9.2 de la regla— **remiten a §9.6 con
su sección**.

**El límite, declarado.** El contexto de lectura por lector es un cambio semántico: los patrones cubren sus huellas
textuales. Se releyeron enteras §8, §9 y §10 de `Vocabulario-Rules.md`, §10.0, §10 y §15 de `Master-Prompt.md`, §6.1
y §8 de `Mesa-Rules.md` y §VI.3 de la guía.

## 6. Verificación de la lista de §VI.3

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 | **Sin violaciones.** D9 se invoca y no se modifica |
| 2 | Autosuficiencia | **Cero** líneas agregadas en los archivos normativos que nombren algo fuera del repositorio |
| 3 | Referencias internas | **Resuelven**: `Master-Prompt.md` §2 paso 2, §8, §10 perfil del auditor, §10.0, §12.1 T0, §15; `Master-Prompt-Migracion.md` §2; `Mesa-Rules.md` §6.1 y §10; `Vocabulario-Rules.md` §9.2, §9.4, §9.5, §9.6; guía §VI.3.1 |
| 4 | Sin contradicción con lo que estaba | **Una resuelta**, que es la del origen (§2). La cabecera de `Migracion-Rules.md` —el archivo es su contexto de lectura— **queda confirmada** por §9.2 |
| 5 | Control de cambios en cada archivo | **Una fila por archivo**, seis |
| 6 | Caso degenerado | **No aplica** |
| 7 | Nada fuera del alcance | **Verificado**, §4 |
| 8 | Barrido | §5 |
| 9 | Coherencia interna | **Verificada**: la cabecera, la tabla de §8, la letra de §9 y §9.6 declaran el mismo alcance; §9.2 y la entrada «Contexto de lectura» de §15 y de la guía de usuario dicen lo mismo; §10.0 declara que la comprobación 7 no emite hallazgo y §10 la usa como insumo |
| 10 | Integridad del registro | **Verificada en los seis archivos y en esta nota**. Dos registros estaban en orden inverso y se reordenaron: **seis filas fechadas quitadas, las seis reaparecen idénticas** |
| 11 | Cobertura de la nota | **Ésta**, para la entrada 13.12 |
| 12 | Catálogo | §3 suma una situación. §4 no cambia: no entra ningún anti-patrón |
| 13 | Devolución al origen | §7 |
| 14 | Afirmaciones de colisión con su medición | **Las de esta nota llevan su comando**, en §2.2, §3 y §8. **Las que la intervención recibió del origen se reprodujeron** antes de usarse: 19/18/0, 23 + 22 y cero en §15, en la 13.10 y en la 13.11; y la de la 13.11 que descartó `procedencia` —presencia en `Master-Prompt.md` §7.0 y `Master-Prompt-Reanudacion.md` §3 y §6— **se reprodujo por sección y es cierta**: 1, 2 y 1 ocurrencias |

**Snapshot (§VI.5).** `_legacy/13.11/` tiene **128** archivos, los mismos del commit `9dc8ded` fuera de las
exclusiones, y **ninguno difiere** byte a byte. Adentro, los seis archivos tocados muestran su versión anterior.

## 7. Devolución al origen (comprobación 13)

El reporte fija **seis criterios de aceptación** en su §7:

| # | Criterio | Veredicto |
|---|---|---|
| 1 | El recuento cambia: `Vocabulario-Rules.md` tiene al menos un `[enumerable]` | **CUMPLIDO.** Con el mismo comando: `enum=1 interp=13` |
| 2 | Cabecera, §8 y §9.6 dejan de contradecirse | **CUMPLIDO.** Leídos juntos declaran el mismo alcance, y el residuo de la acotación vieja fuera del control de cambios es cero |
| 3 | Afirmar una colisión sin comando en una verificación previa es hallazgo por vía del método | **CUMPLIDO A MEDIAS, y se declara.** La comprobación 14 y el criterio de §10, aplicados a la nota y a la entrada de la 13.11, **marcan las dos afirmaciones sin comando** con que esa versión descartó `procedencia`, y lo hacen aunque la afirmación sea cierta. **No se ejerció sobre una verificación previa en vivo**, y la localización por cadena deja escapar sinónimos. Precedente: el reporte `18` |
| 4 | Calificar una sección de un archivo que se lee íntegro da el costo del archivo sin refutador | **CUMPLIDO.** La fila «Orquestador de migración» de §9.2 da el archivo, y la consecuencia 1 el costo: 23 ocurrencias en `Migracion-Rules.md`. **Y corrige el número del origen**: 45 sólo si el sentido nuevo se escribe también en `Master-Prompt-Migracion.md` |
| 5 | La compuerta localiza sin decidir | **CUMPLIDO sobre el comando publicado.** Extraído de §10.0 y corrido sobre los tres términos que la 13.11 agregó a §15, calculados contra su base: ocurrencias por sección y por archivo, **cero palabras de veredicto** en la salida. El banco del destino no se ejerce acá, por la decisión del reporte `12` |
| 6 | Un término con contextos disjuntos no aparece como hallazgo | **CUMPLIDO.** «Migración» en `Rules-Devops.md` y en `Migracion-Rules.md`: la compuerta lo localiza en dos archivos, el descarte está escrito en §9.6, y §9.2 impide que se sumen en un contexto por viajar en la misma lista |

**Cinco cumplidos y uno a medias.**

## 8. Observaciones

**La premisa de §9.2 era cierta sólo a medias desde que se escribió.** Declaraba que el despacho *«nombra secciones,
no archivos completos»*; el esqueleto de `Master-Prompt.md` §8 nombra por ruta la regla de la categoría, los
documentos upstream y los de conocimiento.

**La fila 3.1 de `Vocabulario-Rules.md`** dice que §9.4 cita la línea de insumos del despacho; la cita vive en §9.2.
No se reescribe (§VI.2).

**Impacto medido sobre destinos**, en `SDD/Docs/` fuera de carpetas archivadas, con
`grep -rniE --include='*.md' 'colisi' SDD/Docs | grep -v '/_' | grep -ciE 'términ|sentido|referente|polisem|disjunt'`:
**73, 59, 1 y 89** líneas en los cuatro destinos del espacio de trabajo, y **ninguna** con `grep` o `wc -l` en la misma
línea. Es un proxy: no separa afirmaciones de menciones, y un comando puede estar en la línea siguiente.

## 9. Veredicto

**CONFORME.** Catorce comprobaciones de §VI.3 verificadas, la decimocuarta sobre esta misma nota; barrido con
residuo cero fuera de clases estables y una exclusión propia; snapshot tomado antes de editar y verificado; y
devolución al origen con **cinco criterios cumplidos y uno a medias**. Conjunto resultante: **SDD 13.12**.

## Control de cambios

| Versión | Fecha | Cambios | Autor |
|---|---|---|---|
| 1.0 | 2026-09-12 | Emisión. Cubre la intervención que declara **qué gobierna** `Vocabulario-Rules.md` —§15 define, §9 decide la colisión de todo término—, **el contexto de lectura de cada lector**, **la medición obligatoria de toda afirmación de colisión** en la regla, la mesa y la intervención, y **la localización sin veredicto** en la compuerta. Declara que el argumento cronológico con que se había resuelto la contradicción no se sostenía, dos registros en orden inverso y tres afirmaciones propias sin medición corregidas antes de verificar. | Intervención de la colisión léxica |
