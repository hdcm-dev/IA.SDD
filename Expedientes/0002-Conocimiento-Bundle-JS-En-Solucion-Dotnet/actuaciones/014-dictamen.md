# Actuación 014 — Dictamen

| Campo | Valor |
|---|---|
| Tipo | `providencia` |
| Fecha | 2026-09-13 |
| Autor | Presidente de mesa. **Redacta lo que el jurado aprobó en el folio 013 y no vota.** Lo que agrega por cuenta propia va marcado **[presidente]** |
| Corrige | 011 §1 (severidad de R7 y R10) y 011 §2 (suma X-5), por veredicto de 013 §3 |

> **El dictamen no es norma.** Es la especificación del documento `Knowledge-Bundle-JS.md` que el presidente redacta a continuación en `OUTPUTs/` del tool-prompt, y que la verificación (folio 015) contrasta contra este folio.

---

## 1. El caso, en una línea

El Product Owner pidió conocimiento reutilizable para que agentes de IA diseñen, contraten, integren, diagnostiquen y evalúen un bundle JavaScript dentro de una solución .NET con Blazor, con dos PoC. **La mesa concluye** que el formato de `Rules-Base-Conocimiento.md` admite **un** documento `propio` que caracteriza **la costura** entre el proyecto del bundle y la biblioteca de clases Razor, con sus dos anfitriones de verificación. La metodología que el pedido nombra entra como **procedimiento de cambio del contrato** y **matriz de diagnóstico**, no como método del framework (013 R-02).

## 2. Correcciones a la consolidación

| Qué | Antes (011) | Ahora | Voto |
|---|---|---|---|
| Severidad de R7 (composición) | S2 | **S1** | 013 §3, 5-0 |
| Severidad de R10 (verificabilidad) | S3 | **S2** | 013 §3, 5-0 |
| Contradicción X-5 | no elevada | **La prohibición de copia rige para el anfitrión mínimo y para toda copia mantenida a mano o versionada; la salida que el único generador emite o copia en el mismo comando, ignorada por el control de versiones, es forma válida** | 013 §4, 5-0 |
| Asimetría de la consolidación | — | Constatada: las rebajas recayeron sobre hallazgos contra el documento de entrada. Corrección estructural: el documento de entrada se retira como insumo (§3, P-1) | 013 §3 |

## 3. Qué dice el documento, sección por sección

Cada fila es el contenido obligatorio; la verificación de 015 la recorre una por una.

| Sección | Contenido que el dictamen fija | Fuente del voto |
|---|---|---|
| Cabecera | `Alias: Bundle-JS` · `Naturaleza: propio` · `Consumidor: 05, 08, 09, 10` · `Condicion-de-carga`: un proyecto de código de ecosistema JavaScript cuyo artefacto carga un proyecto .NET con interfaz Blazor, **por insumo de construcción o dentro del mismo proyecto de código** (dispara con F1 y F2; sin render mode) · `Hereda-de: —` · `Sustituye: —` · `Compatible-con: Rules-Base-Conocimiento.md 2.2` | P-14, R-04, R-07, R-10 |
| §0 | Una oración de artefacto; **oración método/artefacto** para el PO; definición operativa de R2 (afuera lo que el framework anfitrión genera o nombra; adentro lo interno del bundle, de la RCL, de cada anfitrión y el contrato); **tabla de equivalencias** de vocabulario SDD; afuera con destino: estructura de solución y ubicación de PoC, NuGet, F3 (paquete publicado), API de terceros con clave (E-3), dominio del ejemplo, maqueta de la Fase B2, spike; excepción de techo por §5; declaración de ofuscación | P-2, P-3, R-02, R-07, E-3, P-15, P-16 |
| §1 | Identidad y **vocabulario E-1**: *bundle* (artefacto agnóstico del anfitrión), *`main.js`* o **capa de interop** (segundo artefacto de la misma construcción, único que conoce `invokeMethodAsync`), *punto de entrada* (uno por artefacto), *guion anfitrión* (script de cada PoC, no es artefacto); supuestos: Interactive Server verificado, WebAssembly y Auto no verificados (una línea); Node requisito de construcción; versión del SDK .NET con que se midió el registro de estáticos | P-4, E-1, P-8, R-10 archivado, R-13 |
| §2 | Piezas por rol y arista; **F2 primero, F1 como variante con su delta**, criterio de elección en §4; layout interno del bundle y de la RCL; los dos anfitriones como piezas; qué se versiona y qué no | P-5, X-1, P-12, P-10 |
| §3 | Contrato (doble declaración, nombres camelCase y de qué dependen, una regla de ausencia, `version` que se compara, callback literal de los dos lados, superficie exportada = contrato); **procedimiento de cambio coordinado**; la costura **se verifica sólo en ejecución**; ciclo de vida e interop; obligaciones del anfitrión; cadena de construcción como **propiedad y síntoma** (registro de estáticos en el primer build), modo nombrado donde falta la cadena; **fixture**: la PoC Blazor captura, la PoC HTML y la batería lo consumen | P-6, R-02, R-11, P-7, R-09, P-8, P-9, R-13 |
| §4 | Bifurcaciones resueltas con alternativa nombrada: F2/F1; dos artefactos/un módulo (E-1); servida/sin servidor con el comando de la global (E-2) y la decisión contraria del producto de origen citada; cadenas/`enum`; TypeScript/JavaScript plano con su costo en una fila; `CustomEvent` como salida adicional; instancias por contenedor/`IJSObjectReference` con el criterio correcto; empaquetador mínimo; pruebas junto a la fuente o aparte | E-1, E-2, R-11, R-12, R-14, P-11 |
| §5 | Esqueletos ofuscados: `package.json` con dos entradas; `tsconfig`; contrato en los dos lenguajes; bundle con registro por contenedor; `main.js`; envoltorio Razor; `.csproj` generador F2 (con la receta del registro rotulada con el SDK); doble del consumidor y `index.html` de la PoC HTML; página mínima de la PoC Blazor **reducida a lo que captura el viaje**; prueba sin anfitrión que consume el fixture | Forma mínima 1-8, R-08 |
| §6 | Criterios `[enumerable]` **sobre la costura**, con comando; `[interpretativo]` con proxy; **aserción mínima de la PoC Blazor = viaje de ida y vuelta** (DTO enviado, acuse recibido íntegro); matriz de diagnóstico por combinación de instrumentos; tabla síntoma → causa → dónde mirar. **Ningún** `comando`/`criterio_aceptacion`/`VER-` de sample | P-13, R-08, H-N2-03 |
| §7 | Anti-patrones con síntoma, causa y corrección; **dos filas separadas** para copia a mano (anti-patrón) y salida del generador (válida); los que no tienen síntoma en una fila «otros» salvo el bundle versionado | P-15, X-5, forma mínima 7 |
| §8 | Frontera: `Rules-Examples.md` §3.6, `Intake-Rules.md` §4, `Rules-Devops.md` §4.9 punto 4, §14 del intake, forma del sample del destino; **clase de contrato**: de compilación por el grafo, verificada en ejecución (hueco declarado); en `web-monolith` la 05 no obliga a documentarla; el DOM del bundle está sujeto al **método de accesibilidad del destino**; «si el framework las incorpora, manda el framework» | P-15, R-03, R-15 |
| §9 | Índice de la base que lo aloje; hermano `Template-Blazor-Interactive-Server-SDD-Default`; los dos precedentes ofuscados; **fila de índice propuesta** y adopción en tres pasos | P-14, P-15 |
| §10 | Control de cambios 1.0 | — |

**Techo** (P-16): `total − §5 ≤ 600` con la excepción declarada en §0; el documento no se parte (X-3).

## 4. Deuda declarada

| Id | Qué se acepta | Motivo | Se revierte si |
|---|---|---|---|
| D-1 | **E-1**: dos artefactos de la misma construcción | Lo dice `ev-05` cuatro veces | El PO elige un solo módulo: se fusionan dos filas de §2 y dos esqueletos |
| D-2 | **E-2**: PoC HTML servida, módulo ES único | Elección técnica dentro de §3.6 | El PO pide apertura sin servidor: la global ya está en §4 con su comando |
| D-3 | **E-3**: API de terceros con clave, afuera | Sin anclas | El PO la incluye: documento hermano con Seguridad convocada |
| D-4 | **P-1**: el documento de entrada queda en 0.2, superado por 13.16 | Sin autorización para escribir en `INPUTs/` | El PO lo reescribe; lista de secciones en §6 |
| D-5 | **R-10**: WebAssembly y Auto como supuesto no verificado | El intake no tiene campo de render mode | Un destino con ese campo |
| D-6 | Accesibilidad no convocada | La remisión de §8 alcanza mientras el documento no fije foco ni teclado | 015 encuentra que los fija |

## 5. Escalada pendiente

`ESC-001` (013 §8), con la recomendación B de la mesa. **[presidente]** El Product Owner aportó antes del veredicto que Lab-Geometria es público y aceptado; sobre <F1> no respondió todavía. **Default aplicado:** el expediente no se confirma ni se publica; nada de este folio ni del documento depende de la respuesta.

## 6. Observaciones al Product Owner, sin corregir

Se entregan en la respuesta de la sesión, **fuera del expediente** (013 P-17), y acá sólo se enumeran por clase:

| Clase | Qué | Folio de origen |
|---|---|---|
| Framework (P-18) | `Relevar-Conocimiento.md` no existe; `Index-Knowledge.md` declara compatibilidad 2.0 contra una regla 2.2; dos documentos publicados sin declaración de ofuscación; `Tema` del documento Blazor difiere entre cabecera e índice; `Rules-Base-Conocimiento.md` §9.2 evalúa la condición contra un D8 que un proyecto de código no tiene | 004 |
| Documento de entrada (P-1) | Superado por 13.16 en §2.3, §4 obs. 2 y 3, §5, §6, §8.2 a §8.4, PA-01, PA-02 y PA-04 | 003, 005, 006, 008 |
| Producto de origen (P-17) | Siete afirmaciones sin respaldo y el defecto de registro de estáticos, con su nombre | 007, 008, 009, 010 |

## 7. Bloque de cierre

```yaml
cierre:
  version_final: Knowledge-Bundle-JS.md 1.0 (a verificar en 015)
  ciclos_ejecutados: 1
  panel:
    convocados: [N1: 7 hallazgos, N2: 7, N3: 7, V1: 7, V2: 7, V3: 7, AH-1: 5, AH-2: 5, refutador: 16 ataques (15 proceden)]
    descartados: [Datos y dominio: cubierto por V2, Seguridad: E-3 afuera, Formal: sin umbrales, Rendimiento: sin volumen, Accesibilidad: remisión en §8 (D-6)]
    ad_hoc: [AH-1: forma del bundle y E3 de la segunda superficie, AH-2: costura .NET-JS y justificación inexacta del índice]
    postergados_por_cupo: []
    aporte_nulo: []
  hallazgos: { detectados: 52, raíces: 13, ataques: 16, procedentes: 15, parches: plan de 18 decisiones (3 aplicar, 14 mejorar, 1 no aplicar) }
  deuda_declarada: [D-1, D-2, D-3, D-4, D-5, D-6]
  escaladas_pendientes: [ESC-001]
  capas_a_revalidar: [documento de entrada 0.2 (del PO), precedente <F1> (del PO)]
```

Sigue: redacción del documento en `OUTPUTs/` y verificación · presidente de mesa
