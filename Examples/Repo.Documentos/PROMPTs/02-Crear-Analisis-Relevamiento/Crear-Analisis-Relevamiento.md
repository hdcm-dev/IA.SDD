# Tool-Prompt — Analisis - Relevamiento

> **Invocación**:
> - `Lee y ejecuta /Repos-RPIs/RPI.VidelControl.Documentos/PROMPTs/01-Analisis-Relevamiento/Crear-Analisis-Relevamiento.md`
>
> **Overview**:  Analizar aplicación

---

# Contexto

  Tengo un pequeño software que hace tres cosas
  - Se conecta a una cámara con software obsoleta y hace de proxy tanto para ver el video como para activar las I/O de la cámara. Referencia: `/Repos-Hosts/Host.Infra.Documentacion/Analisis/HomeHub/Analisis-Relevamiento-Camara-IP-2.md`
  - Se conecta a una o mas camaras usb (webcam, actualmente a una sola cámara) .
  - Se debería conectar a las gpio para mover unos servos.

  - El software en realidad son tres versiones:
    a. La versión `explorador2-v1.1` es: `/Repos-RPIs/RPI.VidelControl/Legacy-Service/explorador2-v1.1`, es una versión anterior realizada en nodejs, tiene implementado control de servos.
    b. La versión `explorador3-v1.1` es: `/Repos-RPIs/RPI.VidelControl/Legacy-Service/explorador3`, es una versión mas reciente de  `explorador2-v1.1` .
    c. La `explorador4` es una versión reducida de las anteriores y esta en: `/Repos-RPIs/RPI.VidelControl/Legacy-Service/explorador4_srv/explorador4/explorador4`

---

# Objetivo

  Analizar las versiones actuales capturando las funcionalidades y los datos tecnicos enfocados en capturar las especificaciones para construir una nueva aplicación que unifique y armonice las funcionalidades. La documentación debe capturar la experiencia para proyectar una nueva aplicación que funcione con las mismas caracteristicas de hardware en al que se construyeron y corrieron esas palicaciones.

---

# Solicitudes

  - Analizar las tres versiones y especificarlas según los objetivos marcados. El hardware esta disponible para ser analizado, sus credenciales de acceso a ssh son:

| # | Parametro | Valor | Descripción |
| --- | --- | --- | --- |
| Host | IP | 192.168.1.102 | |
| Servicio SSH | Puerto | 2222 | |
| Usuario/Contraseña | videoctrl   | Sd.vgWsn93kz-d  |  |

  - Crear la documentación de salida en: `/Repos-RPIs/RPI.VidelControl.Documentos/Analisis/00-Analisis-Legacy-Versions`

---

# Reglas

  - No inventar información.
  - Toda afirmación deberá estar respaldada por evidencias verificables.


---

# Framework

## Profile

Aplicar:

- `IA/IA.Prompts/PromptFramework/Profiles/Study-Guide-Documentation.md`