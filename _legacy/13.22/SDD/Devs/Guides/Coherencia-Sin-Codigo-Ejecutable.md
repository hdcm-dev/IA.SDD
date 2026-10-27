# Nota de coherencia — El framework no lleva código, y ninguna regla lo decía

**Documento:** Coherencia-Sin-Codigo-Ejecutable.md
**Versión:** 1.0
**Fecha:** 2026-08-23
**Versión del conjunto resultante:** SDD **12.1**
**Origen:** El reporte `12` de `IA.SDD.Documentacion` —«La compuerta declarada y la compuerta
ejecutada»—, que planteó si el framework debía distribuir un verificador ejecutable y **se emitió a
propósito sin proponer una decisión**. Sus criterios se transcriben en §6

---

## 1. Alcance

**El hecho ya era cierto; la regla no existía.** El conjunto normativo nunca contuvo un archivo que no
fuera Markdown, y cada mecanismo que el método construyó se resolvió sin código: el barrido por
concepto son comandos publicados en la prosa que los funda, la compuerta de §10.0 es un lector, y la
migración es un árbol declarado. **Ninguna sección lo declaraba.**

**Lo que ese hueco produce es asimétrico y por eso importa.** Un agente que propusiera un verificador
**no tenía con qué cita detenerse** —y `Master-Prompt.md` §8.1 exige cita literal para sostener que algo
es trabajo propio—, y quien lo rechazara **no tenía con qué sostener el rechazo**. Las dos partes
quedaban sin fundamento citable sobre una decisión que el corpus venía aplicando en cada intervención.

**Es la misma figura que esta serie viene corrigiendo.** La 12.0 encontró que §9.2 fundaba su tabla de
exclusiones en una exigencia que §9.5 no contenía, y que los ítems diferidos vivían sólo en una nota
que se cierra con su fecha. **Una decisión que gobierna y no tiene dónde citarse se pierde con el
contexto que la tomó.**

## 2. Qué se agrega, y qué no

| | |
|---|---|
| **Se agrega** | `SDD-Development-Guide.md` **§II.7**, séptimo contrato interno, y el anti-patrón correspondiente en la **Parte V** con su detección |
| **No se agrega** | **Ninguna invariante.** D1–D9 gobiernan **lo que el framework genera** —idioma, encoding, nombres, trazabilidad, evidencia—; esta regla gobierna **de qué está hecho el framework**, que es otro objeto. Meterla como D10 habría ampliado un conjunto con un elemento de distinta naturaleza |
| **No se toca** | Ninguna regla de categoría, ninguna plantilla, ningún orquestador. **Ningún documento generado deja de cumplir** |

**La frontera, que es lo que faltaba y no la prohibición.** El corpus **ya publica comandos** —el
barrido de §VI.3.2— y una prohibición sin frontera los habría vuelto ilegítimos. §II.7 declara por qué
no lo son: **no se versionan aparte, no se instalan, y no pueden desincronizarse de la regla porque
viven en el mismo documento que la regla**. Lo que queda prohibido es el artefacto ejecutable **con
versión propia**, que es el que puede divergir del texto sin que ninguna comprobación lo vea.

## 3. Barrido declarado (`SDD-Development-Guide.md` §VI.3.2)

**No hay par forma anterior / forma vigente, y se declara por qué.** §VI.3.2 gobierna las
intervenciones que **cambian un concepto** y dejan una forma anterior que hay que dejar de encontrar.
Ésta no cambia ninguna: **agrega una sección que declara un estado preexistente**. Declarar un barrido
vacío con un patrón inventado sería el defecto que las emisiones de la 12.0 cometieron tres veces —un
cero obtenido con un patrón que no matchea nada—.

**Lo que sí se publica es el comando que verifica la propiedad que §II.7 declara**, con el mismo alcance
que el resto de la nota:

```bash
ALC="SDD PROMPTS Templates README.md CHANGELOG.md"

# 1 · el conjunto normativo es Markdown y nada más
find SDD -type f -not -name '*.md'

# 2 · ninguna sección del corpus contradice a §II.7 declarando un artefacto ejecutable propio
grep -rniE "ejecutar el (script|verificador)|instalar (el|la) (herramienta|dependencia)" $ALC \
  | grep -vE "_legacy|/Bootstrap/|Coherencia-Sin-Codigo"
```

| Comando | Qué devuelve | Dónde cae |
|---|---|---|
| **1** | Nada | — |
| **2** | `Rules-Examples.md:620` — *«Ejecutar el script `./confirmar-pago.sh` desde la carpeta del sample»* | **El destino sí lleva código, y §II.7 no lo alcanza.** Es una instrucción del runbook de un **sample de un producto**, no una declaración del framework sobre sí mismo. Queda declarada en §7 |

**El comando 1 devuelve vacío y acá el vacío sí es el resultado esperado**, a diferencia del barrido por
concepto: no se busca el residuo de una forma derogada, se comprueba una propiedad de composición. **Si
devuelve una línea, §II.7 está incumplida en el mismo árbol que la declara.**

**El comando 2 devuelve residuo y también es lo esperado**, por el motivo inverso: su patrón no puede
distinguir *«el framework ejecuta»* de *«el destino ejecuta»*, y el segundo es la mitad de lo que el
framework existe para generar. **Un patrón más angosto habría dado cero sin haber mirado**, que es el
defecto que las emisiones de la 12.0 cometieron tres veces. Se prefiere el patrón ancho con su residuo
encajonado.

## 4. Alcance recalculado

```bash
# archivos tocados, sin el snapshot que §VI.5 obliga
git diff <base> --name-only | grep -v '^_legacy/12\.0/'
```

Devuelve **cuatro**: `SDD/Guides/SDD-Development-Guide.md`, `SDD/Devs/Rules/Catalogo-De-Criterios.md`,
`CHANGELOG.md` y esta nota. El alcance declarado —esos cuatro más `_legacy/12.0/`— y el recalculado
coinciden.

## 5. Verificación — las trece comprobaciones

| # | Comprobación | Resultado |
|---|---|---|
| 1 | Invariantes D1–D9 en todo archivo tocado | **Tabla propia más abajo.** Ninguna se modifica |
| 2 | Autosuficiencia | Sin referencias nuevas fuera del árbol. §II.7 nombra el reporte `12` **por su número y su repositorio**, no por ruta, y sólo como origen de las mediciones que la reabrirían |
| 3 | Referencias internas resuelven | §II.7 cita `Migracion-Rules.md` §3, §VI.3.2, §VI.3 y §10.0; las cuatro existen y dicen lo que se les atribuye |
| 4 | Sin contradicción con lo que ya estaba | **El corpus ya cumplía la regla**: el comando 1 de §3 devuelve vacío en el árbol vivo y en los cuarenta y siete snapshots. Se declara lo que es, no lo que se quisiera |
| 5 | Control de cambios en cada archivo modificado | `SDD-Development-Guide.md` sube a **1.25** y `Catalogo-De-Criterios.md` a **1.12**, cada uno con su fila. `CHANGELOG.md` es el registro. **Esta nota no lleva tabla**, con el precedente admitido de `Coherencia-Precedencia-Entre-Reglas.md` |
| 6 | El caso degenerado sigue produciendo el layout aplanado | Nada del layout se tocó |
| 7 | Nada fuera del alcance declarado | **§4**, contraste declarado contra recalculado: tres archivos más el snapshot, cero afuera |
| 8 | Barrido por concepto | **§3**, con la declaración de por qué no hay par de formas y el comando que sí corresponde |
| 9 | Coherencia interna | §II.7 y el anti-patrón de la Parte V dicen lo mismo y comparten la detección |
| 10 | Integridad del registro | Cabecera = última fila en los **dos** archivos con tabla. Ninguna fila histórica alterada |
| 11 | Cobertura de la nota | **Esta nota**, conjunto **12.1** |
| 12 | Cobertura del catálogo | **Entra un criterio**: qué hacer cuando una intervención necesita un mecanismo que exigiría código. `Catalogo-De-Criterios.md` **1.11 → 1.12** suma la fila |
| **13** | **Devolución al origen** | **§6** |

**Comprobación 1 — las nueve invariantes.**

| # | Invariante | Verificación | Resultado |
|---|---|---|---|
| **D1** | Idioma y registro | La sección nueva está en el mismo registro que el resto de la guía | Intacta |
| **D2** | Encoding | Sin cambios de encoding ni de terminador | Intacta |
| **D3** | Nombres | Ningún archivo renombrado; ningún identificador tocado | Intacta |
| **D4** | Sufijo de versión | El snapshot usa la convención de carpeta de §VI.5, como los cuarenta y seis anteriores | Sin cambio |
| **D5** | Una sola versión vigente | La guía sube a 1.25 con su fila; el conjunto a 12.1 con su entrada | Intacta |
| **D6** | Trazabilidad | §II.7 declara su origen —el reporte `12`— y las cuatro mediciones que la reabrirían | Intacta |
| **D7** | Neutralidad de dominio | Sin vocabulario, ejemplos ni productos de ningún dominio de cliente | Intacta |
| **D8** | Conjunto cerrado de tipos | Sin tocar la enumeración | Intacta |
| **D9** | Evidencia verificable | §II.7 se sostiene con **un comando corrible** —`find SDD -type f -not -name '*.md'`— y no con una afirmación | Intacta |

**El snapshot `_legacy/12.0/` queda fuera de esta verificación y se declara:** §VI.5 lo declara
intocable. Lo que sí se verificó es que sea **byte a byte** el estado anterior.

## 6. Comprobación 13 — los criterios del origen

**El reporte `12` es atípico y hay que decirlo antes de contestarlo:** su §7 declara *«este reporte **no
propone una decisión**: propone lo que hay que medir para tomarla»*, y enumera cuatro mediciones. **Su
criterio de aceptación no es que se incorpore un verificador ni que no se incorpore: es que la decisión
se tome sobre algo.**

| # | Criterio del reporte `12` §7 | Veredicto |
|---|---|---|
| 1 | ¿Cuántos de los 97 `[enumerable]` son evaluables sin leer prosa? | **Sin medir.** §II.7 lo declara como una de las cuatro que la reabren |
| 2 | ¿Puede el verificador **derivar** sus reglas del texto en vez de codificarlas? | **Sin medir.** Ídem |
| 3 | ¿Cuánto cuesta mantenerlo? | **Sin medir.** Ídem |
| 4 | ¿Dónde vive? | **Sin medir.** Ídem |
| 5 | Que la decisión de alcance se tome y quede registrada (§5) | **Cumplido**: se decide **no incorporar código ejecutable**, con el fundamento del propio reporte —su §6— y con las cuatro mediciones declaradas como condición de reapertura |

**Lo que este cierre no compra, declarado.** No contesta las cuatro preguntas: **las convierte en la
condición de reapertura**, que es distinto y menos que medirlas. Si alguien las mide y dan a favor,
§II.7 se revisa por §III.8 como cualquier contrato interno. **Un cierre que declara qué lo revertiría es
contestable; uno que no lo declara se lee como definitivo sin serlo.**

## 7. Ítems declarados y no resueltos

- **Las cuatro mediciones del reporte `12` §7 siguen sin hacer.** No se difieren por §12.2 porque **no
  son un ítem obligatorio contestado con una promesa**: son el insumo de una decisión que ya se tomó en
  su ausencia, y §II.7 declara que tomarla así es lo que corresponde mientras el fundamento en contra
  —la duplicación que se desincroniza— siga en pie.
- **§II.7 no alcanza a los repositorios destino.** Gobierna de qué está hecho el framework; qué lleva un
  destino lo decide su propio producto, y `Rules-Devops.md` y `Rules-Calidad-Y-Pruebas.md` presuponen
  que lleva código. **No hay contradicción y se declara para que no se lea como una.**

## 8. Veredicto

**CONFORME.** Las trece comprobaciones pasan, los dos comandos de §3 devuelven vacío y el vacío es el
resultado esperado por el motivo declarado, el alcance recalculado coincide con el declarado, y el
conjunto queda en **SDD 12.1** — **patch por la tabla de §VI.5**, publicado como `12.1` porque el formato
`X.Y` no puede expresar patch, y declarado como tal en la entrada para que el número no se lea como un
minor que incorpora algo nuevo.

**Lo que esta intervención agrega no es una prohibición: es una frontera.** El corpus ya se comportaba
así; lo que faltaba era que las dos partes de la discusión tuvieran de dónde citar.
