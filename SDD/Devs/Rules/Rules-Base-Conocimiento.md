# Reglas constructivas — Base de conocimiento de la organización

**Carpeta target:** la raíz de base de conocimiento que el intake del producto declara (`PRODUCT-INTAKE-template.md`, Parte B). **No es una carpeta de este repositorio.**
**Nivel de aplicación (`Vocabulario-Rules.md` §4 R3):** Framework
**Agente target:** el prompt de relevamiento que cita este archivo, fuera de una corrida de generación, y AG-00980 (Bibliotecario de conocimiento) en tiempo de ejecución
**Versión de las reglas:** 1.0

---

## 0. Qué gobierna este archivo, y qué no

Este archivo **regula el formato de un documento de conocimiento y el contrato del índice que lo
cataloga**. No aporta ni un documento de conocimiento, y el framework no lleva ninguno: los documentos
son de la organización que los escribe y viven en su repositorio, no acá.

Es la diferencia que hace posible la capacidad entera. **El framework aporta el continente; la
organización, el contenido.** Un framework que trajera los documentos quedaría acoplado a la casa que
los escribió, y dejaría de servirle a la de al lado.

### 0.1 Qué es un documento de conocimiento

Un documento que caracteriza **un artefacto o una convención que el framework no gobierna**: cómo está
construido un template y cómo declara sus variables, qué nomenclatura sigue un esquema de base de
datos, qué forma tiene una arquitectura de software concreta, cómo se arma un asistente de formularios.

**Describe el artefacto, no el método.** Qué documentos produce una categoría, con qué criterios se
aceptan, cómo se numera y cómo se traza sigue viviendo en los archivos de reglas de este repositorio y
no se toca desde acá.

| Va en un archivo de reglas del framework | Va en un documento de conocimiento |
| --- | --- |
| Qué artefactos produce una categoría y con qué secciones | Cómo está construido un artefacto externo que el proyecto va a usar o reproducir |
| Criterios de aceptación de un entregable | Convenciones, puntos de extensión y contrato de uso de ese artefacto |
| Nomenclatura y trazabilidad de lo que el framework genera | Nomenclatura interna del artefacto caracterizado |
| Gating por tipo D8 y por flags | Condición de aplicabilidad del conocimiento, declarada en el índice |

**Borde con los glosarios**, porque es el primer choque que alguien va a plantear. `Vocabulario-Rules.md`
§9 gobierna los glosarios de la documentación **generada**, y un glosario declara **qué designa un
término**. Una convención de nomenclatura de base de datos no declara términos: declara **cómo se
construye un nombre**. Son objetos distintos y no compiten.

### 0.2 La capacidad es opcional y está apagada por defecto

Si el intake no declara base de conocimiento, **nada de este archivo aplica** y el framework se comporta
exactamente como si no existiera. Es el mismo patrón que `requiere_maqueta` o `usa_llm`.

### 0.3 Frontera con el piso mínimo del framework

El framework conserva un piso propio de oficio, y **la base se apila sobre él, no lo reemplaza**:

| Piso mínimo | Dónde vive | Qué es |
| --- | --- | --- |
| Diseño de interfaz | `References/Design/` | Insumo normativo de la categoría 03 |
| Modelos capturados de la práctica | `Modelos-UX-UI/` | Opcional, elegido por el humano en la Fase B2 |
| Arquitectura, persistencia, pruebas y entrega | Los archivos de reglas de 02, 05, 08 y 09 | Criterios de aceptación y estructura de los artefactos generados |

**El piso tiene dos capas, y sólo una es desplazable.**

| Capa | Qué es | Ejemplo | ¿La base puede desplazarla? |
| --- | --- | --- | --- |
| **Método** | Criterio de aceptación del artefacto. Es lo que hace que el entregable sirva, independientemente de con qué se lo construya | Los cuatro estados por superficie; WCAG 2.2 AA; fuente única de datos de ejemplo (`Maqueta-Rules.md` §4.2 a §4.6) | **No.** Desplazarlo baja la calidad, no la adapta |
| **Decisión de stack** | Una elección razonada entre alternativas legítimas. Es del framework porque alguien tenía que elegir, no porque sea la única correcta | JavaScript vanilla, Bootstrap por CDN, sin proceso de build (`Maqueta-Rules.md` §4.1 y §7.2) | **Sí**, declarándolo. Es sustitución, no desviación |

### 0.4 Los tres modos de aportar

| Modo | Qué hace | Qué exige del índice |
| --- | --- | --- |
| **Sumar** | Aporta conocimiento sobre algo que el framework no cubre | Nada adicional |
| **Especializar** | Concreta un documento del piso para una casa | Campo `hereda-de` |
| **Sustituir** | Reemplaza una **decisión de stack** etiquetada del piso, y sólo esas | Campo `sustituye` |

**La sustitución la habilita el framework por adelantado, no el que escribe el conocimiento.** Un ítem
del piso sólo es sustituible si el archivo de reglas que lo contiene lo rotuló como decisión de stack.
Sin ese rótulo el caso vuelve a ser **conflicto**, y ante conflicto entre un documento de conocimiento y
el archivo de reglas de la categoría que lo consume **manda la regla de categoría**, salvo que el
documento documente la desviación con su justificación. Es el mismo criterio que `Index-Design-Rules.md`
§4 aplica entre un documento base y su especialización.

Esa regla de subordinación existe además por un motivo mecánico: un documento de conocimiento y un
archivo de reglas de categoría **no viajan** en los insumos obligatorios de todo despacho, de modo que
el criterio de precedencia de `Root-Rules.md` §13 no decide entre ellos y **el conflicto se detendría**.
Declararla acá le da resolución en el árbol.

---

## 1. Especialidad asignada

### 1.1 Especialidad base

Analista de conocimiento técnico. Su trabajo es **caracterizar un artefacto existente para que otro
agente pueda reproducirlo o consumirlo**, no auditarlo, no mejorarlo y no contar su historia. Lee el
artefacto, identifica lo recurrente, separa la decisión del accidente, y escribe el contrato de uso.

La medida de su trabajo es una sola: **si un agente que nunca vio el artefacto puede usarlo bien leyendo
sólo el documento, el documento está bien.**

### 1.2 Variantes según qué se caracteriza

| Qué se caracteriza | Especialidad que releva | Dónde pone el foco |
| --- | --- | --- |
| Template, sistema de estilos, biblioteca de componentes | Desarrollador frontend senior | Layout de archivos, variables y tokens, puntos de extensión, convenciones de nombre de clase |
| Arquitectura de software, patrón de capas | Arquitecto de soluciones senior | Frontera entre capas, dependencias permitidas, qué se inyecta dónde, qué está prohibido |
| Esquema y nomenclatura de base de datos | Ingeniero de datos senior | Reglas de construcción de nombres, tipos canónicos, claves, convención de migraciones |
| Componente de interacción reusable (asistente, formulario dinámico) | Desarrollador frontend senior con foco en UX | Contrato de datos, pasos y estados, validación, extensibilidad |
| Convención de proceso interno de la casa | Analista de procesos | Disparadores, artefactos, responsables, criterios de cierre |

### 1.3 Multi-especialidad

Un artefacto que cruza dos dominios se releva con las dos especialidades y **se escribe como un solo
documento** si el artefacto es uno solo. Si al escribir aparecen dos temas independientes, son dos
documentos: lo resuelve §4.5, no la especialidad.

---

## 2. Documentos que produce

### 2.1 Tabla maestra

| Artefacto | Dónde se escribe | Obligatorio |
| --- | --- | --- |
| El documento de conocimiento, `Knowledge-<Tema>.md` | La raíz de la base de la organización | Sí |
| La fila en el índice `Index-Knowledge.md` de esa base | La misma raíz | Sí |
| El artefacto de referencia ejecutable | Subcarpeta de la base, junto al documento | Opcional, ver §2.2 |

### 2.2 Reglas de inclusión

- **El artefacto de referencia** se deposita sólo si lo caracterizado es ejecutable y el documento no
  alcanza a transmitirlo. El precedente del framework es `Templates/README.md`: «las formas
  constructivas del HTML, del CSS y del JavaScript se transmiten mal en prosa». Si se deposita, se
  declara en §9 del documento.
- **Nada de esto se escribe en el repositorio del framework.** Una captura no emite nota de coherencia,
  no toca el `CHANGELOG.md` de `IA.SDD` y no copia nada a `_legacy/`: esas obligaciones rigen para las
  intervenciones sobre el framework, y una captura no lo es.
- **La compuerta de ofuscación no corre en la captura.** La base es privada y D7 no la alcanza. Rige
  **sólo en la promoción** de un documento al catálogo público del framework, si algún día ocurre.

---

## 3. Nomenclatura y vinculación

### 3.1 Patrón de nombres

`Knowledge-<Tema>.md`, en Título-Con-Guiones ASCII, sin acentos ni eñes, por D3.

**Sin prefijos numéricos.** El orden de lectura dentro de un tema lo resuelve la tabla del índice. Un
prefijo numérico envejece mal el día que hay que insertar un documento intermedio.

### 3.2 El alias citable

El **alias** es el nombre corto y estable con que el intake cita el documento. Está desacoplado del
nombre de archivo a propósito: un archivo se puede renombrar en una migración, y la cita del intake de
un producto ya generado no debería romperse por eso.

**Tres reglas:**

1. **El alias es el nombre establecido de la cosa, cuando la cosa tiene nombre establecido.**
   `Clean-Architecture`, `Patron-DAO`, `Patron-Repository`, `CQRS`, `Atomic-Design`. No `Arquitectura-V2`
   ni `Template-1`. Un nombre canónico se entiende sin abrir el documento, que es la mitad del trabajo
   que un índice tiene que hacer.
2. **Unicidad en el índice de la base que lo declara.** No en el conjunto normativo del framework: la
   base vive afuera. Dos variantes del mismo canon conviven con alias distintos, nunca con el mismo.
   **Colisión con el framework**: si un alias coincide con el nombre de un documento del catálogo de
   diseño, el documento declara `hereda-de` y se resuelve como especialización; si no lo declara, la
   validación de intake lo rechaza. Un mismo nombre resolviendo a dos documentos es el defecto que el
   alias existe para evitar.
3. **Honestidad del nombre.** Si lo caracterizado se aparta materialmente de lo que el nombre canónico
   designa, el alias lo dice —`Clean-Architecture-Simplificada`— o el §0 del documento declara la
   desviación. Un alias canónico sobre contenido que no lo es engaña al que cita sin abrir, que es
   justamente el lector al que el alias sirve.

**Nombre agnóstico del dominio de origen**, con el mismo criterio que `Index-Modelos-UX-UI.md` §3:
`Panel-Operativo-Denso` sí, `Panel-Cliente-Acme` no. Acá la regla es recomendación y no obligación,
porque la base es privada; se vuelve obligación en la promoción.

### 3.3 Vinculación

Todo documento declara en su §9 el índice al que pertenece, sus documentos hermanos si los tiene, el
consumidor declarado y el artefacto de referencia si lo hay. La trazabilidad hacia el framework va por
`compatible-con` en el índice (§7).

---

## 4. Estructura de redacción

### 4.1 Cabecera obligatoria

```text
# <Título del documento>

**Alias:** <Alias-Citable>
**Naturaleza:** canonico | propio
**Consumidor:** <categoría 00 a 11 | transversal | subagente de fase, por ejemplo AG-00031>
**Condición de carga:** <expresada contra campos del intake, flags o tipo D8>
**Hereda de:** <alias o documento del piso, o —>
**Sustituye:** <referencia literal al ítem del piso, o —>
**Compatible con:** Rules-Base-Conocimiento.md <versión>
**Versión:** <X.Y>
**Estado:** Vigente | Superado
**Fecha:** YYYY-MM-DD
```

La cabecera y el índice son lo que hace barata la **divulgación progresiva**: se decide si el documento
aplica leyendo el índice, y se confirma leyendo la cabecera, sin cargar el cuerpo.

### 4.2 Secciones obligatorias

| Sección | Contenido |
| --- | --- |
| **§0 Propósito y alcance** | Qué artefacto caracteriza, **qué queda explícitamente afuera**, y en qué categoría vive lo que queda afuera |
| **§1 Identidad del artefacto** | Qué es, de qué tipo, sobre qué stack, con qué supuestos |
| **§2 Estructura** | Cómo está compuesto: layout de archivos, piezas y el rol de cada una |
| **§3 Contrato de uso** | Variables, puntos de extensión, convenciones que hay que respetar para no romperlo |
| **§4 Decisiones ya tomadas** | Las bifurcaciones que el artefacto resolvió, con el criterio de cada una |
| **§5 Esqueletos de referencia** | Lo mínimo reproducible |
| **§6 Criterios de aceptación** | Cómo se verifica que el conocimiento se aplicó bien |
| **§7 Anti-patrones** | Con su motivo |
| **§8 Frontera con las reglas** | Qué de este tema es normativo y vive en el archivo de reglas de su categoría |
| **§9 Trazabilidad** | Índice, hermanos, consumidor, artefacto de referencia |
| **§10 Control de cambios** | |

**§0 y §8 no se negocian.** Sin el «qué queda afuera» de §0, el agente que lo lee completa el hueco por
su cuenta. Sin §8, el documento empieza a leerse como norma y desplaza en la práctica al archivo de
reglas de su categoría sin haber pasado por su gobierno.

### 4.3 Secciones opcionales

§5 se omite cuando lo caracterizado es una convención y no tiene esqueleto —una nomenclatura de base de
datos, por ejemplo—. Toda omisión se declara en §0 con su motivo.

### 4.4 Las siete propiedades de forma

Son exigibles y verificables en §6. Salen de la práctica establecida de escritura de material para
consumo de agentes.

| Propiedad | Qué exige | Por qué |
| --- | --- | --- |
| **Un documento, un artefacto** | El documento cubre un artefacto o convención y nada más. Si aparecen dos temas, son dos documentos | La unidad de carga y la unidad de sentido coinciden, y no se paga contexto por lo que no se va a usar |
| **Cabecera autodescriptiva** | Qué es, a qué consumidor alimenta, cuándo aplica y qué queda afuera | La selección se resuelve sin abrir el cuerpo |
| **Secciones autocontenidas** | Cada sección se entiende leída sola | Permite citar una sección puntual sin arrastrar el documento entero |
| **Forma extractiva antes que narrativa** | Tablas, enunciados declarativos, identificadores y rutas literales. La prosa se reserva para el principio y el motivo | Un dato en tabla se consume sin interpretación; en prosa se reconstruye, y reconstruir es donde se pierde |
| **Un hecho, un lugar** | Nada se repite entre documentos de la base. Si dos lo necesitan, uno lo declara y el otro lo cita | Duplicar garantiza deriva: las dos copias se editan en momentos distintos y una queda mintiendo |
| **Forma de contrato** | Lo que hay que saber para **usar** el artefacto, no la historia de cómo llegó a ser así | El consumidor es un subagente que va a reproducirlo, no auditarlo |
| **Techo de tamaño declarado** | El de §6.2. Superarlo obliga a partir en dos | Sin techo, la base se degrada a documentos que nadie carga porque salen caros |

### 4.5 Anti-patrones a evitar

| Anti-patrón | Detección | Por qué |
| --- | --- | --- |
| **Reexplicar el canon** `[interpretativo]` | Un documento `canonico` que dedica más de una sección a describir el patrón en general | El framework ya manda que «los estándares de industria se nombran, no se enlazan» (`README.md`, autosuficiencia). Acá: se nombran, no se reexplican. Lo que aporta el documento es **lo que el nombre no dice** |
| **Conocimiento disfrazado de regla** `[enumerable]` | El documento define criterios de aceptación de un entregable del framework, nomenclatura de artefactos generados o gating por tipo D8 | Es una regla escrita en el lugar equivocado, sin el gobierno de una regla. §8 del documento existe para hacerlo visible |
| **Sustitución tácita** `[enumerable]` | El documento contradice un ítem del piso y el índice no declara `sustituye` | El subagente aplicaría la variante creyendo que aplica el piso |
| **Resumen de proyecto** `[interpretativo]` | El documento narra qué hace el sistema de origen en vez de cómo se construye lo caracterizado | Es lo que sale cuando la captura arranca sin el paso de orientación |
| **Documento de dos temas** `[interpretativo]` | §0 necesita dos oraciones con «y además» para declarar el alcance | Rompe la unidad de carga: se paga contexto por la mitad que no se usa |
| **Prefijo numérico en el nombre** `[enumerable]` | El nombre de archivo empieza con dígitos | Envejece mal al insertar un documento intermedio; el orden lo da el índice |

---

## 5. Preguntas guía para el relevamiento

Son las tareas de relevamiento propiamente dichas. El prompt que releva las recorre antes de escribir.

### 5.1 Orientación, antes de mirar nada

1. ¿Qué conocimiento se quiere capturar, en una oración?
2. ¿De qué artefacto o proyecto se lo extrae?
3. ¿Quién lo va a consumir: qué categoría o qué subagente de fase?
4. ¿Es `canonico` o `propio`? De la respuesta depende si el documento escribe **el delta** o escribe todo.

**Sin este paso la captura produce un resumen del proyecto en lugar de conocimiento reutilizable.** Es
el modo de falla más frecuente y el más caro, porque el resultado parece un documento válido.

### 5.2 Identidad y frontera

5. ¿Qué es exactamente lo caracterizado, y qué **no** lo es aunque esté al lado?
6. ¿Sobre qué stack y con qué supuestos funciona?
7. ¿Qué de este tema ya está normado por el framework y por lo tanto **no** va acá?

### 5.3 Estructura y contrato

8. ¿Cómo está compuesto? ¿Qué archivos, qué piezas, qué rol cumple cada una?
9. ¿Qué hay que declarar, configurar o completar para usarlo? Variables, tokens, puntos de extensión.
10. ¿Qué convenciones hay que respetar para no romperlo?
11. ¿Qué se rompe si se ignora cada una? Lo que no se puede responder acá probablemente no sea una
    convención sino una costumbre, y no va.

### 5.4 Decisiones y accidentes

12. ¿Qué bifurcaciones resolvió el artefacto, y con qué criterio? Eso es §4 del documento.
13. ¿Qué de lo que se ve es **decisión** y qué es **accidente** de cómo se fue armando? El accidente no
    se documenta como si fuera decisión: se omite, o se declara como deuda del artefacto.
14. ¿Qué se intentó y salió mal? Eso es §7 del documento, y es de lo más valioso que una captura puede
    dejar.

### 5.5 Composición con el piso

15. ¿Contradice algo que el framework ya fija?
16. Si contradice: ¿ese ítem está rotulado como **decisión de stack**? Si sí, va a `sustituye`. Si no,
    va a §8 del documento como desviación justificada, y **manda la regla del framework**.
17. ¿Especializa un documento del piso? Entonces va `hereda-de` y **sólo se escribe el delta**.

### 5.6 Verificación antes de cerrar

18. ¿Un agente que nunca vio el artefacto puede usarlo bien leyendo sólo esto?
19. ¿Hay algo repetido de otro documento de la base?
20. ¿Entra bajo el techo de §6.2?

---

## 6. Criterios de aceptación del documento

### 6.1 Lista de comprobación

- [ ] `[enumerable]` La cabecera lleva los diez campos de §4.1, ninguno vacío. Los que no aplican llevan `—`.
- [ ] `[enumerable]` El nombre de archivo cumple `Knowledge-<Tema>.md`, ASCII, sin prefijo numérico.
- [ ] `[enumerable]` El alias es único en el índice de la base.
- [ ] `[enumerable]` Están las secciones §0 a §10 de §4.2, salvo las omisiones que §0 declare.
- [ ] `[enumerable]` El documento entra bajo el techo de §6.2.
- [ ] `[enumerable]` Existe la fila en `Index-Knowledge.md` y sus campos coinciden con la cabecera.
- [ ] `[enumerable]` Si el documento contradice un ítem del piso, o el índice declara `sustituye`, o §8 declara la desviación con su justificación.
- [ ] `[interpretativo]` §0 declara qué queda afuera, y no en términos genéricos.
- [ ] `[interpretativo]` Un documento `canonico` escribe el delta y no reexplica el canon.
- [ ] `[interpretativo]` El documento no define criterios de aceptación, nomenclatura ni gating de artefactos que el framework genera.
- [ ] `[interpretativo]` Las siete propiedades de §4.4 se sostienen a lo largo del documento.
- [ ] `[interpretativo]` Un agente sin contexto previo podría usar el artefacto leyendo sólo esto.

### 6.2 Techo de tamaño

| Naturaleza | Techo | Motivo |
| --- | --- | --- |
| `canonico` | **250 líneas** | El agente ya conoce el patrón. Lo que falta es el delta: la variante adoptada, las convenciones locales y las decisiones ya tomadas. Un documento canónico largo es casi siempre un documento que se puso a explicar el canon |
| `propio` | **600 líneas** | El agente no sabe nada del artefacto y hay que darle identidad, estructura, contrato y esqueletos |

Superar el techo **no se justifica: se parte el documento en dos**, y los dos se declaran hermanos en su
§9. La única excepción es un §5 de esqueletos que no se puede partir sin volverlo inútil, y se declara
en §0 con su motivo.

**Estos dos números son calibrables.** Se fijan acá para que el criterio exista desde el primer día y se
revisan con los primeros documentos reales en la mano.

---

## 7. Contrato del índice de una base

`Index-Knowledge.md` es **el único lugar donde se declara qué existe y cuándo se carga**, y es lo que el
orquestador abre para resolver un alias. Una base cuyo índice no cumpla este contrato **no valida**.

### 7.1 Columnas obligatorias

| Columna | Qué lleva | Obligatoria |
| --- | --- | --- |
| `Documento` | Nombre de archivo | Sí |
| `Alias` | El alias citable de §3.2 | Sí |
| `Naturaleza` | `canonico` o `propio` | Sí |
| `Tema` | Una línea | Sí |
| `Consumidor` | Categoría `00` a `11`, `transversal`, o un subagente de fase (`AG-00031`). **Admite lista** | Sí |
| `Condicion-de-carga` | Expresada contra campos del intake, flags o tipo D8. `—` si sólo se carga por cita explícita | Sí |
| `Hereda-de` | Alias o documento del piso que especializa | Si aplica |
| `Sustituye` | Referencia literal al ítem del piso que reemplaza, por ejemplo `Maqueta-Rules.md §4.1 · tecnología de construcción` | Si aplica |
| `Compatible-con` | Versión de este archivo contra la que se escribió el documento | Sí |
| `Estado` | `Vigente` o `Superado` | Sí |

### 7.2 Por qué el consumidor admite subagentes de fase

Porque hay conocimiento cuyo consumidor natural no es una categoría. El caso concreto: quien construye
la maqueta es **AG-00031**, subagente de la Fase B2, y un documento sobre cómo construir páginas web
tiene que llegarle a él. Con el consumidor limitado a las doce categorías, ese conocimiento no
alcanzaría nunca al agente que lo necesita.

### 7.3 Por qué el consumidor es obligatorio

Es lo que evita la inflación de contexto. Sin él, un alias citado en el intake terminaría inyectado en
los doce despachos. Un documento puede declarar más de un consumidor —la caracterización de un template
alimenta razonablemente a 03 y a 11—, y por eso el campo admite lista; lo que no admite es estar vacío.

### 7.4 Identidad de versión de la base

La base declara una **identidad de versión citable** —la forma la elige la organización— y el intake la
registra. Es lo que hace reconstruible una corrida **sin copiar los documentos** al `_legacy/` del
framework: los documentos no son suyos, de modo que se cita la versión, no se copia el archivo.

---

## 8. Prompt-snippet sugerido

El prompt de relevamiento **cita este bloque literalmente** en lugar de reescribirlo.

```text
Vas a caracterizar un artefacto externo para incorporarlo a la base de conocimiento de la organización.

Rol: el que corresponda según §1.2 de `Rules-Base-Conocimiento.md`, en función de qué se caracteriza.

Antes de escribir nada, respondé las veinte preguntas guía de §5, en orden. Las cuatro primeras son
bloqueantes: sin orientación declarada, la captura produce un resumen del proyecto y no conocimiento
reutilizable.

Producís exactamente dos cosas, y las dos en la raíz de la base de conocimiento indicada:
  1. `Knowledge-<Tema>.md`, con la cabecera de §4.1 y las secciones de §4.2.
  2. La fila correspondiente en su `Index-Knowledge.md`, con las columnas de §7.1.

No escribís nada en el repositorio del framework.

Reglas que no se negocian:
  - Describís el artefacto, no el método del framework (§0.1).
  - Si es `canonico`, escribís el delta. No reexplicás el patrón (§4.5).
  - Si contradecís algo que el framework fija, mirá si ese ítem está rotulado como decisión de stack.
    Si lo está, lo declarás en `sustituye`. Si no, manda la regla del framework y lo declarás como
    desviación justificada en §8 del documento (§0.4).
  - Un documento, un artefacto. Si aparecen dos temas, son dos documentos.
  - Entrás bajo el techo de §6.2 o partís el documento.

Antes de devolver, corré la lista de §6.1 completa y declarás el resultado de cada ítem.
```

---

## 9. AG-00980 — Bibliotecario de conocimiento

**Sujeto a decisión abierta.** Si el responsable decide que el bibliotecario lleve su propio archivo de
reglas, con el precedente de `Maqueta-Rules.md` para AG-00031, esta sección se muda entera y acá queda
la referencia.

### 9.1 Para qué existe

El caso común lo resuelve la inyección por condición y por cita del intake, que es determinista y
gratis. **AG-00980 atiende el caso que esa vía no cubre**: el subagente que necesita algo específico y
no lo tiene entre sus insumos.

Un bibliotecario **entrega el libro; no lo lee por vos, no te lo resume, no te cuenta lo que dice**. Esa
es toda la diferencia, y es lo que evita crear una segunda fuente, que `Master-Prompt.md` §6 punto 1
prohíbe por nombre.

### 9.2 Contrato

| | |
| --- | --- |
| **Entrada** | La necesidad en prosa, tal como el subagente la escribió; el índice de la base declarada, filtrado por consumidor; el tipo D8 y los flags del proyecto de código |
| **Salida** | Una lista de **alias**, cada uno con una línea de fundamento. O vacía, que es una respuesta legítima |
| **Prohibido** | Devolver texto de los documentos. Proponer un alias que no esté en el índice. Escribir en ningún lado |
| **Quién entrega** | El **orquestador**, que resuelve alias a ruta e inyecta el documento entero y verbatim en el despacho de reanudación |
| **Registro** | Pedido y respuesta completos al log del orquestador |

Las dos prohibiciones del medio son las que hacen seguro al rol. **No devolver texto** elimina la
paráfrasis. **No proponer fuera del índice** lo vuelve una selección sobre un conjunto cerrado, que es
la misma disciplina con que D8 acota los tipos de proyecto de código: un agente que elige dentro de un
conjunto declarado no deriva, elige.

### 9.3 Secuencia

| Paso | Quién | Qué |
| --- | --- | --- |
| 1 | Subagente | Se detiene con el bloque de `Master-Prompt.md` §9, con la necesidad en «Qué se necesita» |
| 2 | Orquestador | Despacha a AG-00980 con la necesidad y el índice filtrado |
| 3 | AG-00980 | Devuelve los alias que corresponden, con fundamento. O ninguno |
| 4 | Orquestador | Resuelve alias a ruta, registra, y reanuda el despacho con los documentos sumados enteros |
| 5 | Subagente | Sigue, con el conocimiento en su lista de insumos obligatorios |

Si el paso 3 vuelve vacío, la detención escala al humano como cualquier otra ambigüedad de §9. Es
correcto: significa que la base no tiene lo que hacía falta, y **eso es información**, no una falla.

### 9.4 Dos propiedades que conviene aprovechar

**Cada llamada al bibliotecario es evidencia de una condición mal calibrada.** Si un subagente pidió el
patrón de acceso a datos de la casa, esa era una condición que el índice debería haber disparado solo.
El catálogo se afina con su propio uso en lugar de con opinión.

**El pedido en prosa es más barato que el índice viajando.** El costo deja de crecer con el tamaño del
catálogo y pasa a crecer con la frecuencia con que un subagente se queda corto, que es lo que se quiere
que tienda a cero a medida que las condiciones se afinan.

---

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-23 | Emisión inicial. Regula el **formato de un documento de conocimiento** y el **contrato del índice** de una base de conocimiento de la organización, que vive **fuera de este repositorio** y que el intake declara. El framework aporta el continente y no aporta ni un documento. Fija: la frontera entre conocimiento y método (§0.1); la capacidad como opcional y apagada por defecto (§0.2); las **dos capas del piso mínimo** —método no desplazable y decisión de stack sustituible— y los **tres modos de aportar**, sumar, especializar y sustituir, con la sustitución habilitada por el framework y nunca por el conocimiento (§0.3 y §0.4); la regla de subordinación que evita que un choque caiga en `Root-Rules.md` §13 y detenga; el patrón de nombres y las tres reglas del **alias citable** (§3); la plantilla del documento §0 a §10 y las **siete propiedades de forma** (§4); las **veinte preguntas guía** del relevamiento (§5); los criterios de aceptación con **techo de tamaño diferenciado** entre `canonico` y `propio` (§6); las diez columnas obligatorias del índice, incluido `sustituye` y el consumidor que **admite subagentes de fase** (§7); el prompt-snippet que el prompt de relevamiento cita literalmente (§8); y el contrato de **AG-00980**, el bibliotecario que entrega identificadores y nunca texto (§9). |
