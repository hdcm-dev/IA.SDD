Método: copia literal de los once bloques de código de §5 de `Knowledge-Bundle-JS.md` (comparación línea a línea contra el documento) en una solución F2 mínima, corrida de los comandos de §6.1 y de la cadena de construcción desde limpio en contenedor, y apertura de las dos PoC con Chromium por `tools/medios/web.sh`.

# ev-10 — Esqueletos de §5, de punta a punta

## Base

| | |
|---|---|
| Fecha y hora | 2026-09-13 16:37 -03 (inicio) a 16:43 -03 |
| Quién | Agente de evidencia despachado por el presidente |
| Documento verificado | `IA.SDD.Documentacion/PROMPTs/SDD/Catalogado/02-Extraccion-Concepto-Espcificacion-Integracion-Proyecto-Bundle-JS/OUTPUTs/Knowledge-Bundle-JS.md`, v1.0, sha256 `f4bd11da8ff7922cb77d6e04ed1828a271965e504af5557fd8ff9b6dfd880fe1` (sin modificar) |
| Node (host y contenedor) | v22.23.2 · npm 10.9.8 |
| esbuild | 0.25.12 |
| typescript | 5.9.3 · @types/node 22.20.1 |
| SDK .NET | 10.0.400, imagen `<f1>/construccion:10.0` (`docker run` montando la carpeta de la solución; el wrapper `herramientas/dotnet` monta la raíz de <F1> y no se usó) |
| Carpeta de trabajo | `<scratchpad>/esqueletos/` |

## Solución armada

| Ruta | Origen |
|---|---|
| `contoso-reservas-mapa/package.json`, `tsconfig.json` | §5.1, literal (documento L256-L286) |
| `contoso-reservas-mapa/src/contrato.ts` | §5.2, literal (L290) |
| `contoso-reservas-mapa/src/mapa.ts` | §5.3, literal (L329) |
| `contoso-reservas-mapa/src/main.ts` | §5.4, literal (L380) |
| `contoso-reservas-mapa/src/fixture.test.ts` | §5.6, literal (L457) |
| `contoso-reservas-mapa/tsconfig.pruebas.json` | **No es esqueleto del documento.** Escrito por el agente: `extends ./tsconfig.json`, `noEmit: false`, `rootDir: src`, `outDir: build`, `include: [src]`, `exclude: []` |
| `contoso-reservas-mapa/fixture/viaje.json` | Construido por el agente con la forma de §5.9 (camelCase, dos celdas, acuse de la celda 1); después reemplazado por la captura real de la PoC Blazor (paso 4) |
| `Contoso.Reservas.Mapa/Contrato.cs` | §5.2, literal (L307) |
| `Contoso.Reservas.Mapa/Mapa.razor` | §5.5, literal (L400) |
| `Contoso.Reservas.Mapa/Contoso.Reservas.Mapa.csproj` | §5.7, literal (L493). Desde el paso 3b, con una línea agregada: `<ImplicitUsings>enable</ImplicitUsings>` (defecto D1) |
| `Contoso.Reservas.PocBlazor/` | `dotnet new blazor --interactivity Server`; `Components/Pages/Home.razor` = §5.9 literal (L580); `_Imports.razor` + `@using Contoso.Reservas.Mapa`; referencia de proyecto a la RCL |
| `poc-html/index.html`, `poc-html/anfitrion.js` | §5.8, literal (L545, L558); `poc-html/fixture/viaje.json` copia del fixture |
| `Contoso.Reservas.sln` | `dotnet new sln --format sln` + los dos proyectos .NET |

Comparación de copia: los once bloques extraídos de L250-L604 dieron `IDENTICO` contra los archivos.

## Paso 1 — Proyecto del bundle (host)

| Comando | Resultado | Salida literal relevante |
|---|---|---|
| `npm install` | pasa | `added 5 packages, and audited 6 packages in 2s` · `exit=0` · genera `package-lock.json` |
| `npm ci` | pasa | `added 5 packages, and audited 6 packages in 818ms` · `exit=0` |
| `npm run build` | pasa | `dist/mapa.js  1.4kb` · `dist/main.js  342b` · `exit=0` |
| `npm test` | pasa | `ok 1 - el fixture capturado por la PoC Blazor produce el acuse esperado` · `# pass 1` · `# fail 0` · `exit=0` |
| Sonda: `npm test` con el fixture alterado (`"estado":"ocupada"` para id 1) | falla, como se esperaba | `not ok 1 - …` · `# fail 1` · `exit=1`; restaurado: `exit=0` |

`dist/main.js` emitido: `import { montar as montarBundle, render, destruir, activar } from "./mapa.js";` y `export { activar, destruir, montar, render };`.

## Paso 2 — Criterios §6.1 (1, 2, 3, 4, 7, 8, 9)

| # | Comando | Resultado | Salida literal |
|---|---|---|---|
| 1 | `grep -oE 'Invoke(Void)?Async(<[^>]*>)?\("[^"]*"' Mapa.razor` contra `export` de `src/main.ts` | **falla tal como está escrito** | Literales: `"import"`, `"montar"`, `"render"`, `"destruir"`. Exports: `montar`, `render`, `destruir`, `activar`. `"import"` (de `Js.InvokeAsync<IJSObjectReference>`) no está exportado. Restringido a llamadas sobre `_modulo`: `montar`, `render`, `destruir` ⊂ exports → pasa (defecto D3) |
| 2 | `grep -o 'JSInvokable("[^"]*")' *.razor` · `grep -o 'metodo = "[^"]*"' src/main.ts` | pasa | `JSInvokable("AlActivar")` · `metodo = "AlActivar"` |
| 3 | segmento `_content/<X>/` del `.razor` y `<PackageId>` del `.csproj` | pasa | `_content/Contoso.Reservas.Mapa/` · `<PackageId>Contoso.Reservas.Mapa` |
| 4 | literal de `contrato.ts` y valor inicial de `Contrato.cs` | pasa | `version: 1` · `Version { get; init; } = 1` |
| 7 | forma renderizada: `grep -cE 'fetch\(\|XMLHttpRequest\|WebSocket\|localStorage\|sessionStorage' src/mapa.ts` con `\|` leído como `\|` de tabla → `|` | pasa | `0`. Sonda con un archivo que contiene `fetch(x)` y `localStorage.a`: `2` |
| 7 | forma fuente del markdown, copiada con `\|` | vacía | `src/mapa.ts` → `0`; sonda con `fetch(x)` y `localStorage.a` → `0` (GNU grep -E toma `\|` como `|` literal: no puede fallar) (defecto D4) |
| 8 | `grep -c 'from "./mapa.js"' dist/main.js` | pasa | `1` |
| 9 | `npm test` | pasa | `npm test exit=0` |

## Paso 3 — Cadena de construcción .NET desde limpio (contenedor)

Estado inicial de cada corrida: sin `node_modules/`, `dist/`, `build/` en el bundle; sin `bin/`, `obj/`, `wwwroot/` en la RCL; sin `bin/`, `obj/` en la PoC Blazor. `node --version` en el contenedor: `v22.23.2`.

### 3a — Esqueleto literal

| Comando | Resultado | Salida literal relevante |
|---|---|---|
| `dotnet build Contoso.Reservas.sln` | **falla** | VerificarNode imprime `22`; `npm ci` y `npm run build` corren (`dist/main.js  342b`); luego `/src/Contoso.Reservas.Mapa/Contrato.cs(12,31): error CS0246: The type or namespace name 'IReadOnlyList<>' could not be found (are you missing a using directive or an assembly reference?)` · `Build FAILED.` · `exit=1` |
| C10 `grep -c 'main.js' obj/*/*/staticwebassets.build.json` | no ejecutable | `grep: obj/*/*/staticwebassets.build.json: No such file or directory` |
| C11 | **falla** | el build de la solución no termina bien (CS0246) |
| `-p:SinCadenaJs=true`, artefactos presentes | falla | mismo `error CS0246` |
| `-p:SinCadenaJs=true`, `wwwroot/js/` vacío | pasa (falla esperada) | `Contoso.Reservas.Mapa.csproj(38,5): error : Faltan los artefactos en wwwroot/js/: la RCL no se entrega sin su insumo de construcción.` · `exit=1` |

Avisos del esqueleto literal (no bloquean): `Contrato.cs(10,83)` y `(17,67)` `warning CS8632`; `Mapa.razor(9,31)`, `(10,40)`, `(12,32)` `warning CS8669` (el csproj no declara `<Nullable>`).

### 3b — Con `<ImplicitUsings>enable</ImplicitUsings>` agregado al csproj (única diferencia)

| Comando | Resultado | Salida literal relevante |
|---|---|---|
| BUILD 1 `dotnet build Contoso.Reservas.sln` | pasa | `22` · `added 5 packages…` · `dist/mapa.js  1.4kb` · `dist/main.js  342b` · `Contoso.Reservas.Mapa -> …/Contoso.Reservas.Mapa.dll` · `Contoso.Reservas.PocBlazor -> …/Contoso.Reservas.PocBlazor.dll` · `Build succeeded.` · `5 Warning(s)` · `0 Error(s)` · `exit=0` |
| C10 en ese primer build: `grep -c 'main.js' obj/*/*/staticwebassets.build.json` | pasa | `obj/Debug/net10.0/staticwebassets.build.json` → `1` (`mapa.js` → `1`) |
| C11 | pasa | BUILD 1 sin paso previo, `exit=0` |
| BUILD 2 (sin limpiar) | pasa, sin ítem duplicado | `Build succeeded.` · `0 Warning(s)` · `0 Error(s)` · `exit=0` |
| BUILD 3 `-p:SinCadenaJs=true`, artefactos presentes | pasa | `Build succeeded.` · `0 Error(s)` · `exit=0` |
| BUILD 4 `-p:SinCadenaJs=true`, `wwwroot/js/` vacío | pasa (falla esperada con el mensaje del target) | `Contoso.Reservas.Mapa.csproj(39,5): error : Faltan los artefactos en wwwroot/js/: la RCL no se entrega sin su insumo de construcción.` · `Build FAILED.` · `exit=1` |
| BUILD 5 (normal, restituye artefactos) | pasa | `0 Error(s)` · `exit=0` |

### 3c — Sonda del criterio 10 (copia de la RCL sin el target `DeclararArtefactos`)

| Comando | Resultado | Salida literal |
|---|---|---|
| `dotnet build` desde limpio + `grep -c main.js obj/*/*/staticwebassets.build.json` | el criterio falla, como se esperaba | `0 Error(s)` · `0` |
| segundo `dotnet build` + mismo grep | — | `1` |

## Paso 4 — PoC Blazor en el contenedor

`dotnet run --no-build --no-launch-profile --urls http://0.0.0.0:5197`, `ASPNETCORE_ENVIRONMENT=Development`, puerto publicado en `127.0.0.1:5197`.

| Comando | Resultado | Salida literal |
|---|---|---|
| `curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:5197/` | pasa | `200 text/html; charset=utf-8` |
| `… /_content/Contoso.Reservas.Mapa/js/main.js` | pasa | `200 text/javascript` |
| `… /_content/Contoso.Reservas.Mapa/js/mapa.js` | pasa | `200 text/javascript` |
| `web.sh http://127.0.0.1:5197/ e1-ev10-poc-blazor --wait 2500 --pasos 'click [data-celda="1"]; wait 1500'` (§6.2, celda presente) | pasa | texto visible `1B` y `{"vista":{"celdas":[{"id":1,"fila":0,"columna":0,"estado":"libre","etiqueta":null},{"id":2,"fila":0,"columna":1,"estado":"ocupada","etiqueta":"B"}],"version":1},"acuse":{"tipo":"celda-activada","id":1,"estado":"libre","momento":"2026-09-13T19:42:08.639Z"}}` · `ok   click [data-celda="1"]` · errores `(ninguno)` |
| §6.2, celda ausente | no ejecutado | el bundle sólo dibuja celdas de la vista y `web.sh` no evalúa guiones: no hay cómo activar un id ausente desde la página |
| `npm test` con la captura real como `fixture/viaje.json` | pasa | `ok 1 - …` · `# pass 1` · `# fail 0` · `exit=0` |

Capturas: `tools/medios/out/e1-ev10-poc-blazor.png` y `.txt` (copia en `scratchpad/capturas/`).

## Paso 5 — PoC HTML

| Comando | Resultado | Salida literal |
|---|---|---|
| `python3 -m http.server 8197` desde `esqueletos/` · `curl /poc-html/index.html` | pasa | `200 text/html` |
| `curl /poc-html/anfitrion.js` | pasa | `200 text/javascript` |
| `curl /poc-html/fixture/viaje.json` | pasa | `200 application/json` |
| `curl /contoso-reservas-mapa/dist/main.js` (= `../contoso-reservas-mapa/dist/main.js` desde la PoC) | pasa | `200 text/javascript` (`dist/mapa.js` → `200`) |
| `web.sh http://127.0.0.1:8197/poc-html/index.html e1-ev10-poc-html --pasos 'click [data-celda="2"]; wait 500'` | pasa | texto visible `1B` y `AlActivar {"tipo":"celda-activada","id":2,"estado":"ocupada","momento":"2026-09-13T19:42:12.710Z"}` · errores `(ninguno)` |
| Forma del comentario de L546: `python3 -m http.server 8198` desde `poc-html/` · `curl --path-as-is /../contoso-reservas-mapa/dist/main.js` | **falla** | `404` (`/index.html` `200`, `/anfitrion.js` `200`) |
| `web.sh http://127.0.0.1:8198/index.html e1-ev10-poc-html-desde-poc` | **falla** | texto visible vacío · `console: Failed to load resource: the server responded with a status of 404 (File not found)` |

## Resumen §6.1

| Criterio | Tal como está escrito | Con las correcciones de la tabla siguiente |
|---|---|---|
| 1 | falla (D3) | pasa |
| 2 | pasa | pasa |
| 3 | pasa | pasa |
| 4 | pasa | pasa |
| 7 | pasa en forma renderizada; vacío en forma fuente (D4) | pasa |
| 8 | pasa | pasa |
| 9 | pasa | pasa |
| 10 | falla: la RCL no compila (D1) | pasa |
| 11 | falla: la RCL no compila (D1) | pasa |
| 5, 6, 12 | no ejecutados (no pedidos) | — |

## Defectos del documento

| # | Línea | Error literal | Corrección mínima |
|---|---|---|---|
| D1 | L319 (`Contrato.cs`, `IReadOnlyList<CeldaDto>`), con L496-L502 (csproj de §5.7 sin `ImplicitUsings`) | `Contrato.cs(12,31): error CS0246: The type or namespace name 'IReadOnlyList<>' could not be found (are you missing a using directive or an assembly reference?)` | Agregar `<ImplicitUsings>enable</ImplicitUsings>` al `PropertyGroup` del csproj de §5.7 (medido: construye), o `using System.Collections.Generic;` en `Contrato.cs` |
| D2 | L546 (comentario de `index.html`: `npx http-server . -p 8080`) | servido desde la carpeta de la PoC, `../contoso-reservas-mapa/dist/main.js` → `404`; en Chromium `Failed to load resource: the server responded with a status of 404 (File not found)` | Servir desde la carpeta que contiene la PoC y el proyecto del bundle (`npx http-server .. -p 8080`, abrir `/poc-html/`) |
| D3 | L613 (criterio 1: `InvokeAsync<…>("…")`) | la comprobación toma `"import"` de `Js.InvokeAsync<IJSObjectReference>("import", …)`, que no es export de `src/main.ts` | Restringir la comprobación a las llamadas sobre el módulo importado (`_modulo.InvokeVoidAsync("…")`/`_modulo.InvokeAsync<…>("…")`) |
| D4 | L619 (criterio 7, `\|` dentro del código de la celda) | copiado desde el fuente markdown, `grep -cE 'fetch\(\|XMLHttpRequest\|…'` da `0` también sobre un archivo con `fetch(x)` y `localStorage.a` | Sacar la comprobación de la tabla o escribirla sin `|`: `grep -cE -e 'fetch\(' -e XMLHttpRequest -e WebSocket -e localStorage -e sessionStorage src/mapa.ts` |
| D5 (aviso, no bloquea) | L496-L502 (csproj sin `<Nullable>`) | `warning CS8632` en `Contrato.cs(10,83)` y `(17,67)`; `warning CS8669` en `Mapa.razor(9,31)`, `(10,40)`, `(12,32)` | Agregar `<Nullable>enable</Nullable>` al `PropertyGroup` |
