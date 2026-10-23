| Campo | Valor |
|---|---|
| Tipo | informe |
| Fecha | 2026-10-23 |
| Autor | Reproductor a ciegas A |
| Corrige | — |

# Reproducción a ciegas — defecto con caso que funciona y objetivo corregido a mitad del encargo

**Secciones de Mesa-De-Expertos-A-Pedido 2.0 leídas:** el documento entero (la fila «Presidís una mesa»
del mapa de carga pide §1 a §8; §9 y §10 se leyeron para probar las referencias). Además, enteros:
`Excepcion-A-Un-Conocimiento` 1.0 y `Cadena-De-Consecuencias` 1.0. De la norma: `Mesa-Rules.md` 1.5
§0.0, §1 a §7.1; `Expediente-Rules.md` 1.1 §1 a §3.5; `Root-Rules.md` 8.9 §14.1 a §14.4;
`Master-Prompt.md` 8.21 §6 (precedencia del conocimiento) y las líneas ancladas por las dependencias.

**Condiciones de la prueba.** Workspace limpio (`limpio-A/IA.SDD/`, copia del árbol sin `.git` y sin
`Expedientes/0004-*`). No se leyó nada fuera de él; la única escritura fuera es este folio. Entrada como
agente nuevo: `README.md` → `Conocimiento/Index-Knowledge.md` → fila de `Mesa-De-Expertos-A-Pedido`
(`Index-Knowledge.md:41`). No hay proyecto real: todo lo que exigiría medir va como «por medir» con su
comando, y lo que exigiría un dato del destino va como supuesto declarado.

Las rutas del destino se escriben en forma calificada (`Biblioteca/SDD/...`): el destino es imaginario y
una ruta local a un expediente que no existe haría fallar A10 en este expediente.

---

## Parte I — La mesa, en papel

### 1. Supuestos declarados (lo que el caso no da y el documento necesita)

| # | Supuesto | Por qué hace falta |
| --- | --- | --- |
| S-1 | Biblioteca es un destino SDD con `SDD/Docs/` generado, una unidad de entrega `rest-api` (la API), una `web-monolith` (la web) y una `mobile-app-maui` (la app móvil) | §2.3 y `Expediente-Rules.md` §2 deciden dónde vive el registro según sea destino o framework |
| S-2 | El destino no declara almacén de evidencia | §1, fila «Supuestos» (`Knowledge-Mesa-De-Expertos-A-Pedido.md:114`); decide el `.gitignore` de §5.3 |
| S-3 | No hay expedientes previos en el destino: el número es `0001` | `Expediente-Rules.md` §3.1 |
| S-4 | La mesa **no** cumple las tres cláusulas de `Mesa-Rules.md` §0.0 (ver bloqueante B-3): se usa su mecánica como forma y las diferencias de §2.2 | `Knowledge-Mesa-De-Expertos-A-Pedido.md:116-120` |
| S-5 | Canal de los dos mensajes: conversación con el agente; fecha-hora: `{{2026-10-23 hh:mm UTC−3}}`, no expuesta | `Expediente-Rules.md` §3.3 |

### 2. Contrato de entrada (§5.1) — folio `providencia`

```text
PEDIDO (literal): «en el proyecto Biblioteca, el alta de un socio por la API devuelve 401 y por la pantalla
  web funciona, con la misma cuenta; hacé una mesa de expertos que encuentre por qué y lo corrija, y que no
  toquen el login de la web» — Product Owner, 2026-10-23, conversación.
  Huella (SHA-256 del texto con LF final): 3fa4a93b39bd46a424448fb3a4efc8d86561f8f6b507a60279556205383a3070

ENUNCIADO (§3.1):
  F1 «el alta de un socio por la API devuelve 401» → DATO (afirmación sobre el estado: ancla C hasta
     reproducirlo, Expediente-Rules §3.3) e INCÓGNITA implícita (¿por qué?).
     Sujeto: el emisor «la API» no está identificado —qué cliente, qué encabezado, qué ambiente, qué
     versión desplegada—. Medir otro cliente no contesta la pregunta, la acota, y se dice.
  F2 «y por la pantalla web funciona, con la misma cuenta» → DATO; es el CASO QUE FUNCIONA (§3.3).
     Sujeto: la pantalla web del mismo ambiente, misma cuenta. Ancla C hasta medirlo.
  F3 «hacé una mesa de expertos que encuentre por qué» → REQUISITO: causa identificada.
  F4 «y lo corrija» → REQUISITO: corrección aplicada. Designa quién aplica (ver B-1).
  F5 «y que no toquen el login de la web» → EXCLUSIÓN. Dos lecturas: (a) no se modifica el código ni la
     configuración del flujo de inicio de sesión web; (b) no cambia el comportamiento observable del login
     web, aunque se toque código compartido. Se toma (a), la que menos agrega a lo que la mesa puede
     mover, declarada. Si la causa vive en código compartido con el login web, eso sale a quien pidió.
  Origen de cada condición: F1–F5 del pedido. Ninguna condición sale del comportamiento actual.
  Caso que funciona: la web (F2). Tabla diferencial: sección 3 de este folio.
  Agregados detectados y no despachados: «en todos los ambientes», «sin cambiar el cliente de la API»,
     «manteniendo el esquema de autenticación actual de la API». Ninguno tiene frase del pedido.

CLASE DE OBJETO: investigación de un defecto (§2.2). Descarte: «interfaz en ejecución», porque el objeto
  es la respuesta de la API; la web entra como referencia medida, no como superficie evaluada.
OBJETO: la API de Biblioteca, operación de alta de socio, en {{commit desplegado en el ambiente donde se
  observó}}; referencia: el flujo web de alta, mismo ambiente.
OBJETIVO (vigente, v1): que el alta de un socio por la API, con la misma cuenta con que funciona por la web,
  deje de devolver 401 [F1, F4], con la causa identificada [F3], sin modificar el login de la web [F5].
PREGUNTAS DEL CASO:
  Q1 ¿Qué difiere entre el camino web y el camino API para que el mismo receptor rechace la misma cuenta?
  Q2 ¿Cuál es el cambio mínimo que iguala esa diferencia sin tocar el login web?
  Q3 ¿Qué prueba cubre el defecto, vista fallar antes y pasar después?
LECTURA P0–P3:
  P0 viola una restricción dura (toca el login web) o hace imposible el objetivo (la API sigue en 401).
  P1 la corrección saldría con retrabajo o con lecturas divergentes entre implementadores.
  P2 pérdida acotada (un mensaje de error, un registro de diagnóstico).
  P3 claridad.
RESTRICCIONES DURAS: F5 (no tocar el login web). Ninguna ficha de excepción entra acá
  (Excepcion-A-Un-Conocimiento §0).
DECISIONES CERRADAS: las CONVENCIONES QUE RIGEN de abajo; los ADR `Aceptado` de 05 de Biblioteca sobre
  autenticación {{por leer: ls Biblioteca/SDD/Docs/05-Arquitectura-Tecnica/Adrs/}}, verificando que cada uno
  mande lo que se le atribuye para ese componente (§3.3, «Comportamiento no es restricción»).
CONVENCIONES QUE RIGEN (§3.4):
  Índice:   Conocimiento/Index-Knowledge.md (supuesto: el intake de Biblioteca no declara otro)
  Barrido:  grep '^| `Knowledge-' Conocimiento/Index-Knowledge.md | cut -d'|' -f3,5,11
  Salida:   nueve filas, todas `Vigente` (ver Parte II, verificación V-4)
  Versión:  grep -m1 '^\*\*Versión' Conocimiento/Knowledge-<alias>.md
  Rigen:    Mesa-De-Expertos-A-Pedido 2.0 (entero); Cadena-De-Consecuencias 1.0 §2, §3;
            Excepcion-A-Un-Conocimiento 1.0 (si aparece una ficha);
            Entorno-De-Ejecucion-Del-Agente 1.0 (la cuenta del Product Owner es una credencial que puede
            llegar por la conversación: fila «Credencial compartida en la conversación», :164);
            Conformacion-Pull-Request-Manual 1.0 §3 (la corrección se entrega como unidad de trabajo;
            el agente no fusiona) — Automatico 1.0 sólo si la delegación del merge está asentada en el destino;
            Clean-Architecture-DataManager 1.0 §2, §3 sólo si la API es .NET sobre SQL Server
            ({{por medir: cat Biblioteca/SDD/Intake/PRODUCT-INTAKE.md}}).
  Descartes: Template-HTML-SDD-Default y Template-Blazor-Interactive-Server-SDD-Default: su Tema es la
            maqueta y la superficie, y la mesa no toca la web (F5).
FUERA DE ALCANCE: el login web (F5); el resto de las operaciones de la API.
MEDIOS: un cliente HTTP con salida de encabezados (curl -v) contra un ambiente no productivo; las
  herramientas de red del navegador sobre la web; la historia del código (git log -S, git blame).
  Sin observar: producción; la app móvil (hasta la corrección del objetivo).
EXPEDIENTE: Biblioteca/SDD/Expedientes/0001-Alta-De-Socio-Por-Api-Devuelve-401/
QUIÉN APLICA: quien el pedido designa (F4); ver B-1 sobre si puede ser la mesa.
PRESUPUESTO: 5 hallazgos por comisión; una ronda.
DESPACHO VERIFICADO: cada dato de sección con su comando y salida (Parte II, V-1 a V-6); los datos del
  destino (F1, F2) viajan como ancla C, no como hechos.
```

**Una pregunta de una línea, en el momento** (obstáculo, `Cadena-De-Consecuencias` §3, y bloqueo con la
forma del pedido, §3.1 fila del bloqueo): el pedido no muestra la forma de la llamada que dio 401.

```text
¿Con qué cliente, qué ambiente y qué encabezado de autorización hiciste el alta por la API?
SI NO RESPONDÉS: se reproduce con el cliente que documenta 11/ de la API, se declara que mide otro
emisor y que la respuesta acota F1 sin contestarla.
```

Y la cuenta: «la misma cuenta» es de una persona real, y un alta crea un socio con datos personales. Rige
§4, «Datos reales» (`Knowledge-Mesa-De-Expertos-A-Pedido.md:293`): la reproducción usa un socio sembrado
por la propia comisión, en un ambiente no productivo, y la credencial se usa sólo en memoria de proceso
(`Entorno-De-Ejecucion-Del-Agente` :164). Ver menor M-9.

### 3. Tabla diferencial del caso que funciona (§3.3)

Una fila por camino, una columna por cada cosa que pasa entre la entrada y el resultado. Ancla por
celda: todas «por medir», con el comando.

| Camino | Emisor | Cómo obtiene la credencial | Cómo viaja | Esquema que la valida en el receptor | Política del endpoint de alta | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| Web (funciona) | navegador | login web → {{cookie de sesión / token}} | {{Cookie: … / Authorization: …}} — herramientas de red | {{esquema por defecto}} — `grep -rn "AddAuthentication\|AddScheme" <api>` | {{atributo / política}} — `grep -rn "Authorize" <controlador de socios>` | 2xx — C |
| API (401) | {{cliente del PO}} | {{token emitido por …}} | `curl -v -X POST …/socios -H "Authorization: …"` | ídem | ídem | 401 — C |

**Ejes fijos que el experimento no mueve**: la cuenta (F2), el login web (F5), el receptor desplegado.
**Columna que cambia**: la que la medición marque. **Primera salida evaluada**: igualar esa columna a la de
la web, del lado del emisor o de la API, nunca del login web. Antes de tratar una línea como invariante:
`git log -S '<línea que difiere>' -- <ruta>` y `git blame -L <n>,<n> <ruta>`; si antes tenía la forma del
caso que funciona, volver a ella es alternativa obligatoria. **Peritaje** (§3.3, «El peritaje cambia una
sola variable»): dos corridas idénticas salvo esa columna, con evidencia de las dos.

### 4. Composición del panel (§2.1 paso 4; `Mesa-Rules.md` §5 y §6.2) — la vota el jurado

| Rol | Tipo | Señal y ubicación | Decisión propuesta |
| --- | --- | --- | --- |
| Requisitos | núcleo | — | convocar |
| Verificación | núcleo | — | convocar (Q3, la prueba en rojo) |
| Lector sin contexto | núcleo | — | convocar |
| Refutador | núcleo | — | convocar, último |
| Seguridad | variable | autenticación: el 401 (F1) y `{{ruta de la configuración de autenticación}}` | convocar |
| Arquitectura | variable | más de una unidad de entrega (S-1) | convocar |
| Operación y entrega | variable | ambientes: un 401 depende de la configuración por ambiente `{{ruta de appsettings por ambiente}}` | convocar |
| Datos y dominio | variable | la entidad socio | descartar: la petición no llega a persistir; el defecto es anterior |
| Cumplimiento | variable | datos personales del socio | descartar: no se cambia su tratamiento; queda cubierto por «Datos reales» |
| Uso y accesibilidad | variable | la web | descartar: F5 la deja fuera |
| Formal, Concurrencia, Rendimiento, Trazabilidad | variable | sin señal | descartar |
| Perito | de la clase | §2.2, investigación de defecto | diseña el experimento de una variable; no vota |

Tres variables de un techo de cinco. El registro de convocatoria lleva los descartes con su motivo
(`Mesa-Rules.md` §2.2 ítem 2).

### 5. Carta de despacho completa — comisión de Seguridad (§5.2)

Se archiva en `evidencia/` antes de despachar (§2.1 paso 2; `Expediente-Rules.md` §3.5).

```text
Método: carta de despacho, texto verbatim
Base: {{commit corto del destino al abrir}}
Quién: presidente de la mesa

Sos la COMISIÓN DE SEGURIDAD en una mesa de expertos sobre la operación de alta de socio de la API de
Biblioteca, {{commit}}. Tu encargo es refutar, no verificar.
Trabajás a ciegas: no vas a ver el informe de ninguna otra comisión.
Clase de objeto: investigación de un defecto.

Caso, tal como lo presentó quien pidió la mesa: «en el proyecto Biblioteca, el alta de un socio por la API
devuelve 401 y por la pantalla web funciona, con la misma cuenta; hacé una mesa de expertos que encuentre
por qué y lo corrija, y que no toquen el login de la web»
Objetivo, con el origen de cada cláusula: que el alta de un socio por la API, con la misma cuenta con que
funciona por la web, deje de devolver 401 [«devuelve 401», «lo corrija»], con la causa identificada
[«que encuentre por qué»], sin modificar el login de la web [«que no toquen el login de la web»]. Lo que da
por fijo sin origen es tu primer hallazgo.
Si falla un paso que el pedido prescribe, no lo rodeás: devolvés «BLOQUEO: paso — salida — prueba de una
variable». El 401 de la API es el objeto de la mesa, no un paso fallido: reproducirlo es tu primer dato.

Tu competencia es cómo se emite, transporta y valida la credencial en cada camino (web y API): esquemas
de autenticación, encabezados, cookies, emisor, audiencia, vencimiento y políticas de autorización del
endpoint. No te corresponde la configuración por ambiente ni la topología entre unidades de entrega: si
encontrás algo ahí, emitís una solicitud de convocatoria con la señal y su ubicación, no un hallazgo.

Por cada hallazgo: nivel P0–P3 (con la lectura para este caso: P0 viola una restricción dura —toca el
login web— o hace imposible el objetivo; P1 retrabajo o lecturas divergentes; P2 pérdida acotada;
P3 claridad), clase de ancla E1–E4 o C con su cita o su comando y salida (la escala está en
SDD/Devs/Rules/Mesa-Rules.md §6.1), impacto si no se corrige y dirección de la corrección, no su redacción.
Llenás tu fila de la tabla diferencial con ancla por celda y marcás la columna que cambia; la primera
dirección que evaluás es igualarla a la del camino web.

Rigen estas convenciones: Mesa-De-Expertos-A-Pedido 2.0; Cadena-De-Consecuencias 1.0 §2 y §3;
Entorno-De-Ejecucion-Del-Agente 1.0 (credencial compartida: sólo en memoria de proceso);
Conformacion-Pull-Request-Manual 1.0 §3. Toda acción sobre el sistema vivo, sólo con datos que vos
sembraste (Mesa-De-Expertos-A-Pedido §4, «Datos reales»). Si proponés no seguir alguna, cargás entero
Conocimiento/Knowledge-Excepcion-A-Un-Conocimiento.md y escribís su ficha, con la alternativa de cumplir,
una por decisión, en Biblioteca/SDD/Expedientes/0001-Alta-De-Socio-Por-Api-Devuelve-401/fichas-propuestas/:
quien preside la incorpora como folio propio.
«Más simple» o «no aplica del todo» no es motivo. Antes de recomendar entre opciones, corrés
Conocimiento/Knowledge-Cadena-De-Consecuencias.md §2.

Norma: Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md 2.0. Leé primero las líneas 1 a 101 y después
sólo lo que su «Mapa de carga» da para tu situación; una remisión a algo que no cargaste, en el texto de tu
acto, la cargás.
En la cabecera de tu folio declarás la fila «Secciones de Mesa-De-Expertos-A-Pedido 2.0 leídas».
Tope: 5 hallazgos. Declarás hasta tres ítems de «lo que revisé y está bien».
Escribís tu informe, verbatim, en {{RUTA DEL FOLIO: ver bloqueante B-2}}; quien preside cuenta los folios,
no los transcribe.
```

La carpeta de fichas propuestas es un supuesto: §5.2 deja `{{CARPETA DE FICHAS}}` como parámetro y no
dice dónde va; la ficha se incorpora después como folio de la serie (`Excepcion-A-Un-Conocimiento` §5.1:
«Ninguna ruta de ficha se asigna de antemano»).

### 6. Corrección del objetivo a mitad del encargo (§0 renglón 2; §2.1 paso 2)

Llega, con las comisiones ya despachadas:

```text
«ah, y la API la usa también la app móvil, que no se rompa» — Product Owner, 2026-10-23, conversación.
Huella: c9dc9bde0beffe2a3db83cae54f4d5b9019eb694f4aebb91798a2d15d97150d4
```

**Toca el objetivo** (agrega un requisito) **y lo que se daba por fijo** (la API tenía un solo consumidor
en el enunciado). Por eso se rehace el enunciado y el turno siguiente muestra el cambio:

```text
ENUNCIADO, frase nueva:
  F6 «la API la usa también la app móvil» → DATO (ancla C hasta medir que la app llama a esta operación).
  F7 «que no se rompa» → REQUISITO. Sujeto: la app móvil publicada que usa la API. Dos lecturas: (a) las
     llamadas que la versión publicada de la app hace hoy siguen funcionando sin cambiar la app; (b) la app
     puede cambiar junto con la API. Se toma (a): (b) agrega una entrega de la app que nadie pidió.
  Efecto en el caso que funciona: si la app hace altas hoy con éxito, es un SEGUNDO caso que funciona, y
  entra como fila de la tabla diferencial (abajo).

OBJETIVO VIGENTE (v1)  → que el alta de un socio por la API, con la misma cuenta con que funciona por la
                         web, deje de devolver 401 [F1, F4], con la causa identificada [F3], sin modificar
                         el login de la web [F5].
OBJETIVO CORREGIDO (v2) → lo mismo, y sin que dejen de funcionar las llamadas que la app móvil publicada
                         hace hoy a la API [F6, F7].
```

Fila nueva de la tabla diferencial:

| Camino | Emisor | Cómo obtiene la credencial | Cómo viaja | Esquema que la valida | Política del endpoint | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| App móvil | app publicada {{versión}} | {{flujo de la app}} | {{Authorization: …}} — por medir sobre tráfico de un emulador con cuenta sembrada | ídem | ídem | {{¿2xx?}} — C |

**Qué se hace con el encargo.** Ninguna fase irreversible (merge, etiqueta, publicación) había corrido;
la siguiente es el pull request de la corrección, y el encargo se detiene antes de él. Las cartas de la v1
se reemplazan por cartas con el objetivo v2 y se relanza el despacho; los informes que ya hubieran
llegado bajo la v1 se conservan como corrida descartada, con una `constancia` que dice por qué
(`Expediente-Rules.md` §3.4). La señal nueva —«API consumida por otra unidad de entrega», con su
ubicación en F6— la vota el jurado para **Interfaz externa** (`Mesa-Rules.md` §5.2: «API pública,
contrato con terceros, retrocompatibilidad»); con ella son cuatro variables, bajo el techo. Ver menor M-4.

**Efecto en la primera salida.** Igualar la columna que cambia «del lado de la API» (por ejemplo, que el
receptor acepte lo que manda el cliente que da 401) puede alterar lo que valida para la app: esa
alternativa ahora tiene que mostrar con E1 que la fila móvil sigue en 2xx. Igualar «del lado del emisor»
no toca ni la web ni la app, y sigue siendo la primera.

### 7. Ficha de excepción (lo que el documento llama ficha; el término «apartamiento» ya no aplica)

En el caso no hay contradicción visible con un conocimiento que rige; la ficha sólo existe si una
comisión la propone. Para probar que la forma se puede aplicar, se arma la que más probablemente aparecería
y se la pasa por el filtro «¿Contradicción o conveniencia?» (`Excepcion-A-Un-Conocimiento` §3).

```text
EXCEPCIÓN XC-1   (ilustrativa: la propondría la comisión de Interfaz externa)
  Conocimiento:           Entorno-De-Ejecucion-Del-Agente 1.0, fila «Credencial compartida en la
                          conversación» — «Se usa sólo para esa tarea y en memoria de proceso: …»
  Alternativa de cumplir: medir la fila móvil con una cuenta sembrada por la comisión en el emulador, sin
                          la credencial del Product Owner, y borrar el emulador al terminar.
  Costo de cumplir:       sembrar una cuenta de prueba en el ambiente no productivo — comando: {{alta de
                          cuenta de prueba}} — salida: {{…}}
  Por qué no se cumple:   para reproducir «con la misma cuenta» en la app, la credencial del Product
                          Owner quedaría persistida en el almacenamiento del dispositivo (E1: {{comando que
                          muestra la sesión guardada}}).
  Reversibilidad:         alta: borrar el emulador.
  Sostiene:               comisión de Interfaz externa — folio {{informe}}
  Aprobó:                 pendiente — sale en el cierre
```

**Juicio del refutador, previsible:** la fila móvil compara emisores, no cuentas; «la misma cuenta» es
eje fijo de las filas web y API (F2), no de la móvil. Cumplir cuesta una cuenta sembrada. La ficha
**no se admite**: se cumple la convención. **El camino de compromiso no se convoca**, porque §2.1 paso
6 bis lo pide sólo por ficha admitida. Si se hubiera admitido —por ejemplo, si el defecto dependiera de un
atributo de esa cuenta y no del emisor—, el análisis tendría esta forma (§5.3):

```text
ANÁLISIS DEL CAMINO DE COMPROMISO — XC-1 (ficha {{folio}})
  Sigue rigiendo:       Entorno-De-Ejecucion-Del-Agente en web y API: la credencial, sólo en memoria.
  Fuera del documento:  la sesión persistida por la app en el dispositivo.
  Alternativas:         Alt-1 cuenta sembrada con el mismo atributo que la del Product Owner (la más cercana
                        a cumplir) — Alt-2 credencial del Product Owner en un emulador efímero, borrado al
                        terminar — Alt-3 pedirle al Product Owner que reproduzca él en su teléfono.
  Criterios y pesos (fijados antes de puntuar):
    K-1 Cercanía a cumplir — peso 3 — fuente: Entorno-De-Ejecucion-Del-Agente, fila de la credencial
    K-2 Reversibilidad     — peso 3 — fuente: Cadena-De-Consecuencias §2, paso 4
    K-3 Exposición del secreto — peso 2 — fuente: OWASP (sin apartado: no se verificó)
  Ponderación:          {{alt × criterio, 0 a 3, una línea de evidencia por celda}}
  Caminos:              C-1 (recomendado) Alt-1 — reversible; Sin C-2: Alt-2 quedó segunda; la pondría
                        primera un peso de K-1 menor que el de una medición más fiel, que no es razonable.
  Mientras se decide:   provisorio: se sigue C-1.
```

### 8. Carpeta del expediente (§2.3, §5.3; `Expediente-Rules.md` §3)

```text
Biblioteca/SDD/Expedientes/0001-Alta-De-Socio-Por-Api-Devuelve-401/
├── README.md        Número · Título · Objeto · Apertura · Origen · Base + línea de remisión
├── .gitignore       **/evidencia*/**/*.png, *.jpg, *.ndjson; una línea por la ruta de cada volcado HAR
│                    o log crudo; ninguna línea excluye .md ni .txt
├── actuaciones/
│   ├── 001-presentacion-pedido-de-mesa-del-product-owner.md        testimonio F1–F5, huella 3fa4a93b…
│   ├── 002-providencia-contrato-de-entrada-y-despacho.md            §5.1, barrido, composición propuesta
│   ├── 003-constancia-folia-registro-de-mesa-ronda-1.md             ruta@commit de Audit/ (composición)
│   ├── 004-constancia-correccion-del-objetivo-por-el-product-owner.md  testimonio F6–F7, huella c9dc9bde…,
│   │                                                                 objetivo v1 → v2
│   ├── 005-constancia-corrida-descartada-por-cambio-de-objetivo.md
│   ├── 006-providencia-relanzamiento-con-el-objetivo-corregido.md
│   ├── 007-informe-ficha-de-excepcion-1.md                         si una comisión la propone
│   ├── 008-constancia-folia-informes-refutacion-y-veredicto.md      ruta@commit de Audit/
│   ├── 009-resolucion-consolidacion-veredicto-y-plan.md             plan, fila Reintegra, cierre
│   ├── 010-constancia-verificacion-prueba-en-rojo-y-en-verde.md
│   └── 011-archivo-aplicado-y-verificado.md                         sólo con A13 y A14 vacíos
└── evidencia/
    ├── 001-pedido-literal.txt  002-correccion-literal.txt
    ├── 003-carta-comision-seguridad.md … (una por carta, v1 y v2)
    ├── 0NN-reproduccion-401-curl.txt (salida redactada: sin el valor del encabezado)
    └── 0NN-red-web.txt (el .txt de la captura; la captura y el HAR quedan locales, con ruta y huella)
```

En un destino los informes de comisión, refutador y jurado viven en `SDD/Docs/Audit/` y el expediente los
folia por `ruta@commit` (`Expediente-Rules.md` §3, «Lo que se asienta verbatim, y dónde»). Comprobación de
lo crudo: `git ls-files -ci --exclude-standard SDD/Expedientes/0001-Alta-De-Socio-Por-Api-Devuelve-401` →
vacío.

### 9. Campos de cierre (`Mesa-Rules.md` §6.7, más `Excepcion-A-Un-Conocimiento` §5.2)

```text
CIERRE DE MESA — Biblioteca, {{fecha}}
  PANEL
    Convocados:   Requisitos, Verificación, Lector sin contexto, Seguridad, Arquitectura, Operación y
                  entrega, Interfaz externa (ronda relanzada): {{hallazgos procedentes de cada uno}}
    Descartados:  Datos y dominio, Cumplimiento, Uso y accesibilidad, Formal, Concurrencia, Rendimiento,
                  Trazabilidad: {{motivo de cada uno, sección 4}}
    Ad hoc: ninguno   Postergados: ninguno   Aporte nulo: {{…}}
  HALLAZGOS   Detectados {{n}}  Procedentes {{n}}  Con parche {{n}}  Descartados por C {{n}}
  COMPUERTA (§10.0)   Resultado {{…}}   No mirado: producción; versiones viejas de la app
  ENTREGA AL ORQUESTADOR
    Parches {{n}}, en {{capa: emisor | API}}   Deuda declarada {{n}}   Capas a revalidar {{…}}
    Escaladas {{n}}   Reintegra: {{diseño interno | «no altera el compromiso», con su observable}}
  FOLIOS
    Informes (7 comisiones + refutador + 0 análisis + 2 del jurado): 10 — Escritos: {{n}} — {{rutas}}
    Además foliados, fuera de la cuenta: presentación, providencias, constancias, ficha XC-1, resolución
  EXCEPCIONES A CONOCIMIENTOS
    No admitidas: XC-1: cumplir cuesta una cuenta sembrada — se cumple la convención
    Propuestas de cambio de convención: (ninguna)
  CIERRE
    por decisión y no por criterio: una sola ronda; lo abierto: {{lista}}
  REGLA DE CIERRE DE LA CLASE (§2.2): la prueba de alta por API con la cuenta sembrada, vista en rojo
    (401) antes del arreglo y en verde después; la fila móvil, en verde antes y después.
  BARRIDO DE SECRETOS: git diff --cached | grep -nEi 'authorization:|bearer |cookie:|password|token=' →
    {{vacío}}; redactado: el valor del encabezado en la evidencia de curl; sin versionar: el HAR.
  LOTE AL PRODUCT OWNER (con SI NO RESPONDÉS y origen del hecho)
    {{si la causa vive en código compartido con el login web: «¿Se puede tocar X, que también usa el
    login web, o se busca la salida del lado del emisor?» SI NO RESPONDÉS: se aplica la del emisor y X
    queda como deuda declarada}}
```

---

## Parte II — Verificación de las referencias que el documento me dio

| # | Qué probé | Comando | Resultado |
| --- | --- | --- | --- |
| V-1 | Los diez archivos de norma y guía que citan los tres documentos | `ls` de cada ruta | resuelven todos, salvo `Expedientes/0004-…` (excluido por la prueba) |
| V-2 | Las secciones citadas de `Mesa-Rules.md` (§0.0, §2.1, §2.2, §4, §5.1–§5.5, §6.1–§6.7, §7, §7.1), `Expediente-Rules.md` (§1, §2, §3, §3.1–§3.5, §6 A1–A15), `Root-Rules.md` (§9, §11, §14–§14.5), `Master-Prompt.md` (§6, §7.0, §8.1, §10, §10.0, §10.1, §12.1 T0), `Rules-Base-Conocimiento.md` (§0.2, §0.4, §2.2, §4.4, §6.1, §6.2, §7, §8), `Deriva-Rules.md` §1, §3, `Rules-Arquitectura-Tecnica.md` §3.3, §4.1, `Coherencia-Mesa-De-Evaluacion.md` §6, `Coherencia-Mesa-De-Expertos-A-Pedido.md` §3 | `grep -n '^#'` sobre cada archivo | todas existen |
| V-3 | Las anclas por línea de las dos tablas «Dependencias» | `sed -n` sobre cada rango | todas caen en el texto que dicen (`Mesa-Rules.md:245`, `:249-251`, `:365-371`, `:384-387`, `:454-465`, `:507-512`, `:570-578`; `Master-Prompt.md:576-577`, `:983-988`, `:1001-1004`, `:1486-1489`; `Rules-Base-Conocimiento.md:98-103`; `Rules-Arquitectura-Tecnica.md:130-132`, `:170`; `Expediente-Rules.md:367-369`; `Index-Knowledge.md:34`) |
| V-4 | El barrido de §5.1 | `grep '^| \`Knowledge-' Conocimiento/Index-Knowledge.md \| cut -d'\|' -f3,5,11` | nueve filas con alias, Tema y Estado; funciona tal cual |
| V-5 | Fin de §0, para la carta | `grep -n '^## 1\.' Knowledge-Mesa-De-Expertos-A-Pedido.md` | línea 103; §0 termina en la 101 |
| V-6 | Las secciones internas que cita §0 (§3.3 «Caso que funciona antes que diseño», «Comportamiento no es restricción»; §7 «Tratar el comportamiento actual como dato», «Rodear en silencio…») | `grep -n` | existen |

---

## Parte III — Reporte

### Referencias rotas

- **R-1.** `Expedientes/0004-Reintegracion-Del-Conocimiento-De-Mesa-A-Pedido/` no está en el workspace
  limpio: lo citan `Knowledge-Mesa-De-Expertos-A-Pedido.md:522`, `:524`, `:539` (su
  `evidencia/ev-06-cotejo-de-las-copias-del-fork.diff`), `:541` y `:550`; `Knowledge-Excepcion-A-Un-Conocimiento.md:312`,
  `:313`, `:329`, `:335`; `Knowledge-Cadena-De-Consecuencias.md:144`, `:154`, `:160`; `Index-Knowledge.md:57`.
  Lo excluyó la propia prueba (`--exclude 'Expedientes/0004-*'`), así que con el expediente publicado
  resolvería. Ninguna de esas citas es necesaria para aplicar el documento: son origen y ejemplar.
- **R-2.** El nombre citado en `Knowledge-Mesa-De-Expertos-A-Pedido.md:539`, `ev-06-…`, contradice
  `Expediente-Rules.md:164-165`: «`ev-`/`EV-` para la evidencia colisiona con la familia `EV` de D9. La
  evidencia se nombra `NNN-<slug>`». No lo pude abrir, pero el nombre ya no cumple la regla del árbol al
  que remite.
- **R-3.** `Mesa-Rules.md:574` (disparador 3) remite a `Knowledge-Mesa-De-Expertos-A-Pedido.md` §3.1 para
  «el Product Owner pidió diseñar lo que el producto no prometía». §3.1 (`:221-240`) no trata el cambio de
  alcance foliado: la remisión cae en una sección que no dice lo que se le atribuye.

### Bloqueantes

- **B-1. Quién aplica: tres textos que no coinciden.** El pedido dice «que encuentre por qué y **lo
  corrija**». `Knowledge-Mesa-De-Expertos-A-Pedido.md:291`: «Quién aplica | **Quien el pedido designe.**
  Si el pedido no dice, la mesa entrega el plan y no aplica (`Mesa-Rules.md` §6.6) | El pedido puede
  autorizar aplicar». La regla que cita dice lo contrario sin condición: `Mesa-Rules.md:486`, «**La mesa no
  aplica.**», y `Root-Rules.md:865`, «quien el pedido designe para aplicar (`Mesa-Rules.md` §6.6: nunca la
  mesa)». No se puede saber si «hacé una mesa que lo corrija» designa a la mesa, lo que el conocimiento
  admite y la regla prohíbe, o a otro. Elegí que la presidencia designe un aplicador fuera del panel, que
  implementa y verifica (§3.2, «quien lo aplica lo verifica»), pero es adivinar. §8 (`:493`) dice que ante
  contradicción manda la regla, y el propio §4 se apoya en ella.
- **B-2. Dónde escribe su folio cada comisión, en un destino.** `Knowledge-Mesa-De-Expertos-A-Pedido.md:132`
  y `:184`: cada comisión escribe su informe «en la ruta de folio que le dio el despacho», y «en un destino,
  el registro de `Audit/` foliado por `ruta@commit`. **Los escribe cada uno en su ruta**: el presidente no
  transcribe». Pero `Mesa-Rules.md:156` fija un único archivo, `SDD/Docs/Audit/Mesa-<AAAA-MM-DD>[-ciclo-<N>].md`,
  escrito por AG-00970, y `:184` pone los informes dentro de ese registro (ítem 4). Ninguno de los textos
  da un patrón de ruta para un informe por comisión dentro de `Audit/`. La carta (§5.2) tiene que llevar
  `{{RUTA DEL FOLIO}}`, y no la pude llenar sin inventar. Si la mesa cumpliera §0.0 (B-3), mandaría el
  registro único y la cuenta de folios de §2.1 paso 10 (`:138`) no tendría sobre qué contar.
- **B-3. ¿Cumple el caso §0.0? De eso depende el resto.** `Knowledge-Mesa-De-Expertos-A-Pedido.md:116-120`:
  si cumple las tres cláusulas, «esa regla la gobierna entera; de este documento sólo se toman la lectura
  del pedido (§3.1) y el expediente (§2.3)», y se pierden la clase de objeto, el perito, la tabla
  diferencial (§3.3) y la regla de cierre propia. `Mesa-Rules.md:25-27`: (1) corpus previo no producido en
  esta corrida: Biblioteca lo tiene; (2) estado leído con la forma del contrato de §4: se puede leer así el
  contrato de entrada de la mesa; (3) plan por aprobar o decisión de alcance: el plan de corrección es un
  plan por aprobar. Con una lectura literal el caso **cumple**, y entonces el conocimiento casi no se
  aplica a la clase para la que tiene más herramientas. Tomé que no cumple (S-4), porque el corpus no es el
  objeto, pero ningún texto lo decide. Hace falta un criterio: por ejemplo, que el objeto de §0.0 sea el
  corpus documental, no el código.

### Menores

- **M-1. No se llega al documento desde la entrada.** La matriz de ruteo de `README.md` no tiene fila
  para «me pidieron una mesa de expertos»; la más cercana (`README.md:64`) manda a `Mesa-Rules.md`. El
  catálogo de criterios hace lo mismo (`Catalogo-De-Criterios.md:90`, «El caso pide una mesa y ningún
  orquestador la convoca» → `Mesa-Rules.md` §0.0). Sólo lo encontré por `Index-Knowledge.md:41`, porque la
  tarea me mandó al índice. Un agente que siguiera la matriz aplicaría la regla y no el conocimiento.
- **M-2. El vocabulario de la ficha.** Lo que se pide como «ficha de apartamiento» el árbol lo llama
  «excepción a un conocimiento», y «apartamiento declarado» designa el ADR de `Root-Rules.md` §11, que sí
  entra en `restricciones_duras` (`Knowledge-Excepcion-A-Un-Conocimiento.md:33-34`, `:38-40`). La
  terminología se resuelve bien en el documento hermano, pero quien llega con la palabra vieja encuentra
  primero `Root-Rules.md` §11.
- **M-3. El 401 como ejemplo de bloqueo.** `Knowledge-Mesa-De-Expertos-A-Pedido.md:236` da «un 401» como
  ejemplo de paso prescripto que falla y obliga a emitir `BLOQUEO`. En este caso el 401 es el objeto de la
  investigación, no un paso del pedido. El texto no los distingue, y una comisión podría devolver
  `BLOQUEO` sobre el defecto mismo. Lo aclaré en la carta; convendría una línea en §3.1.
- **M-4. Cómo se relanza.** §0 renglón 2 (`:34-37`) y §2.1 paso 2 (`:129`): «el encargo se detiene antes
  de su próxima fase irreversible (merge, etiqueta, publicación) y se relanza». No dice si se relanza
  todo o sólo los despachos afectados, ni qué pasa con los informes que ya llegaron bajo el objetivo
  anterior (¿cuentan en el paso 10?). Tampoco dice si una señal nueva traída por quien pidió entra por la
  «sola ronda de convocatoria en caliente» de `Mesa-Rules.md:324-326`. Lo resolví con la «corrida
  descartada» de `Expediente-Rules.md:234-235`, que sí está en el árbol. Una remisión desde el paso 2
  bastaría.
- **M-5. «La que menos agrega».** `:32` y `:235`. Ante una frase restrictiva («que no se rompa», «que no
  toquen»), no es obvio si menos agrega la lectura que restringe más o la que restringe menos. Lo
  interpreté como la que agrega menos trabajo o entregas no pedidas, y lo declaré.
- **M-6. El perito no está en la cuenta de folios.** La clase «investigación de un defecto» suma un perito
  (`:147`), y §2.1 paso 7 (`:135`) prevé un peritaje. Pero la cuenta del paso 10 (`:138`), el criterio de
  `:426-428` y la de `Knowledge-Excepcion-A-Un-Conocimiento.md:184-186` no lo nombran, ni dicen dónde
  escribe ni si su folio cuenta. Lo mismo pasa con los tres roles que suma la clase «interfaz en
  ejecución».
- **M-7. Tipo de folio para lo que quien pidió agrega a mitad del caso.** El testimonio va en un folio
  (`Expediente-Rules.md` §3.3), pero `presentacion` devuelve el estado a «abierto» (`:182`) y `constancia`
  es «un hecho». Usé `constancia` con el bloque de testimonio. Ni el conocimiento (§2.3, tabla `:181-186`)
  ni la regla dicen cuál corresponde.
- **M-8. La fila «comisión» del mapa de carga.** `:97` no lista `Cadena-De-Consecuencias` en «además»,
  pero la carta de §5.2 (`:355-356`) manda a la comisión a correr su §2. Lo cubre el «respaldo» (`:85-87`),
  pero el mapa y la carta dicen cosas distintas sobre lo mismo.
- **M-9. «La misma cuenta» y los datos reales.** El caso que funciona está atado a una cuenta real (F2), y
  §4 «Datos reales» (`:293`) limita toda acción sobre el sistema vivo a datos que la comisión sembró. Un
  alta además crea datos personales (`Mesa-Rules.md:576`, disparador 5). El documento no dice cómo
  reproducir «con la misma cuenta» sin actuar sobre ella: ¿se pide la credencial, se siembra una cuenta
  con los mismos atributos, o se le pide a quien pidió que reproduzca él? Lo resolví con una cuenta
  sembrada y lo declaré, pero el eje fijo «misma cuenta» queda medido sobre otra.
- **M-10. Combinación de clases.** §2.2 da cuatro clases excluyentes. Un defecto que involucra una
  superficie web como referencia podría leerse también como «interfaz en ejecución». No hay regla para
  elegir ni para combinar. Elegí una y declaré el descarte.
- **M-11. `{{CARPETA DE FICHAS}}`.** La carta de §5.2 (`:354`) la pide como parámetro, y
  `Knowledge-Excepcion-A-Un-Conocimiento.md:140` dice «Ninguna ruta de ficha se asigna de antemano». No
  hay convención para la carpeta de trabajo donde la comisión deja la ficha antes de que se folie.
- **M-12. Una reproducción en papel dentro de un expediente.** Este folio no puede llevar el cerco
  `testimonio` en sus ejemplos sin que A8 lo tome como el testimonio del folio. Los escribí en bloques
  `text`. No es un defecto del documento; sí un cuidado para la próxima reproducción.

### Lo que sí se pudo hacer sin ayuda

El enunciado, el objetivo con origen, la clase con su variante, la composición con descartes, la carta
completa, la corrección del objetivo con vigente → corregido, la ficha con su filtro, el análisis del
camino de compromiso y los campos de cierre se armaron sólo con el árbol. El barrido de §5.1 corre tal cual.
Las anclas por línea resuelven todas. Lo que no cerró sin adivinar fueron tres puntos donde el conocimiento
y la regla que cita no coinciden (B-1, B-2) o donde la condición que decide qué rige no se puede evaluar
(B-3).

Sigue: consolidación de las reproducciones a ciegas · presidente de la mesa
