# Clean Architecture con capa de datos por DataManager

**Alias:** Clean-Architecture-DataManager
**Naturaleza:** canonico
**Tema:** Arquitectura interna en cuatro capas con acceso a datos por DataManager sobre ADO.NET, sin ORM
**Consumidor:** 05
**Condicion-de-carga:** proyectos de código `rest-api` o `web-monolith` sobre stack .NET con persistencia SQL Server
**Hereda-de:** —
**Sustituye:** —
**Compatible-con:** Rules-Base-Conocimiento.md 2.0
**Versión:** 1.0
**Estado:** Vigente
**Fecha:** 2026-08-23

---

## 0. Propósito y alcance

Caracteriza **la variante de Clean Architecture que se usa en esta casa**, cuya diferencia con el canon
no está en la dirección de dependencias —que se respeta— sino en **la capa de datos**: no hay ORM y no
hay `Repository`; hay un **DataManager por tabla** sobre ADO.NET, con su puerto declarado en el dominio.

**No explica qué es Clean Architecture.** El canon se nombra, no se reexplica: capas concéntricas,
dependencias hacia adentro, dominio sin dependencias, infraestructura como detalle. Lo que este
documento aporta es **lo que el nombre no dice**.

**Queda explícitamente afuera:**

| Fuera de alcance | Dónde vive |
| --- | --- |
| Cómo se estructura la capa web o la UI | Categoría 03 y su catálogo de diseño |
| Convención de nomenclatura del esquema de base de datos | Documento propio, todavía no capturado |
| Estrategia de pruebas de cada capa | Categoría 08 y `Rules-Calidad-Y-Pruebas.md` |
| Despliegue y contenedores | Categoría 09 |

**Advertencia de nombre**, por la regla de honestidad: el alias dice `Clean-Architecture-DataManager` y
no `Clean-Architecture` a propósito. La variante **se aparta del canon en un punto material** —los
puertos del dominio llevan nombres de tabla— y llamarla por el nombre canónico a secas engañaría a
quien la cita sin abrir el documento. Ver §4, «La desviación del canon».

---

## 1. Identidad del artefacto

| | |
| --- | --- |
| **Qué es** | Un layout de solución .NET en cuatro proyectos, con dirección de dependencias de Clean Architecture y capa de datos propia |
| **Stack** | .NET 8, ASP.NET Core, ADO.NET sobre SQL Server. **Sin ORM** |
| **Supuestos** | Base relacional existente y estable; el esquema manda sobre el modelo; una sola base por servicio |
| **Cuándo aplica** | Servicios de backend con API HTTP y persistencia SQL. No está pensada para proyectos sin base relacional |

---

## 2. Estructura

```text
<Solucion>.slnx
├── <Solucion>.Domain            sin dependencias
│   ├── Entities/                entidades de negocio
│   ├── Enums/
│   ├── Exceptions/
│   └── Interfaces/              puertos: I<Tabla>DataManager, y puertos de servicios externos
├── <Solucion>.Application       depende de Domain
│   ├── DTOs/
│   ├── Interfaces/              un I<Nombre>Service por servicio
│   └── Services/                la implementación de cada uno
├── <Solucion>.Infrastructure    depende de Domain y de Application
│   ├── DataAccess/              DataEntityCore, el núcleo ADO.NET compartido
│   ├── DataManagers/<Tabla>/    un par Abstract + DataManager por tabla
│   ├── Models/                  <Tabla>Model, el modelo de persistencia
│   └── Providers/               adaptadores de servicios externos, con su factory
└── <Solucion>.API               composición: depende de las tres
    ├── Controllers/
    ├── Middleware/
    └── Program.cs               el único lugar donde se registran las implementaciones
```

**Dirección de dependencias, verificable en los `.csproj`:**

| Proyecto | Referencia a |
| --- | --- |
| `Domain` | ninguno |
| `Application` | `Domain` |
| `Infrastructure` | `Domain`, `Application` |
| `API` | `Application`, `Infrastructure`, `Domain` |

Que `API` referencie a `Infrastructure` **no es una violación**: es la raíz de composición, y es el único
proyecto autorizado a conocer implementaciones.

---

## 3. Contrato de uso

### 3.1 Los tres pares que hay que respetar

| Concepto | Puerto (dónde) | Implementación (dónde) |
| --- | --- | --- |
| Acceso a una tabla | `Domain/Interfaces/I<Tabla>DataManager.cs` | `Infrastructure/DataManagers/<Tabla>/<Tabla>DataManager.cs` |
| Servicio de aplicación | `Application/Interfaces/I<Nombre>Service.cs` | `Application/Services/<Nombre>Service.cs` |
| Servicio externo | `Domain/Interfaces/I<Nombre>Provider.cs` | `Infrastructure/Providers/<Nombre>Provider.cs` |

### 3.2 El par Abstract + DataManager

Cada tabla lleva **dos archivos** en su carpeta, y la división es el punto que más se malinterpreta:

- **`<Tabla>Abstract.cs`** — clase abstracta con el CRUD y las consultas derivadas del esquema. Todo
  `virtual`. Es **mecánico**: se deriva de la tabla y se regenera si la tabla cambia.
- **`<Tabla>DataManager.cs`** — hereda del abstracto e implementa el puerto. Es donde va **lo escrito a
  mano**: sobrescrituras, consultas compuestas, reglas de acceso.

**No se edita el abstracto.** Lo que hay que cambiar se sobrescribe en el DataManager. Es lo que permite
regenerar el abstracto sin perder trabajo.

### 3.3 Convención de nombres de método

| Forma | Qué devuelve |
| --- | --- |
| `InsertAsync`, `UpdateAsync`, `DeleteAsync` | Afectados o confirmación |
| `GetOneAsync(id)` | El modelo o `null` |
| `GetAllAsync()` / `GetListAllAsync()` | `DataSet` cruda / lista tipada |
| `GetBy_<Campo>Async(valor)` | `DataSet` filtrada |
| `GetListBy_<Campo>Async(valor)` | Lista tipada filtrada |
| `GetBy_<Campo>_CantidadAsync(valor)` | El conteo |

El guion bajo antes del campo es parte de la convención y no un descuido. `DataSet` y lista tipada
conviven a propósito: la primera para consumo directo, la segunda para el dominio.

### 3.4 Transacciones

Los métodos de escritura aceptan un `SqlTransaction?` opcional al final. **Quien orquesta la transacción
es el servicio de Application**, no el DataManager: es lo que permite componer varias tablas en una
unidad de trabajo sin que la capa de datos conozca el caso de uso.

### 3.5 Registro

Todo puerto se registra en `Program.cs` y en ningún otro lado. `AddScoped` para DataManagers y
servicios; `AddSingleton` sólo para factories sin estado por request.

---

## 4. Decisiones ya tomadas

| Decisión | Criterio |
| --- | --- |
| **Sin ORM** | La base es preexistente y el esquema manda. Un ORM agrega una capa de traducción sobre un modelo que ya está fijo, y su costo no se recupera |
| **`DataManager` y no `Repository`** | Un `Repository` canónico expone una colección del dominio; acá la unidad es **la tabla**. Llamarlo repositorio prometería una abstracción que no está |
| **Abstracto separado de la implementación** | El abstracto se deriva del esquema y se regenera. Sin la división, regenerar pisa lo escrito a mano |
| **Modelo de persistencia separado de la entidad** | `<Tabla>Model` sigue al esquema; `Entities/` sigue al negocio. Unificarlos ata el dominio a la forma de la tabla |
| **Servicios y no casos de uso** | Un servicio agrupa operaciones afines de un mismo tema. No hay CQRS ni bus de mensajes: para el tamaño de estos servicios, agrega piezas sin resolver un problema que exista |
| **Un puerto por servicio de aplicación** | Todo `<Nombre>Service` tiene su `I<Nombre>Service`, sin excepción, aunque hoy tenga una sola implementación. Es lo que mantiene testeable a la capa |

### La desviación del canon, declarada

**Los puertos del dominio llevan nombres de tabla**, con el prefijo del esquema incluido:
`ILut<Entidad>DataManager`, `ISys<Entidad>DataManager`. En Clean Architecture canónica el dominio no
debería saber cómo se llaman las tablas.

**Se adopta conscientemente**, con el mismo criterio que el resto: el esquema es preexistente y estable,
y la trazabilidad directa entre puerto y tabla vale más acá que la pureza de la capa. **Es la razón por
la que el alias no es `Clean-Architecture` a secas.**

Consecuencia a tener presente: **cambiar el nombre de una tabla alcanza al dominio.** Si esa
propiedad deja de ser aceptable, la salida es una capa de traducción en Infrastructure, no renombrar
puertos.

---

## 5. Esqueletos de referencia

**Agregar una tabla nueva** — cinco archivos, en este orden:

```text
1. Domain/Interfaces/I<Tabla>DataManager.cs        el puerto
2. Infrastructure/Models/<Tabla>Model.cs           el modelo de persistencia
3. Infrastructure/DataManagers/<Tabla>/<Tabla>Abstract.cs
4. Infrastructure/DataManagers/<Tabla>/<Tabla>DataManager.cs
5. API/Program.cs                                  AddScoped<I<Tabla>DataManager, <Tabla>DataManager>
```

**Agregar un servicio nuevo** — tres archivos:

```text
1. Application/Interfaces/I<Nombre>Service.cs
2. Application/Services/<Nombre>Service.cs         recibe los puertos por constructor
3. API/Program.cs                                  AddScoped<I<Nombre>Service, <Nombre>Service>
```

**Agregar un proveedor externo** — el puerto va en `Domain/Interfaces/`, la implementación en
`Infrastructure/Providers/`, y si hay más de una variante se resuelve por factory registrada como
singleton.

---

## 6. Criterios de aceptación

- [ ] `[enumerable]` Los `.csproj` reproducen la tabla de dependencias de §2. Ninguna referencia de `Domain` a otro proyecto.
- [ ] `[enumerable]` Toda tabla tiene sus cinco archivos de §5, incluido el registro en `Program.cs`.
- [ ] `[enumerable]` Todo `<Nombre>Service` tiene su `I<Nombre>Service` en `Application/Interfaces/`.
- [ ] `[enumerable]` Ningún `using` de `Infrastructure` aparece en `Application` ni en `Domain`.
- [ ] `[enumerable]` Los métodos de consulta siguen las formas de §3.3.
- [ ] `[interpretativo]` El abstracto no tiene código escrito a mano: lo que se agregó está en el DataManager.
- [ ] `[interpretativo]` Las transacciones que abarcan más de una tabla las abre un servicio de Application.
- [ ] `[interpretativo]` Las entidades de `Domain/Entities/` no son copias del modelo de persistencia.

---

## 7. Anti-patrones

| Anti-patrón | Por qué |
| --- | --- |
| **Editar el abstracto** | Se pierde en la próxima regeneración desde el esquema |
| **Inyectar un DataManager en un controlador** | Saltea la capa de aplicación, y con ella la transacción y la regla de negocio |
| **Abrir la transacción en el DataManager** | La capa de datos no conoce la unidad de trabajo; el resultado son commits parciales |
| **Usar el modelo de persistencia como DTO de la API** | Ata el contrato público al esquema: cambiar una columna rompe a los consumidores |
| **Registrar implementaciones fuera de `Program.cs`** | El grafo de dependencias deja de ser legible en un solo lugar |
| **Un servicio sin su interfaz** | Rompe la testeabilidad de la capa y la regla de §4 sin declararlo |

---

## 8. Frontera con las reglas

Lo normativo de la categoría 05 sigue viviendo en `Rules-Arquitectura-Tecnica.md` y **este documento no
lo redefine**: qué documentos produce la categoría, con qué secciones, con qué criterios de aceptación y
cómo se numeran y trazan sus artefactos.

Este documento aporta **la forma concreta que la casa le da a la arquitectura interna** de un proyecto de
código. Ante conflicto con la regla de categoría, **manda la regla**: no hay ningún ítem de
`Rules-Arquitectura-Tecnica.md` rotulado como decisión de stack, de modo que acá no hay sustitución.

---

## 9. Trazabilidad

| | |
| --- | --- |
| **Índice** | `Index-Knowledge.md` de esta base |
| **Documentos hermanos** | Ninguno todavía. La nomenclatura del esquema de base de datos es candidata y está sin capturar |
| **Consumidor** | Categoría 05, Arquitectura Técnica |
| **Artefacto de referencia** | No se deposita. La estructura se transmite bien en texto y los esqueletos de §5 alcanzan |

---

## 10. Control de cambios

| Versión | Fecha | Cambios |
| --- | --- | --- |
| 1.0 | 2026-08-23 | Emisión inicial. Primer documento de esta base y piloto del formato que `Rules-Base-Conocimiento.md` 1.0 regula. |
