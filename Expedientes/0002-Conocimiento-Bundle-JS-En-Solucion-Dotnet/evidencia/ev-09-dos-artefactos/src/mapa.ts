import type { Vista, Acuse } from "./contrato.js";
const instancias = new WeakMap<object, { alActivar?: (a: Acuse) => void; vista?: Vista }>();
export function montar(contenedor: object, opciones: { alActivar?: (a: Acuse) => void } = {}): void { instancias.set(contenedor, { ...opciones }); }
export function render(contenedor: object, vista: Vista): void { const i = instancias.get(contenedor); if (i) i.vista = vista; }
export function activar(contenedor: object, id: number): void { const i = instancias.get(contenedor); const c = i?.vista?.celdas.find(x => x.id === id); i?.alActivar?.({ tipo: "celda-activada", id, estado: c?.estado ?? null }); }
export function destruir(contenedor: object): void { instancias.delete(contenedor); }
