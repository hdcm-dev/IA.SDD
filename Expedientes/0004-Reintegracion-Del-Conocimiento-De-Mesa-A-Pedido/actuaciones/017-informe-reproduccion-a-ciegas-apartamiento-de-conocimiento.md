| Campo | Valor |
| --- | --- |
| Tipo | informe |
| Fecha | 2026-10-23 |
| Autor | Reproductor a ciegas B |
| Corrige | — |

# Reproducción a ciegas B — mesa a pedido ante una excepción no declarada a un conocimiento

**Workspace limpio.** `limpio-B/IA.SDD/`, copiado del worktree sin `.git` y sin `Expedientes/0004-*`.
No se leyó nada fuera de él. Recorrido de entrada: `README.md` → `Conocimiento/Index-Knowledge.md` §3
(fila `Mesa-De-Expertos-A-Pedido`, línea 41) → `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` 2.0
(550 líneas, leído entero porque presido) → por la columna «además» del mapa de carga (línea 95),
`Knowledge-Excepcion-A-Un-Conocimiento.md` 1.0 y `Knowledge-Cadena-De-Consecuencias.md` 1.0, enteros →
las reglas citadas en sus secciones (`Mesa-Rules.md` 1.5, `Expediente-Rules.md` 1.1, `Master-Prompt.md`
8.21, `Rules-Base-Conocimiento.md` 2.3, `Rules-Arquitectura-Tecnica.md` 4.6).

En adelante «MEP» es `Knowledge-Mesa-De-Expertos-A-Pedido.md`, «XC» es `Knowledge-Excepcion-A-Un-Conocimiento.md`
y «CC» es `Knowledge-Cadena-De-Consecuencias.md`; los números son líneas del archivo en el workspace limpio.

Secciones de Mesa-De-Expertos-A-Pedido 2.0 leídas: todas (§0 a §10), por presidir (MEP:95).
Además: Excepcion-A-Un-Conocimiento 1.0 entero; Cadena-De-Consecuencias 1.0 entero.

---

## Parte I — La salida en papel

### 1. Contrato de entrada (MEP §5.1)

```text
PEDIDO (literal): «la mesa de UX del proyecto Turnos decidió guardar los parámetros de sistema en el archivo
  de configuración en vez de la tabla de parámetros que manda el conocimiento de parámetros de la casa; hacé
  una mesa de expertos que revise si eso estuvo bien y qué hacemos» — Product Owner, 2026-10-23, chat.
  Huella (printf '%s\n' <literal> | sha256sum): 02d34092a6d576a7fe1ebb1d84bed7411783a0530ead8183988662a9e8d0ab94

ENUNCIADO (§3.1):
  F1 «la mesa de UX … decidió guardar los parámetros de sistema en el archivo de configuración» → DATO
     (afirmación sobre el estado: ancla C hasta que la corrobore el registro de esa mesa y el archivo;
      Expediente-Rules §3.3, tabla de clasificación)
  F2 «en vez de la tabla de parámetros que manda el conocimiento de parámetros de la casa» → DATO
     (que existe un conocimiento que rige y manda la tabla; supuesto del caso, a verificar con el barrido §3.4)
  F3 «revise si eso estuvo bien» → INCÓGNITA 1: ¿la decisión de no seguir la convención era admisible?
     Sujeto: la decisión de la mesa de UX de Turnos, en el commit base del destino; no «los parámetros en
     general» ni otro proyecto.
     Dos lecturas: (a) «bien» = conforme al procedimiento de excepción (contradicción, ficha, elevación);
     (b) «bien» = técnicamente mejor. Se toma (a), que menos agrega y es la que el árbol sabe medir
     (XC §3, «Contradicción, no conveniencia»); (b) entra sólo como insumo del análisis si hay ficha.
  F4 «y qué hacemos» → INCÓGNITA 2: el camino a seguir. Requisito implícito: la respuesta es accionable.
  F5 «hacé una mesa de expertos» → REQUISITO de forma (MEP §3.1, primera fila).
  Exclusiones: ninguna literal. Deseables: ninguno.
  Caso que funciona: ninguno con la misma entrada (no hay otro proyecto de la casa medido en el pedido).
     Si el barrido del destino encontrara otro proyecto que ya usa la tabla, ese sería el caso de referencia
     y la primera salida evaluada sería igualarlo (§3.3).
  Agregados marcados: «migrar los valores ya en producción» — NO está en el pedido; sale marcado.

CLASE DE OBJETO: corpus documental existente (el registro de la mesa de UX, el archivo de configuración,
  la especificación de Turnos). Segunda lectura declarada: «diseño de una decisión» por F4. Se toma la
  primera, que no suma comisiones de fuentes externas; las fuentes externas entran igual por el análisis
  del camino de compromiso (XC §5.3), que las exige.
  Variante del panel: «nada: Mesa-Rules.md tal cual» (MEP:144). Regla de cierre propia: la de Mesa-Rules §6.7.

¿Cumple Mesa-Rules §0.0? (1) corpus previo no producido en esta corrida: sí; (2) estado leído con la forma
  de §4: sí, una vez que la presidencia lo arma; (3) decisión de alcance o plan por aprobar: sí, F4.
  → ES la mesa normativa (MEP:116-118). Ver bloqueante B1 sobre qué de MEP sigue aplicando.

OBJETO: <destino>/SDD/Docs/Audit/Mesa-<fecha-de-la-mesa-UX>.md @ <commit base>; el archivo de configuración
  de Turnos @ <commit base>; Knowledge-<Parametros-De-Sistema>.md del destino @ su versión.

OBJETIVO: Dictaminar si la decisión de la mesa de UX de guardar los parámetros de sistema en el archivo de
  configuración era una excepción admisible a la convención de parámetros de la casa [F3, lectura (a);
  XC §3], y entregar el camino a seguir [F4]: cumplir la convención, o la excepción con su ficha, su
  análisis del camino de compromiso y su default [XC §4, §5.3]; [agregado: la migración de los valores
  existentes — no se despacha como objetivo; sale marcada en el cierre].

PREGUNTAS DEL CASO:
  Q1 ¿La mesa de UX tenía una contradicción (E1/E2) que impidiera usar la tabla, o fue conveniencia?
  Q2 ¿Qué parámetros, si alguno, no pueden vivir en la tabla?
  Q3 ¿Qué se hace con Turnos: cumplir, excepción parcial o total, y qué rige mientras el PO decide?

LECTURA P0–P3:
  P0 lo que viola una restricción dura o hace imposible el objetivo (p. ej. un parámetro que, en la tabla,
     impide arrancar el sistema);
  P1 lo que haría salir el plan con retrabajo o lectura divergente (p. ej. un parámetro clasificado en los
     dos lugares);
  P2 pérdida acotada (un parámetro mal documentado);
  P3 claridad.

RESTRICCIONES DURAS: las RN-* del intake de Turnos y los apartamientos de Root-Rules §11 vigentes. La
  ficha de excepción NO va acá (XC:38-40).

DECISIONES CERRADAS: los ADR Aceptado de Turnos; CONVENCIONES QUE RIGEN (abajo). La decisión de la mesa de
  UX NO entra: es el objeto que el pedido pone en revisión (F3) y «se decidió en la mesa N» sin frase de
  quien pidió no fija nada (MEP:270). Ver bloqueante B4.

CONVENCIONES QUE RIGEN:
  Índice:   <ruta del índice del destino>  ← no hay de dónde sacarla: ver B2. Se supone
            <destino>/SDD/Conocimiento/Index-Knowledge.md
  Barrido:  grep '^| `Knowledge-' <índice> | cut -d'|' -f3,5,11
  Salida (supuesta para el caso; probada la forma del comando sobre el índice del framework, que da 9 filas
            con alias y Estado):
            `Parametros-De-Sistema` | Parámetros de sistema en la tabla de parámetros … | Vigente
            `Mesa-De-Expertos-A-Pedido` | … | Vigente
            `Excepcion-A-Un-Conocimiento` | … | Vigente
            `Cadena-De-Consecuencias` | … | Vigente
            (+ las filas del framework que el destino herede)
  Versión:  grep -m1 '^\*\*Versión' <carpeta>/Knowledge-Parametros-De-Sistema.md → <X.Y> (supuesta)
            grep -m1 '^\*\*Versión' Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md → **Versión:** 1.0
            grep -m1 '^\*\*Versión' Conocimiento/Knowledge-Cadena-De-Consecuencias.md → **Versión:** 1.0
  Rigen:    Parametros-De-Sistema <X.Y> §<la sección que manda la tabla>; Excepcion-A-Un-Conocimiento 1.0 §3-§5;
            Cadena-De-Consecuencias 1.0 §2-§3.
  Descartes: Template-HTML-SDD-Default, Template-Blazor-…: su Tema es la maqueta, no la persistencia de
            parámetros; Conformacion-Pull-Request-*: el traspaso, no la materia; Entorno-De-Ejecucion-Del-Agente:
            el origen de textos de la conversación; Clean-Architecture-DataManager: sólo si Turnos es .NET
            sobre SQL Server (dato del intake, sin medir aquí) — si lo es, entra por la forma del acceso a la tabla.
FUERA DE ALCANCE: el contenido de los valores de cada parámetro; la mesa de UX en lo que no sea esta decisión.
MEDIOS: lectura del árbol del destino en el commit base (git show/git grep); sin ejecución.
EXPEDIENTE: <destino>/SDD/Expedientes/<NNNN>-Revision-De-Los-Parametros-De-Sistema-De-Turnos/
QUIÉN APLICA: nadie: sólo plan (el pedido no designa; MEP:291, Mesa-Rules §6.6).
PRESUPUESTO: tope 8 hallazgos por comisión; 1 ronda (cierra «por decisión», MEP:290).
DESPACHO VERIFICADO:
  D1 «la mesa de UX decidió …»   → git grep -n -i 'configuraci' <commit> -- SDD/Docs/Audit/Mesa-*.md
  D2 «el archivo guarda los parámetros» → git show <commit>:<ruta del archivo de configuración> | grep -c '<clave>'
  D3 «el conocimiento manda la tabla» → grep -n -i 'tabla' <carpeta>/Knowledge-Parametros-De-Sistema.md
  D4 «la mesa de UX no lo declaró» → git grep -n -i 'excepci\|apartamient\|XC-' <commit> -- SDD/Docs/Audit/ SDD/Expedientes/
       (vacío esperado: es la premisa del caso)
  D5 «la tabla no existe en Turnos» (llega con la corrección, abajo) → git grep -n -i '<nombre de la tabla>' <commit> -- '*.sql'
```

### 2. Corrección del objetivo a mitad del encargo (MEP §2.1 paso 2; MEP:34-37)

Con las comisiones despachadas, el PO escribe: «ojo que en Turnos la tabla de parámetros todavía no existe;
y no quiero que se toque nada en producción hasta que vea los caminos». Huella
`117d7e564d02ced2d0b9c71f6c1185bee7c270f8d5ab852eabeb0ace2556462c`. Se asienta como `presentacion` nueva.

Enunciado rehecho:
- G1 «la tabla de parámetros todavía no existe» → DATO, ancla C hasta D5. **No es contradicción**: es el
  caso de origen de XC:96 —«la tabla no existe» llevado como obstáculo en vez de la opción de crearla—.
  La alternativa de cumplir pasa a ser «crear la tabla + migración + lectura».
- G2 «no quiero que se toque nada en producción hasta que vea los caminos» → REQUISITO (preferencia de
  quien decide). Toca lo que el encargo daba por fijo: el default «provisorio» de XC §4 podía avanzar en
  pasos reversibles; ahora ningún paso alcanza producción antes de la respuesta.

```text
OBJETIVO VIGENTE  → Dictaminar si … era admisible [F3] y entregar el camino [F4] …
OBJETIVO CORREGIDO→ Dictaminar si … era admisible [F3], con la creación de la tabla como alternativa de
                    cumplir medida [G1; XC:96] y entregar el camino [F4], sin que ningún paso del camino
                    provisorio alcance producción antes de la respuesta del PO [G2].
```

El encargo se detiene antes de su próxima fase irreversible (no hay merge ni despliegue en curso: la mesa
no aplica) y se relanza: cartas nuevas, versionadas en `evidencia/` junto a las anteriores, con el objetivo
corregido; los informes de la primera tanda se conservan como corrida descartada con constancia
(Expediente-Rules §3.4, última oración). Ver menor M6.

### 3. Composición (Mesa-Rules §5; MEP §2.1 paso 4)

| Rol | Tipo | Señal y ubicación |
| --- | --- | --- |
| Requisitos | núcleo | siempre |
| Verificación | núcleo | siempre |
| Lector sin contexto | núcleo | siempre |
| Datos y dominio | variable | «tabla de parámetros», persistencia: Knowledge-Parametros-De-Sistema §<n> |
| Operación y entrega | variable | configuración por ambiente: archivo de configuración de Turnos |
| Arquitectura | variable | más de una unidad de entrega (front y back de Turnos), ADR del destino |
| Refutador | núcleo, último | siempre |
| Análisis de decisiones | condicionado | sólo si el refutador admite una ficha (MEP:134) |
| Jurado | — | Mesa-Rules §6.4: composición y veredicto |

Descartados: Uso y accesibilidad — la señal «UX» es de la mesa anterior, no del objeto (la persistencia de
parámetros no tiene flujo con personas); Seguridad — sin señal ubicada: se convoca sólo si una comisión
emite solicitud por un secreto entre los parámetros; Formal, Concurrencia, Rendimiento, Interfaz externa,
Cumplimiento, Trazabilidad documental — sin señal en el objeto. Composición la vota el jurado; no se eleva
al PO (MEP:224).

### 4. Carta de despacho completa — Datos y dominio (MEP §5.2)

Se archiva como `evidencia/003-carta-datos-y-dominio.md` antes de despachar, con sus tres líneas de cabecera.

```text
Método: carta de despacho, texto verbatim
Base: <commit base>
Quién: presidencia de la mesa

Sos la comisión DATOS Y DOMINIO en una mesa de expertos sobre la decisión de la mesa de UX de Turnos de
guardar los parámetros de sistema en el archivo de configuración. Tu encargo es refutar, no verificar.
Trabajás a ciegas: no vas a ver el informe de ninguna otra comisión.
Clase de objeto: corpus documental existente.

Caso, tal como lo presentó quien pidió la mesa: «la mesa de UX del proyecto Turnos decidió guardar los
parámetros de sistema en el archivo de configuración en vez de la tabla de parámetros que manda el
conocimiento de parámetros de la casa; hacé una mesa de expertos que revise si eso estuvo bien y qué hacemos»
Y su corrección posterior: «ojo que en Turnos la tabla de parámetros todavía no existe; y no quiero que se
toque nada en producción hasta que vea los caminos»
Objetivo, con el origen de cada cláusula: Dictaminar si la decisión era una excepción admisible a la
convención de parámetros [pedido: «revise si eso estuvo bien»; Excepcion-A-Un-Conocimiento §3], con la
creación de la tabla como alternativa de cumplir medida [corrección: «la tabla … no existe»; Excepcion §3,
filtro], y entregar el camino [pedido: «qué hacemos»], sin que ningún paso provisorio alcance producción
antes de la respuesta [corrección: «no quiero que se toque nada en producción»]. Agregado, no despachado:
migrar los valores existentes. Lo que da por fijo sin origen es tu primer hallazgo.
Si falla un paso que el pedido prescribe, no lo rodeás: devolvés «BLOQUEO: paso — salida — prueba de una variable».

Tu competencia es entidades, persistencia, ciclo de vida de los parámetros y la forma de la tabla.
No te corresponde despliegue por ambiente, secretos ni la frontera entre unidades de entrega: si encontrás
algo ahí, emitís una solicitud de convocatoria con la señal y su ubicación, no un hallazgo.

Por cada hallazgo: nivel P0–P3 (con la lectura para este caso: P0 viola una restricción dura o hace
imposible el objetivo; P1 haría salir el plan con retrabajo o lectura divergente; P2 pérdida acotada;
P3 claridad), clase de ancla E1–E4 o C con su cita o su comando y salida (la escala está en
SDD/Devs/Rules/Mesa-Rules.md §6.1), impacto si no se corrige y dirección de la corrección, no su redacción.

Rigen estas convenciones: Parametros-De-Sistema <X.Y> §<n>; Excepcion-A-Un-Conocimiento 1.0;
Cadena-De-Consecuencias 1.0. Si proponés no seguir alguna, cargás entero
Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md y escribís su ficha, con la alternativa de cumplir,
una por decisión, en <expediente>/evidencia/fichas/: quien preside la incorpora como folio propio.
«Más simple» o «no aplica del todo» no es motivo. Antes de recomendar entre opciones, corrés
Conocimiento/Knowledge-Cadena-De-Consecuencias.md §2.

Datos del despacho, con su comando: D1 a D5 del contrato de entrada (salidas adjuntas en evidencia/002).

Norma: Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md 2.0. Leé primero las líneas 1 a 101 y después
sólo lo que su «Mapa de carga» da para tu situación; una remisión a algo que no cargaste, en el texto de tu
acto, la cargás. En la cabecera de tu folio declarás la fila «Secciones de Mesa-De-Expertos-A-Pedido 2.0 leídas».
Tope: 8 hallazgos. Declarás hasta tres ítems de «lo que revisé y está bien».
Escribís tu informe, verbatim, en <destino>/SDD/Docs/Audit/Mesa-2026-10-23/datos-y-dominio.md; quien
preside cuenta los folios, no los transcribe.
```

(La ruta de informe y la carpeta de fichas son elecciones de la presidencia: ver B3 y M3.)

### 5. Carpeta del expediente (Expediente-Rules §2, §3; MEP §2.3, §5.3)

```text
<destino>/SDD/Expedientes/<NNNN>-Revision-De-Los-Parametros-De-Sistema-De-Turnos/
├── README.md                          carátula de 6 campos + línea de remisión
├── .gitignore                         forma de MEP §5.3 (png, jpg, ndjson); sin evidencia cruda prevista
├── actuaciones/
│   ├── 001-presentacion-pedido-del-po.md              testimonio F1-F5, huella 02d34092…
│   ├── 002-providencia-contrato-de-entrada-y-despacho.md
│   ├── 003-presentacion-correccion-del-objetivo.md    testimonio G1-G2, huella 117d7e56…
│   ├── 004-providencia-relanzamiento-con-objetivo-corregido.md
│   ├── 005-constancia-corrida-descartada.md
│   ├── 006-constancia-folia-registro-de-audit.md      ruta@commit del registro e informes de Audit/
│   ├── 007-informe-ficha-de-excepcion-1.md            XC-1, autor: Datos y dominio
│   ├── 008-informe-analisis-del-camino-de-compromiso.md  (en destino: ¿aquí o en Audit/? ver B3)
│   └── 009-resolucion-dictamen-plan-y-cierre.md
└── evidencia/
    ├── 001-pedido-del-po.txt           texto exacto del testimonio (sostiene la huella)
    ├── 002-salidas-del-despacho-verificado.txt
    ├── 003-carta-datos-y-dominio.md  … una por carta, y las relanzadas
    └── fichas/                         carpeta de entrega de las fichas (M3)
```

Los informes de comisión, refutador y jurado viven en `SDD/Docs/Audit/` por ser destino y mesa de §0.0
(Expediente-Rules §3, «Lo que se asienta verbatim»; MEP:188-190) y entran por la constancia 006.

### 6. Ficha de excepción (XC §5.1)

La comisión Datos y dominio no sostiene la decisión de la mesa de UX en bloque: halla (E1) que el archivo
mezcla dos clases de parámetros. Para la mayoría, «la tabla no existe» no es contradicción (XC:96-97):
**se cumple**. Para los de arranque —la URL del backend y el identificador del cliente de autenticación—
sostiene una contradicción y deja la ficha:

```text
EXCEPCIÓN XC-1
  Conocimiento:           Parametros-De-Sistema <X.Y> §<n> — «<texto literal: los parámetros de sistema se
                          guardan en la tabla de parámetros>»
  Alternativa de cumplir: crear la tabla de parámetros (migración de esquema), leer de ella todos los
                          parámetros, incluidos los de arranque
  Costo de cumplir:       los de arranque se leen ANTES de poder consultar la tabla: el front necesita la URL
                          del backend para llegar a la API que lee la tabla. Comando:
                          git grep -n '<clave URL backend>' <commit> -- <front>/  → usada en el bootstrap
  Por qué no se cumple:   E1 — la lectura de la tabla depende del parámetro que la tabla guardaría
                          (dependencia circular medida con el comando de arriba); E2 — ADR-<n> Aceptado de
                          Turnos, «el front no accede a la base»
  Reversibilidad:         reversible: mover dos claves de vuelta a la tabla es un cambio acotado, sin pérdida
  Sostiene:               comisión Datos y dominio — <Audit/…/datos-y-dominio.md>
  Aprobó:                 pendiente — sale en el cierre (§5.2)
```

El refutador la admite sólo para los dos parámetros de arranque (el E2 del ADR solo «prohíbe el medio»:
no impide la tabla detrás de la API, así que no basta; el E1 sí). Para el resto, ficha no admitida: se cumple.

### 7. Análisis del camino de compromiso (XC §5.3)

```text
ANÁLISIS DEL CAMINO DE COMPROMISO — XC-1 (ficha folio 007)
  Sigue rigiendo:       Parametros-De-Sistema §<n> para todo parámetro que no sea de arranque: se cumple
  Fuera del documento:  los dos parámetros de arranque; referencia: The Twelve-Factor App, factor «Config»
  Alternativas:         Alt-1 tabla para todo salvo los de arranque, que van a configuración por ambiente
                        (la más cercana a cumplir) — Alt-2 todo en configuración (lo que hizo la mesa de UX)
                        — Alt-3 tabla para todo con los de arranque duplicados en configuración
    Descartadas antes de ponderar: Alt-0 tabla para todo, sin configuración — E1 de la ficha (circular)
  Criterios y pesos (fijados antes de puntuar):
    K-1 Cercanía a cumplir — peso 3 — fuente: Parametros-De-Sistema §<n>
    K-2 Reversibilidad     — peso 2 — fuente: Cadena-De-Consecuencias §2, paso 4
    K-3 Mantenibilidad     — peso 1 — fuente: ISO/IEC 25010 (sin apartado) — por qué pesa así: dos lugares
                             para un mismo valor es la deriva que la convención evita
  Ponderación:          Alt-1: K1 3, K2 3, K3 2 → 17 · Alt-2: K1 0, K2 2, K3 2 → 6 · Alt-3: K1 2, K2 3, K3 0 → 12
  Caminos:
    C-1 (recomendado) Alt-1: cumple todo lo cumplible; reversible
    Sin C-2: Alt-3 quedó segunda; la pondría primera un peso de K-3 ≤ 0, lo que no es razonable porque
      duplicar valores es justo lo que la convención evita
  Mientras se decide:   provisorio: se sigue C-1 en lo reversible; por G2, nada en producción
```

### 8. Campos de cierre (Mesa-Rules §6.7 + XC §5.2)

```text
CIERRE DE MESA — Turnos, 2026-10-23
  PANEL
    Convocados:  Requisitos, Verificación, Lector sin contexto, Datos y dominio, Operación y entrega,
                 Arquitectura: <hallazgos procedentes por rol>
    Descartados: Uso y accesibilidad (señal de la mesa anterior, no del objeto); Seguridad (sin señal ubicada); …
  HALLAZGOS  Detectados: n · Procedentes: n · Con parche: n · Descartados por C: n
  COMPUERTA (§10.0)  Resultado: — (corpus de destino sin fase en curso) · No mirado: valores de cada parámetro
  ENTREGA AL ORQUESTADOR
    Parches: crear la tabla; mover los parámetros no de arranque; ADR Propuesto de XC-1
    Deuda declarada: XC-1 con evento de cierre «respuesta del PO»
    Escaladas: XC-1 (en el lote)
    Reintegra: clase <de la resolución>; categorías 05 (ADR, modelo de datos) y 06
  FOLIOS
    Informes (6 convocados + refutador + análisis + 2 del jurado): 10 — Escritos: <n> — <rutas>
    Además foliados, fuera de la cuenta: presentaciones 001 y 003, providencias, ficha 007, resolución
  EXCEPCIONES A CONOCIMIENTOS
    XC-1: Parametros-De-Sistema §<n> → los dos parámetros de arranque en configuración por ambiente —
      ficha 007 — contradicción: E1 (dependencia circular)
      Refuta: <Audit/…/refutador.md> — Analiza: 008 — Veredicto: <Audit/…/jurado-veredicto.md>
      Estado: provisorio: se sigue C-1, reversible (sin tocar producción, por tu corrección)
      Caminos (análisis 008): C-1 Alt-1, total 17, reversible — sin C-2: Alt-3 segunda (12), la pondría
        primera K-3 ≤ 0 — criterios: Twelve-Factor App «Config»; ISO/IEC 25010
      ¿Validás C-1 o pedís otro camino?
      SI NO RESPONDÉS: se sigue con C-1, provisorio y sin aprobar, hasta tu respuesta; nada irreversible
      ni nada en producción se apoya en él; el ADR queda `Propuesto` hasta tu respuesta
      Origen del hecho: ajeno a la corrida — la decisión de la mesa de UX está en el commit base sin cambios
        (git log <base> -- <archivo de configuración>)
      Aprobó: pendiente
    No admitidas: la excepción para los parámetros que no son de arranque — «la tabla no existe» es
      conveniencia (XC:96-97): se cumple la convención, creando la tabla
    Propuestas de cambio de convención: (ninguna)
  PREGUNTA SOBRE EL AGREGADO
    ¿Querés que el plan incluya migrar los valores hoy en el archivo a la tabla? SI NO RESPONDÉS: el plan no
    la incluye y queda como deuda declarada.
  BARRIDO DE SECRETOS
    git grep -n -i -E 'password|secret|token|apikey' -- <carpeta del caso> → <resultado>; redactado: <…>
  CIERRE
    por decisión, con lo que quedó abierto: XC-1 sin aprobar; una sola ronda (MEP:290)
```

Dictamen por pregunta: **Q1** no: la mesa de UX no tenía contradicción para la mayoría de los parámetros
(conveniencia y precedente: XC:96-97) y, para los de arranque, la tenía pero no la declaró ni la elevó
(anti-patrón XC:278). **Q2** los de arranque (dos). **Q3** cumplir con la tabla para el resto; XC-1 con C-1
provisorio; nada en producción hasta la respuesta.

---

## Parte II — Reporte

### Referencias rotas

Comprobadas con `ls`/`test -e`/`grep -n` en el workspace limpio. Todo lo demás citado —`Mesa-Rules.md`
§0.0, §2.1, §2.2, §4, §5, §5.1, §5.5, §6.1-§6.7, §7; `Expediente-Rules.md` §1, §2, §3, §3.1, §3.3, §3.4,
§3.5, §6 A3/A8; `Master-Prompt.md` §6, §7.0, §8.1, §10, §10.0, §10.1; `Root-Rules.md` §11, §14;
`Deriva-Rules.md` §3; `Rules-Base-Conocimiento.md` §0.2, §0.4, §2.2, §4.4, §6.1, §6.2, §7, §8;
`Rules-Arquitectura-Tecnica.md` §3.3, §4.1; las tres guías de coherencia; el folio 019 del expediente 0003;
las anclas de línea de MEP:537-539 y XC:321-326— resuelve y dice lo que se afirma.

1. **`Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/` no existe en el workspace limpio**
   (`test -e` → FALTA). Lo citan MEP:522 (ejemplar a la vista), MEP:524 (origen de la 2.0), MEP:539
   (`evidencia/ev-06-cotejo-de-las-copias-del-fork.diff`, ancla de la equiparación de las copias), MEP:541,
   MEP:550; XC:312, XC:313, XC:329, XC:335; CC:144, CC:154, CC:160; Index-Knowledge.md:57. La exclusión es
   del montaje de la prueba, pero un agente que reciba el framework sin ese expediente pierde el único
   ejemplar de la forma 2.0 y el cotejo que funda la equiparación de MEP:539.
2. **`evidencia/ev-06-…diff`** (MEP:539) además usa un prefijo `ev-` que `Expediente-Rules.md` §3.1
   (líneas 163-166) declara colisionante y reemplaza por `NNN-<slug>`: aunque el expediente estuviera, el
   nombre citado contradice la regla de nombres de evidencia.
3. **`Coherencia-Mesa-De-Evaluacion.md` y `Coherencia-Condicion-De-Convocatoria.md` sin ruta** (MEP:66,
   MEP:523, MEP:256): resuelven sólo con `find` (en `SDD/Devs/Guides/`, más 15 copias en `_legacy/`); la
   ruta aparece recién en MEP:540. No es rota, pero un `ls` directo desde `Conocimiento/` falla.
4. **`Knowledge-<Parametros-De-Sistema>` / «la base del destino»**: el índice del destino al que manda
   MEP:313 no tiene ruta definida en el framework (ver B2).

### Bloqueantes

- **B1 — Si la mesa cumple `Mesa-Rules.md` §0.0, ¿qué de MEP aplica?** MEP:116-118: «es esa mesa y esa
  regla la gobierna entera; de este documento sólo se toman la lectura del pedido (§3.1) y el expediente
  (§2.3)». Este caso cumple las tres cláusulas, y sin embargo lo que el caso exige —el paso 6 bis
  (MEP:134), la cuenta de folios con el análisis (MEP:138), `ENUNCIADO`, `LECTURA P0–P3`, `CONVENCIONES QUE
  RIGEN` (MEP:302-316) y la carta de §5.2— está fuera de §3.1 y §2.3. Contradice MEP:27 («Lo que no se omite
  al aplicar este documento, se cargue lo que se cargue») y MEP:498-501 (los campos extienden el contrato de
  `Mesa-Rules.md` §4). Además `Mesa-Rules.md` no conoce el rol «análisis de decisiones». Tuve que adivinar:
  apliqué los seis renglones de §0 y las secciones de excepción siempre. Mi lectura es la que hace útil al
  documento, pero el texto de MEP:116-118 la prohíbe.
- **B2 — El índice «que declara el intake» no existe.** MEP:313 parametriza el barrido con «la ruta del
  índice que declara el intake». `Index-Knowledge.md:50-51` dice «El intake no registra ninguna raíz ni
  ninguna versión de base: cita alias», e `Intake-Rules.md:187` resuelve los alias sólo contra
  `Conocimiento/Index-Knowledge.md` del framework; `Master-Prompt.md:576` abre `../IA.SDD/Conocimiento/…`.
  El caso («conocimiento de la casa en la base del destino») no tiene dónde vivir en el modelo del
  framework: o el destino es un fork del framework, o no hay base del destino. Supuse
  `<destino>/SDD/Conocimiento/Index-Knowledge.md` sin ancla.
- **B3 — Dónde escribe cada informe en un destino.** `Mesa-Rules.md` §2.1 (línea 156) y §2.2 ítem 4 fijan
  **un** registro `SDD/Docs/Audit/Mesa-<fecha>.md` que contiene los informes; MEP:132, MEP:184 y MEP:255
  piden que cada comisión escriba su propio folio en la ruta que le da el despacho; y XC:136 pone la ficha en
  `actuaciones/NNN-informe-ficha-…` aunque en destino los demás informes van a `Audit/` (Expediente-Rules §3,
  «Lo que se asienta verbatim»). Nada dice dónde va el análisis de decisiones en destino. Elegí una carpeta
  `Audit/Mesa-<fecha>/` con un archivo por rol, que la regla no prevé.
- **B4 — Dos decisiones cerradas en conflicto.** `Mesa-Rules.md:245` toma como fuente de
  `decisiones_cerradas` los «informes de audit cerrados»: la decisión de la mesa de UX lo es. MEP:280 manda
  asentar ahí también la convención que rige. Las dos se contradicen y ambas «sólo se reabren con E1/E2»
  (`Mesa-Rules.md:249-251`). MEP:270 dice que «se decidió en el expediente N» sin frase de quien pidió no
  fija nada, pero eso habla del objetivo, no del campo `decisiones_cerradas`; y reabrir es el disparador 7
  de `Mesa-Rules.md` §7 (arbitraje del humano). Resolví que la frase «revise si eso estuvo bien» saca a la
  decisión de UX del campo, pero ningún texto lo dice. Falta, además, el caso entero: **una excepción ya
  ejecutada y no declarada por otra mesa**. XC sólo describe la ficha de «quien propone» (XC:58); no dice
  quién la escribe de forma retroactiva ni si la mesa revisora debe escribirla en nombre de la anterior.

### Menores

- **M1 — README sin ruta a la mesa a pedido.** La matriz de ruteo (README:64) lleva «evaluar un corpus» a
  `Mesa-Rules.md`; el pedido «hacé una mesa de expertos» sólo llega a MEP pasando por README:30 →
  `Index-Knowledge.md:41`. Un agente que siga la matriz termina en la regla normativa y nunca carga MEP.
- **M2 — Clase de objeto no exclusiva.** MEP:142-147 da cuatro clases sin regla para un objeto mixto (un
  corpus que también pide una decisión). Apliqué «la que menos agrega» de MEP:235 por analogía.
- **M3 — `{{CARPETA DE FICHAS}}` sin definir** (MEP:354): ningún texto fija dónde deja la comisión la
  ficha antes de que la presidencia la folie; XC:140 sólo dice que no se asigna ruta de antemano al folio.
- **M4 — Campos del contrato en dos grafías y con faltantes.** MEP §5.1 usa `RESTRICCIONES DURAS`,
  `DECISIONES CERRADAS`, `FUERA DE ALCANCE`; `Mesa-Rules.md` §4 usa `restricciones_duras`, etc., y además
  exige `estado`, `diff_normativo` y `pendientes_declarados`, que el esqueleto de MEP no trae. Bajo B1 no
  queda claro si hay que llenarlos.
- **M5 — «Secciones … leídas» para documentos hermanos.** La carta (MEP:360) pide declarar las secciones
  de MEP, pero no las de XC ni CC, que el mapa de carga manda cargar enteros; el cruce del paso 10
  (MEP:138) no puede verificar si se cargaron.
- **M6 — «Se relanza»** (MEP:36, MEP:129) no dice si se relanza todo el despacho o sólo las cartas
  afectadas, ni qué pasa con los informes ya escritos. Usé «corrida descartada con constancia»
  (Expediente-Rules §3.4), que MEP no cita.
- **M7 — Redundancia extensa.** El paso 2 de §2.1 (MEP:129) repite casi literal el renglón 2 de §0
  (MEP:33-37); la fila «Comportamiento no es restricción» (MEP:270) repite el renglón 4 (MEP:44-47) y el
  anti-patrón de MEP:473. Aumenta la carga sin agregar regla.
- **M8 — Tensión entre el origen del hecho y XC.** MEP:271 dice que el pedido nunca está en la base, por
  lo que un hecho apoyado en él es «de la corrida»; la decisión de la mesa de UX está en la base, pero la
  ficha nace del pedido. No sé qué rotular en «Origen del hecho» del cierre (rotulé «ajeno», por el commit).
  XC:118 resuelve el efecto (la pregunta sale igual) pero no el rótulo.
- **M9 — Barrido y versión del documento.** El comando de versión (MEP:315) da `**Versión:** 2.0`, pero
  la fila del índice no tiene columna de versión (sólo `Compatible-con`), así que «alias, versión» exige dos
  comandos por documento; está bien, pero el texto «lista alias, Tema y Estado» (MEP:278) coincide con
  `-f3,5,11` sólo contando la columna vacía inicial, lo que no se dice.
- **M10 — Ejemplo de origen casi idéntico al caso.** XC:96 describe dos mesas que descartaron una tabla de
  parámetros; ayuda, pero un agente puede copiar su veredicto en lugar de medir. No hay ejemplar completo
  (el 0004 no está, referencia rota 1).

Sigue: consolidación de las reproducciones a ciegas · presidencia del expediente 0004
