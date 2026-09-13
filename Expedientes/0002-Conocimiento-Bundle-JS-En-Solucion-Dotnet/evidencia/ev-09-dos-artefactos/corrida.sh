#!/bin/sh
# Método: proyecto mínimo neutro; tsc --noEmit, esbuild con --bundle para el bundle y sin --bundle para main.js, y una prueba en node con un doble de la referencia .NET. Base: 2026-09-13, node v22.23.2, esbuild 0.25.12, typescript 5.9.3 (binarios tomados de un node_modules local, sin modificarlo). Quién: presidente de mesa.
# Uso: ESBUILD=<ruta a esbuild> TSC=<ruta a tsc> ./corrida.sh
set -e; mkdir -p dist
"$TSC" -p tsconfig.json && echo "tsc: ok"
"$ESBUILD" src/mapa.ts --bundle --format=esm --outfile=dist/mapa.js
"$ESBUILD" src/main.ts --format=esm --outfile=dist/main.js
grep -n 'from' dist/main.js; grep -c WeakMap dist/main.js || true
node prueba.mjs
