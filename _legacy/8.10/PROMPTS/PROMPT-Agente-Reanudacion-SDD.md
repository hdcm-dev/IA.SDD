# Prompt de entrada — Agente de Reanudación SDD

> **Invocación**:
> - `Leer y Ejecutar /IA/SDD/IA.SDD/PROMPTS/PROMPT-Agente-Reanudacion-SDD.md en el repositorio: /<Repositorio-Destino>`

**Archivo:** `PROMPT-Agente-Reanudacion-SDD.md`
**Versión:** 1.0
**Idioma:** Español rioplatense neutro técnico
**Modo de ejecución:** Local en Claude Code, en una sesión sin memoria de las anteriores
**Resultado esperado:** El estado del destino reconstruido desde el árbol, sus divergencias declaradas, y una decisión del humano sobre cómo continuar

---

## 0 · Qué es este prompt

Este es el **prompt de entrada de la reanudación**: se usa cuando alguien vuelve a un destino y **no
sabe en qué estado quedó**, o cuando la sesión anterior terminó y hay que seguir desde cero.

Es el tercero de los tres prompts de entrada, y el único que **no ejecuta trabajo sobre el destino**:
lo diagnostica y despacha al que corresponda.

| Prompt de entrada | Cuándo | Cardinalidad |
| --- | --- | --- |
| `PROMPT-Agente-Bootstrap-SDD.md` | El destino no tiene documentación | Una vez por producto |
| `PROMPT-Agente-Migracion-SDD.md` | El destino está desfasado y se decidió migrar | Una vez por salto de versión |
| **`PROMPT-Agente-Reanudacion-SDD.md`** | **No se sabe en qué estado está** | **Una vez por reanudación** |

**Cuándo usar éste y no los otros dos.** Cuando la respuesta a «¿cuál corro?» **es la pregunta**. Los
otros dos se invocan con la decisión ya tomada; éste existe para tomarla con el estado a la vista.

**Y una respuesta que conviene anticipar: con frecuencia no corresponde ninguno de los dos.** Un
destino con su documentación generada y su código a mitad de camino no necesita ni generar ni migrar:
necesita construir. Es la salida D del orquestador, y la que más se pasa por alto porque es la única
sin prompt propio.

## 1 · Modelo de dos repositorios

El mismo que declaran los otros dos prompts de entrada: el repositorio del framework en **solo
lectura**, el repositorio destino donde se lee y —sólo para el informe de estado— se escribe.

## 2 · Prerrequisitos verificables

| # | Prerrequisito | Cómo se verifica |
| --- | --- | --- |
| 1 | El repositorio destino existe y es accesible | Se lista su raíz |
| 2 | Tiene una carpeta `SDD/` | Si no la tiene, **no hay nada que reanudar**: corresponde el prompt de bootstrap |
| 3 | El repositorio del framework es accesible en solo lectura | Se lee la cabecera de su `CHANGELOG.md` |

**No hay prerrequisito de conocer el estado anterior**, y es el punto: si hiciera falta saber dónde
se quedó, este prompt no serviría para lo que existe.

## 3 · Invocación del orquestador

Leer y ejecutar `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` del repositorio del framework,
con el repositorio destino como objetivo.

El orquestador declara sus fases —**R0** reconocimiento, **R1** presentación, **R2** salidas, **R3**
informe— y sus dos detenciones obligatorias. Este prompt no las repite.

## 4 · Qué esperar al terminar

- Un **informe de estado** en `SDD/Docs/Audit/Estado-Del-Destino-<AAAA-MM-DD>.md`, con las seis
  dimensiones resueltas y las divergencias declaradas.
- Una **decisión tuya** entre cuatro salidas: reparar las divergencias primero, migrar a la vigente,
  seguir en la versión declarada, o continuar la construcción.
- **Ningún cambio en el destino** fuera de ese informe.

**Si el estado tiene divergencias, la primera decisión no es cuál orquestador correr**: es si lo que
el árbol dice sobre sí mismo es cierto. El orquestador las presenta antes que las salidas por ese
motivo.

## 5 · Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-16 | Emisión inicial. Tercer prompt de entrada del método, para retomar un destino desde una sesión sin memoria. Declara la tabla de los tres prompts con su cardinalidad, y anticipa que la salida más frecuente —continuar la construcción— es la única sin prompt propio. |
