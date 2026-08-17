# Nota de coherencia — El traspaso por pull request, y el árbol sucio

**Framework:** SDD
**Documento:** Coherencia-Traspaso-Por-Pull-Request.md
**Versión:** 1.1
**Estado:** Vigente
**Fecha:** 2026-08-17
**Autor:** AG-ROOT (Arquitecto de Soluciones)
**Versión del conjunto resultante:** SDD 9.2
**Origen:** dos pedidos del Product Owner sobre una corrida real — que la reanudación normalice el repositorio antes de diagnosticar, y que el protocolo de pull request que se venía usando quede escrito como regla

---

## 1. Alcance

Dos incorporaciones que resultaron ser la misma: **`Master-Prompt.md` §12.1**, que declara cómo el
trabajo sale del orquestador hacia el humano, y el **paso 0 de R0** de la reanudación, que la aplica
antes de medir nada. Más la salida que faltaba y las tres columnas que el cuestionario no daba.

## 2. El protocolo existía y no estaba escrito

**Ningún orquestador mencionaba una rama, un commit ni un pull request.** Se verificó buscando en los
tres: cero apariciones normativas. Y sin embargo el protocolo se usó en migraciones reales durante
toda su corrida —rama, commit, push, aviso al humano, merge del humano, aviso de vuelta— y funcionó.

**Que funcionara sin estar declarado es exactamente lo que hizo que nadie lo verificara**, que es la
misma forma que `Master-Prompt-Reanudacion.md` §1 describe para el estado del destino: una propiedad
cierta y no escrita no la comprueba nadie.

**Y falló apenas se salió del carril.** Un destino quedó con **452 cambios sin commitear en la rama
principal, 428 de ellos borrados**, con una migración estructural a mitad de camino. Nada estaba mal
hecho: nadie había declarado cuándo se pone a salvo.

## 3. Las seis reglas, y por qué T2 es la que importa

`Master-Prompt.md` §12.1 declara **T1** el agente no fusiona, **T2** nada se escribe sobre un árbol
sucio, **T3** una unidad de trabajo un pull request, **T4** la forma de la entrega y la detención,
**T5** el aviso del humano se verifica y no se cree, **T6** su límite.

**T1 tiene un fundamento que conviene no perder:** el merge es **el único control que no es del
agente**. Un agente que fusiona su propio trabajo no se ahorra un paso, elimina la revisión.

**T2 es la que justifica el paso 0 de R0, y no es higiene.** El historial del repositorio es el
**contraste observable** de las dimensiones 3 y 5 del estado. No incluye lo que no está commiteado.
Sobre un árbol sucio, las dos dimensiones se contrastan contra un observable **incompleto**, y el
informe declara «coincide» o «diverge» sin base. En el destino observado, una migración estructural
entera era invisible para `git log`.

**T5 dice que el aviso se verifica y no se cree**, y no es desconfianza: son dos sesiones distintas.
Un aviso puede llegar antes de que la plataforma termine, o referirse a otro pull request. Seguir
sobre una rama principal que no tiene el trabajo produce la unidad siguiente **encima de un estado que
no existe**, y eso se descubre tarde.

## 4. La salida que faltaba

**El orquestador tenía cuatro salidas y una migración en vuelo no encaja en ninguna.** La dimensión 3
la detecta —contrasta contra `_fusion/`— pero R2 ofrecía A, B, C y D, y **elegir B la reempieza**: el
migrador arranca en M0 y reconstruye un plan ya escrito sobre un árbol que ya pasó las fases
estructurales.

Se observó en un destino con **170 documentos en diez carpetas `_fusion/`** y su plan emitido, donde
**la única salida correcta —terminar lo que estaba a medias— no estaba en la lista, y la más parecida
era la que lo destruía**. Entra **E · Retomar la migración en curso**, con sus tres señales de
detección en el paso 5 de R0.

## 5. Las tres columnas, que el Product Owner pidió con precisión

Su observación fue que el cuestionario no dejaba entender la decisión. **Las salidas describían qué
invocan, y quien elige necesita saber qué le pasa a él.** R2 suma **en qué estado te deja**, **¿vuelve
a preguntar?** y **qué no resuelve**.

**El caso que lo prueba es la salida A**: repara y **vuelve a R0**, con lo cual **repite la misma
pregunta**. Es correcto por diseño —reparar cambia el estado sobre el que se decide— y no se deducía
de su texto. Elegir sin esas tres cosas es elegir el nombre de un prompt, no un resultado.

## 6. Barrido declarado (§VI.3.2)

| Concepto | Forma anterior | Forma vigente |
| --- | --- | --- |
| Cantidad de salidas de R2 | `cuatro salidas` | `cinco salidas` |

**Corrida sobre el árbol vivo:** una ocurrencia corregida, en `PROMPT-Agente-Reanudacion-SDD.md` §4.

**Exclusiones enumeradas:** una fila de control de cambios de `Migracion-Rules.md`; la fila de
inventario de `Coherencia-Orquestador-Reanudacion.md`, que registra lo que se verificó en su fecha; y
el texto de `Master-Prompt-Reanudacion.md` §4 que **explica por qué** la salida E entró, donde la forma
anterior es el sujeto de la oración. `Coherencia-Orquestador-Reanudacion.md` §3 defendía «cuatro y no
tres»: se conserva con una nota que declara la quinta, porque el argumento sigue siendo el de la cuarta.

**Regla 4, sobre el texto propio:** el patrón se corrió sobre §12.1, sobre R0, R1 y R2 y sobre esta
nota. Las apariciones son las tres exclusiones declaradas arriba.

## 7. Inventario de archivos

| Archivo | Versión | Qué cambió |
| --- | --- | --- |
| `SDD/Devs/Orchestrator/Master-Prompt.md` | 8.0 → **8.1** | **§12.1 nueva**, con T1 a T6 |
| `SDD/Devs/Orchestrator/Master-Prompt-Reanudacion.md` | 1.2 → **1.3** | R0 pasos **0** y **5**; R1 el bloque `REPOSITORIO` y la fila «En curso»; R2 la salida **E** y tres columnas |
| `SDD/Devs/Orchestrator/Master-Prompt-Migracion.md` | 2.3 → **2.4** | Cita §12.1; declara **T2 como prerrequisito de M0** |
| `PROMPTS/PROMPT-Agente-Reanudacion-SDD.md` | 1.1 → **1.2** | Cinco salidas y el anticipo del paso 0 |
| `SDD/Devs/Guides/Coherencia-Orquestador-Reanudacion.md` | 1.2 → **1.3** | Nota sobre la quinta salida |
| `CHANGELOG.md` | — | Entrada `[9.2]` |

## 8. Verificación de invariantes

| Invariante | Estado | Verificación |
| --- | --- | --- |
| **D1** a **D3** | Conforme | Sin cambios de idioma ni de nombres |
| **D4**, **D5** | Conforme | Los cinco archivos subieron versión y registraron su fila; comprobación 10 en cero |
| **D6** Trazabilidad | Conforme | Los dos orquestadores citan §12.1 y no la redefinen, que es el patrón de contrato compartido que la 8.5 estableció |
| **D7** Neutralidad | Conforme | Los dos destinos observados se citan por sus magnitudes, sin nombrarlos |
| **D8** Conjunto cerrado | Conforme | No se toca |
| **D9** Evidencia | Conforme | La ausencia del protocolo se midió sobre los tres orquestadores; los 452 cambios y los 170 documentos, sobre los árboles |

**Sobre una contradicción interna que esta intervención introdujo y corrigió.** R0 abría con «sin
despachar ningún subagente, y **sin escribir nada**», y el paso 0 escribe. Se reformuló: no escribe
nada **del destino**, y la única escritura admitida pone a salvo lo que ya estaba y además detiene la
corrida. Es la comprobación 9 —coherencia interna del artefacto— encontrando algo en la misma
intervención que lo introdujo, que es donde tiene que encontrarlo.

## 9. Lo que esta nota dejaba anotado, y cómo se cerró a medias

**T3 declaraba la unidad de trabajo y no había forma de verificar que se respetó.**

**Se cerró la mitad que se podía, en la 9.3.** La comprobación 4 de la **compuerta T0** verifica que
**no haya dos unidades vivas a la vez**: si una rama empujada espera merge, no se empieza otra. Era la
mitad que producía daño —dos ramas pisándose los mismos documentos, y un humano que no puede aceptar
una y rechazar la otra—.

**La otra mitad sigue sin comprobación y se declara.** Que una rama lleve **dos unidades adentro** no
lo detecta nada: la única señal es el tamaño del pull request. Es una regla de redacción, y §12.1 T0
lo dice en su propio texto en lugar de dejarlo en esta nota.

## 10. Veredicto

**APROBADO.** El conjunto 9.2 declara el traspaso por pull request como mecánica compartida de los
tres orquestadores, la reanudación normaliza el repositorio antes de medir, y R2 ofrece las cinco
salidas reales con lo que hace falta para elegir entre ellas.

## 11. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-17 | Emisión inicial. **§12.1** declara el protocolo de traspaso que se usaba sin estar escrito, con **T2** —nada se escribe sobre un árbol sucio— como fundamento del **paso 0 de R0**. Entra la salida **E**, que faltaba para una migración en vuelo, y las **tres columnas** que el cuestionario no daba. Registra la contradicción interna que la propia intervención introdujo en el preámbulo de R0 y corrigió. |
| 1.1 | 2026-08-17 | §9 pasa a **cómo se cerró a medias**: la compuerta T0 de la 9.3 verifica que no haya **dos unidades vivas**, que era la mitad que producía daño; que una rama lleve dos unidades adentro sigue sin comprobación y queda declarado en §12.1. |
