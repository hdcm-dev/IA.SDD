| Campo | Valor |
|---|---|
| Tipo | providencia |
| Fecha | 2026-09-16 |
| Autor | Presidente de mesa (orquestador de la sesión): convoca, consolida, **no vota** |
| Corrige | — |

# Convocatoria de mesa: contrato de entrada, base mecánica y panel

## 1. Contrato de entrada

**PEDIDO (literal):** actuación 001.

**CLASE DE OBJETO:** diseño de una norma (Mesa-De-Expertos-A-Pedido §2.2): las comisiones citan fuentes externas con nombre y no inventan cláusulas; el refutador ataca el costo de aplicarla. Con una pieza de **investigación de un defecto**: el caso medido del destino (evidencia ev-01).

**OBJETO:** `IA.SDD` `main` `b8943c2` (13.19): `Master-Prompt.md` (Fase I, §13), `Master-Prompt-Reanudacion.md` (§3.1, §4), `Mesa-Rules.md` (§6.7), `Expediente-Rules.md` (§5), `Rules-Backlog-Tecnico.md` (§3.6), `Root-Rules.md` (§12.2), `Conocimiento/Knowledge-Mesa-De-Expertos-A-Pedido.md` (§2.1 paso 10). Y el destino privado como caso: cuatro expedientes cerrados, uno reintegrado y tres no.

**OBJETIVO:** que todo cambio que un destino introduce después del handoff —por mesa, por expediente o por pedido directo— vuelva a la especificación (01–03, 05), al backlog funcional y técnico (06) y al acta o intake, con identificadores consecutivos a los planificados; y que ese comportamiento sea de los orquestadores del framework, no de la memoria de un agente.

**PREGUNTAS DEL CASO**

| # | Pregunta |
|---|---|
| Q1 | ¿Qué cláusulas del framework ya gobiernan la retroalimentación (Fase I, el evento de `Rules-Backlog-Tecnico.md` §3.6, `Expediente-Rules.md` §5, `Mesa-Rules.md` §6.7, Reanudación §4) y por qué no actuaron en el caso: falta de norma, norma sin disparo, o norma no aplicada? |
| Q2 | ¿Qué tiene que garantizar como mínimo una «reintegración»: qué categorías toca (CU/RN, VIEW, ADR, US/BT, acta o intake, ítems diferidos), con qué criterio se distingue un cambio que altera el compromiso de uno de nomenclatura, y cómo se numeran los ítems (consecutivos a los planificados, sin renumerar)? |
| Q3 | ¿Dónde vive la regla y qué prompts orquestadores cambian: el cierre de la mesa (§6.7), el cierre del expediente, la Fase I del master-prompt, la reanudación, la mesa a pedido? ¿Qué versión del framework sube y con qué compatibilidad hacia atrás? |
| Q4 | ¿Cómo se verifica mecánicamente que la reintegración ocurrió (una compuerta o un criterio de audit: todo expediente cerrado que cambió comportamiento está citado desde 02 o 06; la reanudación lista los no reintegrados)? |
| Q5 | ¿Cuánto cuesta y cómo se evita la ceremonia que nadie completa (anti-patrón §7 de la mesa a pedido)? |
| Q6 | ¿Cómo se aplica al destino que originó el caso (sus expedientes 0002–0004) y a destinos que no siguen el estándar completo (sin `PRODUCT-INTAKE`, con acta y carta de cambios propias)? |
| Q7 | ¿Qué dicen la industria y la academia sobre el control de cambios y la trazabilidad de la especificación en desarrollo incremental (con fuente)? |

**RESTRICCIONES DURAS:** R1 no se reescribe lo publicado (Expediente-Rules §5.1); R2 un cambio a una regla lleva su fila de control de cambios y sube la versión del framework (`CHANGELOG.md`); R3 el conjunto normativo se cita, no se duplica: la regla vive en un solo lugar y los orquestadores la invocan; R4 S2: el destino privado se nombra por su rol y sus rutas se ofuscan en lo que se escriba en el framework; R5 nada que exija una herramienta concreta de orquestación.

**DECISIONES CERRADAS:** el modelo de tres repositorios; que `Conocimiento/` no es normativo; la escala P0–P3; la forma del expediente (13.18); la condición de convocatoria de la mesa (§0.0); la Fase I como tramo re-ejecutable.

**FUERA DE ALCANCE:** rediseñar la mesa o el expediente; el pipeline de generación (Fases A–H); herramientas.

**MEDIOS:** el árbol del framework (lectura y `git grep`); el árbol del destino privado (lectura y `git grep`, sólo para medir el caso); fuentes externas citables. Sin observar: otros destinos del framework.

**EXPEDIENTE:** `Expedientes/0003-Retroalimentacion-De-La-Especificacion-Ante-Cambios/`.

**QUIÉN APLICA:** la mesa (el presidente como implementador), por designación del Product Owner («evalua, planifica, y comenza»), con pedido de fusión propio en el framework y la primera aplicación en el destino.

**PRESUPUESTO:** 7 hallazgos por comisión; un ciclo.

**DESPACHO VERIFICADO:** ev-01 (alcance de cada expediente del destino sobre `docs/`), ev-02 (cláusulas vigentes con línea).

## 2. Base mecánica (ev-01, ev-02)

1. En el destino, el expediente 0001 está citado desde 15 documentos de `docs/` (glosario, CU-03, reglas de negocio, flujo y wireframes, contratos, ADR, **product-backlog**, plan de pruebas, devops, guía, deuda). El 0002 desde 4 (arquitectura, contratos, ADR, deuda). El 0003 desde 4 (contratos, ADR, guía MAUI, deuda). El 0004 desde 1 (una hoja de estilos de la maqueta). Ninguno de los tres últimos toca `product-backlog` (2.5, 2026-09-14), `backlog-tecnico` (2.3), `especificacion-funcional` (1.8), `reglas-negocio` (1.6) ni `wireframes` (3.3): todos anteriores a los 18 pedidos de fusión de los expedientes 0002–0004 (#141–#160, 2026-09-15/16).
2. El framework ya declara: Fase I del `Master-Prompt.md` (línea 728) que actualiza **10 y 11** por incremento, no 01–06; `Rules-Backlog-Tecnico.md:162` un evento —la entrada de control de cambios del Product Owner en el intake— que reabre backlog y roadmap; `Expediente-Rules.md:304` que «la evidencia funda la especificación» y que la fila de control de cambios del artefacto normal nombra el expediente; `Mesa-Rules.md:491` §6.7 el bloque de cierre, sin paso de reintegración; `Knowledge-Mesa-De-Expertos-A-Pedido.md:81` el paso 10 «Cierre» con deuda y preguntas, sin backlog.
3. El destino no tiene `PRODUCT-INTAKE`: tiene `Context/acta_proyecto.md` y una carta de cambios `C-NN`; su norma propia vive en `Prompts/`.

## 3. Composición

| Rol | Tipo | Señal |
|---|---|---|
| Consultor de documentación del framework | núcleo (diseño de norma) | inventariar y verificar cada cláusula que ya habla de cambios posteriores al handoff (Q1) |
| Perito del caso | núcleo (investigación) | medir en el destino qué se reintegró y qué no, expediente por expediente y categoría por categoría (Q1, Q6) |
| Requisitos de la reintegración | núcleo | qué garantiza el mínimo y con qué criterio de compromiso (Q2) |
| Diseño de la norma (implementador ingenuo del framework) | núcleo | dónde va la regla, qué prompts cambian, versión y compatibilidad (Q3, Q5) |
| Verificación / QA | núcleo | compuerta o criterio de audit que detecte lo no reintegrado (Q4) |
| Metodología (industria y academia) | variable | el pedido pide diseñar una norma: control de cambios y trazabilidad con fuentes (Q7) |
| Abogado del diablo | núcleo, último | ataca por evidencia y por costo de aplicación |

Descartados: UX, seguridad, rendimiento (sin señal); arquitectura de herramientas (R5).

## 4. Despacho

A ciegas y en paralelo, con el pedido literal, este contrato y las dos evidencias. El refutador entra último. Los informes se asientan verbatim como folios 003 en adelante.

Sigue: comisiones · presidente de la mesa
