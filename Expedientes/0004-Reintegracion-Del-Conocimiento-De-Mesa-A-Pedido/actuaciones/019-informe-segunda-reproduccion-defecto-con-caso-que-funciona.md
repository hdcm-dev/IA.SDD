# Segunda reproducción a ciegas — un defecto con caso que funciona, sobre el commit corregido

| Campo | Valor |
| --- | --- |
| Tipo | informe |
| Fecha | 2026-10-23 |
| Autor | Reproductor a ciegas C (sobre el commit corregido) |
| Corrige | — |

## 0. Condiciones de la reproducción

- **Workspace.** Un árbol limpio del framework obtenido con `git archive HEAD` del worktree del expediente,
  sin la carpeta `Expedientes/0004-*` (la retiró la preparación). Ninguna lectura fuera de ese árbol:
  ni worktree, ni workspace del usuario, ni memorias, ni otros directorios.
- **Ruta de descubrimiento seguida.** `README.md:65` (fila «Armar una mesa de expertos que alguien pidió
  por nombre») → `Conocimiento/Index-Knowledge.md:41` (fila `Mesa-De-Expertos-A-Pedido`) →
  `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` 2.0, cargado entero por el rol de presidente
  (`:95`), más `Knowledge-Excepcion-A-Un-Conocimiento.md` 1.0 y `Knowledge-Cadena-De-Consecuencias.md` 1.0
  enteros (`:51-56`, `:95`). Por remisión desde el texto de mi acto: `SDD/Devs/Rules/Mesa-Rules.md` 1.5
  §0.0, §2, §4, §5, §6, §7; `SDD/Devs/Rules/Expediente-Rules.md` 1.1 §1 a §6;
  `SDD/Devs/Rules/Root-Rules.md` 8.9 §14; `SDD/Devs/Orchestrator/Master-Prompt.md` 8.21 §6, §8.1, §10.
- **Secciones de Mesa-De-Expertos-A-Pedido 2.0 leídas:** todas (§0 a §10).
  Excepcion-A-Un-Conocimiento 1.0 y Cadena-De-Consecuencias 1.0, enteros.
- **No hay proyecto real.** Todo lo que haría falta medir en el destino va como «a medir», con el
  comando o el medio que lo mediría, y sin cifras inventadas.
- **Cómo está escrito este folio.** La salida en papel va dentro de bloques de código con sangría, para
  que las comprobaciones A4 y A8 de `Expediente-Rules.md` §6 —que cuentan líneas sin mirar cercos— no
  lean las cabeceras ni los bloques de testimonio ilustrativos como propios de este folio (ver M-11).

## 1. Salida en papel

### 1.1 Pedido, enunciado y objetivo (paso 1 y 2 de §2.1)

```text
    PEDIDO (literal, 1): «en el proyecto Biblioteca, el alta de un socio por la API devuelve 401 y por la
      pantalla web funciona, con la misma cuenta; hacé una mesa de expertos que encuentre por qué y lo
      corrija, y que no toquen el login de la web»
      Quién: Product Owner de Biblioteca. Canal: conversación con el agente. Fecha-hora: 2026-10-23T{{hh:mm}}-03:00
      (el caso no da hora; zona supuesta). Huella (texto sin «», con LF final):
      3fa4a93b39bd46a424448fb3a4efc8d86561f8f6b507a60279556205383a3070

    ENUNCIADO (§3.1, fila «Todo pedido que plantea un problema»):
      F1 «el alta de un socio por la API devuelve 401»                → dato (síntoma) + incógnita: ¿por qué?
           Sujeto: el emisor que llama al endpoint de alta «por la API». NO está nombrado: puede ser una
           herramienta del PO, un cliente de pruebas o la app móvil. Medir otro emisor no contesta la
           pregunta, la acota. → incógnita I-0: qué cliente, qué versión, qué entorno.
           El 401 es el OBJETO de la investigación, no un bloqueo (§3.1, fila del bloqueo, :242).
      F2 «por la pantalla web funciona»                               → dato: CASO QUE FUNCIONA.
      F3 «con la misma cuenta»                                        → dato: eje fijado por quien pidió (cuenta).
      F4 «hacé una mesa de expertos que encuentre por qué»            → requisito: diagnóstico causal.
      F5 «y lo corrija»                                               → requisito: aplicar (autoriza aplicar, §4 «Quién aplica»).
      F6 «que no toquen el login de la web»                           → exclusión (restricción dura RD-1).
           Dos lecturas: (a) no cambiar el comportamiento ni el código del inicio de sesión web;
           (b) no editar ningún archivo donde viva configuración del login (p. ej. el arranque de la app).
           Se toma la que restringe sólo lo que nombra: (a). Declarada. (b) sería un agregado.
      Origen de cada condición: F1–F6, el pedido. Lo que el producto hace hoy no es condición (§3.3).
      Caso que funciona: sí (F2), con tabla diferencial abajo.

    OBJETIVO vigente (versión 1):
      Encontrar la causa por la que el alta de socio por la API devuelve 401 [F1, F4] mientras por la web
      funciona con la misma cuenta [F2, F3], y corregirla [F5] sin cambiar el inicio de sesión web [F6, lectura a].
```

**Tabla diferencial (§3.3, «Caso que funciona antes que diseño»).** Una fila por camino, ancla por
celda; en papel todas las celdas quedan «a medir» con su medio.

```text
    Camino      | Emisor            | Cómo obtiene la credencial | Cómo viaja                       | Qué transforma en el medio  | Receptor: esquema que acepta el endpoint de alta | Autorización (rol/claim) | Resultado
    Web (ref.)  | navegador         | formulario de login (F6)   | cookie de sesión [a medir: E1]   | proxy [a medir]             | [a medir: E2, arranque de la app y atributo del endpoint] | [a medir] | 201/200 (F2, dato C del PO hasta medir)
    API (falla) | {{I-0}}           | [a medir]                  | encabezado Authorization [a medir: E1, captura de la petición] | [a medir] | [mismo receptor, a medir] | [a medir] | 401 (F1)
    Ejes fijos: cuenta (F3), receptor y endpoint (mismo alta), login web (F6).
    Columna que cambia: [a determinar por la medición]. Hipótesis nombradas, a correr antes de rodear nada:
      H1 el endpoint de alta sólo acepta el esquema de cookie (esquema por defecto) y descarta el encabezado;
      H2 el emisor de la API manda la credencial con otra forma (prefijo de esquema, codificación);
      H3 la credencial de la API no lleva el claim que la política exige (daría 403 y no 401: la contradice el síntoma; se mide igual).
    Prueba de una variable (perito): dos peticiones al alta iguales salvo la forma de la credencial
      (cookie obtenida por la web vs. encabezado), con la cuenta sembrada; evidencia de las dos.
    Historia antes de tratar una línea como invariante: git log -S '<esquema por defecto>' / git blame sobre el arranque.
    Primera salida a evaluar: igualar la columna que cambia a la del caso que funciona (en el emisor o en el
      receptor, según lo que mida la tabla), sin mover F3 ni F6.
```

**Datos reales (§4, «Datos reales»).** «La misma cuenta» es una cuenta real del Product Owner. Las
comisiones reproducen con una cuenta sembrada con los mismos atributos (rol, estado) y altas de socios
ficticios que ellas sembraron, y declaran el eje que no quedó fijo (la cuenta). La medición con la cuenta
real es un obstáculo, y sale en el mismo turno en una línea:
«¿Podés correr esta petición de alta con tu cuenta y pegarme el código de respuesta y el encabezado
`WWW-Authenticate`?»

### 1.2 Clase de objeto, contrato de entrada (§5.1)

```text
    CLASE DE OBJETO: investigación de un defecto o contradicción (pregunta principal: «por qué» + «corregir»).
      Descartada: interfaz en ejecución — la pantalla web es el caso que funciona, no el objeto; no se
      convoca ninguna señal de usabilidad. Cierra con la regla de la clase tomada: la prueba que cubre el
      defecto se vio fallar antes del arreglo y pasar después (§2.2).
    Relación con Mesa-Rules §0.0: NO la cumple (el objeto es un defecto del código, no un corpus de
      especificación: §1, :116-122). Mesa-Rules se usa como forma.
    OBJETO: endpoint de alta de socio de la API de Biblioteca, en {{repo}}@{{commit base}}; y su
      autenticación frente a la de la web.
    OBJETIVO: el de 1.1 (con su versión y origen por cláusula).
    PREGUNTAS DEL CASO: Q1 ¿por qué el alta por la API da 401 con la misma cuenta que funciona en la web?
      Q2 ¿qué cambio mínimo lo corrige sin tocar el login web?
    LECTURA P0–P3: P0, lo que viola RD-1 (toca el login web) o hace imposible el objetivo;
      P1, lo que haría salir el arreglo con retrabajo o con lecturas divergentes entre implementadores
      (p. ej. una corrección que no iguala la pieza que difiere); P2, una pérdida acotada; P3, claridad.
    RESTRICCIONES DURAS: RD-1 no cambiar el inicio de sesión web (F6, lectura a). Apartamientos de
      Root-Rules §11 del destino: [a leer del intake del destino].
    DECISIONES CERRADAS: las CONVENCIONES QUE RIGEN de abajo; ADR vigentes de autenticación del destino [a leer].
    CONVENCIONES QUE RIGEN (§3.4):
      Índice:  Conocimiento/Index-Knowledge.md del framework que corre
      Barrido: grep '^| `Knowledge-' Conocimiento/Index-Knowledge.md | cut -d'|' -f3,5,11
      Salida (recortada a alias y Estado; el Tema completo está en el índice):
        Clean-Architecture-DataManager | Vigente ; Conformacion-Pull-Request-Manual | Vigente ;
        Conformacion-Pull-Request-Automatico | Vigente ; Template-HTML-SDD-Default | Vigente ;
        Template-Blazor-Interactive-Server-SDD-Default | Vigente ; Mesa-De-Expertos-A-Pedido | Vigente ;
        Excepcion-A-Un-Conocimiento | Vigente ; Cadena-De-Consecuencias | Vigente ;
        Entorno-De-Ejecucion-Del-Agente | Vigente
      Versión: grep -m1 '^\*\*Versión' Conocimiento/Knowledge-<alias>.md
      Rigen: Mesa-De-Expertos-A-Pedido 2.0 (todo); Excepcion-A-Un-Conocimiento 1.0 (§3–§5);
        Cadena-De-Consecuencias 1.0 (§2, §3); Conformacion-Pull-Request-Manual 1.0 (entrega del arreglo,
        salvo que el destino asiente la delegación del merge); Entorno-De-Ejecucion-Del-Agente 1.0 §2–§3
        (clasificar el origen del segundo mensaje como pedido); Clean-Architecture-DataManager 1.0 §2–§3,
        CONDICIONAL: sólo si el intake del destino declara la API `rest-api` .NET sobre SQL Server
        (supuesto S-1, a verificar contra el intake).
      Descartes: Template-HTML-SDD-Default y Template-Blazor-Interactive-Server-SDD-Default: su Tema es la
        maqueta; el objeto no es una maqueta. Conformacion-Pull-Request-Automatico: sólo vale con la
        delegación del merge asentada en el destino, que el caso no muestra.
    FUERA DE ALCANCE: el login web (RD-1); el modelo de datos del socio; la app móvil salvo lo que agregue
      quien pidió.
    MEDIOS: peticiones HTTP contra un entorno de prueba con cuenta sembrada; lectura del código; historia
      de git. Sin observar: el entorno de producción y la cuenta real (obstáculo pedido en 1.1).
    EXPEDIENTE: SDD/Expedientes/<NNNN>-Alta-De-Socio-Por-Api-Devuelve-401/ (número: el siguiente libre del destino).
    QUIÉN APLICA: quien convoca —el presidente, en el lugar del orquestador—, nunca un rol del panel (§4).
    PRESUPUESTO: tope de 5 hallazgos por comisión; una ronda prevista (cierra «por decisión», §4).
    estado / diff_normativo / pendientes_declarados: no aplica — la mesa no cumple Mesa-Rules §0.0.
    Prefijo de familia de hallazgos del ciclo: MAP- (supuesto: no se pudo verificar que no colisione con
      Audit/ del destino; Mesa-Rules §2.2 punto 1).
    DESPACHO VERIFICADO: cada sección que se pasa al panel, con el comando que la ubica
      (p. ej. grep -n '^### 3.3' Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md → 266);
      el barrido de arriba; la huella del pedido (sha256sum de la pieza, ver B-1).
```

### 1.3 Composición del panel (paso 4, la vota el jurado)

```text
    Núcleo permanente: Requisitos, Verificación, Lector sin contexto, Refutador (último).
    Variables por señal (ubicación = frase del pedido, ver M-4):
      Seguridad        — señal: «devuelve 401», «la misma cuenta» (F1, F3): autenticación. Titular AG-00050.
      Arquitectura     — señal: dos unidades de entrega sobre un receptor (web y API, F1–F2). Titular AG-00050.
      Interfaz externa — entra con el segundo mensaje: «la API la usa también la app móvil» (contrato con un
                         consumidor, retrocompatibilidad). Titular AG-00020.
    Perito: diseña la prueba de una variable de 1.1; no vota.
    Descartados con motivo: Datos y dominio (el defecto es de autenticación, no del modelo del socio);
      Cumplimiento (el arreglo no cambia el tratamiento de datos personales; si cambiara, disparador 5);
      Uso y accesibilidad (no hay superficie bajo examen); Formal, Concurrencia, Rendimiento, Operación y
      entrega, Trazabilidad documental (sin señal en el pedido).
    Techo: 3 variables de 5. Composición sin elevar a quien pidió (Mesa-Rules §6.2).
```

### 1.4 Carta de despacho completa — comisión de Seguridad (§5.2), versión 2 (relanzada)

```text
    Sos la COMISIÓN DE SEGURIDAD en una mesa de expertos sobre el endpoint de alta de socio de la API de
    Biblioteca, en {{repo}}@{{commit base}}. Tu encargo es refutar, no verificar.
    Trabajás a ciegas: no vas a ver el informe de ninguna otra comisión.
    Clase de objeto: investigación de un defecto o contradicción.

    Caso, tal como lo presentó quien pidió la mesa: «en el proyecto Biblioteca, el alta de un socio por la
    API devuelve 401 y por la pantalla web funciona, con la misma cuenta; hacé una mesa de expertos que
    encuentre por qué y lo corrija, y que no toquen el login de la web» — y, a mitad del trabajo:
    «ah, y la API la usa también la app móvil, que no se rompa»
    Objetivo, con el origen de cada cláusula: encontrar la causa del 401 en el alta por la API [F1, F4]
    mientras la web funciona con la misma cuenta [F2, F3], y corregirla [F5] sin cambiar el inicio de
    sesión web [F6, lectura a] y sin que deje de funcionar lo que la app móvil hace hoy contra la API
    [F7, lectura a]. Lo que da por fijo sin origen es tu primer hallazgo.
    Si falla un paso que el pedido prescribe, no lo rodeás: devolvés «BLOQUEO: paso — salida — prueba de una
    variable». El 401 del alta es el objeto, no un bloqueo.

    Tu competencia es autenticación y autorización: esquemas que acepta cada endpoint, forma de la
    credencial en cada emisor, políticas y claims. No te corresponde el modelo de datos del socio ni el
    contrato funcional de la app móvil: si encontrás algo ahí, emitís una solicitud de convocatoria con la
    señal y su ubicación, no un hallazgo.

    Por cada hallazgo: nivel P0–P3 (con la lectura para este caso: P0 viola RD-1 o RD-2 o hace imposible
    el objetivo; P1 haría salir el arreglo con retrabajo o lecturas divergentes; P2 pérdida acotada;
    P3 claridad), clase de ancla E1–E4 o C con su cita o su comando y salida (la escala está en
    SDD/Devs/Rules/Mesa-Rules.md §6.1), impacto si no se corrige y dirección de la corrección, no su redacción.
    Toda acción sobre el sistema vivo, sólo con la cuenta y los socios que vos sembraste.

    Rigen estas convenciones: Mesa-De-Expertos-A-Pedido 2.0; Excepcion-A-Un-Conocimiento 1.0 §3–§5;
    Cadena-De-Consecuencias 1.0 §2–§3; Conformacion-Pull-Request-Manual 1.0; Entorno-De-Ejecucion-Del-Agente
    1.0 §2–§3; Clean-Architecture-DataManager 1.0 §2–§3 si S-1 se verifica. Si proponés no seguir alguna,
    cargás entero Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md y escribís su ficha, con la
    alternativa de cumplir, una por decisión, en <carpeta-del-caso>/despacho/: quien preside la incorpora
    como folio propio. «Más simple» o «no aplica del todo» no es motivo. Antes de recomendar entre
    opciones, corrés Conocimiento/Knowledge-Cadena-De-Consecuencias.md §2.

    Norma: Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md 2.0. Leé primero las líneas 1 a 102 y
    después sólo lo que su «Mapa de carga» da para tu situación; una remisión a algo que no cargaste, en el
    texto de tu acto, la cargás.
    En la cabecera de tu folio declarás la fila «Secciones de Mesa-De-Expertos-A-Pedido 2.0 leídas» y, si
    cargaste los otros dos documentos, su alias y su versión.
    Tope: 5 hallazgos. Declarás hasta tres ítems de «lo que revisé y está bien».
    Escribís tu informe, verbatim, en <carpeta-del-caso>/despacho/comision-seguridad.md; quien preside
    cuenta los folios, no los transcribe.
```

La carta se archiva en `evidencia/` antes de despachar (§2.1 paso 2; `Expediente-Rules.md` §3.5). La
versión 1 era igual sin el segundo literal, sin F7 y sin RD-2.

### 1.5 Corrección del objetivo a mitad del encargo (§0 renglón 2; §2.1 paso 2)

```text
    PEDIDO (literal, 2), llegado con las comisiones ya despachadas (paso 5 en curso):
      «ah, y la API la usa también la app móvil, que no se rompa»
      Quién: Product Owner. Canal: la misma conversación. Fecha-hora: 2026-10-23T{{hh:mm}}-03:00.
      Huella: c9dc9bde0beffe2a3db83cae54f4d5b9019eb694f4aebb91798a2d15d97150d4
    Clasificación del origen (Entorno-De-Ejecucion-Del-Agente §2.1): pedido de quien pidió → se obedece.
    Rehacer el ENUNCIADO:
      F7 «la API la usa también la app móvil»  → dato: otro emisor sobre el mismo receptor (sujeto nuevo).
      F8 «que no se rompa»                     → requisito (RD-2). Dos lecturas: (a) la app móvil sigue
           funcionando como hoy contra la API; (b) además hay que verificar y arreglar la app si hoy falla.
           Se toma (a), la que menos agrega. (b) sale marcada como agregado a quien pidió.
      Nota: F8 es la ÚNICA vía legítima para tratar como fijo un comportamiento actual —el de la app—:
      ahora tiene literal de quien pidió (§3.3, «Comportamiento no es restricción»). Antes de F8, «no
      romper la app» habría sido un agregado.
    Turno siguiente a quien pidió (una línea por cada lado):
      Objetivo vigente:   corregir el 401 del alta por la API sin cambiar el login web.
      Objetivo corregido: corregir el 401 del alta por la API sin cambiar el login web y sin que deje de
                          funcionar lo que la app móvil hace hoy contra la API [F7, F8 lectura a].
    Detención: el encargo se detiene antes de su próxima fase irreversible (el merge del arreglo; no
      había ninguna en curso) y se relanza.
    Relanzar: vuelven a salir todas las cartas de comisión (todas llevan el objetivo, que cambió), como
      versión 2; los informes que ya llegaron se conservan como corrida descartada con su constancia
      (Expediente-Rules §3.4), fuera de la cuenta del paso 10. La señal nueva (Interfaz externa) entra con
      el relanzamiento (ver M-5).
    Tabla diferencial: suma una fila «App móvil | app | [a medir] | [a medir] | … | resultado hoy [a medir]»;
      la corrección se compara con la referencia también en esa fila: la diferencia es vacía o se declara.
    Asiento: folio `providencia` de quien preside, con el testimonio del literal 2 (§2.3), no `presentacion`.
    Agregados que salen marcados a quien pidió (no se despachan): aceptar en el alta los dos esquemas
      «para compatibilidad», una lista de formas de credencial reconocidas, sostener versiones viejas de la
      app más allá de la publicada hoy, lectura (b) de F6 y de F8.
```

### 1.6 Ficha de excepción, camino de compromiso (paso 5 y 6 bis), ilustrativos

Ninguna ficha nace del caso por sí sola: hace falta que una comisión sostenga con E1 o E2 que cumplir una
convención que rige es imposible. La que sigue es **ilustrativa y condicionada** a una medición que en
papel no se puede hacer; mientras no se haga, la ficha queda **«sin admitir»** (Excepcion §4, «Una
imposibilidad sin medir»).

```text
    EXCEPCIÓN XC-1
      Conocimiento:           Clean-Architecture-DataManager 1.0 §2 — «Program.cs  el único lugar donde se
                              registran las implementaciones»
      Alternativa de cumplir: registrar el esquema de autenticación de la API en Program.cs, junto al de la web.
      Costo de cumplir:       [a medir] git diff --stat del cambio en Program.cs; y si toca las líneas del
                              login web: git blame -L <rango del login> Program.cs
      Por qué no se cumple:   SÓLO si E2 muestra (Program.cs:<línea>) que el esquema por defecto y la
                              configuración del login web son la misma instrucción, de modo que registrar
                              el de la API exige editarla → choca con RD-1 (E4: restricción dura del contrato).
      Reversibilidad:         volver a registrar en Program.cs: un cambio acotado, sin datos ni contrato publicado.
      Sostiene:               comisión de Seguridad, despacho/comision-seguridad-ficha-1.md
      Aprobó:                 pendiente — sale en el cierre
    Refutación esperada («¿cuánto cuesta realmente cumplir?»): agregar un segundo esquema en una llamada nueva
      de Program.cs, sin editar las líneas del login, cumple las dos cosas → si eso compila y la prueba de
      una variable lo confirma, la ficha es inadmisible por conveniencia y se cumple.

    ANÁLISIS DEL CAMINO DE COMPROMISO — XC-1 (si el refutador la admitiera)
      Sigue rigiendo:      Clean-Architecture-DataManager §2 (capas y dependencias) y §3, salvo el lugar del registro.
      Fuera del documento: la forma de seleccionar el esquema por endpoint; referencia: documentación oficial
                           de la plataforma de autenticación que use el destino.
      Alternativas:        Alt-1 registro en Program.cs con una línea nueva que no edita el login (la más cercana)
                           Alt-2 método de extensión en API/Middleware, invocado con una línea nueva desde Program.cs
                           Alt-3 host separado para la API
        Descartadas antes de ponderar: Alt-1, si E2 prueba que no hay forma de agregarla sin editar la instrucción del login.
      Criterios y pesos (fijados antes de puntuar):
        K-1 Cercanía a cumplir  — peso 3 — fuente: Clean-Architecture-DataManager §2
        K-2 Reversibilidad      — peso 3 — fuente: Cadena-De-Consecuencias §2, paso 4
        K-3 Seguridad de la autenticación — peso 2 — fuente: OWASP Application Security Verification
            Standard (sin apartado: no verificado) — por qué pesa así: el objeto es un 401
        K-4 Mantenibilidad (modularidad) — peso 1 — fuente: ISO/IEC 25010 (sin apartado) — pesa menos: no es el objeto
      Ponderación (0 a 3, en papel sin evidencia por celda: no desempata):
        Alt-2: K-1 2, K-2 3, K-3 2, K-4 3 → 6+9+4+3 = 22    Alt-3: K-1 1, K-2 1, K-3 2, K-4 2 → 3+3+4+2 = 12
      Caminos:
        C-1 (recomendado) Alt-2: el registro sigue invocándose desde Program.cs y no toca el login — reversible.
        Sin C-2: Alt-3 quedó segunda; la pondría primera un peso de K-4 mayor que 13, que no es razonable.
      Mientras se decide: rama de la reversibilidad (restricción dura), C-1 reversible → provisorio, ADR Propuesto.
```

### 1.7 Carpeta del expediente y registro (§2.3, §5.3; `Expediente-Rules.md` §3)

```text
    SDD/Docs/Audit/Mesa-2026-10-23.md            registro de la mesa (forma de Mesa-Rules §2.2, nueve secciones;
                                                 informes y ficha como secciones) — ver B-2
    SDD/Expedientes/<NNNN>-Alta-De-Socio-Por-Api-Devuelve-401/
    ├── README.md            carátula de seis campos + línea de remisión
    ├── .gitignore           **/evidencia*/**/*.png, *.jpg, *.ndjson; y una línea por ruta para el volcado
    │                        crudo de las peticiones (texto crudo con encabezados de autorización)
    ├── despacho/            rutas de trabajo de cada rol; vacía al cierre
    ├── actuaciones/
    │   ├── 001-presentacion-pedido-del-product-owner.md         testimonio 1
    │   ├── 002-providencia-contrato-de-entrada-y-despacho.md    §5.1 y despacho verificado
    │   ├── 003-providencia-correccion-del-objetivo.md           testimonio 2, objetivo vigente → corregido
    │   ├── 004-constancia-corrida-descartada.md                 los informes de la versión 1 de las cartas
    │   ├── 005-constancia-registro-de-mesa.md                   SDD/Docs/Audit/Mesa-2026-10-23.md@<commit>
    │   ├── 006-resolucion-veredicto-plan-y-cierre.md            plan, fila Reintegra, cierre, lote
    │   └── 007-constancia-aplicacion-y-verificacion.md          rojo antes / verde después, reintegración
    └── evidencia/
        ├── 001-pedido-literal-1.txt ; 002-pedido-literal-2.txt  (ver B-1)
        ├── 003-barrido-de-convenciones.txt
        ├── 004-… a 0NN-…  las cartas, versión 1 y versión 2, una por rol
        └── 0NN-prueba-de-una-variable.txt  extracto redactado; el volcado crudo, local con su huella
```

### 1.8 Cadena de consecuencias de la primera salida (Cadena §5)

```text
    CADENA DE CONSECUENCIAS — cómo se corrige el 401
      Opción 1: igualar la columna que cambia a la del caso que funciona, en el lado que la tabla señale.
        Dónde cae: el emisor o el receptor de la API; la app móvil si comparte esa columna.
        Cuánto pesa ahí: [a medir] diff del cambio + prueba en rojo/verde de los tres caminos.
        Qué pierde la otra: nada que el pedido nombre.  Reversible: sí, un cambio acotado.
      Opción 2: que el endpoint de alta acepte los dos esquemas (agregado: nadie lo pidió).
        Dónde cae: la superficie de ataque del endpoint y el contrato con la app.
        Cuánto pesa ahí: [a medir]. Qué pierde la otra: compatibilidad con un emisor que nadie nombró.
        Reversible: sí técnicamente; no si la app empieza a depender del segundo esquema.
      Recomendación: Opción 1; la 2 sale a quien pidió como agregado marcado.
      Obstáculos: la medición con la cuenta real, pedida en una línea al PO en el turno de 1.1.
```

### 1.9 Campos de cierre (paso 10; `Mesa-Rules.md` §6.7; Excepcion §5.2)

```text
    CIERRE DE MESA — Biblioteca, 2026-10-23
      PANEL
        Convocados:   Requisitos, Verificación, Lector sin contexto, Seguridad, Arquitectura, Interfaz externa: {{procedentes}}
        Descartados:  los de 1.3, con su motivo
        Ad hoc:       ninguno.  Postergados: ninguno.  Aporte nulo: {{tras dos ciclos}}
      HALLAZGOS   Detectados {{n}} Procedentes {{n}} Con parche {{n}} Descartados por C {{n}}
      COMPUERTA (§10.0)  Resultado: no aplica tal cual (el objeto es código): base mecánica = reproducción del
                         defecto y medición del caso que funciona (§2.2). No mirado: producción, cuenta real.
      ENTREGA
        Parches: {{n}}, en la capa de origen (emisor o receptor de la API)
        Deuda declarada: {{n}}.  Capas a revalidar: pruebas de la app móvil contra la API.
        Escaladas: los agregados de 1.5, en lote.
        Reintegra: «no altera el compromiso» — observable: el alta por la API vuelve a responder lo que el CU
                   ya promete; si quien pidió acepta un agregado (Opción 2), pasa a «compromiso» con fila de
                   alcance PROPUESTA (Root-Rules §14.2), que no se asienta por silencio.
      FOLIOS
        Informes (6 convocados + refutador + análisis + perito + 2 del jurado): 11 — Escritos: {{n}} — {{rutas}}
        Además foliados, fuera de la cuenta: presentación, dos providencias, ficha XC-1, corrida descartada, plan, cierre
      EXCEPCIONES A CONOCIMIENTOS
        XC-1: Clean-Architecture-DataManager §2 → registro por extensión invocada desde Program.cs — ficha {{folio}}
              — contradicción: {{E2 Program.cs:<línea> contra RD-1 | sin medir}}
          Refuta: {{folio}} — Analiza: {{folio}} — Veredicto: {{folio}}
          Estado: sin admitir: falta la medición `git blame -L <rango> Program.cs`, a cargo de la comisión
                  (no falta acceso: si falta, se pide a quien lo tenga)
          Caminos (análisis {{folio}}): C-1 Alt-2, 22, reversible — sin C-2: Alt-3, K-4 > 13
            — criterios: OWASP ASVS, ISO/IEC 25010
          ¿Validás C-1 o pedís otro camino? SI NO RESPONDÉS: se sigue con C-1, provisorio y sin aprobar, hasta tu
          respuesta; nada irreversible (ni el merge) se apoya en él; el ADR queda `Propuesto` hasta tu respuesta
          Origen del hecho: de la corrida — se apoya en el pedido (folio de presentación), que no está en la base
            La autocorrección no alcanza porque reabre una decisión cerrada (la convención que rige); es
            arbitraje de quien pidió
          Aprobó: pendiente
        No admitidas: —   Propuestas de cambio de convención: (ninguna)
      PREGUNTAS (lote, cada una con SI NO RESPONDÉS y origen del hecho): los agregados de 1.5;
        lectura (b) de F6 y de F8 → SI NO RESPONDÉS: rige la lectura (a).
      BARRIDO S2: git grep -nIiE 'authorization:|bearer |cookie:|set-cookie|password' -- <carpeta-del-caso>
        → los encabezados de las peticiones se redactan en el extracto; el volcado crudo queda local.
      CIERRE: por decisión y no por criterio — una sola ronda; abierto: {{lista}}.
        Regla de la clase cumplida sólo si la prueba que cubre el 401 se vio fallar y después pasar, en los
        tres caminos (web, API, app móvil).
```

## 2. Reporte

### 2.1 Referencias rotas

Probé con `ls` cada archivo citado y con un script cada par «archivo § sección» de los tres documentos y
del índice contra los encabezados del árbol: todos resuelven, y también las anclas de línea de las
tablas «Dependencias». Lo único que no resuelve en el workspace limpio:

- **R-1.** `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/`: lo citan
  `Conocimiento/Index-Knowledge.md:57`, `Knowledge-Mesa-De-Expertos-A-Pedido.md:532`, `:534`, `:549`,
  `:551`, `:560`, `Knowledge-Excepcion-A-Un-Conocimiento.md:317`, `:318`, `:334`, `:340` y
  `Knowledge-Cadena-De-Consecuencias.md:144`, `:154`, `:160`. No resuelve porque la preparación retiró la
  carpeta, y los tres documentos declaran que ninguna de esas citas hace falta para aplicarlos (`:551`,
  `Excepcion:334`, `Cadena:154`). **No bloquea.**
- **R-2.** `Expedientes/0004-…/evidencia/ev-06-cotejo-de-las-copias-del-fork.diff`
  (`Knowledge-Mesa-De-Expertos-A-Pedido.md:549`): no se puede verificar por el mismo motivo. Además, el
  nombre `ev-06-` choca con `Expediente-Rules.md:164-166`, que dice que `ev-`/`EV-` colisiona con la
  familia `EV` de D9 y que la evidencia se nombra `NNN-<slug>`. O el archivo no existe con ese nombre, o
  existe y viola A9/§3.1.
- **R-3.** `Mesa-Rules.md:387` cita `Expedientes/0003-…`, folio 019 §1 R-E: la ruta va con puntos
  suspensivos y no es literal. Resuelve a mano (la fila `R-E` está en
  `Expedientes/0003-…/actuaciones/019-…md:24`), pero A10 no la ve.

### 2.2 Bloqueantes

- **B-1. La huella del testimonio no se puede comprobar como dice el documento.**
  `Knowledge-Mesa-De-Expertos-A-Pedido.md:259` manda comprobarla «con `sha256sum` sobre la pieza de
  `evidencia/` que guarda ese texto». Pero `Expediente-Rules.md:230` (§3.4) dice que toda pieza «abre
  con tres líneas» (`Método`, `Base`, `Quién`), y A9 (`:403-406`) lo exige para `.txt` y `.md`. Entonces
  `sha256sum` de la pieza incluye esas tres líneas y nunca da la huella del bloque (`Expediente-Rules.md:206-209`, punto 2).
  Para seguir tuve que adivinar entre `tail -n +4 <pieza> | sha256sum`, o guardar el literal con una
  extensión que A9 no lista y ponerle un `.txt` al lado. Ninguna de las dos está escrita. Las huellas de
  1.1 y 1.5 las calculé sobre el texto solo.
- **B-2. No está dicho dónde va el registro de una mesa a pedido que no cumple `Mesa-Rules.md` §0.0,
  cuando corre en un destino.** `:188` dice que en un destino los informes son «secciones del registro
  único de `Mesa-Rules.md` §2.1». `:119-122` dice que si no se cumple §0.0 esa regla «se usa como
  forma». `:194-197` sólo dice adónde va el registro cuando §0.0 sí se cumple, y adónde va la carpeta
  cuando no se cumple `Expediente-Rules.md` §1. Además, `Expediente-Rules.md:60` excluye el caso entero
  que es «una mesa que ya deja su registro en `SDD/Docs/Audit/`». Tuve que adivinar: un registro
  `SDD/Docs/Audit/Mesa-<fecha>.md` con la forma de §2.2, más un expediente que lo folia por `ruta@commit`
  (1.7). La otra lectura posible eran folios `informe` dentro del expediente, como en el framework.

### 2.3 Menores

- **M-1. ¿Toda mesa a pedido abre expediente?** Todo pedido es un testimonio del Product Owner que
  funda una decisión, así que la rama 2 de `Expediente-Rules.md:55-56` se cumpliría siempre. Eso choca
  con I1 (`:449`, «un expediente por cada mesa… es el anti-patrón») y con
  `Knowledge-Mesa-De-Expertos-A-Pedido.md:196`, que admite mesas sin expediente. Lo resolví con la
  rama 1: hay agregados que dependen de una respuesta del PO que no llega en esta corrida.
- **M-2. Sólo la carta de comisión tiene esqueleto.** `:131` dice que toda carta lleva la norma, las
  secciones leídas y la lectura P0–P3: la del refutador, el jurado, el perito, el análisis de decisiones,
  el usuario estándar y quien aplica. Pero §5.2 da sólo la de comisión, y las demás se arman por
  analogía, sin saber qué cláusulas de §5.2 llevan (objetivo, BLOQUEO, tope).
- **M-3. Dos listas distintas de qué es irreversible.** `:36` dice «merge, etiqueta, publicación».
  `Excepcion:108` dice «borrar o migrar datos…, publicar un contrato o desplegar a producción». No queda
  claro si un camino provisorio de una excepción permite el merge. Tomé la más estricta (1.9).
- **M-4. En la clase «defecto», la señal no tiene corpus donde ubicarse.** `Mesa-Rules.md:284-285` exige
  una «señal observable en el corpus, citada con su ubicación», pero en esta clase el objeto es código y
  la señal sale del pedido. Ubiqué las señales en las frases del pedido, y ningún texto dice que eso
  valga. Algo parecido pasa con el núcleo permanente (`Mesa-Rules.md:269-271`), que está redactado sobre
  «afirmaciones del corpus».
- **M-5. El relanzamiento no dice qué hacer con la composición.** `:131` separa el mensaje que cambia
  el objetivo (se relanza) del que «sólo trae una señal nueva» (ronda en caliente). El segundo mensaje
  hace las dos cosas. No está dicho si el jurado vuelve a votar la composición (paso 4), ni cómo cuenta
  ese folio de composición frente a «los dos del jurado» (`:140`; `Excepcion:188-191`).
- **M-6. ¿Dónde vive la corrida descartada en un destino?** `:131` y `Expediente-Rules.md:234` mandan
  conservarla con una constancia. Pero si en un destino los informes son secciones de `Audit/` (`:188`),
  no queda claro si esa corrida es otra sección del registro, o va al expediente.
- **M-7. Dos reglas tiran del eje de la cuenta en sentidos opuestos.** «Datos reales» (`:305`) obliga a
  mover el eje de la cuenta, que quien pidió fijó con «la misma cuenta». A la vez, `:276` dice que «los
  ejes que fijó quien pidió no se mueven». Lo resuelve la frase «declara el eje que no quedó fijo»
  (`:305`), pero §3.3 no remite a esa salvedad.
- **M-8. «P0»…«P5» se usan con dos sentidos.** `Mesa-Rules.md:409-505` llama P0 a P5 a las fases del
  ciclo (§6.2 a §6.7), y la misma regla y el conocimiento (`:263`, `:340-345`) usan P0–P3 como niveles
  de severidad. En una carta, «Mesa-Rules §6.2 P0» se puede leer como severidad.
- **M-9. La clase del cambio de un arreglo de defecto no está prevista.** `Root-Rules.md:869-878` no
  tiene clase para un arreglo que restituye lo prometido. Hay que inferir «no altera el compromiso» con
  su observable (`:918-920`), aunque el comportamiento observable cambie de 401 a éxito.
- **M-10. «Quien la convocó» tiene dos lecturas.** `:303` admite dos: el PO, que pidió, o el
  presidente, que «recibe el pedido» (`:109`). Tomé el presidente, porque §4 dice «en el lugar del
  orquestador».
- **M-11. A4 y A8 leen los cercos de código como texto del folio.** `Expediente-Rules.md:371-374` y
  `:395-400` cuentan líneas `^| Tipo |` y cercos `testimonio` sin mirar los bloques de código. Un folio
  que ilustra cabeceras o testimonios (como éste, o una carta archivada que cite un folio) falla
  A4 o A8 si no les pone sangría. Ningún texto lo advierte.
- **M-12. El barrido de §3.4 deja dudas al aplicarlo.** El comando de `:326` funciona, pero lo que
  imprime (el `Tema` entero) es largo para un contrato de entrada. Además, la regla no dice cómo se
  asienta un conocimiento cuya condición depende del stack del destino (aquí,
  Clean-Architecture-DataManager): ¿rige, se descarta o queda condicional?
- **M-13. La línea fin de §0 hay que calcularla a mano.** El valor de `{{FIN DE §0}}` (`:373`) no está
  escrito: es 102 y lo saqué con `grep -n '^## 1\.'`. Es poco trabajo, pero cada presidente lo
  recalcula.

### 2.4 Lo que funcionó sin ayuda

El camino `README.md` → índice → documento se encuentra en dos saltos. Los seis renglones de §0
alcanzaron para no omitir el enunciado, el objetivo con origen, la tabla diferencial, la corrección del
objetivo y el bloqueo. El caso del 401 que es objeto y no bloqueo está dicho de forma explícita
(`:242`). El filtro «Comportamiento no es restricción» dejó ver que, antes del segundo mensaje, «no
romper la app» habría sido un agregado, y que después tiene literal. El mapa de carga y la cuenta de
folios cierran sin ambigüedad. No encontré contradicciones entre los tres documentos de conocimiento.

Sigue: incorporar B-1, B-2 y los menores al análisis del expediente · presidencia del expediente
