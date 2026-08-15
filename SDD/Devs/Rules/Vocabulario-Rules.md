# Reglas de vocabulario normativo

**Archivo target:** todo artefacto del framework y toda documentación que el framework genera
**Lector:** el orquestador, todo subagente AG-XX, el auditor de cada fase y quien interviene el framework
**Versión de las reglas:** 3.0

---

## §1 Propósito y posición

Esta es una regla meta, como `Root-Rules.md` e `Intake-Rules.md`: no gobierna una de las doce categorías, gobierna una capacidad transversal. Fija **qué designa cada término del framework**, con un término por concepto y un concepto por término.

Existe porque el framework no tenía glosario propio. El único glosario disponible, el de `Marco-Teorico-SDD.md` §9, es un glosario de industria y define los dos términos centrales por su papel en la herramienta en lugar de por su frontera: *Proyecto* como «unidad de especialización del template» y *Solución* como «agrupación de una jerarquía de N proyectos». Un término definido por lo que la herramienta hace con él absorbe cualquier significado, y eso fue exactamente lo que ocurrió: la palabra «proyecto» llegó a designar cuatro cosas distintas dentro del mismo árbol generado.

La regla ordena el vocabulario en dos ejes que antes estaban mezclados en uno:

- El **eje de producto**, que responde qué se entrega y a quién. Es el eje del negocio y de las categorías que lo especifican.
- El **eje de código**, que responde cómo se compila y se agrupa lo que se entrega. Es el eje del ecosistema tecnológico.

Los dos ejes son independientes por diseño. Un mismo producto puede reorganizar su composición de código sin dejar de ser el mismo producto, y una misma solución de código puede pasar de servir a un producto a servir a dos.

---

## §2 Los seis términos

Cada término se define por su **frontera** —qué lo delimita, quién lo consume—, no por los artefactos que el framework le produce.

| Término | Qué designa | Qué lo delimita | Eje |
| --- | --- | --- | --- |
| **Producto** | Aquello que se entrega y que alguien usa para obtener valor. Es la unidad de trabajo del framework: un intake, un negocio, un repositorio destino, un árbol `SDD/Docs/` | Una frontera clara, stakeholders conocidos, usuarios o clientes definidos, un roadmap y un ciclo de vida propios. Dos conjuntos de capacidades con clientes, roadmaps y ciclos de vida desacoplados son **dos productos**, y llevan dos intakes | producto |
| **Unidad de entrega** | Cada pieza del producto que se despliega o se distribuye por separado y que un usuario, integrador u operador consume directamente. **Es el nivel intermedio del layout de salida** y el que lleva un valor D8 | Poder desplegarse o publicarse de forma independiente. Un producto monolítico tiene una sola | producto |
| **Módulo** | Área funcional dentro de una unidad de entrega: un agrupamiento de capacidades con sentido para el usuario | Cohesión funcional percibida por quien usa el producto. **No es desplegable por separado** | producto |
| **Solución de código** | El artefacto del ecosistema que agrupa la construcción: el archivo de solución en .NET, el POM agregador en Maven, el *workspace* en Cargo o npm | El comando de construcción que la toma como entrada única | código |
| **Proyecto de código** | La unidad de compilación dentro de una solución de código: lo que el ecosistema llama *project*, *module*, *subproject* o *package*. **No lleva valor D8 y no tiene árbol documental propio**: se inventaría a nivel producto y las unidades de entrega declaran cuáles componen | Producir un artefacto de compilación propio y declarar sus propias dependencias | código |
| **Proyecto** | El emprendimiento: el esfuerzo temporal que se acomete para construir o evolucionar un producto | Tener principio, fin y alcance acordado. Es temporal por definición; el producto no lo es | proceso |

**Repositorio destino**, **repositorio fuente** y **repositorio de documentación** conservan el sentido que les fija el `README.md` del framework y no se redefinen acá.

---

## §3 Los cuatro planos de identidad

Un producto se nombra distinto en cada plano, y los cuatro nombres son **independientes**: ninguno se deriva de otro salvo donde esta tabla lo declara. Confundirlos fue lo que produjo bloques informativos con tres líneas que parecían la misma cosa escrita distinto.

| Plano | Campo | Forma | Quién lo consume | Ejemplo |
| --- | --- | --- | --- | --- |
| Negocio | `Nombre-Producto` | Prosa legible, con espacios, tildes y mayúsculas naturales | 00-Contexto, 01-Necesidades-Negocio, el README raíz, la comunicación con el cliente | `Gestión de Turnos` |
| Documentación | `Slug-Producto` | Título-Con-Guiones, ASCII sin acentos (D3) | Nombres de archivo y rutas del plano documental: `PRODUCT-INTAKE-<Slug-Producto>.md` | `Gestion-De-Turnos` |
| Código, raíz | `Raiz-Codigo` | La del ecosistema. **Admite separadores de segmento** | El archivo de solución, la raíz de los espacios de nombres, el prefijo de cada proyecto de código | `Contoso.Turnos` |
| Código, agrupador | `Artefacto-Agrupacion` | `<Raiz-Codigo>` más la extensión del ecosistema | El comando de construcción, la apertura del repositorio, los scripts | `Contoso.Turnos.sln` |

Reglas de derivación y de declaración:

1. `Slug-Producto` **se deriva** de `Nombre-Producto` con el algoritmo de normalización de `Master-Prompt.md` §3.2. Es el único derivado obligatorio.
2. `Raiz-Codigo` **se declara** en el perfil de convención del intake. Solo se deriva de `Nombre-Producto` cuando el intake no declara valor, y aun entonces admite separadores. La identidad de código es una decisión técnica, muchas veces preexistente al framework, y no una forma tipográfica del nombre de negocio.
3. `Artefacto-Agrupacion` se deriva de `Raiz-Codigo` con la extensión del ecosistema, y se declara cuando el ecosistema no tiene una convención única.
4. Cada proyecto de código lleva a su vez dos nombres: `Nombre-Proyecto-Codigo`, su identidad documental en Título-Con-Guiones, e `Identidad-Codigo`, su nombre en el ecosistema, compuesto como `<Raiz-Codigo>.<Sufijo>`.

**Prohibido que dos de estos campos se distingan solo por capitalización o por puntuación.** Si `Slug-Producto` y `Raiz-Codigo` resultan la misma cadena con los puntos cambiados por guiones, uno de los dos está mal declarado: el plano de negocio no habla en forma de código.

---

## §4 Reglas de uso

**R1. «Proyecto» a secas designa el emprendimiento.** Nunca una unidad de compilación, nunca un producto. Cuando el referente es la unidad de compilación se escribe **siempre completo**: «proyecto de código».

> Excepción única y declarada: en los compuestos `multi-proyecto`, `inter-proyecto` y `cross-proyecto`, el referente es siempre el proyecto de código. Son formas lexicalizadas donde el calificador no entra sin deformar la palabra. Fuera de esos tres compuestos la excepción no se extiende.

**R2. «Solución» a secas no se usa.** El agrupador de construcción se escribe siempre completo: «solución de código». La palabra queda reservada a ese compuesto y a su uso corriente en prosa de negocio («la solución al problema del cliente»), donde no nombra ningún concepto del framework.

**R3. El nivel se declara por artefacto, sobre tres niveles posibles.** La cabecera de cada
`Rules-<Categoria>.md` declara el nivel predominante de la categoría y **el nivel que rige es el de
cada artefacto**. Los tres niveles son:

| Nivel | Qué documenta | Dónde vive su salida |
| --- | --- | --- |
| **Producto** | Lo que atraviesa todas las entregas: visión, necesidades de negocio, el equipo, y el inventario de la solución de código con su grafo de compilación | `SDD/Docs/` y `SDD/Docs/Producto/` |
| **Unidad de entrega** | Lo que alguien despliega o publica y otro consume: casos de uso, experiencia, backlog, plan, calidad, pipeline, ejemplos y cuerpo documental | `SDD/Docs/Unidades-Entrega/<Nombre-Unidad-Entrega>/` |
| **Proyecto de código** | Su stack, sus dependencias de compilación, sus capas y su modelo de datos lógico. **No tiene árbol propio**: se declara dentro del inventario de nivel producto y de la arquitectura de las unidades de entrega que compone | `SDD/Docs/Producto/` |

El tercero no es un nivel de carpetas y es deliberado: un proyecto de código compartido entre varias
unidades de entrega tendría que documentarse una vez por cada una, o asignarse arbitrariamente a una
dejando en las otras una referencia colgada. Ese nivel fija qué nombre usa el documento en su prosa: un documento de nivel
producto nombra al producto con `Nombre-Producto` y tiene prohibido nombrarlo con `Raiz-Codigo`.

Cuándo hace falta declararlo artefacto por artefacto:

- Si **todos** los artefactos de la categoría comparten el nivel de la cabecera, la declaración de la
  cabecera los gobierna a todos y no hace falta nada más. Es el caso de once de las doce categorías.
- Si la categoría contiene artefactos de **más de un nivel**, su tabla maestra §2.1 lleva una columna
  **Nivel** y la declara artefacto por artefacto. Hoy es el caso de `Rules-Plan-Sprint.md`, cuyos
  planes son del proyecto de código y cuya velocidad, capacidad y plantillas de ceremonia son del
  equipo, que es del producto.

**Por qué el nivel es del artefacto y no de la categoría.** Declararlo por categoría presupone que
todos sus artefactos hablan del mismo nivel. Cuando no es así, los del nivel equivocado se replican
una vez por proyecto de código y **dejan de medir lo que su nombre dice**. El nivel de un artefacto
se deriva de **de qué habla**, no de en qué carpeta está.

**Señal de detección, aplicable al resto del framework.** Una regla cuya **forma** se condiciona a un
atributo del nivel superior es candidata a contener artefactos de ese nivel superior. En
`Rules-Plan-Sprint.md` ese atributo es `equipo_n`, que `Master-Prompt.md` §4 declara de ámbito
producto, y que ni siquiera está nombrado en la regla de la categoría.

**R4. «Módulo» conserva su sentido funcional.** Designa un área funcional del producto, no una unidad de compilación. El uso que ya hacen las reglas de UX-UI-DX, de maqueta y de calidad es el correcto y no se toca.

**R5. Un término, un concepto.** Ningún artefacto del framework introduce un sinónimo de los seis términos de §2 sin incorporarlo acá primero.

**R6. «Migración» a secas no designa la capacidad del framework.** Llevar un destino generado con una versión anterior a la versión vigente se escribe **siempre completo**: «migración normativa». La palabra desnuda queda para los otros dos referentes que ya tenía —la intervención sobre el propio framework y las migraciones de datos o de esquema del producto documentado—, y para su uso corriente en prosa. La familia calificada, la colisión que la obliga y la única excepción admitida están en §9.6.

---

## §5 Confusiones que esta regla cierra

| No son lo mismo | Diferencia |
| --- | --- |
| Producto y solución de código | El producto es qué se entrega; la solución de código es cómo se agrupa la construcción. Su cardinalidad no es necesariamente uno a uno |
| Producto y proyecto de código | Un producto puede compilarse en un proyecto de código o en veinte. El número de proyectos de código no dice nada sobre cuántos productos hay |
| Producto y proyecto | El producto es permanente y se mide por el valor que entrega; el proyecto es temporal y se mide por su alcance y su cierre |
| Unidad de entrega y proyecto de código | Una unidad de entrega se despliega; un proyecto de código se compila. Una capa interna es proyecto de código y **no** es unidad de entrega. Las dos condiciones no se excluyen: un proyecto de código que se publica por separado —una librería redistribuible— **es también** una unidad de entrega |
| El grafo de entrega y el grafo de construcción | Son **dos grafos distintos sobre el mismo producto** y no coinciden. El de entrega une unidades por **integración en runtime**; el de construcción une proyectos de código por **dependencia de compilación**. Un front que le habla a una API por HTTP tiene una arista de entrega y ninguna de compilación |
| Composición y contención | Una unidad de entrega **se compone de** proyectos de código; no los contiene. La relación es de muchos a muchos: un proyecto de código compartido compone varias unidades de entrega, y por eso se inventaría una sola vez a nivel producto |
| Unidad de entrega y módulo | La unidad de entrega se despliega por separado; el módulo no. Un panel con nueve módulos en su barra de navegación es **una** unidad de entrega |
| `Slug-Producto` y `Raiz-Codigo` | Identidad documental e identidad de código. Independientes por diseño: ver §3 |

---

## §6 Precedencia frente al glosario del dominio del cliente

El dominio de un cliente puede usar cualquiera de estas seis palabras con otro sentido, y es legítimo: el vocabulario del negocio no se le corrige al negocio.

Cuando ocurre, rige este procedimiento:

1. El glosario del dominio del intake **declara explícitamente el choque** y define los dos usos, cada uno con un término distinguible.
2. Dentro de la documentación generada, el término desnudo queda para el sentido del dominio del cliente, y el sentido del framework se escribe calificado.
3. La declaración es bloqueante: un intake cuyo glosario usa un término de §2 sin declarar el choque no pasa la validación de `Intake-Rules.md` §5.

Es lo que convierte en procedimiento lo que hasta ahora cada destino resolvía por reacción y de manera distinta.

Esta sección resuelve el choque de **un término de §2** con el dominio del cliente. El criterio general —cuándo un término polisémico cualquiera necesita desambiguarse y cuándo no— vive en §9, y es el que decide si un choque como éste es un defecto o es lenguaje natural funcionando.

---

## §7 Correspondencia con el vocabulario de industria

El framework no inventa estos conceptos: los nombra igual que los estándares que ya usa en sus roles y en sus prácticas. La tabla declara la correspondencia para que quien llega con formación de industria no tenga que aprender un vocabulario paralelo.

| Término del framework | Correspondencia | Fuente |
| --- | --- | --- |
| Producto | *Product*: vehículo para entregar valor, con frontera clara, stakeholders conocidos y usuarios o clientes definidos. Un *Product Backlog* y un *Product Owner* por producto | Scrum Guide 2020 |
| Unidad de entrega | *Container*: unidad desplegable o ejecutable por separado, por encima del nivel de componente | Modelo C4 |
| Módulo | *Component*: agrupamiento de funcionalidad dentro de una unidad desplegable, no desplegable por sí mismo | Modelo C4 |
| Proyecto | *Project*: esfuerzo temporal que se acomete para crear un producto, servicio o resultado único | Cuerpo de conocimiento y léxico del PMI |
| Solución de código y proyecto de código | *solution* / *project* en Visual Studio y MSBuild; *multi-module project* / *module* en Maven; *multi-project build* / *subproject* en Gradle; *workspace* / *package* en Cargo y npm | Documentación de cada ecosistema |
| Producto, como sistema entregado a un cliente | *Solution* de SAFe: el producto, servicio o sistema entregado al cliente. Se registra la correspondencia porque explica por qué el framework usaba antes esa palabra | SAFe |

**Sobre la evidencia de esta sección.** Las afirmaciones de §1 a §6 se verifican abriendo archivos de este repositorio. Las de esta tabla se verifican contra los estándares publicados, que no viven acá: se citan por estándar y por concepto, y deliberadamente sin número de cláusula, porque un número que no se puede comprobar desde el repositorio sería una cita sin evidencia y D9 lo prohíbe.

**No se adopta ningún marco completo.** SDD toma de cada fuente la definición del concepto, no su ceremonia ni su estructura organizativa.

---

## §8 Pendientes declarados y su cierre

**Cerrado en la versión 8.0.** Hasta la 7.0, la unidad de entrega estaba definida en §2 y no era un
nivel del layout: el nivel intermedio de `SDD/Docs/Proyectos/<Nombre-Proyecto-Codigo>/` se poblaba con
proyectos de código, y las once categorías que colgaban de él producían artefactos que no eran de ese
nivel. La 8.0 lo ejecuta: el nivel intermedio pasa a `SDD/Docs/Unidades-Entrega/<Nombre>/`, el valor
D8 pasa a ser atributo de la unidad de entrega, y el proyecto de código deja de tener árbol propio.

La discrepancia que lo originó se midió sobre destinos reales antes de corregirla: un producto de
nueve necesidades de negocio había emitido setenta y un casos de uso repartidos en siete proyectos de
código, dos de los cuales se desplegaban; un proyecto de código de DTOs tenía guía de onboarding para
developers y documento de entornos de despliegue, y ese documento tuvo que abrir declarando que el
proyecto «no tiene ambientes ni canales propios».

**Alcance de esta regla, declarado.** Esta regla gobierna **los términos del framework que colisionan
con el vocabulario del dominio de un cliente**: los seis de §2, con su precedencia de §6 y su criterio
de desambiguación de §9. No gobierna el resto del vocabulario propio del framework —`sonda`, `pasada
de diseño`, `pasada de ejecución`, `arnés` y equivalentes—, que **vive en el glosario operativo de
`Master-Prompt.md` §15** y se cita desde la documentación generada sin redefinirlo. Que un término
del método no colisione con el negocio no significa que no haga falta definirlo: significa que su
ausencia es silenciosa.

La declaración importa porque esta regla se presenta como la regla de vocabulario del framework y
gobierna seis palabras. Sin decir dónde vive el resto, cada categoría que necesita un término del
método tiene que decidir por su cuenta dónde declararlo, y decide distinto.

Con eso queda resuelto también el segundo tramo del pendiente: el campo pasa a llamarse
**`tipo_unidad_entrega`**, que es el nivel que le corresponde. El conjunto D8 no cambia —siguen siendo
exactamente ocho valores— y lo que cambia es de qué es atributo: `SDD-Development-Guide.md` declara
que los ocho tipos «cubren el espacio de **formas de entrega** de software», y una forma de entrega
es una propiedad de lo que se entrega, no de lo que se compila.

**Sobre la cardinalidad de soluciones de código.** Es `1..N` según §5, y el inventario del eje de
construcción lo respeta: `PRODUCT-MANIFEST-template.md` §2.B agrupa los proyectos de código **por
solución de código**, y §3 declara que hay **un grafo de compilación por solución**, porque la
solución es lo que delimita un comando de construcción. Una dependencia entre proyectos de soluciones
distintas no es una arista de ese grafo: es un consumo de artefacto publicado.

**Sin pendientes declarados.** Esta sección se conserva porque el mecanismo de declarar un pendiente
en la propia regla funcionó: el que estuvo acá desde la 5.0 se cerró en la 8.0, y quedó visible
durante tres versiones en lugar de leerse como un descuido. Cuando aparezca otro, va acá.

---

## §9 Criterio de desambiguación léxica

Las secciones anteriores fijan el vocabulario **del framework**. Esta fija cómo se decide, en cualquier documentación que el framework genere, si un término con más de un referente es un defecto o es lenguaje natural funcionando. Sin ella, el framework verifica «glosario sin contradicciones» sin tener con qué separar un caso real de un falso positivo.

### §9.1 La regla de decisión

**Un término polisémico se desambigua solo cuando sus sentidos pueden aparecer en el mismo contexto de lectura.** Cuando los contextos son disjuntos, no se califica: hacerlo carga el texto sin resolver un problema que no existe.

«Imagen de registro» y «registro del contenedor» conviven sin ambigüedad: el modificador las distingue y ningún lector se confunde. Reportarlas como defecto es un falso positivo, y la corrección que ese falso positivo induce —calificar todas las ocurrencias del término— **es** un defecto.

### §9.2 Qué cuenta como «mismo contexto de lectura»

Acá está la parte que el framework tiene que declarar explícitamente, porque es propia de cómo trabaja y no se deduce de la lingüística:

> **El contexto de lectura de un subagente es la sección, no el documento.**

`Master-Prompt.md` §8 construye cada despacho con una lista de insumos que nombra **secciones**, no archivos completos: «Parte A negocio; §13 composición; §17 bloque técnico del proyecto de código». Un lector humano abre el documento entero y el contexto le resuelve la referencia; un subagente que recibió tres secciones de setenta, no.

Consecuencia operativa: **un término cuyos sentidos se distinguen solo leyendo el documento completo sí colisiona.** «El registro queda en el estado previo», leído dentro de un caso de uso completo, se entiende; leído como sección suelta por un subagente que tiene que derivar una decisión de transaccionalidad, admite tres lecturas que producen tres arquitecturas distintas.

Corolario: el término desnudo de una familia calificada es el caso que hay que mirar. Si un documento usa «registro de auditoría», «registro del contenedor» e «imagen de registro», las tres formas calificadas están bien y **«el registro» a secas es el defecto**.

### §9.3 Las tres formas de desambiguar, por costo creciente

Se usa **la más barata que resuelva el caso**, y se declara por qué las anteriores no alcanzaban.

| Forma | Cuándo alcanza | Costo |
| --- | --- | --- |
| **Entrada de glosario** que declara los referentes y cuál corresponde a cada contexto | El término se lee mal solo en algunas secciones y el glosario está en el alcance de lectura del subagente | El más bajo: un párrafo, ninguna reescritura |
| **Forma calificada obligatoria** en las ocurrencias que colisionan | El término desnudo aparece en secciones que se despachan por separado y ahí no se resuelve | Medio: reescritura puntual, verificable por ocurrencia |
| **Invariante de producto con prohibición de fusión** (§5 de `Master-Prompt.md`) | El término es central, se usa en las doce categorías y una fusión posterior invalidaría documentación aguas abajo | El más alto: alcanza a todo subagente y a todo audit |

### §9.4 Prohibición

**No se declara una invariante de desambiguación sin haber verificado que los contextos colisionan.** Enumerar los sentidos de un término cuyos contextos son disjuntos, y prohibir su fusión, es tratar como defecto lo que no lo es. El patrón queda primado: una vez que un producto declara una invariante para un término, la forma del patrón —enumerar sentidos, prohibir la fusión— se aplica al siguiente término sin volver a verificar la premisa.

La verificación es por ocurrencia y es afirmación sobre el estado del sistema: cae bajo D9.

### §9.5 Sustituir un término en un corpus ya escrito

Renombrar un término a lo largo de documentación existente es una intervención léxica, no una operación de texto. **Queda prohibida la sustitución global de una cadena.** Dos razones, las dos verificadas sobre este mismo framework:

1. **La cadena de un término es subcadena de otras palabras.** Sustituir `soluci*` por `producto` convierte «re**soluci**ón» en «reproducto». En la intervención del framework 5.0 esto produjo treinta ocurrencias de una palabra inexistente en doce archivos, incluidos un título de sección, un ancla de tabla de contenido y el nombre de un campo de contrato.
2. **La misma palabra puede llevar un sentido no normativo que las reglas de uso preservan.** R2 conserva «solución» en prosa de negocio y como remedio de un problema. La misma intervención pisó veintitrés cabeceras de tabla de anti-patrones —cuya columna de remedio se llama «Solución»— y varios usos de prosa, dejando concordancias de género rotas del tipo «producto técnica».

Procedimiento obligatorio: enumerar las ocurrencias, clasificar cada una por sentido, sustituir solo las que cambian de referente y verificar el resultado con un barrido que busque la palabra nueva en contextos donde no puede aparecer. El registro de la sustitución declara cuántas ocurrencias se revisaron y cuántas se cambiaron.

### §9.6 Familia calificada declarada: «migración normativa»

El framework incorporó la capacidad de llevar un destino generado con una versión anterior a la versión vigente. La palabra que la nombra **ya tenía dos referentes vigentes**, así que antes de adoptarla se corrió el barrido que §9.4 exige. Esta subsección deja constancia del barrido y de su resolución, que es lo que convierte a R6 en una regla con premisa verificada en lugar de un patrón aplicado por analogía.

**Los tres referentes de «migración» en el framework:**

| Id | Qué designa | Dónde vive | Estado |
| --- | --- | --- | --- |
| **R1** | La intervención sobre el propio framework que renombró su vocabulario en la versión 5.0 | Las filas de control de cambios de diez archivos del árbol vivo, que la nombran «la migración de la 5.0» | Preexistente |
| **R2** | Las migraciones de datos y de esquema del **producto documentado** | `Rules-Arquitectura-Tecnica.md` (migración inicial del modelo lógico, su anti-patrón de modelo sin migración versionada y el plan de migraciones de un estilo arquitectónico), `Rules-Devops.md` (guía de migración ante un cambio incompatible y su ejemplo de mensaje de commit) y el ejemplo de dolor de `PRODUCT-INTAKE-template.md` | Preexistente |
| **R3** | Llevar un destino de la versión de origen a la vigente preservando su contenido | La capacidad nueva: `Migracion-Rules.md` y el orquestador que la ejecuta | Nuevo |

**Resolución, por la escalera de §9.3:**

| Frente | Forma adoptada | Por qué la anterior no alcanzaba |
| --- | --- | --- |
| R3 contra R1 | **Forma calificada obligatoria**: el término canónico es «migración normativa», hermano de «reconciliación normativa», que ya existía | La entrada de glosario sola no resuelve, porque los dos referentes coexisten **en la misma sección**: §9.5 de este archivo habla de la intervención 5.0 y es precisamente donde se explica cómo no hacer una sustitución léxica. Por §9.2 el criterio de colisión es la sección, no el documento |
| R1 en prosa normativa vigente | Se sustituye por **«intervención»**, término que el framework ya usa para eso en su `README.md` y en `SDD-Development-Guide.md` §VI | El sentido viejo tiene un término mejor y disponible: liberar la palabra sale más barato que calificarla en cada ocurrencia. Alcanzó a las dos ocurrencias de §9.5. **Las filas de control de cambios no se tocan**, por §VI.2 de la guía de desarrollo: una fila ya escrita no se reescribe, y por eso R1 sigue siendo un referente vivo y la calificación de R3 sigue siendo necesaria |
| R3 contra R2 | **Nada** | Los contextos son disjuntos: R2 vive en la documentación técnica del producto —persistencia, devops, configuración— y R3 en la normativa del framework sobre sus propios destinos. Calificar R2 sería el falso positivo que §9.1 describe y que el criterio negativo de §10 declara defecto del informe. Se declara acá para que una ronda de auditoría posterior no lo levante como hallazgo |

**Forma desnuda admitida.** Dentro de `Migracion-Rules.md` y del master-prompt de migración, donde no hay otro referente en el contexto de lectura, «migración» puede usarse sin calificar. En todo otro archivo la primera mención de cada sección va calificada. Es el tratamiento estándar de una familia calificada según §9.2.

**Lo que conserva su nombre.** «Reconciliación normativa» sigue designando la fase de diagnóstico del orquestador de generación, porque lo que hace es comparar y no transformar. Lo que se renombró es su salida A: de «plan de adecuación» a «plan de migración normativa».

---

## §10 Criterios de aceptación

**Naturaleza de cada criterio.** Cada ítem lleva su marca: `[enumerable]` si se decide contando o
comparando —existencia, forma, recuento, resolución de un enlace— y `[interpretativo]` si solo se
decide leyendo los dos lados. Los enumerables son los que la compuerta mecánica de
`Master-Prompt.md` §10.0 tiene que cubrir; los interpretativos son para lo que el audit existe.

La clasificación es **conservadora por diseño**: ante la duda, un criterio se marca interpretativo.
El error no es simétrico —declarar mecanizable algo que no lo es produce falsa confianza, que es peor
que la ausencia de verificación—, así que marcar de más un interpretativo solo cuesta atención del
auditor, y marcar de menos un enumerable dejaría un hueco que nadie mira.

Verificables por el auditor de cualquier fase sobre cualquier artefacto:

- [ ] [interpretativo] No aparece «proyecto» a secas designando una unidad de compilación ni un producto, salvo en los tres compuestos de la excepción de R1.
- [ ] [interpretativo] No aparece «solución» a secas designando el agrupador de construcción.
- [ ] [interpretativo] Los cuatro campos de identidad de §3 están declarados y ninguno se distingue de otro solo por capitalización o puntuación.
- [ ] [interpretativo] Todo documento de nivel producto nombra al producto con `Nombre-Producto` y no con `Raiz-Codigo`.
- [ ] [interpretativo] Si el glosario del dominio del cliente usa un término de §2, el choque está declarado según §6.
- [ ] [interpretativo] Ningún sinónimo nuevo de los seis términos circula sin estar incorporado a §2.
- [ ] [interpretativo] No aparece «migración» a secas designando la capacidad de llevar un destino a la versión vigente, salvo dentro de los dos archivos donde §9.6 admite la forma desnuda.

Sobre desambiguación léxica (§9), en la documentación que el framework genera:

- [ ] [interpretativo] Todo término que la fase acuña y que aparece en más de un artefacto está declarado en el glosario de su categoría.
- [ ] [interpretativo] Todo término con más de un referente dentro de la fase tiene entrada de glosario que los declara, o forma calificada en todas las ocurrencias que colisionan.
- [ ] [interpretativo] Ninguna forma desnuda de un término de una familia calificada queda sin resolver en una sección que se despacha por separado (§9.2).
- [ ] [interpretativo] **Criterio negativo:** ninguna polisemia con contextos disjuntos se reporta como defecto. Reportarla es un hallazgo del informe de auditoría, no del documento auditado.
- [ ] [interpretativo] Toda invariante de desambiguación declarada cita la verificación de colisión que la justifica (§9.4).
- [ ] [interpretativo] Ninguna sustitución de un término en un corpus ya escrito se hizo por reemplazo global de la cadena, y su registro declara ocurrencias revisadas y ocurrencias cambiadas (§9.5).

---

## §11 Control de cambios

| Versión | Fecha | Cambios | Autor |
| --- | --- | --- | --- |
| 1.0 | 2026-07-29 | Regla inicial de vocabulario normativo. Fija los seis términos de §2 con definición por frontera, los cuatro planos de identidad de §3, las cinco reglas de uso de §4, la tabla de confusiones de §5, la precedencia frente al glosario del dominio del cliente de §6 y la correspondencia con el vocabulario de industria de §7. Nace de la constatación de que el framework no tenía glosario propio y de que sus dos términos centrales estaban definidos por su papel en la herramienta en lugar de por su frontera. Declara como pendiente la reubicación de las once categorías de nivel producto al nivel de unidad de entrega. | Reformulación SDD |
| 2.0 | 2026-07-29 | **§9 nueva, criterio de desambiguación léxica.** La regla pasa de fijar el vocabulario del framework a fijar además cómo se decide, en la documentación que el framework genera, si un término con más de un referente es un defecto. Sube major porque agrega criterios de aceptación que el auditor de cualquier fase aplica sobre todo artefacto, y porque §9.5 prohíbe un procedimiento que hasta ahora no estaba prohibido. §9.1 fija la regla de decisión: se desambigua solo cuando los sentidos comparten contexto de lectura. §9.2 declara que **el contexto de lectura de un subagente es la sección y no el documento**, porque el despacho de `Master-Prompt.md` §8 entrega secciones nombradas y no archivos completos; de ahí se sigue que el término desnudo de una familia calificada es el caso a mirar y las formas calificadas no lo son. §9.3 ordena las tres formas de desambiguar por costo creciente y obliga a usar la más barata que resuelva. §9.4 prohíbe declarar una invariante de desambiguación sin verificar la colisión, y remite esa verificación a D9. §9.5 prohíbe la sustitución global de una cadena al renombrar un término en un corpus ya escrito, con las dos clases de daño verificadas sobre la migración de la 5.0 —la subcadena dentro de otra palabra y el sentido no normativo que R2 preserva— y fija el procedimiento por ocurrencia. §6 suma un puntero a §9. §10 suma seis criterios, incluido el criterio negativo del falso positivo. **Origen**: el criterio existía enunciado dentro del intake de un producto real y no como regla del framework; y la propia migración de la 5.0 lo incumplió antes de que existiera. §11 era §10. | Revisión SDD |
| 2.1 | 2026-07-29 | Adopción del término de la capacidad de migración normativa (prerrequisito F5). **§9.6 nueva**: declara la familia calificada «migración normativa» con sus tres referentes verificados por barrido —la intervención sobre el propio framework en la 5.0, las migraciones de datos y de esquema del producto documentado, y la capacidad nueva—, y su resolución por la escalera de §9.3. Se adopta la **forma calificada obligatoria** frente al primer referente, con el primer escalón declarado insuficiente y su evidencia: los dos sentidos coexisten dentro de §9.5 de este mismo archivo, y por §9.2 el criterio de colisión es la sección. Frente al segundo referente **no se desambigua nada**, por contextos disjuntos, y la constancia queda escrita para que una ronda de auditoría posterior no lo levante como hallazgo. Se declara la forma desnuda admitida y que «reconciliación normativa» conserva su nombre porque compara y no transforma. **§4 suma R6** con la regla de uso operativa. **§9.5** libera el sentido viejo sustituyendo «migración» por «intervención» en sus dos ocurrencias de prosa normativa; las filas de control de cambios que nombran «la migración de la 5.0» **no se tocan**, por `SDD-Development-Guide.md` §VI.2, y por eso ese referente sigue vivo y la calificación sigue siendo necesaria. **§10** suma un criterio. Sube **minor**: incorpora una declaración y una regla de uso sin invalidar ninguna de las anteriores. | Framework SDD (migración normativa) |
| 2.2 | 2026-08-15 | Nivel por artefacto y alcance declarado (intervención reportes 00 a 11). **R3** pasa de «cada categoría declara su nivel» a «el nivel se declara por artefacto»: la cabecera declara el nivel predominante y gobierna a toda la categoría cuando sus artefactos lo comparten, y una categoría con artefactos de más de un nivel lleva columna **Nivel** en su tabla maestra §2.1. Se agrega la señal de detección para el resto del framework: una regla cuya forma se condiciona a un atributo del nivel superior es candidata a contener artefactos de ese nivel. **§8** declara el alcance real de esta regla —los términos que colisionan con el dominio del cliente— y remite el resto del vocabulario propio del framework al glosario operativo de `Master-Prompt.md` §15, que es la política que `Rules-Plan-Sprint.md` §6 ya enunciaba una sola vez y sobre términos que no la necesitaban. Sube **minor**: precisa una regla de uso y declara un alcance, sin cambiar los seis términos ni su precedencia. Origen: reportes `08` y `11`. Además, **§6 clasifica cada criterio de aceptación** como `[enumerable]` o `[interpretativo]`, con la nota que declara la política conservadora: ante la duda se marca interpretativo, porque declarar mecanizable lo que no lo es produce falsa confianza. Los enumerables son lo que la compuerta mecánica de `Master-Prompt.md` §10.0 debe cubrir. Origen adicional: reportes `09` y `10`. | Framework SDD (intervención reportes 00-11) |
| 3.0 | 2026-08-15 | La unidad de entrega pasa a ser un nivel del layout (framework 8.0). **§2** declara que es el nivel intermedio y el que lleva el valor D8, y que el proyecto de código no lleva D8 ni tiene árbol documental propio. **§4 R3** pasa de dos niveles a tres, con la tabla que declara qué documenta cada uno y dónde vive su salida, y con el motivo de que el tercero no sea un nivel de carpetas: un proyecto de código compartido tendría que documentarse una vez por cada unidad de entrega que compone. **§5** suma tres confusiones: que un proyecto de código publicable es también una unidad de entrega, que el grafo de entrega y el de construcción son distintos y no coinciden, y que la relación entre ejes es de composición de muchos a muchos. **§8** cierra el pendiente declarado desde la 5.0 y registra el que queda: el inventario de proyectos de código no agrupa por solución de código cuando hay más de una. Sube **major**: cambia el nivel de aplicación de once categorías. | Framework SDD |
