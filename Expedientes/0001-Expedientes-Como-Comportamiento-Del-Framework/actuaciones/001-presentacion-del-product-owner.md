# Actuación 001 — Presentación del caso

| Campo | Valor |
|---|---|
| Expediente | `0001` — Expedientes como comportamiento del framework |
| Folio | 001 |
| Tipo | `presentacion` |
| Fecha | 2026-09-13 |
| Autor | Product Owner del `Framework SDD` |
| Asentada por | Orquestador de la corrida (Claude Opus 5), por transcripción literal |
| Fuente | Encargo del Product Owner a la corrida, del 2026-09-13 |

> **Esta actuación no se reescribe.** Una corrección, una aclaración del Product Owner o una
> interpretación posterior entran como actuación nueva, con su folio.

---

## 1. La presentación, literal

Tres pasajes, en el orden en que el Product Owner los formuló. **Se transcriben sin editar**, incluidas
las marcas de formato del original.

### 1.1 El caso

> *«Vamos a adoptar como parte del `Framework SDD` que los expedientes y casos que se armen se documenten
> de forma sistemática dentro de lo que sería `<repo>/SDD/Expedientes`, donde cada caso se vaya
> numerando, y dentro se ubique un README.md que describa el caso tratado, tal como se hacen en los
> juicios, mesas o comisiones de investigaciones, partiendo de informes que presentan el caso y luego se
> va expedientando todo su tratamiento — eso quiero que sea parte del comportamiento del `Framework SDD`
> — de esta manera, las pruebas que aporte yo o las que obtuviesen los agentes quedarían como parte de
> las especificaciones — arreglá esa idea y mejorala en base a los estándares de la industria y la
> academia.»*

### 1.2 Dónde se está parado

> *«Acordate en saber dónde estás parada — para el caso de migrar `Lab-Geometria`, llevá tus expedientes
> dentro de una carpeta numerada en `/PROG2/Geometria/Lab-Geometria/SDD/Expedientes` — ahora si
> planteaste una mesa en `IA.SDD`, llevá su expediente de reportes `/IA/SDD/IA.SDD/Expedientes` de igual
> manera con su caso en una carpeta numerada.»*

### 1.3 Ante un problema

> *«Cuando te encuentres con un problema, en vez de pararte, armá una mesa adecuada para llegar a una
> conclusión, evaluá realmente si necesitás preguntarme algo o es una mala interpretación analizando todo
> el conjunto del problema.»*

---

## 2. Lo que el encargo de la corrida agrega a la presentación

El encargo que convoca esta corrida lleva, además de la presentación, **tres precisiones del
orquestador de la sesión** que no son del Product Owner y se asientan separadas para no confundir su
autoridad:

1. **Las dos carpetas `Expedientes` existen y están vacías.** Verificado en `evidencia/ev-01-base.out`:
   `IA/SDD/IA.SDD/Expedientes` y `PROG2/Geometria/Lab-Geometria/SDD/Expedientes`, cero entradas cada una.
   **La verificación encontró una tercera** que ni la presentación ni el encargo nombran:
   `IA/SDD/IA.SDD.Documentacion/Expedientes`, también vacía. Se registra y no se interpreta (ver
   actuación 002, §6).
2. **En el repositorio del framework el expediente va en la raíz** (`IA.SDD/Expedientes/`) y no en
   `SDD/Expedientes`, porque `SDD/` es el conjunto normativo y se copia entero a `_legacy/<versión>/`.
   **El encargo pide verificarlo y decidirlo en la mesa, no heredarlo.** Queda como pregunta de la mesa.
3. **La norma no se modifica en esta corrida**: otra corrida migra un destino contra la 13.16, y los
   cambios quedan como plan para una intervención posterior (`PROMPTs/Fixs/09`).

## 3. Lo que la presentación pide, enunciado por el orquestador

**Esto es interpretación y no presentación.** Se escribe para que la mesa tenga un objeto delimitado;
si una comisión la encuentra mal, la corrige una actuación posterior.

| # | Pedido | Pasaje |
|---|---|---|
| P1 | Que los casos se documenten **de forma sistemática**, como comportamiento del framework y no como hábito | §1.1 |
| P2 | **Una carpeta numerada por caso**, con un `README.md` que describa el caso | §1.1 |
| P3 | La **forma procesal**: el caso parte de informes que lo presentan y **se va expedientando su tratamiento** | §1.1 |
| P4 | Que **las pruebas del Product Owner y de los agentes** queden **como parte de las especificaciones** | §1.1 |
| P5 | Que la idea se **arregle y mejore contra estándares de industria y academia** | §1.1 |
| P6 | **Saber dónde se está parado**: el expediente vive en el repositorio donde ocurre el caso | §1.2 |
| P7 | **Ante un problema, mesa y no detención**, y preguntar sólo lo que sobreviva al análisis del conjunto | §1.3 |
