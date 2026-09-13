# Actuación 002 — Providencia: convocatoria de mesa

| Campo | Valor |
|---|---|
| Tipo | `providencia` |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa (orquestador de la corrida, Claude Opus 5): convoca, consolida, **no vota** |
| Corrige | — |

Base de la corrida: `IA.SDD` `main` `a501857` (13.17) · `IA.SDD.Documentacion` `main` `3f78a5c` con cinco archivos sin confirmar · `<F1>` `main` `9aabe5c` — `evidencia/ev-01-base.out`.

---

## 1. Desde dónde se convoca

**Por pedido explícito del Product Owner** (actuación 001 §2 punto 5), sobre el marco de
`IA/PROMPTs/IA.Prompts/Base/Mesa-Evaluadora.md`. No es la condición de `Mesa-Rules.md` §0.0 —no hay
orquestador de generación corriendo ni corpus de destino que evaluar—; es el caso que
`Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` cataloga: una mesa que se pide por nombre sobre un
objeto que la condición no alcanza. Acá el objeto es **una norma de oficio por escribir**.

**Lo que este expediente es y no es.** El repositorio del framework no es un destino y no tiene
`SDD/Docs/Audit/`; **el expediente es el registro de la mesa**, con la forma provisoria que el expediente
`0001` dejó en uso (carátula de cinco campos, folios contiguos, pase al final de cada folio, evidencia con
método, base y quién). El **producto de la mesa no se escribe acá**: va a `OUTPUTs/` del tool-prompt,
fuera de este repositorio, por decisión del Product Owner (001 §2 punto 4).

## 2. Contrato de entrada (`Mesa-Evaluadora.md` §2)

| Campo | Valor |
|---|---|
| `objeto` | Un documento de conocimiento **por escribir**: `Knowledge-Bundle-JS.md`, alias `Bundle-JS`, naturaleza `propio`, con la forma de `Rules-Base-Conocimiento.md` §4, más su fila de índice propuesta. Insumos: la presentación (`ev-05`), el análisis previo `INPUTs/Bundle-JS-En-Solucion-Blazor.md` (`ev-04`), el conjunto normativo 13.17 y un precedente real del workspace (`ev-03`) |
| `objetivo` | Que un agente de IA de este framework, o de otro parecido en concepto, pueda crear el proyecto del bundle, la PoC HTML, la biblioteca de clases Razor que lo integra y la PoC Blazor, y diagnosticar fallas de contrato, leyendo sólo el documento |
| `restricciones_duras` | (R1) **No se modifica el `Framework SDD`**: ni `SDD/`, ni `PROMPTS/`, ni `Templates/`, ni `Conocimiento/`, ni `CHANGELOG.md`. Lo único que esta corrida escribe en `IA.SDD` es esta carpeta de expediente. (R2) El documento **no dicta la estructura de la solución .NET** ni la ubicación de las PoC en el framework que lo adopte. (R3) Nada se afirma sin ancla; los hechos de plataforma se anclan en documentación oficial nombrada o en el precedente. (R4) D7: el documento no lleva nombres de cliente ni de producto de origen; el precedente se cita ofuscado. (R5) D1 a D3 en lo que aplica a un archivo suelto: español rioplatense técnico, UTF-8, nombre en Título-Con-Guiones ASCII |
| `decisiones_cerradas` | Alias `Bundle-JS` (001 §2 punto 1). Naturaleza `propio`: el artefacto no tiene nombre canónico establecido (`Rules-Base-Conocimiento.md` §3.2 regla 1) y hay que darle identidad, estructura y contrato (§6.2). Destino `OUTPUTs/` y no `Conocimiento/` (001 §2 punto 4). La RCL **no** se convierte en NuGet en este alcance (001 §2 punto 2). El bundle es **proyecto de código** por `PRODUCT-INTAKE-template.md` §13 l.318 (`ev-02`). **Se reabren sólo con ancla E1 o E2 que muestre contradicción** |
| `fuera_de_alcance` | Escribir código del bundle, de la RCL o de las PoC; modificar el precedente; decidir por el Product Owner la pregunta PA-04 del documento de entrada (si el mapa es unidad de entrega `library`); catalogar el documento en `Index-Knowledge.md` |
| `umbral_de_calidad` | S1 y S2 bloquean el cierre |
| `presupuesto` | `ciclos_max: 2`, `hallazgos_max_por_especialista: 7` (5 para los ad hoc), más hasta 3 «lo que revisé y está bien» |
| `pendientes_declarados` | PA-01, PA-02 y PA-04 del documento de entrada §7, abiertas. El documento de entrada no fue auditado por nadie más que su autor, que es el mismo que preside esta mesa: **eso es un sesgo declarado**, y es una de las razones del refutador |

## 3. Compuerta mecánica (`Mesa-Evaluadora.md` §5.1 a)

Los cinco chequeos de coherencia de §3 suponen requisitos con identificador, tareas y pruebas; el objeto de
este caso no tiene esa forma todavía. Se corre lo chequeable: **todo archivo del framework que el documento
de entrada cita existe en la base 13.17, y toda sección citada como `Archivo §N` tiene encabezado** —
`evidencia/ev-06-chequeo-mecanico.out`, 17 archivos y 14 secciones, ninguna ausente. Los nombres con cero
coincidencias en esa salida son artefactos **generados** (`Pipeline-Producto.md`, `Vista-Producto.md`,
`guia-publicacion-paquete-npm.md`) o archivos fuera de `SDD/` (`CHANGELOG.md`, el tool-prompt), no archivos
del conjunto normativo: no es un hallazgo.

**Y un dato que la compuerta fija antes de que nadie opine:** el término «PoC» / «prueba de concepto» tiene
**cero** ocurrencias en el conjunto normativo 13.17 (`ev-02`, última línea). Lo que el Product Owner llama
PoC no tiene figura propia en el método; encontrarle el lugar es trabajo de la mesa, no un defecto del
pedido.

## 4. Barrido de señales y registro de convocatoria (§5.1 b y c)

### 4.1 Núcleo permanente

| Id | Rol | Pregunta |
|---|---|---|
| N1 | **Requisitos** | ¿Qué tiene que cumplir el documento para satisfacer el pedido, y qué del pedido está mal formulado o se contradice? |
| N2 | **Verificación** | ¿Cómo se verifica que el documento cumple `Rules-Base-Conocimiento.md`, y cómo se verifica que el conocimiento se aplicó bien? |
| N3 | **Lector sin contexto** | Un agente de otro framework, con `/demos` y `/docs`, ¿puede crear las cuatro piezas sin preguntar? |
| — | **Refutador** | Entra después de la consolidación, con los informes a la vista. Ataca el plan compuesto **y** el sesgo declarado en §2 |

### 4.2 Variables del catálogo, con su señal

| Id | Rol | Señal, con ubicación | Decisión |
|---|---|---|---|
| V1 | **Arquitectura** | Integración entre sistemas y más de un componente: documento de entrada §2.3, §4 obs. 2, §8.4; el precedente resuelve la composición de otra forma (ADR-00042, `ev-03`) | `CONVOCAR` |
| V2 | **Interfaz / consumidor externo** | «cómo se genera la base contractual entre los diferentes artefactos» (`ev-05`, Contexto); contrato declarado una vez de cada lado en el precedente (`Contrato.cs`, `ts/contrato.ts`, `ev-03`) | `CONVOCAR` |
| V3 | **Operación y entrega** | Orden de construcción y artefactos generados: documento de entrada §8.4; targets de MSBuild, versión de Node fijada y bundle no versionado en el precedente (`ev-03`) | `CONVOCAR` |
| — | Datos y dominio | «DTO» en `ev-05`, pero el dominio del mapa está fuera del objeto: lo que importa es la forma del contrato, que cubre V2 | `NO_CONVOCAR` |
| — | Seguridad | Sin autenticación ni datos personales en el objeto. Un bundle que integre una API externa (el original nombra mapas de terceros) traería claves: **queda para el refutador** | `NO_CONVOCAR` |
| — | Formal / matemático | Sin umbrales ni cuantificadores en el objeto; el único número es el techo de 600 líneas, que es de N2 | `NO_CONVOCAR` |
| — | Accesibilidad / uso | Hay interfaz de usuario, pero la del mapa es del producto y no del conocimiento a transmitir; el precedente ya la resolvió en su 03 | `NO_CONVOCAR`, con nota: si el documento fija convenciones de foco o teclado en el bundle, se reconvoca en el ciclo 2 |
| — | Rendimiento y costo | Sin volumen ni latencia declarados | `NO_CONVOCAR` |

### 4.3 Agentes ad hoc (§4.1.3), con carta de mandato

| Id | Nombre | Señal | Decisión |
|---|---|---|---|
| AH-1 | **Ingeniería del bundle** (TypeScript, empaquetado, dos superficies, pruebas sin anfitrión) | «crear el proyecto bundle javascript ... arrojará dos artefactos: main.js y el bundle» (`ev-05`, Solicitudes) | `INSTANCIAR_AD_HOC`, carta en `ev-07/07-AH1-*.md` |
| AH-2 | **Interoperabilidad Blazor ↔ JavaScript** y biblioteca de clases Razor | «registrar callback blazor en la clase de interfaz en main.js» y «crear la librería de clases .NET Blazor» (`ev-05`) | `INSTANCIAR_AD_HOC`, carta en `ev-07/08-AH2-*.md` |

Techo de cinco variables y ad hoc: **cumplido exacto** (V1, V2, V3, AH-1, AH-2). Nadie postergado por cupo.

## 5. Cómo trabaja el panel

- **A ciegas y en paralelo**: las ocho comisiones se despachan en el mismo acto; ninguna ve el informe de
  otra. El refutador entra después de la consolidación.
- **Cada comisión recibe** el encargo común y su carta, asentados **antes del despacho** en
  `evidencia/ev-07-cartas-despachadas/` con su manifiesto de huellas.
- **Cada informe se asienta verbatim** como actuación `informe`, escrito por la propia comisión en el folio
  que su carta le asigna (003 a 010). Lo que el presidente agregue va en actuación propia.
- **Salida de cada comisión**: dos tablas, **relevamiento** (qué tiene que decir el documento, por sección
  destino, con ancla) y **hallazgos** sobre los insumos (con nivel, severidad y confianza), más «lo que está
  bien», solicitudes de convocatoria y preguntas al Product Owner que sólo un `C` justifique.

## 6. Jurado y auditores

**Se declara la limitación en lugar de simularla**, como en `0001` folio 002 §5: los cinco jueces con
funciones objetivo —evidencia, impacto, costo-beneficio, coherencia histórica, riesgo e irreversibilidad—
se despachan como **un solo subagente con cinco mandatos** después de la refutación, y vota **por hallazgo y
por ítem de relevamiento** con fundamento por voto. La salvaguarda del 80 % de votos 5-0 se aplica y se
informa. El **cuerpo auditor** que diseña el documento es el presidente, que **no vota**: la separación entre
quien redacta y quien aprueba se sostiene porque el veredicto (jurado) precede a la redacción (presidente) y
la verificación final (N2 reconvocada sobre el documento escrito) la cierra.

## 7. Dónde queda cada sección de `Mesa-Evaluadora.md` §7 en este expediente

| Pieza | Actuación |
|---|---|
| Contrato de entrada y compuerta mecánica | 002 (esta) y `evidencia/ev-06` |
| Registro de convocatoria | 002 §4 |
| Informes del panel | 003 a 010 |
| Consolidación y plan compuesto | 011 |
| Refutación | 012 |
| Veredicto del jurado | 013 |
| Dictamen: qué dice el documento, deuda declarada, escaladas, bloque de cierre | 014 |
| Verificación del documento escrito | 015 |

Sigue: despacho de las ocho comisiones · presidente de mesa
