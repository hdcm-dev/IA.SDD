import { montar as montarBundle, render, destruir, activar } from "./mapa.js";
export interface ReferenciaDotNet { invokeMethodAsync(metodo: string, ...args: unknown[]): Promise<unknown> }
export function montar(contenedor: object, ref: ReferenciaDotNet, metodo = "AlActivar"): void {
  montarBundle(contenedor, { alActivar: (a) => { ref.invokeMethodAsync(metodo, a).catch(() => {}); } });
}
export { render, destruir, activar };
