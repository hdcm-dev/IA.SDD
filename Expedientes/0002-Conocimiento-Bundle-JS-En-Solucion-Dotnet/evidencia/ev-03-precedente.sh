#!/bin/sh
# Método: inspección fijada a commit (git show / git ls-tree) de un producto del workspace generado con el framework que ya tiene un bundle TypeScript dentro de una biblioteca de clases Razor. Base: <F1> 9aabe5c. Quién: presidente de mesa.
R=<repo-privado-F1>
C=9aabe5c
g() { git -C "$R" show "$C:$1"; }
printf -- '--- arbol del proyecto de codigo del bundle\n'
git -C "$R" ls-tree -r --name-only "$C" -- src/<F1>.<Componente> | grep -v '^src/<F1>.<Componente>/build/'
printf -- '\n--- package.json\n'; g src/<F1>.<Componente>/package.json
printf -- '\n--- targets del csproj (nombres y BeforeTargets/AfterTargets)\n'
g src/<F1>.<Componente>/<F1>.<Componente>.csproj | grep -nE '<Target |BeforeTargets|AfterTargets|DependsOnTargets|<Exec |<PackageReference'
printf -- '\n--- contrato del lado .NET: tipos declarados\n'
g src/<F1>.<Componente>/Contrato.cs | grep -nE 'public (static class|sealed record|const)'
printf -- '\n--- contrato del lado TypeScript: tipos exportados\n'
g src/<F1>.<Componente>/ts/contrato.ts | grep -nE '^export (type|interface)'
printf -- '\n--- API publica del modulo (funciones exportadas del punto de entrada)\n'
g src/<F1>.<Componente>/ts/<componente>.ts | grep -nE '^export (function|const|class)'
printf -- '\n--- envoltorio Blazor: lineas de interoperabilidad\n'
g src/<F1>.<Componente>/DiagramaDeCabecera.razor | grep -nE 'IJSObjectReference|DotNetObjectReference|InvokeAsync|InvokeVoidAsync|JSInvokable|JSDisconnectedException|_content/|IAsyncDisposable'
printf -- '\n--- ADR-00042 y ADR-00043: titulo y decision\n'
g SDD/Docs/05-Arquitectura-Tecnica/Adrs/ADR-00042-Cadena-De-Construccion-De-Javascript.md | sed -n '1p;/^## 2. Decisión/,/^## 3/p' | head -20
g SDD/Docs/05-Arquitectura-Tecnica/Adrs/ADR-00043-Dos-Superficies-De-Consumo.md | sed -n '1p;/^## 2. Decisión/,/^## 3/p' | head -14
printf -- '\n--- la maqueta consume el bundle empaquetado (README de la maqueta)\n'
g SDD/Maquetas/<F1>-Web/README.md | grep -nE 'vendor/<componente>|Lo copiado no se edita|global' | head -6
printf -- '\n--- pruebas del bundle sin anfitrion (csproj)\n'
g src/<F1>.<Componente>/<F1>.<Componente>.csproj | grep -n 'sin anfitrion' 
