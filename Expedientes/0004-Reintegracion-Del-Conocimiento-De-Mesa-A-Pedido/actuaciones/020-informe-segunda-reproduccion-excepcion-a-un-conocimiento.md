# Segunda reproducción a ciegas — excepción a un conocimiento, sobre el commit corregido

| Campo | Valor |
| --- | --- |
| Tipo | informe |
| Fecha | 2026-10-23 |
| Autor | Reproductor a ciegas D (sobre el commit corregido) |
| Corrige | — |

**Condiciones de la reproducción.** Workspace limpio con `git archive HEAD` del worktree del framework,
sin `Expedientes/0004-*`. Ruta de entrada: `README.md` (matriz de ruteo, línea 65) →
`Conocimiento/Index-Knowledge.md` §3 (fila de `Mesa-De-Expertos-A-Pedido`, línea 41) →
`Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` 2.0. Rol asumido: **presidente** (mapa de carga,
línea 95): cargué §1 a §8 enteros, `Cadena-De-Consecuencias` 1.0 entero y, porque hay ficha,
`Excepcion-A-Un-Conocimiento` 1.0 entero. Por respaldo (línea 85-87) cargué además, de las reglas:
`Mesa-Rules.md` 1.5 §0.0, §2, §3, §4, §5, §6, §7; `Expediente-Rules.md` 1.1 §1 a §3.5;
`Root-Rules.md` 8.9 §14.1 a §14.4; `Master-Prompt.md` 8.21 §6 (líneas 576-577), §8.1 (983-1004) y §10
(1486-1489); `Rules-Base-Conocimiento.md` 2.3 §2.2 y §6.2.

Todo lo que sigue sobre el proyecto Turnos es **supuesto del ejercicio**: no hay destino real. Las rutas
del destino, los identificadores (`ADR-00004`, `RN-00012`) y el alias del conocimiento de parámetros
(`Parametros-De-Sistema`) son ficticios y van marcados `{{supuesto}}` donde importan.

---

## Parte A — Salida en papel

### A.1 Presentación (folio `presentacion` del expediente del destino)

```testimonio
la mesa de UX del proyecto Turnos decidió guardar los parámetros de sistema en el archivo de configuración en vez de la tabla de parámetros que manda el conocimiento de parámetros de la casa; hacé una mesa de expertos que revise si eso estuvo bien y qué hacemos
```

| Campo | Valor |
| --- | --- |
| Canal | conversación con el agente, pedido inicial (no responde a una pregunta) |
| Fecha-hora | 2026-10-23 {{hora}} -03:00 |
| Huella | `02d34092a6d576a7fe1ebb1d84bed7411783a0530ead8183988662a9e8d0ab94` |

La huella se calculó con `printf '%s\n' '<texto>' | sha256sum` (LF y salto final, Knowledge §3.2,
fila del testimonio; `Expediente-Rules.md` §3.3 punto 2). La pieza que la sostiene va a
`evidencia/001-pedido-literal.txt`, con sus tres líneas de cabecera.

### A.2 Contrato de entrada (folio `providencia`)

```text
PEDIDO (literal): «la mesa de UX del proyecto Turnos decidió guardar los parámetros de sistema en el archivo
  de configuración en vez de la tabla de parámetros que manda el conocimiento de parámetros de la casa; hacé
  una mesa de expertos que revise si eso estuvo bien y qué hacemos» — Product Owner, 2026-10-23.

ENUNCIADO (§3.1):
  F1 «la mesa de UX del proyecto Turnos decidió guardar los parámetros de sistema en el archivo de
     configuración» → DATO. Es una afirmación sobre el estado: ancla C hasta corroborarla
     (Expediente-Rules §3.3, tabla). La presidencia la corrobora antes de despachar con E2: el registro de
     esa mesa, {{SDD/Docs/Audit/Mesa-AAAA-MM-DD.md:línea}}@{{commit}}, y E1: grep de las claves en
     {{archivo de configuración}} en la base.
  F2 «en vez de la tabla de parámetros que manda el conocimiento de parámetros de la casa» → DATO (la
     convención que rige). Origen: el índice del fork del destino, fila `Parametros-De-Sistema` {{supuesto}},
     con E2 a su sección. Y el supuesto del caso: la mesa anterior no lo declaró (se comprueba: grep del alias
     en el registro de esa mesa → vacío).
  F3 «hacé una mesa de expertos» → REQUISITO (forma del trabajo).
  F4 «que revise si eso estuvo bien» → INCÓGNITA 1. Dos lecturas:
     L1: si guardar en el archivo es, en abstracto, el mejor diseño (rediseña la configuración desde cero);
     L2: si la decisión estaba amparada frente a la convención que rige: contradicción o conveniencia
         (Excepcion-A-Un-Conocimiento §3, filtro).
     Se toma L2, la que menos agrega: no suma un diseño que el pedido no nombra. Declarada.
  F5 «y qué hacemos» → INCÓGNITA 2: uno o dos caminos con default (Excepcion §3, «Con caminos»). No autoriza
     aplicar (Knowledge §4, «Quién aplica»).
  Sujeto: la decisión registrada de la mesa UX de Turnos y el estado de la configuración de Turnos en la
     base de la corrida {{commit}}. No otro proyecto de la casa: medir uno que usa la tabla acota, no contesta.
  Origen de las condiciones: F2 por regla (convención que rige, E2); ninguna por comportamiento actual. Que
     «hoy» los parámetros estén en el archivo no es condición (§3.3, «Comportamiento no es restricción»).
  Caso que funciona: ninguno. No es un defecto con un camino que funciona; los proyectos de la casa que usan
     la tabla son precedente, no referencia (Excepcion §3, «Un precedente del producto no es una regla»).
  Agregados (no se despachan, salen marcados): migrar los valores actuales del archivo a la tabla; retirar
     la clave del archivo; cambiar la convención de la casa.

CLASE DE OBJETO: corpus documental existente (el registro de la mesa UX y lo que dejó en la especificación).
  Descartada: diseño de una norma o decisión. Pregunta principal = F4 (revisar lo existente); de la otra
  clase se suma sólo lo que una señal pida: las comisiones que propongan criterio citan fuente externa.

OBJETO: registro de la mesa UX de Turnos {{ruta@commit}}; la configuración de Turnos {{archivo}}@{{commit}};
  el ADR o la fila del plan donde la mesa UX asentó la decisión {{ruta:línea}}.

OBJETIVO: dictaminar si la decisión de guardar los parámetros de sistema en el archivo de configuración
  estaba amparada frente a la convención de parámetros que rige [F4, lectura L2; Excepcion §3], y entregar
  uno o dos caminos con su default [F5; Excepcion §3 y §5.3], sin aplicarlos [F5 no autoriza aplicar;
  Knowledge §4].

PREGUNTAS DEL CASO:
  Q1 ¿La mesa UX dejó de seguir la convención por contradicción (E1/E2) o por conveniencia?
  Q2 ¿Qué se hace: cumplir con un parche, o una excepción con ficha, uno o dos caminos y su default?
  Q3 ¿Por qué la mesa anterior no declaró la convención, y qué capa lo corrige?

LECTURA P0–P3:
  P0  lo que deja el producto contradiciendo una convención que rige sin ficha ni elevación, o hace imposible
      el objetivo;
  P1  lo que haría salir el plan con retrabajo o con lecturas divergentes entre implementadores (por ejemplo,
      el mismo parámetro definido en el archivo y en la tabla);
  P2  una pérdida acotada (un parámetro mal tipado, una clave sin valor por defecto);
  P3  claridad.

RESTRICCIONES DURAS: {{RN-* del intake de Turnos}}; apartamientos vigentes de Root-Rules §11: {{ninguno}}.
  La ficha de excepción NO entra acá (Excepcion §0).

DECISIONES CERRADAS: `Parametros-De-Sistema` {{versión}} §{{sección}} (convención que rige); ADR vigentes de
  Turnos {{lista}}. La decisión de la mesa UX NO entra: el pedido la pone en revisión, es el objeto
  (Knowledge §3.4).

CONVENCIONES QUE RIGEN:
  Índice:   Conocimiento/Index-Knowledge.md del fork del destino (Knowledge §3.4)
  Barrido:  grep '^| `Knowledge-' {{índice}} | cut -d'|' -f3,5,11
  Salida (sobre el índice del framework; en el destino se suma la fila supuesta):
    `Clean-Architecture-DataManager` | Arquitectura interna en cuatro capas … | Vigente
    `Conformacion-Pull-Request-Manual` | Ciclo de entrega … | Vigente
    `Conformacion-Pull-Request-Automatico` | Ciclo de entrega … | Vigente
    `Template-HTML-SDD-Default` | Forma constructiva de una maqueta HTML/CSS/JS … | Vigente
    `Template-Blazor-Interactive-Server-SDD-Default` | Realización del template HTML … | Vigente
    `Mesa-De-Expertos-A-Pedido` | Mesa de expertos convocada por un pedido explícito … | Vigente
    `Excepcion-A-Un-Conocimiento` | Excepción a un conocimiento que rige … | Vigente
    `Cadena-De-Consecuencias` | Cómo se razona antes de recomendar … | Vigente
    `Entorno-De-Ejecucion-Del-Agente` | Clasificación verificada del origen de un texto … | Vigente
    `Parametros-De-Sistema` {{supuesto}} | Parámetros de sistema en la tabla de parámetros | Vigente
  Versión:  grep -m1 '^\*\*Versión' {{carpeta}}/Knowledge-<alias>.md
    Mesa-De-Expertos-A-Pedido 2.0; Excepcion-A-Un-Conocimiento 1.0; Cadena-De-Consecuencias 1.0;
    Parametros-De-Sistema {{v}}.
  Rigen: Parametros-De-Sistema {{v}} §{{s}}; Excepcion-A-Un-Conocimiento 1.0 entero; Cadena-De-Consecuencias
    1.0 §2 y §3.
  Descartes: Clean-Architecture-DataManager (su Tema es la capa de acceso a datos, no dónde vive un
    parámetro; se reconsidera si el camino elegido toca el DataManager); Conformacion-Pull-Request-* (la
    mesa no entrega por PR); Template-HTML/Blazor (no hay maqueta en el objeto); Entorno-De-Ejecucion-Del-
    Agente (no hay texto de origen dudoso en el pedido).

FUERA DE ALCANCE: cambiar la convención de la casa (sale, si alguien lo sostiene, como propuesta de cambio
  con «SI NO RESPONDÉS: rige la vigente»); el resto de las decisiones de la mesa UX.
MEDIOS: lectura del árbol y git sobre la base; sin sistema vivo.
EXPEDIENTE: SDD/Expedientes/{{NNNN}}-Revision-De-Los-Parametros-De-Sistema/ (rama 2 de Expediente-Rules §1:
  entra el testimonio del PO que funda la decisión; y rama 1: la excepción no se asienta por silencio, pide
  una respuesta que no llega en esta corrida).
QUIÉN APLICA: nadie: sólo plan (el pedido no autoriza aplicar).
PRESUPUESTO: 5 hallazgos por comisión; 1 ronda (cierre por decisión, declarado).
DESPACHO VERIFICADO:
  - F1: {{grep -n 'archivo de configuración\|parámetros' <registro-mesa-UX>}} → {{líneas}}.
  - Supuesto «la mesa no declaró la convención»: grep -c 'Parametros-De-Sistema' <registro-mesa-UX> → 0.
  - Recuento de filas del índice: grep -c '^| `Knowledge-' <índice> → 10 (9 del framework + 1 supuesta).
  - Fin de §0 del Knowledge, para la carta: grep -n '^## 1\.' Knowledge-Mesa-De-Expertos-A-Pedido.md → 103,
    por lo tanto §0 = líneas 1 a 101.
  Campos de Mesa-Rules §4 que la mesa a pedido no trae: `estado` (las seis dimensiones salen de
  Master-Prompt-Reanudacion §1, que no corrió) → primer hallazgo del registro, con supuesto declarado
  (Mesa-Rules §4: «Si un campo falta, ése es el primer hallazgo»); `diff_normativo`: no aplica, no es una
  migración; `pendientes_declarados`: los del registro de la mesa UX, entran como C.
```

**¿Cumple `Mesa-Rules.md` §0.0?** Corpus previo (registro de la mesa UX, no producido en esta corrida): sí.
Estado leído con la forma de §4: lo lee la presidencia, con el supuesto del campo `estado`. Decisión sobre
ese corpus («qué hacemos»): sí. Se toma que **cumple** (Knowledge §1, «Relación con la mesa normativa»):
manda `Mesa-Rules.md` en registro, composición, ciclo, escalada y cierre; el registro va a
`SDD/Docs/Audit/Mesa-2026-10-23.md` del destino, el expediente lo folia por `ruta@commit`, y de este
documento se toman §0, §3.1, §3.4, los campos de §5.1, §2.3 y el paso 6 bis. Prefijo de familia de
hallazgos del ciclo: `PRM` {{comprobado con `grep -rho '\bPRM-[0-9]' SDD/Docs/Audit/` → vacío}}
(`Mesa-Rules.md` §2.2 punto 1).

### A.3 Composición del panel (paso 4; lo vota el jurado, `Mesa-Rules.md` §6.2 punto 3)

Barrido de señales por un relevador sin voto (`Mesa-Rules.md` §6.2 punto 2), con ubicaciones supuestas:

| Rol | Tipo | Señal y ubicación | Titular |
| --- | --- | --- | --- |
| Requisitos | núcleo | — | — |
| Verificación | núcleo | — | — |
| Lector sin contexto | núcleo | — | — |
| Refutador | núcleo, último | — | — |
| Datos y dominio | variable | persistencia: tabla de parámetros en `Parametros-De-Sistema` §{{s}}; modelo de datos de Turnos {{05/Modelo-Datos-Logico.md:línea}} | AG-00020 |
| Operación y entrega | variable | configuración por ambiente: {{archivo de configuración}}; despliegue por instancia {{09/…:línea}} | AG-00090 |
| Arquitectura | variable | decisión de dónde vive la configuración, con ADR {{ADR-00004}} {{supuesto}} | AG-00050 |
| Seguridad | variable | secretos posibles entre los parámetros ({{clave:línea}}); empate en la convocatoria → convoca (`Mesa-Rules.md` §5.5) | AG-00050 |
| Trazabilidad documental | variable | el registro de la mesa UX cita documentos y omite la convención que rige (grep → 0) | AG-00110 |

Descartes con motivo: **Uso y accesibilidad** (no hay señal ubicada de una superficie de edición de
parámetros; si aparece, ronda en caliente de `Mesa-Rules.md` §5.3); **Formal** (no hay umbrales ni pesos en
el objeto; si un parámetro es un umbral, entra sin votación); **Concurrencia y tiempo**, **Rendimiento y
costo**, **Interfaz externa**, **Cumplimiento** (sin señal en el objeto). Techo: cinco variables, lleno;
postergados: ninguno.

### A.4 Carta de despacho completa — comisión «Datos y dominio»

Se archiva antes de despachar en `evidencia/002-carta-datos-y-dominio.md`, con sus tres líneas
(`Método: carta de despacho` · `Base: {{commit}}` · `Quién: presidencia`).

```text
Sos la comisión Datos y dominio en una mesa de expertos sobre la decisión de la mesa UX del proyecto Turnos
de guardar los parámetros de sistema en el archivo de configuración ({{registro}}@{{commit}}).
Tu encargo es refutar, no verificar.
Trabajás a ciegas: no vas a ver el informe de ninguna otra comisión.
Clase de objeto: corpus documental existente.

Caso, tal como lo presentó quien pidió la mesa: «la mesa de UX del proyecto Turnos decidió guardar los
parámetros de sistema en el archivo de configuración en vez de la tabla de parámetros que manda el
conocimiento de parámetros de la casa; hacé una mesa de expertos que revise si eso estuvo bien y qué hacemos»
Objetivo, con el origen de cada cláusula: dictaminar si la decisión estaba amparada frente a la convención de
parámetros que rige [«que revise si eso estuvo bien», lectura L2 declarada; Excepcion-A-Un-Conocimiento §3],
y entregar uno o dos caminos con su default [«y qué hacemos»; Excepcion §3 y §5.3], sin aplicarlos [el
pedido no autoriza aplicar]. Lo que da por fijo sin origen es tu primer hallazgo.
Si falla un paso que el pedido prescribe, no lo rodeás: devolvés «BLOQUEO: paso — salida — prueba de una
variable».

Tu competencia es el modelo de datos y la persistencia de los parámetros: entidades, tipos, valores por
defecto, ciclo de vida de un parámetro y su migración. No te corresponde la seguridad de los secretos, el
despliegue ni la redacción del registro: si encontrás algo ahí, emitís una solicitud de convocatoria con la
señal y su ubicación, no un hallazgo.

Por cada hallazgo: nivel P0–P3 (con la lectura para este caso: P0 deja el producto contradiciendo una
convención que rige sin ficha ni elevación, o hace imposible el objetivo; P1 retrabajo o lecturas
divergentes entre implementadores; P2 pérdida acotada; P3 claridad), clase de ancla E1–E4 o C con su cita o
su comando y salida (la escala está en SDD/Devs/Rules/Mesa-Rules.md §6.1), impacto si no se corrige y
dirección de la corrección, no su redacción.

Rigen estas convenciones: Parametros-De-Sistema {{v}} §{{s}}; Excepcion-A-Un-Conocimiento 1.0;
Cadena-De-Consecuencias 1.0 §2 y §3. Si proponés no seguir alguna, cargás entero
Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md y escribís su ficha, con la alternativa de cumplir,
una por decisión, en SDD/Expedientes/{{NNNN}}-Revision-De-Los-Parametros-De-Sistema/despacho/: quien preside
la incorpora como folio propio.
«Más simple» o «no aplica del todo» no es motivo. Antes de recomendar entre opciones, corrés
Conocimiento/Knowledge-Cadena-De-Consecuencias.md §2.

Norma: ../IA.SDD/Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md 2.0. Leé primero las líneas 1 a 101 y
después sólo lo que su «Mapa de carga» da para tu situación; una remisión a algo que no cargaste, en el texto
de tu acto, la cargás.
En la cabecera de tu folio declarás la fila «Secciones de Mesa-De-Expertos-A-Pedido 2.0 leídas» y, si
cargaste los otros dos documentos, su alias y su versión.
Tope: 5 hallazgos. Declarás hasta tres ítems de «lo que revisé y está bien».
Escribís tu informe, verbatim, en SDD/Expedientes/{{NNNN}}-Revision-De-Los-Parametros-De-Sistema/despacho/datos-y-dominio.md;
quien preside cuenta los folios, no los transcribe.
```

Las otras siete cartas de comisión cambian `{{COMISIÓN}}`, competencia, no-competencia y ruta. La del
refutador suma: atacar el objetivo contra el pedido literal y, por cada ficha, «¿cuánto cuesta realmente
cumplir?» (Knowledge §2.1 paso 6).

### A.5 Carpeta del expediente (en el destino)

```text
SDD/Expedientes/{{NNNN}}-Revision-De-Los-Parametros-De-Sistema/
├── README.md                     carátula de seis campos + línea de remisión
├── .gitignore                    **/evidencia*/**/*.png · *.jpg · *.ndjson (Knowledge §5.3)
├── actuaciones/
│   ├── 001-presentacion-pedido-del-product-owner.md        testimonio A.1
│   ├── 002-providencia-contrato-de-entrada-y-despacho.md   A.2 + verificación del despacho
│   ├── 003-providencia-correccion-del-objetivo.md          A.6 (testimonio del PO a mitad del encargo)
│   ├── 004-constancia-corrida-descartada.md                los informes llegados antes de A.6
│   ├── 005-informe-ficha-de-excepcion-1.md                 XC-1 (A.7), si una comisión la escribe
│   ├── 006-constancia-registro-de-mesa-ruta-at-commit.md   folia SDD/Docs/Audit/Mesa-2026-10-23.md@{{commit}}
│   └── 007-resolucion-dictamen-y-plan.md                   plan, cierre, Reintegra, lote con SI NO RESPONDÉS
├── despacho/                     rutas de trabajo de cada rol; queda vacía al incorporar
└── evidencia/
    ├── 001-pedido-literal.txt
    ├── 002-carta-datos-y-dominio.md … 010-carta-refutador.md   (una por despacho)
    └── 011-barrido-de-convenciones.txt                         comando y salida de A.2
```

En un destino, los informes del panel y la ficha son **secciones del registro** de `Audit/` y el expediente
los folia con una constancia `ruta@commit` (Knowledge §2.3; `Expediente-Rules.md` §3); por eso 005 existe
como folio propio sólo si se lee la ficha como pieza del expediente y no del registro (ver menores M5).

### A.6 Corrección del objetivo a mitad del encargo (simulada)

Con las comisiones despachadas, el PO escribe (simulado para el ejercicio):

```testimonio
ojo que los parámetros los tiene que poder cambiar el administrador sin redeploy
```

| Campo | Valor |
| --- | --- |
| Canal | conversación, mensaje espontáneo durante el encargo |
| Fecha-hora | 2026-10-23 {{hora}} -03:00 |
| Huella | `5524dee97cd41d3dca48629a5c2cecca7f402dca16ea282fabbf0b0fedece986` |

Se rehace el enunciado (Knowledge §0 renglón 2; §2.1 paso 2): F6 «los tiene que poder cambiar el
administrador sin redeploy» → **REQUISITO** (preferencia de quien decide). Es un comportamiento
observable que Turnos {{no prometía}}: cambio de alcance pedido por quien decide → el pedido foliado es el
arbitraje, el ciclo no se bloquea (`Mesa-Rules.md` §7 disparador 3; Knowledge §3.1 última fila), y la
resolución declara clase `compromiso` con la fila de alcance **propuesta** al PO (`Root-Rules.md` §14.2),
que no se asienta por silencio.

```text
OBJETIVO VIGENTE → OBJETIVO CORREGIDO
  vigente:   dictaminar si la decisión estaba amparada frente a la convención [F4/L2] y entregar uno o dos
             caminos con su default [F5], sin aplicarlos [F5].
  corregido: dictaminar si la decisión estaba amparada frente a la convención [F4/L2] y entregar uno o dos
             caminos con su default [F5] que dejen al administrador cambiar los parámetros sin redeploy [F6],
             sin aplicarlos [F5].
```

Relanzar: como toda carta lleva el `OBJETIVO`, vuelven a salir las ocho cartas de comisión (y la del
refutador, que aún no había salido, sale con el corregido). Los informes ya llegados se conservan como
corrida descartada con constancia (folio 004; `Expediente-Rules.md` §3.4), fuera de la cuenta del paso 10.
No hay fase irreversible en curso (la mesa no aplica), así que no hay nada que detener antes.

### A.7 Ficha de excepción

Primero el filtro. La decisión de la mesa UX es **una excepción ya ejecutada sin ficha**: no se le escribe
una ficha retroactiva. La comisión que la encuentra (Trazabilidad o Datos) la emite como **hallazgo**:

```text
PRM-01 · P0 · E2 — Parametros-De-Sistema {{v}} §{{s}} manda la tabla ({{ruta:línea}}); el registro de la mesa UX
  asentó el archivo de configuración ({{ruta:línea}}) sin ficha ni elevación, y sin declarar la convención
  (grep -c → 0). Dirección: cumplir con un parche, salvo que alguien sostenga la imposibilidad con ficha.
```

(`Excepcion-A-Un-Conocimiento.md` §4, fila «Una excepción ya ejecutada sin ficha».) Si una comisión
sostiene ahora que cumplir es imposible, escribe la ficha a su nombre. Supuesto del ejercicio: la comisión
Arquitectura lo sostiene apoyada en un ADR del producto.

```text
EXCEPCIÓN XC-1
  Conocimiento:           Parametros-De-Sistema {{v}} §{{s}} — «{{los parámetros de sistema se guardan en la
                          tabla de parámetros}}» {{supuesto}}
  Alternativa de cumplir: crear la tabla de parámetros en la base del servicio de agenda de Turnos, con su
                          migración de esquema, la carga de los {{n}} parámetros del archivo y la lectura por
                          el componente de configuración.
  Costo de cumplir:       {{grep -c '^Parametros' <archivo>}} → {{n}} claves a migrar; una migración de esquema;
                          {{n}} puntos de lectura (grep -rn 'GetSection("Parametros")' src/ → {{n}}).
  Por qué no se cumple:   E2 — {{05/Adrs/ADR-00004.md:línea}} `Aceptado`: «el servicio de agenda no tiene
                          persistencia propia». La tabla en esa base contradice el ADR. {{supuesto}}
  Reversibilidad:         volver a cumplir después = crear la tabla y mover las claves; sin pérdida de datos si
                          los nombres y tipos de las claves siguen los de la convención.
  Sostiene:               comisión Arquitectura — despacho/arquitectura.md
  Aprobó:                 pendiente — sale en el cierre (§5.2)
```

Rama de `Excepcion` §4: el ADR **sólo prohíbe el medio** (persistencia en ese servicio) y no dice dónde
van los parámetros → **rama de la reversibilidad**, no rama de la regla. Refutación (en su folio): «¿cuánto
cuesta realmente cumplir?» — la tabla en la base de **otro** proyecto de Turnos que sí persiste no choca con
el ADR; si el refutador lo mide con E1 y el costo es acotado, la ficha **no se admite** y se cumple. Para el
ejercicio se sigue la rama en que el refutador la admite parcialmente (cumplir completo en el servicio de
agenda es imposible; la alternativa en otro proyecto es posible y entra como Alt-2).

### A.8 Camino de compromiso (paso 6 bis, folio del análisis de decisiones)

```text
ANÁLISIS DEL CAMINO DE COMPROMISO — XC-1 (ficha folio 005)
  Sigue rigiendo:      Parametros-De-Sistema §{{s}}: nombres, tipos y valores por defecto de cada parámetro
                       según la convención; se cumple en todas las alternativas.
  Fuera del documento: dónde se aloja la tabla cuando el servicio que consume no persiste; ahí la referencia es
                       el estándar citado.
  Alternativas:        Alt-1 tabla en la base del servicio de agenda (cumplir entero)
                       Alt-2 tabla de parámetros en la base del proyecto de administración de Turnos, leída por
                             el servicio de agenda por API con caché y valores de arranque (la más cercana a
                             cumplir posible)
                       Alt-3 archivo de configuración con las claves de la convención y recarga en caliente
                       Alt-4 variables de entorno por instancia
    Descartadas antes de ponderar: Alt-1 — contradice ADR-00004 (E2 {{ruta:línea}}); Alt-4 — no cumple F6:
                       cambiarlas exige reiniciar la instancia (E1 {{medición}}).
  Criterios y pesos (fijados antes de puntuar):
    K-1 Cercanía a cumplir — peso 3 — fuente: Parametros-De-Sistema §{{s}}
    K-2 Reversibilidad     — peso 3 — fuente: Cadena-De-Consecuencias §2, paso 4
    K-3 Modificabilidad    — peso 2 — fuente: ISO/IEC 25010 (mantenibilidad), sin apartado — por qué pesa
                             así: es la calidad que pide F6.
    K-4 Configuración separada del código — peso 1 — fuente: The Twelve-Factor App, factor «Config», sin
                             apartado — por qué pesa así: favorece Alt-3 y se declara para que el sesgo quede
                             a la vista.
  Ponderación (0 a 3; evidencia supuesta del ejercicio):
               K-1(3)  K-2(3)  K-3(2)  K-4(1)  Total
    Alt-2        3       2       3       2      9+6+6+2 = 23   tabla según la convención; volver a Alt-1 = mover tabla
    Alt-3        1       3       2       3      3+9+4+3 = 19   claves de la convención, fuera de la tabla
  Caminos:
    C-1 (recomendado) Alt-2: deja regir la tabla de la convención y cumple F6 y el ADR — reversible: mover la
        tabla al servicio si el ADR se supera, sin pérdida.
    Sin C-2: Alt-3 quedó segunda; la pondría primera K-1 con peso 1 (con K-4 en 3), lo que no es razonable
        porque K-1 mide cuánto de la convención que rige sobrevive.
  Mientras se decide:  provisorio: se sigue C-1 en el plan, sin apoyar en él nada irreversible; ADR nuevo
                       `Propuesto`.
```

### A.9 Cadena de consecuencias (de la recomendación)

```text
CADENA DE CONSECUENCIAS — dónde viven los parámetros de sistema de Turnos
  Opción C-1 (Alt-2): tabla en el proyecto de administración
    Dónde cae:          el servicio de agenda, que pasa a depender de una API para leer parámetros.
    Cuánto pesa ahí:    {{n}} puntos de lectura — comando: grep -rn 'Parametros' src/Agenda → {{n}}
    Qué pierde la otra: Alt-3 pierde la convención (K-1) y el criterio de la casa queda como precedente roto.
    Reversible:         sí: mover la tabla o volver al archivo con las mismas claves.
  Opción Alt-3: archivo con recarga
    Dónde cae:          la convención de la casa, que deja de regir en Turnos; el administrador edita archivos.
    Cuánto pesa ahí:    1 convención apartada; {{n}} instancias con su archivo — comando: {{ls de despliegue}}
    Qué pierde la otra: C-1 paga una dependencia nueva entre proyectos.
    Reversible:         sí.
  Recomendación:        C-1; las dos reversibles, decide K-1. Condición para revisar: si ADR-00004 se supera.
  Obstáculos:           ninguno (no falta poder, falta decidir).
```

### A.10 Campos de cierre (folio `resolucion`, bloque de `Mesa-Rules.md` §6.7 + apartado de `Excepcion` §5.2)

```text
CIERRE DE MESA — Turnos, 2026-10-23
  PANEL
    Convocados:   Requisitos, Verificación, Lector sin contexto, Datos y dominio, Operación y entrega,
                  Arquitectura, Seguridad, Trazabilidad documental: {{procedentes por rol}}; Refutador: {{n}}
    Descartados:  Uso y accesibilidad, Formal, Concurrencia y tiempo, Rendimiento y costo, Interfaz externa,
                  Cumplimiento: sin señal ubicada
    Ad hoc:       ninguno     Postergados: ninguno     Aporte nulo: {{n/a, primer ciclo}}
  HALLAZGOS
    Detectados: {{n}}   Procedentes: {{n}}   Con parche: {{n}}   Descartados por C: {{n}}
    Rendimiento: {{procedentes}} / 9 (8 comisiones + refutador)
  COMPUERTA (§10.0)
    Resultado: {{salida}}   No mirado: {{recortes}}
  ENTREGA AL ORQUESTADOR
    Parches:           {{n}}: el registro de la mesa UX no se reescribe; ADR nuevo `Propuesto` (C-1), en 05
    Deuda declarada:   XC-1 provisoria, evento de cierre: respuesta del PO (folio) — ítem §12.2
    Capas a revalidar: 05 (ADR, modelo de datos), 06 (BT de lectura de parámetros), 09 (configuración)
    Escaladas:         1 (XC-1), en el lote
    Reintegra:         REINTEGRACIÓN — expediente {{NNNN}} folio 007
                         Clase de cambio:   compromiso — F6: el administrador cambia parámetros sin redeploy
                         Fuente de alcance: fila PROPUESTA al Product Owner
                         Artefactos:        02 (RN del parámetro editable) → 05 (ADR nuevo) → 06 (US/BT) → 11
                         No tocados:        03 (sin superficie ubicada; §14.2), 07/08 si no cambian
                         Diferidos:         XC-1, evento: folio de respuesta del PO
  CIERRE
    por decisión y no por criterio: una sola ronda (Knowledge §4, «Criterio de corte»). Abierto: XC-1, fila
    de alcance de F6.
  FOLIOS
    Informes (8 convocados + refutador + análisis + 2 del jurado): 12 — Escritos: {{12}} — {{secciones del
      registro SDD/Docs/Audit/Mesa-2026-10-23.md}}
    Además foliados, fuera de la cuenta: presentación 001, providencias 002 y 003, constancia 004, ficha 005,
      constancia 006, resolución 007
  EXCEPCIONES A CONOCIMIENTOS
    XC-1: Parametros-De-Sistema §{{s}} → tabla en el proyecto de administración (C-1) — ficha 005 —
      contradicción: E2 ADR-00004 {{ruta:línea}}
      Refuta: {{sección del refutador}} — Analiza: {{sección del análisis}} — Veredicto: {{sección del jurado}}
      Estado: provisorio: se sigue C-1, reversible
      Caminos (análisis): C-1 Alt-2, total 23, reversible — sin C-2: Alt-3 (19) quedaría primera con K-1 en
        peso 1, no razonable — criterios: ISO/IEC 25010; The Twelve-Factor App
      ¿Validás C-1 o pedís otro camino?
      SI NO RESPONDÉS: se sigue con C-1, provisorio y sin aprobar, hasta tu respuesta; nada irreversible se
      apoya en él; el ADR queda `Propuesto` hasta tu respuesta
      Origen del hecho: ajeno a la corrida — la decisión de la mesa UX está en la base {{commit}} sin cambios
        (git log {{commit}}..HEAD -- <registro> → vacío)
      Aprobó: pendiente
    No admitidas: (ninguna)
    Propuestas de cambio de convención: (ninguna)
  PREGUNTAS EN LOTE (Mesa-Rules §7.1)
    1. XC-1 (arriba).
    2. Fila de alcance de F6: «el administrador cambia los parámetros de sistema sin redeploy».
       SI NO RESPONDÉS: queda propuesta; el expediente no se archiva «aplicado y verificado».
    3. PRM-xx Q3 (por qué la mesa UX no declaró la convención): resuelto en el árbol, no sale.
  BARRIDO DE SECRETOS Y DATOS PERSONALES
    Comando: git diff --cached | grep -nEi 'password|secret|token|connectionstring' → {{salida}};
    redactado: {{valores de parámetros secretos citados en extractos}}; sin versionar: {{ninguno}}.
```

Respuestas por pregunta (dictamen de la clase corpus): Q1 — por conveniencia, salvo que la ficha XC-1
pruebe la contradicción con E2 (el registro no la trae: P0, PRM-01). Q2 — cumplir, con el camino C-1 si XC-1
se admite. Q3 — la mesa UX decidió fuera de su mandato (Uso y accesibilidad no tiene competencia sobre
persistencia, `Mesa-Rules.md` §5.3 «Sin opinar fuera de mandato») y su presidencia no barrió el índice
(Knowledge §3.4): capa de origen, el contrato de entrada de esa mesa.

---

## Parte B — Reporte

### B.1 Referencias rotas

Comprobadas con `ls`, `grep -n` y `sed -n` sobre el workspace limpio.

1. `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/` no existe en el workspace (lo
   retiró la preparación). Lo citan `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md:532, 534, 549, 551,
   560`, `Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md:317, 318, 334, 340`,
   `Conocimiento/Knowledge-Cadena-De-Consecuencias.md:144, 154, 160` y `Conocimiento/Index-Knowledge.md:57`.
   Todas, salvo una, se declaran «no hace falta para aplicar el documento» y no afectaron la aplicación.
2. `Expedientes/0004-…/evidencia/ev-06-cotejo-de-las-copias-del-fork.diff`
   (`Knowledge-Mesa-De-Expertos-A-Pedido.md:549`): no resuelve, por lo mismo. Es la única cita a 0004 que
   la tabla «Dependencias» no declara prescindible; no se necesitó, porque la fila cita también las líneas de
   la regla, y esas resuelven.
3. Ninguna otra. Resolvieron todas las secciones citadas: `Mesa-Rules.md` §0.0, §2.1, §2.2, §3, §4, §5.1 a
   §5.5, §6.1 a §6.7, §7, §7.1, §8; `Expediente-Rules.md` §1, §2, §3, §3.1 a §3.5, §6 (A1 a A15);
   `Master-Prompt.md` §6, §7.0, §8.1, §10, §10.0, §10.1, §12.1 T0; `Root-Rules.md` §11, §12.2, §14.1 a §14.4;
   `Rules-Base-Conocimiento.md` §0.2, §0.4, §2.2, §4.4, §6.1, §6.2; `Rules-Arquitectura-Tecnica.md` §3.3;
   `Deriva-Rules.md` §1, §3; `Vocabulario-Rules.md` §9.2, §9.4; `Master-Prompt-Reanudacion.md` §3.1 (R1.5);
   las tres notas de coherencia; `Expedientes/0003-…/actuaciones/019-resolucion-consolidacion-veredicto-dictamen-y-plan.md`.
   Las anclas por línea también caen donde dicen: `Index-Knowledge.md:34` (las diez columnas),
   `Mesa-Rules.md:245`, `:249-251`, `:365-371`, `:384-387`, `:454-465`, `:507-512`, `:570-578`,
   `Master-Prompt.md:576-577`, `:983-988`, `:1001-1004`, `:1486-1489`, `Rules-Base-Conocimiento.md:98-103`,
   `Rules-Arquitectura-Tecnica.md:130-132`, `:170`, `Expediente-Rules.md:367-369`. El comando de barrido de
   `Knowledge-Mesa-De-Expertos-A-Pedido.md:326` corre y devuelve alias, `Tema` y `Estado`.

### B.2 Bloqueantes

Ninguno que me obligara a adivinar sin regla. Los dos puntos donde estuve más cerca:

1. **«Base del destino» no es una figura que el framework admita.** El caso dice que el conocimiento de
   parámetros «existe en la base del destino». `Knowledge-Mesa-De-Expertos-A-Pedido.md:290-294` dice que el
   índice que se barre es el del framework o el de un fork **en la misma ruta**, y que «una "convención de la
   casa" fuera de ese índice entra al contrato como regla o decisión del producto, con su fuente»;
   `Index-Knowledge.md:50` (§4) dice que el intake no registra una base del destino. Las
   dos lecturas dan salidas distintas: si es fila de un fork, rige `Excepcion-A-Un-Conocimiento` (ficha,
   análisis, default); si es «regla o decisión del producto», no hay conocimiento al que exceptuar y el caso
   cae en la rama de la regla o en el disparador 7 de `Mesa-Rules.md:578`. Lo resolví con la regla del
   enunciado (tomar la lectura que menos agrega: la del fork) y lo declaré, pero el documento no dice qué
   hacer cuando la convención está en un índice del destino que **no** es un fork en la misma ruta, y
   `Excepcion-A-Un-Conocimiento.md` §3 (líneas 87 y 96) habla de «la convención de la casa» como si
   fuera de esta base.
2. **Qué partes del documento rigen cuando la mesa cumple `Mesa-Rules.md` §0.0.**
   `Knowledge-Mesa-De-Expertos-A-Pedido.md:119-121` enumera lo que se toma («§0, §3.1, §3.4, los campos de
   §5.1 (§8), §2.3 y, si hay ficha, el paso 6 bis; no la clase ni su regla de cierre»), pero no nombra la
   carta de §5.2, la refutación del objetivo (paso 6), la cuenta y el cruce de folios (paso 10) ni §4
   «Quién aplica». El principio de la misma oración («lo que ella no regula ni contradice») los alcanza;
   la enumeración, no. Seguí el principio. Además, «no la clase» choca con el campo `CLASE DE OBJETO` que el
   contrato de §5.1 trae y con el criterio de §6 (línea 445) que lo exige; lo llené igual.

### B.3 Menores

1. **La cláusula 2 de `Mesa-Rules.md` §0.0 depende de un campo que una mesa a pedido no tiene.** `estado`
   lleva «las seis dimensiones» de `Master-Prompt-Reanudacion.md` §1 (`Mesa-Rules.md:242`), que no corre en
   una mesa a pedido. Qué régimen rige (`Mesa-Rules` mandando o usada «como forma») queda en manos de la
   presidencia según lea o no el estado. Lo resolví con `Mesa-Rules.md:236-237` (campo faltante = primer
   hallazgo y supuesto declarado). `Knowledge-Mesa-De-Expertos-A-Pedido.md:337-338` dice que esos campos «se
   llenan si la mesa cumple §0.0», lo que es circular.
2. **La decisión puesta en revisión y el disparador 7.** `Excepcion-A-Un-Conocimiento.md:119` dice que
   «una decisión cerrada que la contradiga no la ampara: dos decisiones cerradas en conflicto son el
   disparador 7»; `Knowledge-Mesa-De-Expertos-A-Pedido.md:289` dice que una decisión que el pedido pone en
   revisión es el objeto y no entra en `decisiones_cerradas`. Leídas juntas, la decisión de la mesa UX no
   es decisión cerrada y no hay disparador 7; ninguno de los dos textos lo dice para este caso, que es justo
   el del pedido.
3. **El caso pide una ficha y el documento dice que no corresponde.** Una excepción ya ejecutada sin ficha
   es un hallazgo (`Excepcion-A-Un-Conocimiento.md:119`); la ficha sólo nace si alguien sostiene ahora la
   imposibilidad. Está bien resuelto, pero el lector que viene por el renglón 6 de §0
   (`Knowledge-Mesa-De-Expertos-A-Pedido.md:51-56`) espera una ficha, y la fila que lo desvía está en la
   segunda tabla de §4 del hermano, no en el filtro de §3.
4. **Rama de la regla frente a «con caminos».** En la rama de la regla el cierre pregunta «¿Cuál cede: X o
   Y?» (`Excepcion-A-Un-Conocimiento.md:178`) mientras §3 (línea 89) exige caminos y no un sí o no; el
   esqueleto sí pone la línea «Caminos» antes de las dos ramas (línea 169), pero no dice si en la rama de la
   regla el paso 6 bis se convoca igual. Asumí que sí (§2 del hermano: «por cada ficha admitida»).
5. **Ficha en un destino: ¿folio o sección?** `Excepcion-A-Un-Conocimiento.md:137-144` dice
   `actuaciones/NNN-informe-ficha-de-excepcion-<n>.md` y, en la última oración, «en un destino es una
   sección del registro»; la tabla de `Knowledge-Mesa-De-Expertos-A-Pedido.md:189` dice lo mismo. El
   cierre (`Excepcion` §5.2, línea 165) pide «ficha {{folio}}». En un destino no queda claro si la ficha
   lleva número de folio del expediente además de su sección del registro; en A.5 le di folio propio.
6. **«Cuenta los folios» en un destino cuenta secciones.** `Knowledge-Mesa-De-Expertos-A-Pedido.md:140` y
   `Excepcion-A-Un-Conocimiento.md:162` hablan de folios escritos; en un destino los informes son secciones
   del registro (`Expediente-Rules.md:141-144`). La regla de conteo se aplica igual, pero el nombre engaña.
7. **«Los dos del jurado»** (`Knowledge-Mesa-De-Expertos-A-Pedido.md:140, 188`) se explica sólo en el
   hermano (`Excepcion-A-Un-Conocimiento.md:188-190`: composición y veredicto, ítems 2 y 5 de
   `Mesa-Rules.md` §2.2). Quien preside y carga sólo el padre cuenta mal: el jurado tiene cinco jueces
   (`Mesa-Rules.md:437-446`).
8. **Clase de objeto de «revisar si una decisión estuvo bien».** Ninguna de las cuatro clases de §2.2
   (`Knowledge-Mesa-De-Expertos-A-Pedido.md:144-149`) nombra la revisión de una decisión ya tomada; la
   tomé como «corpus que pide una decisión» por el ejemplo de la línea 154-155. Un ejemplo en la tabla
   evitaría la duda.
9. **El nombre `ev-06-…` contradice `Expediente-Rules.md:165-166`**, que dice que la evidencia se nombra
   `NNN-<slug>` y que `ev-`/`EV-` colisiona con la familia `EV` de D9
   (`Knowledge-Mesa-De-Expertos-A-Pedido.md:549`). No pude abrir el archivo (retirado).
10. **La carta trae «Norma: {{RUTA DE ESTE DOCUMENTO}}»** (`Knowledge-Mesa-De-Expertos-A-Pedido.md:373`) sin
    decir qué ruta usar desde un destino. Usé la de `Master-Prompt.md:576` (`../IA.SDD/Conocimiento/…`),
    que es la que abre el orquestador; un fork en otra ruta no queda cubierto.
11. **Redundancia sin contradicción**: el renglón 2 de §0 (líneas 33-37) y el paso 2 de §2.1 (línea 131)
    dicen lo mismo sobre la corrección del objetivo, y el paso 2 remite al renglón; se lee bien, pero el
    paso 2 es una celda de tabla de casi 200 palabras con seis instrucciones distintas, la parte más
    difícil de encontrar del documento.
12. **Facilidad de encuentro**: el camino `README.md:65` → `Index-Knowledge.md` → documento funcionó en dos
    saltos y sin búsqueda. La fila del README dice «la fila cuyo `Tema` es la mesa a pedido, si el catálogo
    la tiene», y la tiene.

Sigue: incorporación al expediente · presidencia
