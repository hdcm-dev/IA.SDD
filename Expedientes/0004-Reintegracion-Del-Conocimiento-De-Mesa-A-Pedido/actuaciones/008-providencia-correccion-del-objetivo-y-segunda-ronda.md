| Campo | Valor |
|---|---|
| Tipo | providencia |
| Fecha | 2026-10-23 |
| Autor | Presidente de mesa (no vota) |
| Corrige | 002 |

# Corrección del objetivo por el Product Owner y segunda ronda

Corrige el folio 002 en su §1 (la lectura de «dependencias necesarias») y en su §2 (O2 y R1); el detalle está en el §3 de este folio.

## 1. Lo que escribió el Product Owner mientras la ronda corría (literal)

> lo razonable es que si sumamos un conocimiento nuevo, y ese tiene dependencias, si luego yo particulamente tomo ese repositorio y lo clono en otro workspace no quede incompleto apuntando a repositorios que no existen . - si mañana otro hace un fork de ese repositorio sumara sus conocimientos propios - ahora estamos tratando de que el conocimiento que tenga sea completo tomando el conocimiento integro de otro repositorio y nos obliga a traer sus dependencias porque sino ese conocimiento sería incompleto

> la mesa debe ser consciente de esto

El texto toca el objetivo. Por la regla del conocimiento (fork 1.15, «lo que rige siempre» 2), el enunciado se rehace, el objetivo se muestra vigente → corregido y el encargo se detiene y se relanza. No había corrido ninguna fase irreversible: no hubo redacción en el árbol, ni commit, ni pedido de fusión.

## 2. Enunciado rehecho

| Frase | Función | Origen |
|---|---|---|
| «si sumamos un conocimiento nuevo, y ese tiene dependencias» | condición: el conocimiento se importa con lo que necesita | literal 008 |
| «lo clono en otro workspace no quede incompleto apuntando a repositorios que no existen» | **criterio de aceptación**: un clon del framework en cualquier workspace no apunta afuera | literal 008 |
| «si mañana otro hace un fork … sumara sus conocimientos propios» | el mismo mecanismo vale para cualquier fork del framework: es una propiedad general, no del caso | literal 008 |
| «tomando el conocimiento integro de otro repositorio … nos obliga a traer sus dependencias» | **decide la lectura**: (b) y no (a) | literal 008 |
| «la mesa debe ser consciente de esto» | rige para toda la mesa y cada encargo | literal 008 |

## 3. Objetivo vigente → objetivo corregido

| # | Vigente (002) | Corregido |
|---|---|---|
| O1 | Se incorpora la sustancia de 1.3–1.15 **que vale fuera del destino** | Se incorpora **el conocimiento íntegro** del fork 1.15. Sólo se ofusca lo privado (R2), y lo que es trazabilidad a otro repositorio se describe sin apuntar a él |
| O2 | Lectura (a): sólo depende de lo que trae `IA.SDD`; lo del destino se trae al texto **o se quita** | **Lectura (b)**. Cada dependencia del conocimiento importado, transitiva incluida (lo que citan sus dependencias y se usa), **entra al framework**: la reemplaza un equivalente que ya está en el árbol y dice lo mismo, o se trae. **Nada se quita por no resolver** |
| O2′ | — | **Criterio de aceptación:** en una copia del framework sin historia, en un workspace vacío, ninguna referencia del conocimiento (ruta, alias, regla, §n, invariante como K6) apunta a algo que no esté en esa copia |
| O3 | Estructura debatida y correcta | Igual, **incluido dónde y con qué forma viven las dependencias traídas** |
| O4 | Prueba en copia limpia | Igual, y la prueba **mide O2′** |
| O5 | — | **Propiedad general** (literal: «si mañana otro hace un fork»): queda asentado, en el lugar que corresponda, que un conocimiento que se suma desde otro repositorio llega con sus dependencias. Dónde se asienta lo decide la mesa, con R1 |

## 4. Las restricciones a la luz de la corrección

- **R1 (no tocar la norma)** sigue vigente. El criterio del Product Owner del 2026-08-29 no fue revocado. El texto de 008 obliga a **traer** dependencias, no dice **dónde**. Lo primero que se explora es traerlas a la base de conocimiento desacoplada (`Conocimiento/`), o hacerlas coincidir con un equivalente del árbol que diga lo mismo.
- **Si traer una dependencia exige cambiar una regla del framework**, la mesa lo decide con default y **sale marcado al Product Owner**. Por ejemplo, cuando el contenido es normativo por naturaleza y `Conocimiento/` no puede imponerlo (lo plantea el informe 007, RO-01). También sale marcado O5, si para cumplirlo hay que tocar `Rules-Base-Conocimiento.md`.
- **R2 (ofuscación)** sigue vigente sobre todo lo que se traiga.
- **R3 y R4** siguen vigentes.

## 5. Antecedentes que la segunda ronda debe leer

Los informes 003, 005, 006 y 007 de la primera ronda. Se escribieron bajo la lectura (a), pero ya miden las dependencias:
- el fork cita `_convenciones_comunes.md` §7.2, §7.4 y §10 del destino (005, MC-02);
- **K6 no existe en el framework**: vive en `_reglas_base_conocimiento.md` del destino (007);
- el régimen de apartamientos puede convertir el conocimiento en norma (007, RO-01);
- no hay forma conforme de un solo archivo bajo el techo (003, NB-02; 006, AI-01).

## 6. Segunda ronda

| Rol | Señal |
|---|---|
| Portabilidad y cierre de dependencias | cierre transitivo de las dependencias del fork y de sus dos dependencias; equivalente en el árbol o qué se trae; mide O2′ |
| Normativa de la base de conocimiento | dónde y con qué forma viven las dependencias traídas sin violar R1, y dónde se asienta O5 |
| Arquitectura de la información | la estructura del conjunto: documento o documentos y sus dependencias, techos, hermanos, carga progresiva |
| Refutador del objetivo corregido | ataca la lectura (b) en su costo: tamaño del cierre, conocimiento que se vuelve norma, un framework que deja de correr igual con la carpeta vacía |

El informe 005 (metodología del contenido) **se mantiene**, salvo en lo que diga «se quita por accidente del destino»: bajo O1 corregido, eso se trae ofuscado. Le siguen el jurado, la redacción, la prueba y la corrección, como en 002.
