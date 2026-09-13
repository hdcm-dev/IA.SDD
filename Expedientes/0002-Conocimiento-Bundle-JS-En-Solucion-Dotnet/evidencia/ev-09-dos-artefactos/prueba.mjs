import { montar, render, activar, destruir } from "./dist/main.js";
const recibidos = []; const doble = { invokeMethodAsync: async (m, a) => { recibidos.push([m, a]); } };
const c = {}; montar(c, doble); render(c, { version: 1, celdas: [{ id: 3, estado: "ocupado" }] }); activar(c, 3); activar(c, 9); destruir(c);
await new Promise(r => setTimeout(r, 0)); console.log(JSON.stringify(recibidos));
