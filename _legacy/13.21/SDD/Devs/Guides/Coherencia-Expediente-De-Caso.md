# Nota de coherencia — El expediente de caso, la mesa antes de la detención y la compuerta de lo que no se publica

**Documento:** Coherencia-Expediente-De-Caso.md
**Versión:** 1.0
**Fecha:** 2026-09-13
**Conjunto resultante:** SDD **13.18**
**Origen:** reporte `31` de la serie de reportes de evidencia —el método no expedienta sus casos—, evaluado contra SDD 13.16 y verificado contra la 13.17 vigente; su evidencia primaria es el expediente `Expedientes/0001-Expedientes-Como-Comportamiento-Del-Framework/` de este repositorio

## 1. Alcance

**Qué se corrige.** El método no tenía contenedor para un caso que atraviesa corridas o repositorios, ni
lugar con custodia para la evidencia que funda una decisión, ni una salida a la detención que no fuera
preguntar de a una. El Product Owner lo pidió, dos corridas lo inventaron el mismo día con dos formas, y el
primer ejemplar presentó como literal un pedido normalizado.

**Qué NO se toca, y se declara porque el origen lo delimita:**

- **D9 no se modifica.** La escalada E-3 se resolvió por la opción C con respaldo de un jurado de cinco
  agentes: el asiento literal con canal, fecha-hora y huella **es** la aprobación registrada que D9 ya admite.
- **El ciclo de origen no se toca** (`Master-Prompt.md` §8.2, `Root-Rules.md` §12).
- **Nada de `SDD/Docs/Audit/` se muda**, ni de las carpetas de resultados de las intervenciones anteriores.
- **El reporte `12` no se reabre**: ningún verificador aparte; los doce comandos viven en la regla.
- **D3 no se toca**: el número de expediente es familia excluida, sin ámbito nuevo.
- **Ningún repositorio de destino se toca.**

## 2. Las decisiones

### 2.1 La pregunta de fondo: sí

El caso entra como figura normada en `Expediente-Rules.md` 1.0. **No se aplicó el dictamen del expediente
`0001` al pie de la letra**: se sometió a una mesa con Seguridad, Formal y Trazabilidad documental —las tres
que ese expediente postergó por cupo—, Requisitos, Verificación, Lector sin contexto y un refutador del costo
de aplicar, y a un jurado de **cinco agentes distintos**, uno por función, que votó diecisiete ítems 5-0 sin
veto. **Homogeneidad del 100 %, declarada**; la revisión de los `NO_PROCEDE` que pide `Mesa-Rules.md` §6.4 no
tuvo objeto porque no hubo ninguno, y el desacuerdo quedó en las variantes, que el presidente incorporó o
rechazó con motivo.

### 2.2 Lo que la mesa cambió respecto del dictamen del `0001`

| Dictamen | Esta versión | Por qué |
|---|---|---|
| Carátula de cinco campos, dieciocho en total | **Seis**, diecinueve | La letra del pedido: «un README.md que describa el caso tratado» |
| Cinco dígitos | **Cuatro** | Una familia excluida no usa el ancho de `Root-Rules.md` §9.2, y con cinco A1 fallaba para siempre en los dos repositorios con expedientes |
| S1 desde el primer push, sin excepción | Con **una excepción**: la redacción S2 con constancia | Un dato privado ya publicado no puede quedar sin salida |
| Estado del tipo del último folio | **De la secuencia** | Una errata posterior a la resolución reabría el caso |
| Condición de apertura sin precedencia | **Con precedencia** entre ramas y exclusiones | El caso de prueba del propio plan caía en las dos listas |
| Informes como folios en todo repositorio | **Por enlace en un destino** | Duplicaba el registro de `Audit/` y multiplicaba por seis el costo de un caso con mesa |
| Vía única directa | **Directa o a través de `Audit/`** | 13 de 31 artefactos del caso real citaban el plan y no el expediente |
| S2 antes del primer push, como extensión de la ofuscación de `Conocimiento/` | **Autónoma, por clase de dato, antes de cada push, con la visibilidad verificada** | El comando del borrador daba siete falsos positivos y ningún verdadero sobre el único caso real |
| Cinco pasos numerados en §8.1 | **Un párrafo con fundamento**, con la excepción de lo bloqueante y sin reingreso | El orden numerado no era una secuencia bien definida |
| La reanudación lee todo expediente abierto | **Sólo los de forma vigente** | El único ejemplar de destino habría quedado abierto para siempre |

### 2.3 La visibilidad, por decisión del Product Owner

**Repositorio público se nombra; privado se ofusca**, y de un privado se usan conceptos, nunca
infraestructura; la ruta del host se redacta siempre. **La visibilidad se verifica** con una sonda sin
credenciales, o se toma de una **declaración fechada del dueño**, asentada como testimonio. Esta decisión llegó
durante la aplicación, y la regla la lleva en §4 S2.

## 3. Inventario de archivos tocados

| Archivo | Antes → después | En `_legacy/13.17/` |
|---|---|---|
| `SDD/Devs/Rules/Expediente-Rules.md` | **nuevo, 1.0** | no existe |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.19 → **8.20** | 8.19 |
| `SDD/Devs/Orchestrator/Master-Prompt-Migracion.md` | 2.10 → **2.11** | 2.10 |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.13 → **1.14** | 1.13 |
| `SDD/Devs/Rules/Mesa-Rules.md` | 1.3 → **1.4** | 1.3 |
| `SDD/Devs/Rules/Migracion-Rules.md` | 3.20 → **3.21** | 3.20 |
| `SDD/Devs/Rules/Root-Rules.md` | 8.7 → **8.8** | 8.7 |
| `SDD/Devs/Rules/Catalogo-De-Criterios.md` | 1.18 → **1.19** | 1.18 |
| `SDD/Guides/SDD-Development-Guide.md` | 1.30 → **1.31** | 1.30 |
| `SDD/Guides/SDD-User-Guide.md` | 1.21 → **1.22** | 1.21 |
| `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` | 1.0 → **1.1** | 1.0 |
| `README.md` | in situ | — |
| `_legacy/README.md` | in situ | — |
| `Examples/…/Crear-Analisis-Relevamiento.md` y `…/INPUTs/Requerimientos-Tecnicos.md` | in situ | — |
| `Expedientes/0001-…/actuaciones/019-…` y `020-…`, y seis piezas redactadas con dos manifiestos | folios nuevos y redacción S2 | — |
| `SDD/Devs/Guides/Coherencia-Expediente-De-Caso.md` | **nueva, 1.0** | — |
| `CHANGELOG.md` | entrada `[13.18]` | — |

**`Conocimiento/Index-Knowledge.md` no se toca**: su fila del documento alineado no lleva la versión del
documento y sigue siendo cierta.

**Verificación del snapshot**, con su salida:

```text
$ diff -rq <(git archive main Conocimiento Examples PROMPTS README.md SDD Templates) _legacy/13.17   → 0 diferencias
$ find _legacy/13.17 -path '*Expedientes*' | wc -l                                               → 0
$ ls _legacy/13.17/SDD/Devs/Rules/Expediente-Rules.md                                            → no existe
# y la cabecera de cada archivo tocado, en _legacy/13.17, es la de la columna de arriba (8.19, 2.10, 1.13, 1.3, 3.20, 8.7, 1.18, 1.30, 1.21, 1.0)
```

## 4. Barrido por concepto (§VI.3.2)

Corrido sobre el árbol vivo sin `_legacy/`, incluidos los bloques cercados y el texto propio.

| Concepto | Forma anterior (patrón literal) | Forma vigente | Residuo |
|---|---|---|---|
| La forma del expediente de mesa en el catálogo | `Ninguna regla la fija todavía` | Remisión a `Expediente-Rules.md` | **0** |
| El testimonio como ancla | `evidencia E4` | Testimonio clasificado por contenido | **0 vivas**; 4 excluidas: fila 1.1 de la 13.17 (declaración de la propia intervención), `Coherencia-Mesa-De-Expertos-A-Pedido.md` l.55 (nota anterior), folios 003 y 014 del `0001` (`Expedientes/`) |
| La carpeta de mesa en plano | `00-Contrato-De-Entrada`, `NN-Plan-Y-Cierre` | Tipos de actuación | **0 vivas**; 9 y 2 en `Expedientes/0001-…` (clase `Expedientes/`) |
| La mesa que no se reconvoca | `reconvoca dos veces` | «La vuelve a convocar sólo por … §8.1» | **0 vivas**; fila 2.11 (declaración propia) y 7 en `Expedientes/0001-…` |
| El recuento de reglas | `veinte archivos`, `ocho transversales` | veintiún, nueve | **0 vivas**; `CHANGELOG.md` l.2668 (entrada publicada, y es otro referente), dos notas de coherencia anteriores |
| Las exclusiones de §9.2 | `Las cuatro que siguen` | `Las seis que siguen` | **0** |
| El total de anti-patrones | `226 situaciones` | `238 situaciones` | **0** |
| La autosuficiencia | `Ningún archivo de este repositorio referencia otro repositorio` | «Ningún archivo del conjunto normativo…», con la excepción de `Expedientes/` | **0 vivas**; 5 en `Expedientes/0001-…` |
| La comprobación 2 | `cero referencias fuera del árbol de este repositorio \| Cero ocurrencias \|` | Acotada al conjunto normativo | **0 vivas**; dos notas de coherencia anteriores |

**Exclusión propia de este caso:** `Migracion-Rules.md` l.669, «el expediente de la intervención», es el
**sentido histórico** del término —la carpeta de resultados de una intervención— y no el expediente de caso.
Se deja y se declara, como V3-05 declaró el precedente.

**La regla 4, sobre el texto propio, encontró dos defectos antes de publicar:** A7, A9 y A12 listaban rutas con
las tildes escapadas por git, y dos piezas bien nombradas en la constancia S2 del `0001` no se reconocían; y
`Expediente-Rules.md` §5.1 nombraba la ruta calificada de otro repositorio dentro del conjunto normativo. Los
dos se corrigieron con su commit y quedan en la salida de la verificación.

## 5. Verificación de la lista de §VI.3

| # | Comprobación | Resultado |
|---|---|---|
| 1 | D1–D9 intactas | **Cumple.** D1: español con tildes, sin emojis. D2: `head -c3 \| od` sin BOM y sin CR en todo `.md` tocado. D3: `Expediente-Rules.md` y la carpeta `0001-…` en Título-Con-Guiones; los identificadores alcanzados siguen en cinco dígitos. D4 y D5: una sola versión vigente por nombre lógico, con su fila. D6: la regla nueva está enlazada desde `README.md`, `Catalogo-De-Criterios.md` y la guía, y los enlaces resuelven. D7: `git diff -U0 main -- SDD \| grep '^+' \| grep -ciE 'github\|gitlab\|\.csproj\|dotnet\|node\.js\|npm'` → `0`. D8: sin cambios. **D9: sin modificar**, y toda afirmación de estado de esta nota lleva su comando |
| 2 | Autosuficiencia | **Cumple** en el conjunto normativo: `git diff -U0 main -- SDD \| grep '^+' \| grep -cE 'Lab-Geometria\|RPI\.VideoControl\|IA\.SDD\.Documentacion'` → `0` después de la autocorrección de §4. `Expedientes/` nombra repositorios públicos como texto, que es la excepción que esta versión declara |
| 3 | Referencias internas | **Cumple.** Los enlaces que no resuelven en los archivos tocados son las rutas ilustrativas de siempre, el mismo conjunto que en `_legacy/13.17/`; los de `Expediente-Rules.md`, cero |
| 4 | Sin contradicción con lo que ya estaba | **Cumple**, con las modificaciones declaradas: «no la reconvoca dos veces» (`Master-Prompt-Migracion.md`), la autosuficiencia (`README.md`), la eliminación de registros absorbidos (guía §I.2) |
| 5 | Control de cambios en cada archivo | **Cumple**: una fila por archivo versionado |
| 6 | Caso degenerado | **No aplica**: la figura no depende del número de unidades de entrega |
| 7 | Nada fuera del alcance | **Cumple**, con dos ampliaciones pedidas por el coordinador de la sesión y declaradas: la ofuscación de `Examples/` y la redacción S2 del `0001` |
| 8 | Barrido por concepto | **Cumple** (§4) |
| 9 | Coherencia interna | **Cumple**: el caso de prueba de dos folios pasa A1 a A12 y cada criterio falla en su caso construido |
| 10 | Integridad del registro | **Cumple**: cabecera igual a la mayor fila, filas ordenadas, ninguna repetida, en los once archivos versionados |
| 11 | Cobertura de la nota | **Cumple**: esta nota, conjunto 13.18 |
| 12 | Cobertura del catálogo | **Cumple**: cuatro situaciones y la fila de `Expediente-Rules.md`, doce anti-patrones contados sobre su §7: `12 · [enumerable] 6 · [interpretativo] 6` |
| 13 | Devolución al origen | §6 |
| 14 | Afirmaciones de colisión con su medición | §7 |

## 6. Devolución al origen (comprobación 13): los cinco criterios del reporte `31`

1. **La forma mínima se llena en minutos y se verifica enumerando.** **Cumplido, con una diferencia
   declarada.** Un expediente de dos folios, abierto con la regla, tiene **diecinueve** campos y no dieciocho,
   por `Objeto`; el lector sin contexto de la mesa lo abrió desde cero en minutos. Los doce criterios corren con
   su comando **extraído de la regla** y sin guion aparte:
   `awk '/^## 6\. /{s=1} s&&/^```bash$/{b=1;next} b&&/^```$/{exit} b' SDD/Devs/Rules/Expediente-Rules.md`;
   sobre el caso conforme la salida es vacía.
2. **La exclusión del snapshot funciona.** **Cumplido.** `find _legacy/13.17 -path '*Expedientes*' | wc -l` →
   `0`, y la línea de §VI.5 nombra `Expedientes/`.
3. **Un orquestador que tropieza a mitad de M4 sabe que convoca mesa, y la confirmación de plan y T4 siguen
   deteniéndose.** **Cumplido en el texto**: `Master-Prompt.md` §8.1 las excluye por nombre y
   `Master-Prompt-Migracion.md` cablea la mesa por corte. **Sin veredicto hasta una migración real** que tropiece.
4. **La inmutabilidad es observable y ve la evidencia.** **Cumplido.** Sobre un clon con remoto, borrar una
   pieza de `evidencia/` después del push hace que A7 la liste; editar el README, también; renombrar la carpeta,
   también; y una redacción nombrada en su constancia S2 no.
5. **No hay cuatro formas vivas sin nombre.** **Cumplido.** Los dos adelantos son forma histórica nombrada en
   §5.1; el precedente de mesa en plano, sentido histórico; la 13.17 remite a la regla:
   `grep -rnF '00-Contrato-De-Entrada' Conocimiento` → vacío y `grep -rnF 'evidencia E4' Conocimiento` → sólo la
   fila 1.1 que lo declara.

**A1 a A12 re-medidos sobre los dos expedientes reales**, con los comandos de la regla:

| Criterio | `0001` del framework | Expediente de migración del destino | Lectura |
|---|---|---|---|
| A1 | 0 | 0 | Los dos nombres son conformes con cuatro dígitos |
| A2 | 2 | 2 | Carátula anterior a la regla: sin `Base` en la tabla y sin número en la forma nueva |
| A3 | 5 | 7 | Tipos de folio que no son de los seis (`dictamen`, `refutacion`, `testimonio`, `mesa`, `auditoria`) |
| A4 | 47 | 65 | Cabeceras en otra forma |
| A5 | 19 | 13 | Sin `Corrige` en la forma nueva |
| A6 | 0 | 1 | El último folio del destino no tiene pase |
| A7 | 0 contra `main`; 0 contra la rama de la intervención, con las ocho modificaciones nombradas en la constancia S2 del folio 019 | 8 | En el destino, piezas de `evidencia/` editadas después de su alta, antes de esta regla |
| A8 | 0 | 0 | Ningún bloque `testimonio` |
| A9 | 49 | 32 | Evidencia sin las tres líneas, y guiones con permiso de ejecución |
| A10 | 0 | 0 | Todas las citas locales resuelven |
| A11 | 0 | 0 | Nada del host ni de un repositorio privado en lo que se empujaría |
| A12 | 0 | 3 | Tres registros de `Audit/` del destino citan el expediente y no están foliados por `ruta@commit` |

**Los dos son forma histórica y §5.1 no les exige A2 a A12**; lo que marcan es la distancia medida entre
la forma anterior y la vigente, no un hallazgo.

## 7. Afirmaciones de colisión, con su medición (comprobación 14)

```text
$ git ls-tree -r --name-only main -- SDD/Devs/Rules | grep -i expedient                 → (vacío)
$ git grep -oiw folio main -- SDD PROMPTS Templates README.md | wc -l                 → 0
$ git grep -oiw 'actuación' main -- SDD PROMPTS Templates README.md | wc -l           → 0
$ git grep -oiw 'carátula' main -- SDD PROMPTS Templates README.md | wc -l            → 0
$ git grep -oiw providencia main -- SDD PROMPTS Templates README.md | wc -l           → 0
$ git grep -niw pase main -- SDD PROMPTS Templates README.md | wc -l                  → 13   (todas «pase de QA» o el verbo «pasar»: otro referente, contexto disjunto)
$ git grep -nw resolucion main -- SDD/Devs/Rules/Rules-Documentacion.md               → l.514 y l.953, un campo de la bitácora de eventualidades de un destino: contexto de lectura disjunto del de un expediente (Vocabulario-Rules.md §9.2), no colisiona
$ git -C Lab-Geometria grep -c 'EXP-' main | wc -l                                    → 20   (por eso no se acuña EXP-)
$ git -C Lab-Geometria grep -lE '\bEV-[0-9]+' main | wc -l                            → 9    (por eso la evidencia no usa ev- ni EV-)
$ git -C RPI.VideoControl grep -lE '\bEV-[0-9]+' HEAD | wc -l                         → 45
$ git grep -c 'M9-' main -- SDD PROMPTS Templates Conocimiento README.md Expedientes | wc -l → 0   (prefijo de hallazgos de la mesa)
```

## 8. Veredicto

**CONFORME.** Conjunto resultante **13.18**, minor. Deuda declarada D9-1 a D9-3 en el `CHANGELOG.md`, con su
evento de cierre.
