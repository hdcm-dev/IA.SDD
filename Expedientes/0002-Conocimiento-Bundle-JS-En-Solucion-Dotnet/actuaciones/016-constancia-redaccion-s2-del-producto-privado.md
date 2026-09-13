# Actuación 016 — Constancia: redacción S2 del producto privado y del host, antes del primer push

| Campo | Valor |
|---|---|
| Tipo | `constancia` |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa, a pedido del Product Owner |
| Corrige | 002 (y 003 a 015, README y piezas de `evidencia/`, por la misma redacción) |

> **Por qué este folio existe.** El folio 013 §8 elevó `ESC-001`: el expediente nombraba un producto privado del cliente —su repositorio, sus proyectos, sus componentes, sus rutas— y `IA.SDD` es público. El default aplicado en 014 §5 y 015 §5 fue no confirmar ni publicar. El Product Owner respondió hoy; este folio asienta la respuesta y lo que se hizo con ella. Se escribe con la forma provisoria del expediente y con la línea `Redacción S2:` que `Expediente-Rules.md` 1.0 §4 exige, para que A7 tenga contra qué evaluar.

---

## 1. Respuesta del Product Owner a `ESC-001`

| Campo | Valor |
|---|---|
| Fecha | 2026-09-13 |
| Medio | Sesión de trabajo con el orquestador; respuesta cerrada a la pregunta de 013 §8 |
| Decisión | **Opción B**: ofuscar el producto privado en el expediente antes de publicar. Confirma además que la copia `Conocimiento/Knowledge-Bundle-JS.md` que había quedado suelta en el árbol del framework **no se cataloga**: se retira sin commitear, como pidió `ev-05` y como declara §9 del documento |

Con eso `ESC-001` queda **resuelta**, y el expediente pasa a publicable. Nada del documento `Knowledge-Bundle-JS.md` 1.0 cambia: ya estaba ofuscado por R4 (002 §2).

## 2. Qué se redactó

Redacción S2: actuaciones/002-providencia-convocatoria-de-mesa.md, actuaciones/003-informe-requisitos.md, actuaciones/004-informe-verificacion.md, actuaciones/005-informe-lector-sin-contexto.md, actuaciones/006-informe-arquitectura-integracion.md, actuaciones/007-informe-contrato-js-dotnet.md, actuaciones/008-informe-cadena-de-construccion.md, actuaciones/009-informe-ingenieria-del-bundle.md, actuaciones/010-informe-interop-blazor.md, actuaciones/012-refutacion-del-plan-compuesto.md, actuaciones/013-veredicto-del-jurado.md, actuaciones/014-dictamen.md, README.md, evidencia/ev-01-base.out, evidencia/ev-01-base.sh, evidencia/ev-02-citas.sh, evidencia/ev-03-precedente.out, evidencia/ev-03-precedente.sh, evidencia/ev-04-input.out, evidencia/ev-04-input.sh, evidencia/ev-06-chequeo-mecanico.sh, evidencia/ev-08-registro-de-estaticos.md, evidencia/ev-10-esqueletos-de-punta-a-punta.md, evidencia/ev-11-formato-del-documento.out, evidencia/ev-11-formato-del-documento.sh, evidencia/ev-07-cartas-despachadas/00-encargo-comun.md, evidencia/ev-07-cartas-despachadas/01-N1-requisitos.md, evidencia/ev-07-cartas-despachadas/02-N2-verificacion.md, evidencia/ev-07-cartas-despachadas/03-N3-lector-sin-contexto.md, evidencia/ev-07-cartas-despachadas/04-V1-arquitectura-integracion.md, evidencia/ev-07-cartas-despachadas/05-V2-contrato-consumidor.md, evidencia/ev-07-cartas-despachadas/06-V3-operacion-entrega.md, evidencia/ev-07-cartas-despachadas/07-AH1-ingenieria-de-bundle.md, evidencia/ev-07-cartas-despachadas/08-AH2-interop-blazor.md, evidencia/ev-07-cartas-despachadas/09-refutador.md, evidencia/ev-07-cartas-despachadas/10-jurado.md, evidencia/SHA256SUMS, evidencia/ev-07-cartas-despachadas/SHA256SUMS

Sustitución literal, de la forma más específica a la más genérica, sobre todo archivo del expediente. Los marcadores y lo que reemplazan, **descriptos y no transcriptos**:

| Marcador | Clase S2 | Qué reemplaza |
|---|---|---|
| `<repo-privado-F1>` | Dato de un repositorio privado | La ruta completa del repositorio del producto en el host, y su forma relativa a la carpeta de repositorios privados |
| `<F1>` | Dato de un repositorio privado | El nombre del repositorio y del producto, solo o como prefijo de solución, de proyectos (`<F1>.Web`, `<F1>.Domain`, `<F1>.sln`), de la maqueta (`<F1>-Web`) y de su carpeta `SDD` (`<F1>-SDD`). Es el mismo `F1` con que el documento y 014 nombran al primer precedente |
| `<Componente>` / `<componente>` | Dato de un repositorio privado | El nombre del componente del producto, en sus formas Pascal, kebab y minúscula: proyecto RCL (`<F1>.<Componente>`), nombre global del bundle, archivos `ts/<componente>.ts` y `wwwroot/<componente>.js`, documento de contrato `Contratos-Abstractions-<F1>-<Componente>.md` |
| `<prefijo-css>` | Dato de un repositorio privado | El prefijo de clases CSS del componente |
| `<repos-privados>` | Dato de un repositorio privado | La carpeta del host que agrupa los repositorios privados de ese hardware |
| `<workspace>` · `<home>` · `<scratchpad>` · `<usuario>` | Dato del entorno | La ruta del directorio de trabajo del host con su usuario, el directorio personal, la carpeta temporal de la sesión, y el usuario del host en la salida de `ls -l` (`ev-08`) |

**Lo que no se redactó, a propósito.** Los nombres de archivos internos que no llevan el nombre del producto (`DiagramaDeCabecera.razor`, `MapaDelEquipo.razor`, `ts/recorrido.ts`, los `ADR-00042`/`00043`), los números de línea citados y las cifras medidas: son **concepto y evidencia del relevamiento**, no identidad ni infraestructura, y sin ellos los informes 003 a 010 dejan de poder leerse. `Lab-Geometria` no se toca: público por declaración de su dueño (0001 folio 019). Los repositorios `IA.SDD` e `IA.SDD.Documentacion` son públicos y se nombran.

**Efectos colaterales, declarados.** (a) La lista de términos de R-N2-03 (004 §2) quedó redactada sobre sí misma: sus primeros ítems se leen ahora como marcadores. (b) Los guiones `ev-01`, `ev-02`, `ev-03`, `ev-04`, `ev-06` y `ev-11` llevan rutas con marcadores y **ya no corren tal cual**: quien los reproduzca reemplaza `<workspace>` y `<repo-privado-F1>` por sus rutas. Es el costo que 013 §8 opción B anticipó: «las citas pierden verificabilidad directa para un tercero». (c) Las salidas `.out` se redactaron a mano sobre el texto y no se regeneraron: la corrida original es la del 2026-09-13 sobre la base de la carátula.

## 3. Huellas

Antes: las del manifiesto previo a la redacción. Después: las del manifiesto regenerado en este folio. Doce caracteres.

| Pieza | Antes | Después |
|---|---|---|
| `evidencia/ev-01-base.out` | `b1fdc7a4cce0…` | `293c4f81e5d9…` |
| `evidencia/ev-01-base.sh` | `9bb80db3c1d4…` | `59b0065439a1…` |
| `evidencia/ev-02-citas.sh` | `cfe9a2e81987…` | `ba0fb132ac6b…` |
| `evidencia/ev-03-precedente.out` | `f5e25fb41e5b…` | `15b409c5a360…` |
| `evidencia/ev-03-precedente.sh` | `dcc8311aa4c4…` | `bee504c8ac2a…` |
| `evidencia/ev-04-input.out` | `894df35da476…` | `825e22d036b0…` |
| `evidencia/ev-04-input.sh` | `6e08572a5974…` | `7712aca64f51…` |
| `evidencia/ev-06-chequeo-mecanico.sh` | `dd96b4666566…` | `84acb1dc3ca0…` |
| `evidencia/ev-08-registro-de-estaticos.md` | `f1ad2739374b…` | `715150fbe2f6…` |
| `evidencia/ev-10-esqueletos-de-punta-a-punta.md` | `52cfb71eb177…` | `85aa352620db…` |
| `evidencia/ev-11-formato-del-documento.out` | `2d74f7c43d98…` | `c7592906499d…` |
| `evidencia/ev-11-formato-del-documento.sh` | `82f9738040d7…` | `44a8167da5f9…` |
| `evidencia/ev-07-cartas-despachadas/00-encargo-comun.md` | `3dbc81ff1485…` | `2d48e76790fb…` |
| `evidencia/ev-07-cartas-despachadas/01-N1-requisitos.md` | `67902c6bd715…` | `acc08ae9187b…` |
| `evidencia/ev-07-cartas-despachadas/02-N2-verificacion.md` | `d0cdfeb95e9e…` | `2b111318d134…` |
| `evidencia/ev-07-cartas-despachadas/03-N3-lector-sin-contexto.md` | `de1e62bd99cf…` | `c993788f01ed…` |
| `evidencia/ev-07-cartas-despachadas/04-V1-arquitectura-integracion.md` | `bee008ceb7cd…` | `0a9c7bb5adc0…` |
| `evidencia/ev-07-cartas-despachadas/05-V2-contrato-consumidor.md` | `a7e91989cdab…` | `db2ae786479a…` |
| `evidencia/ev-07-cartas-despachadas/06-V3-operacion-entrega.md` | `e0f8a66d9574…` | `1f18de9dda84…` |
| `evidencia/ev-07-cartas-despachadas/07-AH1-ingenieria-de-bundle.md` | `64cf0bba89b7…` | `07f123c44044…` |
| `evidencia/ev-07-cartas-despachadas/08-AH2-interop-blazor.md` | `89c176701a7d…` | `1aea33a44d8c…` |
| `evidencia/ev-07-cartas-despachadas/09-refutador.md` | `70f2c10df631…` | `098b45cbac81…` |
| `evidencia/ev-07-cartas-despachadas/10-jurado.md` | `9ff13d02f937…` | `76a02abca6ee…` |

Las actuaciones 002 a 015 y el `README.md` **no tenían huella asentada** antes de la redacción —la forma provisoria no las manifestaba— y no la tienen ahora: se corrigieron en el árbol de trabajo, antes de su primer commit, y el original **no queda custodiado en ningún lugar**. Se declara porque §4 S1 pide decir dónde queda, y la respuesta es «en ningún lado»: no había versión publicada que retirar ni copia previa que guardar.

## 4. Qué comprueba

`evidencia/ev-12-ofuscacion.sh` → `ev-12-ofuscacion.out`: cero rutas o usuario del host en cualquier codificación, y el recuento de cada marcador. El barrido de los términos del producto se corrió con la lista de R-N2-03 **antes** de que esa lista quedara redactada, y dio cero; el guion no lleva esos términos porque llevarlos los publicaría. Los dos manifiestos verifican: `sha256sum -c SHA256SUMS` desde `evidencia/` y desde `ev-07-cartas-despachadas/`.

## 5. Estado del caso

| | |
|---|---|
| Deuda declarada | D-1 a D-6 (014 §4), sin cambios |
| Escalada | `ESC-001` **resuelta** por el Product Owner, opción B |
| Forma del expediente | Provisoria (carátula de cinco campos, cabecera con tipo entre comillas invertidas, evidencia sin las tres líneas de A9 en las piezas anteriores a este folio). `Expediente-Rules.md` 1.0 (13.18) se publicó después de abierto este expediente; su migración a la forma normada es un folio posterior, no éste |
| Publicación | Con este folio el expediente se confirma en `main` de `IA.SDD` |

Sigue: migración del expediente a la forma de `Expediente-Rules.md` 1.0, o `archivo` con motivo · presidente de mesa
