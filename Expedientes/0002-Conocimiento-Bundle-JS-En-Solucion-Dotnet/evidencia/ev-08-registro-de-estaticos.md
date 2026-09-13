Método: reproducción sobre una copia del repositorio <F1> (rsync del árbol de trabajo sin `bin/`, `obj/`, `node_modules/`; caché `.contenedor/` copiada aparte), cuatro `dotnet build` con el wrapper `./herramientas/dotnet` corrido desde la copia, y lectura del manifiesto `obj/Release/net10.0/staticwebassets.build.json` con `grep` tras cada build.

- Base: commit `9aabe5c` de <F1> (árbol de trabajo con cambios sin commitear ajenos a `src/<F1>.<Componente>`, copiados tal cual).
- Fecha y hora: 2026-09-13 16:31:07 -0300 (primer build) a 16:31:58 -0300 (último).
- SDK: `10.0.400` (salida de `./herramientas/dotnet --version`, imagen `<f1>/construccion:10.0`).
- Quién: agente de evidencia despachado por el presidente del expediente 0002.
- Copia: `<scratchpad>/r8/repo`. El original no se modificó (`git status --short` idéntico antes y después).

## Comandos

Limpieza (antes de los builds 1 y 3), desde la raíz de la copia:

```
rm -rf src/<F1>.<Componente>/bin src/<F1>.<Componente>/obj src/<F1>.<Componente>/node_modules src/<F1>.<Componente>/wwwroot/<componente>.js
```

Tras la limpieza, `wwwroot/` contiene sólo `<componente>.css`.

Cada build:

```
./herramientas/dotnet build src/<F1>.<Componente>/<F1>.<Componente>.csproj -c Release -v normal -p:PruebasDeTypeScript=false
grep -o '<componente>[^"]*\.js' src/<F1>.<Componente>/obj/Release/net10.0/staticwebassets.build.json
```

## Build 1 — defecto, desde limpio (16:31:07 -0300)

Salida relevante del build (exit 0):

```
         npm ci --no-audit --no-fund
       ConstruirBundle:
         npm run build
         > <f1>-<componente>@0.0.0 build
         > tsc --noEmit && esbuild ts/<componente>.ts --bundle --format=esm --minify --outfile=wwwroot/<componente>.js
    0 Warning(s)
    0 Error(s)
```

`wwwroot/`:

```
-rw-rw-r-- 1 <usuario> <usuario> 4011 ago 29 14:54 <componente>.css
-rw-r--r-- 1 <usuario> <usuario> 9977 sep 13 16:31 <componente>.js
```

`grep`: sin salida, exit 1.

## Build 2 — defecto, sin limpiar (16:31:21 -0300)

```
       ConstruirBundle:
       Skipping target "ConstruirBundle" because all output files are up-to-date with respect to the input files.
    0 Warning(s)
    0 Error(s)
```

`grep` (exit 0, 17 líneas):

```
<componente>#[.{fingerprint=ohixhhffwb}]?.js
<componente>.js
<componente>.js
<componente>.js
<componente>#[.{fingerprint}]?.js
<componente>.js
<componente>.js
<componente>.js
<componente>.js
<componente>.js
<componente>.ohixhhffwb.js
<componente>.js
<componente>.ohixhhffwb.js
<componente>.js
<componente>.js
<componente>.ohixhhffwb.js
<componente>.js
```

## Corrección aplicada en la copia

Target agregado a `src/<F1>.<Componente>/<F1>.<Componente>.csproj`, inmediatamente después de `ConstruirBundle` (la primera forma propuesta funcionó sin ajustes):

```xml
  <Target Name="DeclararBundleGenerado" AfterTargets="ConstruirBundle" BeforeTargets="ResolveStaticWebAssetsInputs">
    <ItemGroup>
      <Content Include="wwwroot/<componente>.js" Exclude="@(Content)" />
    </ItemGroup>
  </Target>
```

## Build 3 — corregido, desde limpio (16:31:46 -0300)

```
       ConstruirBundle:
         npm run build
         > <f1>-<componente>@0.0.0 build
         > tsc --noEmit && esbuild ts/<componente>.ts --bundle --format=esm --minify --outfile=wwwroot/<componente>.js
    0 Warning(s)
    0 Error(s)
```

`wwwroot/`:

```
-rw-rw-r-- 1 <usuario> <usuario> 4011 ago 29 14:54 <componente>.css
-rw-r--r-- 1 <usuario> <usuario> 9977 sep 13 16:31 <componente>.js
```

`grep` (exit 0): las mismas 17 líneas que el build 2, en el mismo orden.

## Build 4 — corregido, sin limpiar (16:31:58 -0300)

```
       ConstruirBundle:
       Skipping target "ConstruirBundle" because all output files are up-to-date with respect to the input files.
    0 Warning(s)
    0 Error(s)
```

`grep` (exit 0): las mismas 17 líneas que el build 2. No aparece error ni advertencia de ítem duplicado, y el manifiesto no suma entradas.

## Conclusión

Sin el target, el primer build desde limpio genera `wwwroot/<componente>.js` pero el manifiesto de estáticos no lo registra; el segundo build sí lo registra.
Con `DeclararBundleGenerado`, el primer build desde limpio registra `<componente>.js` y el segundo build no produce duplicados.
