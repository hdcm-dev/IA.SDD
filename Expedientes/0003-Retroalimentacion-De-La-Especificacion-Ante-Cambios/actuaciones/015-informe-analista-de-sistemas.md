| Campo | Valor |
|---|---|
| Tipo | informe |
| Fecha | 2026-09-16 |
| Autor | Comisión de Analista de sistemas (segunda ronda) |
| Corrige | — |

# Informe de la comisión de Analista de sistemas

## 0. Qué revisé y con qué medio

| Qué | Medio | Ancla |
|---|---|---|
| Pedido, contrato de entrada, ampliación y evidencias del expediente 0003 del framework | lectura completa | `Expedientes/0003-…/actuaciones/001`, `002`, `010`; `evidencia/ev-01`, `ev-02`, `ev-03` |
| Reglas del framework que fijan la forma de lo que voy a inventariar | lectura por sección | `Rules-Especificacion-Funcional.md` §3.2, §3.5, §4.2 (líneas 96-100, 140-152, 176-207); `Rules-Backlog-Tecnico.md` §3.6 (líneas 158-181); `Root-Rules.md` §12.2 (720-745); `Expediente-Rules.md` §5 (304-312); `Master-Prompt.md` Fase I (728-736) y §13.1 (1811) |
| Resoluciones y cierres de los expedientes 0002, 0003 y 0004 del destino | lectura completa | `docs/experdientes/0002-…/actuaciones/013` y `024`; `docs/experdientes/0003-…/actuaciones/013`, `014`, `017`, `020`, `022`; `docs/experdientes/0004-…/actuaciones/014`, `015`, `016` |
| Especificación y plan vigentes del destino | lectura y `grep` | `docs/06_plan_sprint/product-backlog_v1.0.md` (2.5; US-01…US-43; precedente US-42/43 en :136-171), `backlog-tecnico_v1.0.md` (2.3; BT-01…BT-24 en :28-52), `especificacion-funcional_v1.0.md` (1.8; CU-01…CU-15 en :48-62), `reglas-negocio_v1.0.md` (1.6; hasta RN-30), `wireframes-componente_v1.0.md` (3.3; VIEW-01…VIEW-12), `contratos-api_v1.0.md` (2.7), `deuda-declarada_v1.0.md` (1.4), `Context/acta_proyecto.md` (1.8), `Context/input/integracion_preacta.md` (último ítem `C-112`, :1138) |
| Código del panel, sólo lectura, para el análisis funcional de Interactive Server | `grep`, lectura | `src/<Destino>.API/Program.cs:176-183`, `Controllers/AuthPanelController.cs:22-32, 116-119, 138`, `Controllers/PanelContextoController.cs:17-31`, `Controllers/AdminAppsController.cs:797-993`; `src/<Destino>.Web/Components/Pages/**/*.razor` (rutas), `Components/Shared/AcuseDeAccion.razor:1`, `Pages/Trabajo/Redactar.razor:107`, `wwwroot/assets/*.js`; `src/<Destino>.Entities/Enums/OrigenMensaje.cs:9-15` |

Tres mediciones propias que fundan el inventario (E1):

- `grep -rlc "plantilla\|templateId\|largeIcon\|contenido dinámico\|Notificaciones Push" docs/02_especificacion_funcional docs/03_ux-ui/*.md docs/06_plan_sprint` → **cero archivos**. Nada de lo entregado por 0002 y 0003 existe hoy en 02, 03 ni 06.
- El último identificador libre por familia, medido en los archivos vigentes: **US-44**, **BT-25** (BT-23 y BT-24 ya existen, `backlog-tecnico_v1.0.md:51-52`, versión 2.2), **RN-31**, **CU-17** (CU-16 existe como archivo `casos-de-uso/CU-16-perfil-y-contrasena_v1.0.md` aunque el índice de `especificacion-funcional_v1.0.md:48-62` termina en CU-15), **VIEW-13**, **EP-13**, **ADR-23**, **C-113**.
- `grep -n "OrigenMensaje" docs/05_arquitectura_tecnica/contratos-api_v1.0.md` → `:527 // OrigenMensaje: API | Panel | Campania`; `src/<Destino>.Entities/Enums/OrigenMensaje.cs:15` agrega `Prueba`.

Lo que no observé: no ejecuté builds ni pruebas, no abrí el panel vivo, no leí los informes de otras comisiones.

## 1. Hallazgos

| Id | P | Ancla | Hallazgo | Impacto | Dirección de la corrección |
|---|---|---|---|---|---|
| AS-01 | **P0** | E4 | El acta del destino declara **fuera del alcance** las notificaciones con imagen adjunta (`Context/acta_proyecto.md:130`, §4.2: «Se descarta para no incorporar funcionalidades con componentes/costos adicionales») y las lista como «posible evolución futura» (`:161`). El expediente 0003 entregó exactamente eso: imagen e ícono hasta el equipo Android (#156) y extensión de servicio iOS de ejemplo (#158). El acta sigue en 1.8 del 31/08 (`:480`) y la carta de cambios termina en `C-112` del 2026-09-01 (`integracion_preacta.md:1138`). | El documento de compromiso del producto contradice al sistema construido. Es el caso literal del pedido del PO («la especificación va a quedar desfasada»). Además, el evento que el framework declara como disparador de la reapertura del backlog —la entrada de control de cambios del PO (`Rules-Backlog-Tecnico.md:162-166`)— **nunca ocurrió** para 0002, 0003 ni 0004. | El PO asienta `C-113` (plantillas y suscripciones de prueba, 0002), `C-114` (medios hasta el equipo, revierte la exclusión de §4.2, 0003) y `C-115` (panel Interactive Server, segundo caso) en `integracion_preacta.md` §21; el acta sube a 1.9 moviendo la imagen de §4.2 a §4.1 y sumando plantillas a §4.1. Recién con esa entrada corre la reintegración de este inventario. |
| AS-02 | **P1** | E4 | El conjunto cerrado `OrigenMensaje` se extendió en código con `Prueba` (`src/<Destino>.Entities/Enums/OrigenMensaje.cs:14-15`, «expediente 0002») mientras el contrato lo sigue declarando `API \| Panel \| Campania` (`contratos-api_v1.0.md:527`) y BT-12 exige «exactamente los valores del contrato §16.1» (`backlog-tecnico_v1.0.md:39`). El framework prohíbe que un subagente extienda un conjunto cerrado sin arbitraje (`Rules-Especificacion-Funcional.md:203-207`). | Un consumidor de `MensajeDetalleResponse.origin` que valide contra el contrato rechaza el valor. La regla de conjuntos cerrados existía y nadie la aplicó porque después del handoff ningún audit lee 02 ni 05 contra el código. | Fila en `contratos-api` §16.1 con el valor nuevo y su origen; **RN-31** (abajo) fija el significado de `Prueba`; la decisión queda registrada como del PO en `C-113`, no como hecho consumado del código. |
| AS-03 | **P1** | E4 | La especificación afirma que la suscripción de prueba **queda excluida** de la audiencia real y de las métricas: US-28 CA-03 (`product-backlog_v1.0.md:591`), US-32 CA-03 (`:239`), CU-05 CA-14 (`CU-05-enviar-mensaje_v1.0.md:224`), glosario (`glosario_v1.0.md:75`). La mesa 0002 decidió lo contrario: «La marca es un rótulo: no excluye de la audiencia» (folio 013 §3 Q1 punto 10) y difirió la exclusión de métricas como D-11 (folio 013 §5). | Cuatro afirmaciones de la especificación describen un control que el código no ejerce, que es **la definición de entrada** del registro `deuda-declarada_v1.0.md` §1, y D-11 no está en ese registro sino sólo en el folio del expediente. Un plan de pruebas que lea CU-05 CA-14 escribe una prueba que falla contra el sistema aprobado. | **RN-31** nueva (la marca es rótulo, apartamiento declarado del proveedor de referencia); CU-05 pasa a 2.0 con FA-06 y CA-14 reescritos; US-28 y US-32 **no se editan** (cerradas: `Rules-Backlog-Tecnico.md:160`) sino que reciben una nota «CA-03 superado por RN-31 / US-45»; D-11 (0002) entra al registro §2 como ítem diferido con los cuatro campos de `Root-Rules.md` §12.2 y evento «el PO decide en `C-113`». |
| AS-04 | **P1** | E4 | US-32 CA-01 exige «guardar sin enviar → estado `Borrador`» (`product-backlog_v1.0.md:237`). La mesa 0002 resolvió «No hay borrador distinto de la plantilla. `EstadoMensaje.Borrador` sigue sin uso» (folio 013 §3 Q2). El editor entregado (#144) guarda **plantillas**, no mensajes en borrador. | Un criterio de aceptación vigente que ninguna implementación aprobada va a cumplir; `Borrador` queda como valor muerto de un conjunto cerrado sin declararlo. | Nota de superación en US-32 CA-01 que remite a **CU-17 / US-46**; `contratos-api` §16.1 marca `Borrador` como «reservado, sin uso (0002)»; la deuda D-12 (0002, «borrador distinto de plantilla») pasa a ítem diferido §12.2 en el registro. |
| AS-05 | **P1** | E4 + fuente | Migración a Interactive Server, flujo de sesión: US-41 CA-03 promete que al cambiar la contraseña «las demás sesiones quedan cerradas» (`product-backlog_v1.0.md:396`) y CU-14 fija que sólo el login emite la cookie (`CU-14-entrar-al-panel_v1.0.md:110`). En un circuito de servidor el estado de autenticación se fija al abrir el circuito y **no se reevalúa** con cada request; sin un proveedor que revalide, un operador sigue operando después de que su cookie expiró o de que otro cerró sus sesiones (Microsoft Learn, «Secure ASP.NET Core server-side Blazor apps», sección `RevalidatingServerAuthenticationStateProvider`, learn.microsoft.com/aspnet/core/blazor/security/server/). | El CA-03 de US-41, hoy verdadero por construcción (cada request lee la cookie), pasa a ser **falso** con la migración si no se especifica la revalidación. Es un cambio de comportamiento para el operador que hoy nadie escribió. | **RN-42** «la sesión interactiva se revalida contra `sys_UsuarioPanel` cada N minutos y al fallar cierra el circuito hacia `/ingresar`», con N decidido por el PO; **US-58** y **BT-36** (abajo). La excepción del login es un conjunto de **tres** flujos que escriben cookie —login, logout y elección de aplicación en contexto (`PanelContextoController.cs:19`)—, no uno. |
| AS-06 | **P2** | E4 | El contrato enumera «los 39 endpoints con `[Authorize(Policy = "Administracion")]`» (`contratos-api_v1.0.md:160-215`) y no lista ninguno de los que 0002 y 0003 agregaron: `messages/test` (`AdminAppsController.cs:797`), `templates`, `templates/{codigo}`, `templates/preview`, `templates/{codigo}/edit|duplicate|delete`, `templates/from-message` (`:819-928`), `subscriptions/{codigo}/test[/remove]`, `users/{id}/test[/remove]` (`:978-993`). El 2.6 y 2.7 del contrato sólo tocaron §4.9 (`:1010-1011`). | La superficie que el panel consume no está descripta; cualquier prueba de integración o migración de página que parta del contrato la construye a ciegas. | **BT-29** (abajo): tabla de administración del contrato completada, con el conteo real medido en el mismo PR. |
| AS-07 | **P3** | E4 | Numeración de la deuda de los expedientes: 0003 folio 022 dice «Deudas abiertas: D-15 a D-25 (0003)» (`022:51`) pero el §5 del folio 013 define D-15…D-24 y **D-25 (0003)** sólo existe en la prosa de una constancia de tramo (`017:38`); 0004 nombra D-26…D-33 sin el calificador «(0004)» que el propio destino adoptó en 0003 T0 (`014:20`, «Identificador calificado»); 0003 no tiene folio de cierre (la serie termina en 022, «Sigue: T7 · PO»). | Al reintegrar como ítems diferidos, dos series de deuda con el mismo prefijo y un calificador que a veces falta hacen que un `grep` no pueda contarlas, que es el defecto que `Root-Rules.md:738-743` describe. | Al escribir los ítems diferidos en el registro se usa siempre `D-NN (000X)`; el folio de cierre del 0003 se asienta con la lista D-15…D-25 (0003) y su estado; ninguna fila publicada se reescribe (R1). |

## 2. Lo que revisé y está bien

1. **El precedente de reintegración del 0001 tiene la forma correcta y es reutilizable.** US-42 y US-43 llevan «Estado real: entregado en el PR #121 (expediente 0001, T-08.1 y T-08.2)» (`product-backlog_v1.0.md:142, 162`), origen con ADR y evidencia, y el documento declara «Los IDs ya emitidos no se renumeran» (`:24`). Es la plantilla de cada fila del inventario de abajo.
2. **`contratos-api` sí cumplió `Expediente-Rules.md` §5** para lo que tocó: sus filas 2.6 y 2.7 nombran el expediente y el tramo (`:1010-1011`), y §4.9.0 cita «expediente 0003, folio 013 §3 Q4» (`:544`). El vínculo declarado en el framework funciona cuando alguien lo usa; el problema es de alcance (sólo 05), no de forma.
3. **La afirmación del PO sobre el login es exacta.** `Ingresar.razor:40` es `<form method="post" action="api/auth/panel/login">` sin lógica en la página (`:5`), y `AuthPanelController.cs:22-32` verifica y firma la cookie con `SignInAsync` (`:138`). El login ya es hoy un endpoint que arma la cookie; la excepción SSR que fija `Context/ui_guide.md:595` se cumple sin cambios.

## 3. Respuestas a las preguntas del caso

### Q10 — Inventario listo para escribir

Convenciones: identificadores consecutivos a los vigentes, con los dos dígitos que el destino usa (su norma propia, no D3); ninguna US cerrada se edita, se agrega la siguiente (`Rules-Backlog-Tecnico.md:160`); «Estado real» como en US-42. Origen: expediente / tramo / PR. El cambio 0002 y 0003 modifican la matriz de épicas y sprints, por lo que **`product-backlog` pasa a 3.0** y **`backlog-tecnico` a 3.0** (criterio de `Rules-Backlog-Tecnico.md:170-177`); 0004 es enmarcamiento de 03 y no reabre 06.

#### 3.1 Carta de cambios y acta (el evento que dispara todo lo demás)

| Id | Título | Origen | Vinculado a | Estado real | Criterio de aceptación |
|---|---|---|---|---|---|
| C-113 | Plantillas de notificación, marca de prueba como rótulo y envío de prueba en lote | 0002, folio 013 §3 | acta §4.1, §5.4 | pendiente: lo asienta el PO | La entrada nombra la carpeta del expediente y el folio, y el acta 1.9 lista plantillas en §4.1 |
| C-114 | Imagen, ícono grande y subtítulo hasta el equipo; se revierte la exclusión de rich media | 0003, folio 013 §3 | acta §4.2 → §4.1 | pendiente: lo asienta el PO | §4.2 deja de excluir la imagen; §4.3 declara la extensión iOS como target de la app consumidora |
| C-115 | El panel vuelve a Blazor Interactive Server, con login, logout y contexto como endpoints SSR | providencia 010 §1 | acta §6, `ui_guide.md:19` | pendiente de decisión (plan de la mesa) | ADR-23 emitido; ADR-21 marcado «revisado por ADR-23» sin reescribirse |

#### 3.2 Casos de uso (02)

| Id | Título | Origen | CU/NB | Estado real | Criterio de aceptación |
|---|---|---|---|---|---|
| CU-17 (nuevo) | Administrar plantillas de notificación push: crear en blanco, desde plantilla o desde mensaje enviado; editar; duplicar; eliminar; usar para enviar; vista previa y «Test & preview» | 0002 T5, T6, T8 / #143, #144, #146 | NB-02, NB-11 · RN-34, RN-35, RN-36 · VIEW-13, VIEW-14, VIEW-16 | entregado | Una plantilla de otra aplicación o inexistente responde 404 en leer, editar y usar |
| CU-04 → 2.0 | Crear mensaje: suma ícono grande (URL, sólo Android), subtítulo rotulado iOS, contenido dinámico en título/subtítulo/cuerpo/URL/imagen, y precarga desde plantilla | 0002 T9 / #147 · 0003 T4 / #154 | RN-35, RN-38, RN-39 | entregado | Paso 1 de `CU-04:65` enumera los campos nuevos y remite a RN-38 para las URL |
| CU-05 → 2.0 | Enviar mensaje: FA-06 pasa a «envío de prueba en lote» (hasta 20 suscripciones de prueba, `Origen=Prueba`); CA-14 se reescribe sobre RN-31 | 0002 T4 / #142 | RN-31, RN-33 | entregado; métricas: pendiente (D-11) | CA-14: «cualquier código no marcado hace fallar el envío entero con 400 y no crea filas en `sys_Mensaje`» |
| CU-07 → 2.0 | Recibir notificación: dos pasadas en Android (texto inmediato, medios después con el mismo id), imagen en iOS por extensión de la app | 0003 T6, T10 / #156, #158 | RN-40 · US-53, US-54 | Android entregado y observado; iOS implementado, no observado (D-24) | Ante falla de descarga queda la notificación de texto sin cierre forzado |
| CU-11 → 2.0 | Audiencia: marcar/quitar prueba por suscripción y en lote por usuario; página «Suscripciones de prueba» | 0002 T2–T4 / #140, #141, #142 | RN-31, RN-32, RN-37 · VIEW-15 | entregado | Los ids de la página coinciden con el segmento `is_test:=:true` (oráculo del folio 013 T-N2.5) |
| CU-13 → 2.0 | Envío en una llamada: `templateId`, `imageUrl`, `largeIcon` opcionales; regla de combinación | 0002 T10 / #148 · 0003 T5 / #155 | RN-36, RN-38 | entregado; Client publicado: pendiente del PO | Campo no vacío de la request pisa a la plantilla sólo en ese envío |
| CU-14 → 1.1 | Entrar al panel: se declara que la página es SSR y el circuito interactivo arranca después del redirect; revalidación de la sesión | segundo caso | RN-42 | pendiente de decisión | El CA-03 de US-41 sigue verificable con circuito abierto |

#### 3.3 Reglas de negocio (02)

| Id | Enunciado | Origen | CU afectados | Estado real |
|---|---|---|---|---|
| RN-31 | La marca de prueba es un rótulo de la suscripción: no la excluye de la audiencia, de los segmentos ni del envío. Apartamiento declarado del proveedor de referencia | 0002 folio 013 §3 Q1 pts. 1 y 10 | CU-05, CU-11 | entregado (#140, #142) |
| RN-32 | El re-registro de una suscripción existente no modifica su marca ni su nombre de prueba; `isTest`/`testName` sólo cuentan en el primer alta | 0002 T1 / #139 | CU-01 | entregado |
| RN-33 | Un envío de prueba alcanza sólo suscripciones marcadas de prueba y en estado `Suscrita`, hasta 20 por envío; un código no marcado rechaza el envío entero | 0002 T4 / #142 | CU-05 | entregado |
| RN-34 | La plantilla no tiene audiencia, programación, idioma ni métricas; al enviar se copia el contenido y no se guarda referencia a la plantilla | 0002 §3 Q2 (D-3) | CU-04, CU-17 | entregado (#143) |
| RN-35 | Contenido dinámico: sólo `{{ user.tags.<clave> }}` con `\| default: "<texto>"`, resuelto por suscripción al enviar; nunca en `DatosLibres`; ausente sin default → vacío; sintaxis inválida → 400 al guardar | 0002 T9 / #147 | CU-04, CU-05, CU-17 | entregado |
| RN-36 | Combinación request/plantilla: el campo no vacío de la request pisa al de la plantilla sólo en ese envío; plantilla ajena o inexistente → 404 | 0002 T10 / #148; 0003 T5 / #155 | CU-13 | entregado |
| RN-37 | El nombre de prueba es obligatorio, sin espacios en los bordes, no único, con el largo de la columna | 0002 §3 Q1 pt. 6 | CU-11 | entregado (#140) |
| RN-38 | URL de medio: https absoluta, host sin `userinfo`, ni `localhost` ni IP privada/loopback/enlace local, ≤ 500, variables sólo después del primer `/`; se revalida al enviar y si falla la entrega sale sin esa clave | 0003 T3 / #153 | CU-04, CU-13, CU-17 | entregado |
| RN-39 | El subtítulo sólo viaja a iOS; el ícono grande sólo a Android; cada clave se emite sólo si queda no vacía después de resolver | 0003 §3 Q1 | CU-05, CU-07 | entregado (#153, #155) |
| RN-40 | Descarga de medios en el equipo: sólo https, ≤ 3 redirecciones, sin IP privada, tipos jpeg/png/gif/webp, 1 MB imagen y 256 KB ícono, presupuesto de tiempo; ante falla queda el texto | 0003 §3 Q2 / #156 | CU-07 | entregado y observado |
| RN-41 | Degradación por tamaño del payload: se omite primero `largeIcon`, después `imageUrl`, con asiento; el rechazo por tamaño no da de baja el token | 0003 T3.4 / #153 | CU-05 | entregado |
| RN-42 | La sesión interactiva del panel se revalida cada N minutos y se cierra al fallar; login, logout y contexto siguen siendo endpoints que escriben cookie | segundo caso (AS-05) | CU-14, CU-16 | pendiente de decisión (N lo fija el PO) |
| RC-01 | Los textos que escribe el operador son `nvarchar` (emoji en historial y auditoría); el grupo B queda en `varchar` hasta decisión del PO (D-21 0003) | 0003 T1 / #151 | modelo conceptual | entregado |

Conjunto cerrado tocado: `OrigenMensaje` + `Prueba` (AS-02) y `EstadoMensaje.Borrador` marcado sin uso (AS-04); las dos filas van a `contratos-api` §16.1 con decisión del PO en C-113.

#### 3.4 Vistas (03)

| Id | Título | Origen | Estado real | Criterio de aceptación |
|---|---|---|---|---|
| VIEW-13 (nueva) | Notificaciones Push: listado de plantillas con Nombre, Plataformas, Última modificación y menú por fila (Editar, Duplicar, Usar para enviar, Eliminar) | 0002 T6 / #144 | entregada | Ítem «Mensajes › Notificaciones Push» primero en el menú (orden R7 del folio 013 §3 Q4) |
| VIEW-14 (nueva) | Editor de plantilla: cinco paneles, vista previa lateral ≥ 1200 px, «Test & preview» como único modal, editor JSON de contexto | 0002 T6, T8 / #144, #146 · 0004 / #159 | entregada | Los scripts E1 del folio 014 §3 Q6 del 0004 en verde; `flujo-interaccion:521` (previa después de Contenido en una columna) |
| VIEW-15 (nueva) | Suscripciones de prueba: filtro `EsPrueba=1`, sin alta, estado vacío con enlaces, menú por fila Quitar/Copiar | 0002 T4 / #142 | entregada | Estado vacío enlaza a Suscripciones y Usuarios |
| VIEW-16 (nueva) | Elección de origen de «Nuevo push»: en blanco, desde plantilla, desde mensaje enviado | 0002 T6 / #144 | entregada | Las tres opciones llevan a VIEW-14 con el contenido copiado |
| VIEW-07 → mod. | Redactar: precarga `?plantilla=`, «Ícono grande (URL) — sólo Android», «Subtítulo (iOS)», ayudas de formato y privacidad, `maxlength=500`; sale del menú | 0002 T6 · 0003 T4 | entregada | `/aplicaciones/<code>/redactar` responde 200 fuera del menú |
| VIEW-08, VIEW-09 → mod. | Menú por fila (Agregar/Quitar de prueba, Copiar ID; Ver ficha en Usuarios), rótulo «Prueba (n de m)», columna de acciones pegajosa | 0002 T3 / #141 | entregadas | A 400 px el disparador queda dentro del viewport |
| VIEW-02 → mod. | Mensajes enviados muestra el rótulo «Prueba» cuando `Origen=Prueba` | 0002 T4 / #142 | entregada | Fila del envío de prueba con el rótulo |
| Menú lateral | Estructura y orden del bloque R7 (Mensajes · Audiencia · Mensajes Despachados · Análisis) | 0002 T-N1.1 / #144 | entregado | Instantánea del DOM comparada ítem por ítem |

`wireframes-componente` pasa a 3.4 y `flujo-interaccion` recibe los flujos de plantilla y de prueba en lote.

#### 3.5 Historias de usuario (06)

| Id | Título | Origen | CU/NB | Estado real | Criterio de aceptación |
|---|---|---|---|---|---|
| EP-13 (nueva) | Plantillas de notificación y pruebas sobre el equipo | 0002 | CU-17, CU-05, CU-11 / NB-02, NB-11 | — | Épica con US-44…US-50 |
| EP-14 (nueva) | Medios hasta el equipo: imagen, ícono grande y subtítulo | 0003 | CU-04, CU-07, CU-13 / NB-05, NB-11 | — | Épica con US-51…US-55 |
| EP-15 (nueva) | Panel interactivo (Interactive Server) | segundo caso | CU-14 + todas las vistas | pendiente de decisión | Épica con US-56…US-58 |
| US-44 | Marcar y quitar suscripciones de prueba desde el panel, por suscripción y en lote por usuario, con auditoría | 0002 T2, T3 / #140, #141 | CU-11 · RN-31, RN-32, RN-37 | entregada | Cancelar el modal no cambia la fila; el asiento de auditoría guarda nombre anterior y nuevo |
| US-45 | Página «Suscripciones de prueba» y envío de prueba en lote desde el panel | 0002 T4 / #142 | CU-05 FA-06, CU-11 · RN-33 | entregada | Un id no marcado → 400 sin filas en `sys_Mensaje` ni `log_ResultadoEnvio` |
| US-46 | Crear, editar, duplicar, crear desde mensaje enviado y eliminar plantillas | 0002 T5, T6 / #143, #144 | CU-17 · RN-34 | entregada | Ajena → 404 en leer, editar y usar |
| US-47 | Usar plantilla para enviar desde el panel y por API (`templateId`) | 0002 T6, T10 / #144, #148 | CU-13 · RN-36 | entregada; Client 0.4.0 sin publicar | Sin `templateId` el envío se comporta igual que antes |
| US-48 | Vista previa Android/iOS y «Test & preview» en el editor | 0002 T7, T8 / #145, #146 | CU-17 · RN-33 | entregada | `npm test` > 0 pruebas; la previa usa sólo `textContent` |
| US-49 | Contenido dinámico por suscripción con vista previa resuelta en el servidor | 0002 T9 / #147 | CU-04, CU-05 · RN-35 | entregada | La respuesta de previa contiene sólo las claves que la plantilla referencia |
| US-50 | Editor JSON del contexto de previsualización, sin persistencia | 0002 T8 / #146 (PO-2 por defecto A) | CU-17 | entregada por default; **ratificación del PO pendiente** | «Guardar» no escribe en la base |
| US-51 | Cargar ícono grande y subtítulo (iOS) desde Redactar, plantilla y prueba | 0003 T4 / #154 | CU-04 · RN-38, RN-39 | entregada | `http` → 400 por campo |
| US-52 | Imagen e ícono por API y `<Destino>.Client` 0.5.0 | 0003 T5 / #155 | CU-13 · RN-36, RN-38 | entregada; publicación pendiente (T7) | Campo en el Client antes que en el servidor → prueba de contrato en rojo |
| US-53 | Ver imagen e ícono en Android (paquete de dispositivo 0.14.0) | 0003 T6 / #156 | CU-07 · RN-40 | entregada y observada en equipo | Casos de falla dejan el texto sin demora visible |
| US-54 | Imagen en iOS con extensión de servicio de ejemplo y guía | 0003 T8–T10 / #157, #158 | CU-07 | implementada, **no observada** (D-24 0003) | Job macOS en verde; la guía dice «no observado en equipo» |
| US-55 | Emoji y acentos en historial y auditoría (migración 26) | 0003 T1 / #151 | CU-12 · RC-01 | entregada | Ida y vuelta con `N'🔔 ñandú サブ'` |
| US-56 | Las páginas del panel operan con circuito interactivo conservando URL profunda, filtros y paginación en la query | segundo caso | todas las VIEW salvo VIEW-10/11 | pendiente de decisión | Cada URL vigente sigue respondiendo lo mismo con y sin circuito |
| US-57 | Los formularios responden en la página sin recarga, conservan lo tipeado ante error y avisan al salir con cambios | segundo caso; cierra D-26 y D-27 (0004) | VIEW-14, VIEW-07 | pendiente de decisión | Un POST rechazado devuelve el editor con los valores; salir con cambios pide confirmación |
| US-58 | La sesión del panel se revalida y se cierra en el circuito al cambiar la contraseña o vencer la cookie | segundo caso (AS-05) | CU-14, CU-16 · RN-42 | pendiente de decisión | US-41 CA-03 verificable con dos pestañas abiertas |

Notas de superación (sin editar la US): US-28 CA-03 → RN-31/US-45; US-32 CA-01 → CU-17/US-46; US-32 CA-03 → RN-31 y D-11.

#### 3.6 Backlog técnico (06)

| Id | Título | Origen | Estado real | Criterio de aceptación |
|---|---|---|---|---|
| BT-25 | Cadena JavaScript del panel: proyecto hermano de bundles, pines exactos, Node 22.23.2, modo `OmitirBundles`, `npm test` en CI (ADR-21) | 0002 T7 / #145 | entregado | Build desde limpio con `main.js` en `staticwebassets.build.json` |
| BT-26 | Migraciones 22–25 (marca de prueba, plantillas) con asiento en `sys_Migracion` | 0002 T2, T5 / #140, #143 | entregado; asiento de 22–25: pendiente (D-20 0003) | `Database.Tests` con 0 saltadas |
| BT-27 | `AuditoriaService` cubre Suscripción y Plantilla; recorte sin partir pares sustitutos | 0002 T2 / #140 · 0003 T1 / #151 | entregado | Prueba del emoji en posición 300 |
| BT-28 | `<Destino>.Client` 0.4.0 (`TemplateId`) y 0.5.0 (`ImageUrl`, `LargeIcon`) | 0002 T10 · 0003 T5 | construidos; **publicación pendiente del PO** | Versión del `.nupkg` igual a la línea base |
| BT-29 | `contratos-api` §admin completa con los endpoints de plantillas, prueba y marca (AS-06) | 0002 T2, T4, T5 | pendiente | El conteo declarado coincide con `grep` del código |
| BT-30 | Migraciones 26 (`nvarchar` grupo A) y 27 (`IconoGrandeUrl` + SP `UPDATE_BY`) | 0003 T1, T4 / #151, #154 | entregado; producción pendiente | Idempotente en dos corridas seguidas |
| BT-31 | Arnés de contrato: `ClavesPayload` en sus dos copias y payload de FCM/APNs capturado | 0003 T2 / #152 | entregado | Cambiar una copia sola pone la prueba en rojo |
| BT-32 | Paquete de dispositivo 0.14.0: `PoliticaDeImagenRemota`, dos pasadas, logs sin URL | 0003 T6 / #156 | entregado; publicación pendiente (T7) | Tabla de casos de la política en verde |
| BT-33 | Workflow macOS para la extensión iOS de ejemplo | 0003 T10 / #158 | entregado | Job en verde con 0 advertencias |
| BT-34 | Gate `verificar-estructura-panel.py` en CI; `verificar-clases-razor.py` fuera de CI (D-28 0004) | 0004 T5 / #159 | entregado; D-28 pendiente | Rojo provocado y verde asentados |
| BT-35 | Host con `AddInteractiveServerComponents`/`AddInteractiveServerRenderMode`, `blazor.web.js` servido, SignalR detrás del borde e IIS | segundo caso | pendiente de decisión | `_framework/blazor.web.js` responde 200 (hoy 404, ev-03 §2) |
| BT-36 | Revalidación de la sesión en el circuito (RN-42) | segundo caso | pendiente de decisión | Cerrar sesiones desde otra pestaña corta el circuito |
| BT-37 | Pruebas sobre componentes del panel (hoy 0 proyectos de `tests/` referencian `.Web`, ev-03 §4) | segundo caso | pendiente | Al menos una prueba por página migrada |

Ítems diferidos que entran al registro con la forma de `Root-Rules.md` §12.2: D-1…D-12 (0002), PO-1 (subida de imágenes, sin respuesta), D-15…D-25 (0003), D-26…D-33 (0004); cada uno con dueño y evento de cierre tal como ya los declaran sus folios (013 §5 del 0002 y 0003, 016 del 0004). `resumen-sprints` recibe los sprints 13 (EP-13), 14 (EP-14) y 15 (EP-15) como realizados o planificados, sin mover los 1–12.

### Q9 (funcional) — Qué cambia para el operador con Interactive Server

**Páginas alcanzadas: 19 de 22.** Todas las de `Pages/Trabajo/` (14), `Administracion/` (4) y `Cuenta/Perfil` pasan al circuito. **Quedan SSR tres:** `Acceso/Ingresar` (crea la cookie por endpoint: `AuthPanelController.cs:22-32`), `Acceso/PrimeraCuenta` (no hay sesión todavía y postea a un endpoint, `:46-55`) y `NoEncontrada` (estática). **Quedan como endpoints con redirect, no como acciones del circuito, tres flujos que escriben cookie:** login, logout (`:116-119`) y elección de la aplicación en contexto (`PanelContextoController.cs:19-31`). La excepción del login que el PO recuerda es exacta y es la única por **creación** de cookie; las otras dos son de la misma clase por **borrado y escritura** de cookie.

**Lo que el operador ve distinto:**

| Flujo | Hoy (SSR estático) | Con Interactive Server | Se conserva |
|---|---|---|---|
| Toda acción (37 formularios en 15 archivos, ev-03 §4) | POST a endpoint, redirect con `?ok=`/`?error=`, recarga completa y acuse (`AcuseDeAccion.razor:1`) | La acción responde en la misma página sin recarga; el acuse aparece en el lugar | El acuse con `role=status`/`role=alert`; el patrón «redirect y acuse» decidido en 0002 se **reemplaza** y hay que decirlo en C-115 |
| Error de validación en el editor (D-26 0004) | Vuelve con el editor vacío | Conserva lo tipeado | — (lo cierra) |
| Salir con cambios (D-27 0004) | Nadie avisa | Aviso posible con `NavigationLock`; decisión de producto | — |
| Filtro de Aplicaciones, búsqueda `q`, paginación `page/size` | Formularios GET: la URL es el estado | Puede ser instantáneo; **la URL tiene que seguir reflejando el estado** (deep link compartible) | Sí, como US-56 |
| `confirm()` antes de enviar (`Redactar.razor:107`) | Diálogo del navegador | Modal propio | La confirmación previa al envío |
| Menús por fila y modales con foco (0002 T-UI.1) | `details.menu` + `common.js` | Componentes | Foco adentro, trampa, devolución (US-42 CA-09) |
| Vista previa, editor JSON, envío de prueba (ADR-21), editor de segmentos (`segmentos-editor.js`) | Bundles montados por DOM y `CustomEvent` | Mecanismo a definir por el arquitecto | Previa al tipear, JSON validado, contador en vivo `aria-live` (US-42 CA-04) |
| Sesión | Cada request lee la cookie | Estado fijado al abrir el circuito; sin revalidación el cierre remoto no llega (AS-05) | US-41 CA-03 sólo con RN-42 |
| Pérdida de conexión | No existe: cada página es una request | Superposición de reconexión; el estado del circuito **se pierde** si el circuito muere (Microsoft Learn, «ASP.NET Core Blazor state management», learn.microsoft.com/aspnet/core/blazor/state-management) | Hay que decidir si el borrador del editor sobrevive; hoy tampoco sobrevive |

**Lo que no cambia para el operador:** rutas (todas las páginas ya llevan `{AppCode}` en la URL), el menú y sus rótulos, los endpoints de administración (siguen siendo el único lugar donde se escribe), las reglas RN-31…RN-41, la maqueta y el sistema de diseño (R1/R2 del 0004), el login por formulario.

### Q2 (numeración y criterio) — sin «depende»

Categorías que toca una reintegración, en este orden: carta de cambios/acta → CU/RN/RC (02) → VIEW (03) → contrato y ADR (05) → EP/US/BT y sprints (06/07) → ítems diferidos en el registro. Criterio de compromiso: el de `Rules-Backlog-Tecnico.md:170-177` aplicado al destino: 0002 y 0003 agregan filas de épica y sprint (estructural, `v3.0`); 0004 no (enmarcamiento de 03: nueva versión menor de wireframes, sin US). Numeración: consecutiva a la última emitida por familia, sin renumerar ni reutilizar, con el precedente escrito en `product-backlog_v1.0.md:24, 363`.

### Q6 (aplicación al destino) — sin «depende»

El destino no tiene `PRODUCT-INTAKE`; su equivalente del evento de `Rules-Backlog-Tecnico.md:162` es una entrada `C-NN` en `integracion_preacta.md` §21 escrita por el PO. Hasta que existan C-113, C-114 y C-115, el inventario de arriba es propuesta; con ellas, se escribe en el orden de Q2 en un PR por expediente reintegrado. El 0001 sirve de patrón; los 0002–0004 son la primera corrida del comportamiento pedido.

## 4. Solicitudes de convocatoria

| # | Señal | Ubicación | A quién |
|---|---|---|---|
| SC-1 | Los bundles del panel montan por DOM y `CustomEvent` «porque el panel es SSR estático» (ADR-21, `decisiones-arquitectura_v1.0.md:853`); el editor de segmentos vive en `src/<Destino>.Web/wwwroot/assets/segmentos-editor.js`. Con render interactivo el DOM lo reconcilia el circuito y hay que decidir islas JS vs. componentes con interop. No es de mi competencia. | ADR-21; ev-03 §4 (6 módulos, 58 `onclick`) | Arquitecto Blazor |
| SC-2 | El evento que reabre el backlog está atado al `PRODUCT-INTAKE` (`Rules-Backlog-Tecnico.md:164-166`, `Master-Prompt.md:1811`); el destino usa acta + carta `C-NN`. La equivalencia no está escrita en el framework y sin ella la regla no dispara en destinos como éste. | `SDD/Devs/Rules/Rules-Backlog-Tecnico.md:162-169` | Diseño de la norma |
| SC-3 | La regla de conjuntos cerrados (`Rules-Especificacion-Funcional.md:203-207`) no se aplicó a `OrigenMensaje` porque después del handoff ningún audit vuelve a leer 02/05 contra el código: la Fase I actualiza 10 y 11 (`Master-Prompt.md:728-736`). | `SDD/Devs/Orchestrator/Master-Prompt.md:728-736` | Verificación / QA y Diseño de la norma |
| SC-4 | La revalidación de sesión en el circuito (AS-05) y SignalR detrás del borde/IIS son decisiones de infraestructura y seguridad; yo sólo fijé el comportamiento que el operador tiene que conservar. | `src/<Destino>.API/Program.cs:176-183, 218` | Arquitecto Blazor / Seguridad |
