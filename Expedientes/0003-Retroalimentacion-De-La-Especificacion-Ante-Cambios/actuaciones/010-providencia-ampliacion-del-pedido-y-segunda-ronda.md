| Campo | Valor |
|---|---|
| Tipo | providencia |
| Fecha | 2026-09-16 |
| Autor | Presidente de mesa |
| Corrige | 002 |

# Ampliación del pedido: segundo caso y segunda ronda de comisiones

Corrige la providencia 002 en su §1 (preguntas Q8–Q10 nuevas) y §3 (composición ampliada).

## 1. Pedido ampliado (literal)

Con las seis comisiones de la primera ronda despachadas y la refutación en curso, el Product Owner amplió el pedido:

```testimonio
pero que sea interactive server fue siempre una decisión de diseño inicial, porque cambiaste ?  - la mesa debería revisar de que no se cumnplio el diseño propuesto, y efectuar una corrección ya en el prompt orquestador que le corresponda o donde sea, - y debería evaluar como segundo caso el hecho de las paginas tambien - el concepto a mantener era que debia ser blazor,interactive server - a no ser que sea algo de fuerza mayor como una pagina que necesite crear la cookie, eso es raro que se de porque seria el login, y creo que el login usas un api para armar la cookie , así que no veo la necesidad de no respetar el diseño fijado.

una vez que evalues, eso, trabajar para que sea interactive server. armar el plan , evalua que implica cambiar, corregi los fallos que evalues en implantar los cambios, y luego implantalos.

sobre el tema de producción lo voy a hacer cuando cerremoss todos estos temas - tenes que terminar primero y despues hablamos de pasar en producción 

sobre la mesa, - dales unos especialistas mas, si vas a trabajar la especificaciones, necesitas product manager, product owner, especialista en manager project , analistas en docuemtnacion tecnica, y analistas en sistemas -
```

| Campo | Valor |
|---|---|
| Canal | chat de la sesión de trabajo, respuesta al informe de estado del presidente tras despachar la primera ronda |
| Fecha-hora | 2026-09-16 ~09:30 UTC−3 (hora del host) |
| Huella | `c7bdb10670ad1cad2be43792f05262eb2dcf67cd3c97d813ab7e3e6c3312c77f` |

## 2. Lectura

1. **Segundo caso (investigación de un defecto):** el diseño del destino fijaba Blazor **Interactive Server** (`Context/ui_guide.md:19` «Render mode: Interactive Server», ADR-02, ADR-11 «el host registra los componentes interactivos de servidor», base de conocimiento `Template-Blazor-Interactive-Server`), con una sola excepción declarada: el login, que opera en SSR porque crea la cookie (`ui_guide.md:595`). El panel se construyó como SSR estático desde el esqueleto (BT-01, 2026-08-29), un fix del 2026-09-01 lo declaró «SSR estático puro» sin ADR, y el expediente 0002 corrigió la arquitectura **para describir el código** (2.4) y escribió ADR-21 sobre esa base. Evidencia ev-03.
2. **Lo que la mesa tiene que resolver del segundo caso:** (a) por qué el diseño no se cumplió y qué pieza del framework debió detectarlo (sensado de deriva, audit, la regla «el código es la verdad» y su filtro descripción/control); (b) la corrección en el prompt orquestador o regla que corresponda; (c) el plan para llevar el panel a Interactive Server: qué implica cambiar, riesgos, orden, fallos previsibles y cómo se corrigen, con el login como única excepción admitida salvo fuerza mayor demostrada.
3. **Aplicación:** la mesa aplica lo del framework y después el destino migra a Interactive Server por tramos (plan del dictamen). Producción queda para después de cerrar todo.
4. **Composición ampliada:** product manager, product owner (proxy), especialista en gestión de proyectos, analista de documentación técnica, analista de sistemas; y para el segundo caso, arquitecto Blazor y perito del desvío. Segunda ronda a ciegas con su propia refutación; el jurado consolida las dos rondas.

## 3. Preguntas nuevas

| # | Pregunta |
|---|---|
| Q8 | ¿Por qué el destino no cumplió el diseño fijado (Interactive Server) y qué pieza del framework —regla, punto de sensado, audit, orquestador— debió detectar el desvío y no lo hizo? ¿Qué corrección va en qué prompt o regla para que un desvío de una decisión de diseño no se absuelva reescribiendo la documentación? |
| Q9 | ¿Qué implica llevar el panel del destino a Interactive Server: páginas, formularios, endpoints de administración con redirect, bundles JS, autenticación por cookie (login como excepción), pruebas, despliegue (SignalR detrás del borde e IIS)? Plan por tramos con riesgos, orden y verificación; fallos previsibles al implantar y cómo se corrigen. |
| Q10 | ¿Cómo se representan en la especificación y el plan del destino los cambios de los expedientes 0002–0004 y la migración a Interactive Server (épicas, US/BT consecutivas, CU/RN/VIEW, ADR, carta de cambios, roadmap, sprints), desde la mirada de producto, de gestión y de análisis? |

**MEDIOS que se suman:** el árbol del destino (código y docs) para el arquitecto Blazor y el perito; sin ejecutar ni desplegar nada en esta ronda.

Sigue: segunda ronda de comisiones y refutación · presidente de la mesa
