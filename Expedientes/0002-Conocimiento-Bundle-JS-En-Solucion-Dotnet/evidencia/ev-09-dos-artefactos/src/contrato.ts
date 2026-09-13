export type Estado = "libre" | "ocupado";
export interface Vista { version: 1; celdas: { id: number; estado: Estado }[] }
export interface Acuse { tipo: "celda-activada"; id: number; estado: Estado | null }
