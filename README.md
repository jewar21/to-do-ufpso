# To-Do UFPSO (Firebase Edition)

Esta es la planeación de este proyecto.

## 1) Apertura

**Mensaje:** “Este curso va a construir una app real. Hoy no programamos: hoy definimos lo que vamos a construir para no perdernos en la semana 6.”

---

## 2) Contexto del producto

### Nombre del producto

**To-Do UFPSO (Firebase Edition)**

### Stack Tecnológico
- **Frontend / Mobile:** Flutter
- **Backend as a Service:** Firebase (Auth, Firestore)

### Objetivo del producto (1 frase)

Permitir que cada usuario gestione sus tareas personales de forma segura, simple y disponible incluso sin internet.

### Usuarios

- Estudiante (principal)
- Docente/administrador (solo como ejemplo, no se implementa rol admin en MVP)

---

## 3) Requisitos funcionales

Los escribes como “El sistema debe…”.

### MVP obligatorio (curso)

#### Fase 1: UI y navegación sin Firebase

**RF1.** Mostrar pantalla de registro con validación local de email y contraseña.

**RF2.** Mostrar pantalla de inicio de sesión con validación local de email y contraseña.

**RF3.** Permitir navegación entre registro, inicio de sesión y Home.

**RF4.** Mostrar estado de carga simulado al enviar formularios válidos.

**RF5.** Mostrar pantalla principal de tareas con estado vacío.

**RF6.** Permitir crear tareas de manera local o simulada con título obligatorio y notas opcionales.

**RF7.** Permitir marcar tareas como completadas o pendientes de manera local o simulada.

**RF8.** Permitir cerrar sesión de forma simulada y volver a la pantalla de acceso.

#### Fase 2: Integración con Firebase

**RF9.** Registrar usuario con email y contraseña usando Firebase Auth.

**RF10.** Iniciar sesión con email y contraseña usando Firebase Auth.

**RF11.** Mantener sesión iniciada y permitir cerrar sesión.

**RF12.** Listar solo las tareas del usuario autenticado.

**RF13.** Editar título/notas de una tarea.

**RF14.** Eliminar una tarea.

**RF15.** Filtrar tareas: Todas / Pendientes / Completadas.

**RF16.** Funcionar offline y sincronizar al recuperar conexión (Firestore offline).

**RF17.** Aplicar reglas de seguridad para que cada usuario solo acceda a sus tareas.

### Extras (elige 2–3)

**RF18.** Prioridad (alta/media/baja).

**RF19.** Fecha límite (due date).

**RF20.** Búsqueda por texto.

**RF21.** Etiquetas (tags).

---

## 4) Requisitos no funcionales

**RNF1.** La app debe mostrar estados: loading/empty/error.

**RNF2.** Validación de formularios (email/password/título).

**RNF3.** Respuesta ante errores o validaciones con mensajes claros (no “Exception”).

**RNF4.** Código organizado por capas (UI/State/Repo).

**RNF5.** Evidencias: repo, README, video demo, APK final.

---

## 5) Historias de usuario + criterios de aceptación

Aquí es donde se ponen serios (sin aburrirse).

### Plantilla

**HU-X:** Como **[tipo de usuario]**, quiero **[acción]** para **[beneficio]**.

**Criterios de aceptación:** (Given/When/Then)

### Fase 1: UI mock

### HU-01 Registro UI

Como usuario quiero registrar mis datos en una pantalla de registro para validar el flujo inicial de acceso a la app.

**CA:**

- Dado que ingreso un email válido y una contraseña con mínimo 6 caracteres
- Cuando presiono “Registrarse”
- Entonces el sistema valida los campos localmente
- Y muestra un estado de carga breve
- Y me redirige a Home
- Y si hay error de validación, se muestra un mensaje entendible.

### HU-02 Login UI

Como usuario quiero iniciar sesión desde una pantalla de acceso para probar la navegación hacia la pantalla principal antes de integrar autenticación real.

**CA:**

- Dado que estoy en la pantalla de inicio de sesión
- Cuando ingreso un email válido y una contraseña con mínimo 6 caracteres
- Entonces el sistema valida los campos localmente
- Y muestra un estado de carga breve
- Y me redirige a Home
- Y si hay error de validación, se muestra un mensaje entendible.

### HU-03 Navegación de acceso

Como usuario quiero moverme entre registro, login y Home para probar el flujo completo de la app.

**CA:**

- Dado que estoy en una pantalla de acceso
- Cuando selecciono la opción de cambiar entre registro o login
- Entonces el sistema me lleva a la pantalla correspondiente
- Y cuando cierro sesión desde Home
- Entonces regreso a la pantalla de acceso.

### HU-04 Crear tarea local

Como usuario quiero crear una tarea de forma local para visualizar cómo organizaré mis actividades.

**CA:**

- Dado que estoy en Home
- Cuando creo una tarea con título no vacío
- Entonces la tarea aparece en mi lista local
- Y si el título está vacío, se muestra un mensaje entendible.

### HU-05 Listar estado vacío

Como usuario quiero ver un estado vacío cuando no tengo tareas para entender que aún no he creado ninguna.

**CA:**

- Dado que no tengo tareas registradas localmente
- Cuando ingreso a Home
- Entonces veo un mensaje o ilustración de estado vacío
- Y se mantiene visible la opción de crear una tarea.

### HU-06 Completar tarea local

Como usuario quiero marcar tareas como completadas para llevar control visual de mis pendientes.

**CA:**

- Dado que tengo tareas creadas localmente
- Cuando marco una tarea
- Entonces cambia su estado visual a completada
- Y cuando la desmarco
- Entonces vuelve a estado pendiente.

### Fase 2: Firebase

### HU-07 Registro real

Como usuario quiero crear mi cuenta real para guardar mi información de manera persistente.

**CA:**

- Dado que ingreso email válido y password con mínimo 6 caracteres
- Cuando presiono “Registrarse”
- Entonces se crea el usuario en Firebase Auth
- Y entro a Home
- Y si ocurre un error, se muestra un mensaje entendible.

### HU-08 Login real

Como usuario quiero iniciar sesión con mi cuenta real para acceder a mis tareas personales.

**CA:**

- Dado que tengo una cuenta registrada
- Cuando ingreso credenciales válidas
- Entonces inicio sesión en Firebase Auth y entro a Home
- Y si las credenciales son incorrectas, se muestra un mensaje entendible.

### HU-09 Persistencia de tareas

Como usuario quiero que mis tareas se guarden en la base de datos para no perderlas al cerrar la app.

**CA:**

- Dado que estoy autenticado
- Cuando creo una tarea válida
- Entonces la tarea se guarda en Firestore
- Y al volver a abrir la app, la tarea sigue disponible
- Y si ocurre un error al guardar, se muestra un mensaje entendible.

### HU-10 Listado de tareas persistidas

Como usuario quiero que la app cargue mis tareas guardadas para continuar mi trabajo desde cualquier momento.

**CA:**

- Dado que tengo tareas guardadas en la base de datos
- Cuando ingreso a Home
- Entonces el sistema consulta y muestra mis tareas
- Y solo veo las tareas asociadas a mi cuenta
- Y si no existen tareas, se muestra el estado vacío.

### HU-11 Trabajo offline

Como usuario quiero poder crear y consultar tareas sin internet para seguir usando la app cuando no tenga conexión.

**CA:**

- Dado que no tengo conexión a internet
- Cuando creo o edito una tarea
- Entonces el cambio se guarda localmente
- Y puedo seguir viendo mis tareas disponibles en el dispositivo
- Y la app no bloquea el flujo principal por falta de conexión.

### HU-12 Sincronización al reconectar

Como usuario quiero que mis cambios offline se sincronicen automáticamente cuando vuelva el internet para mantener mi información actualizada.

**CA:**

- Dado que hice cambios sin conexión
- Cuando el dispositivo recupera internet
- Entonces la app sincroniza los cambios con Firestore
- Y las tareas quedan actualizadas en la base de datos
- Y si ocurre un conflicto o error, se informa con un mensaje claro.

> Con 6–8 historias con CA ya tienes un backlog sólido.
> 

---

## 6) Modelo de datos (Firestore)

Colección: `tasks`

Campos (MVP):

- `userId: string`
- `title: string`
- `notes: string?`
- `isDone: bool`
- `createdAt: timestamp`
- `updatedAt: timestamp`

Extras:

- `priority: int` (1–3)
- `dueAt: timestamp?`
- `tags: array<string>?`

**Regla de oro:** todo documento de `tasks` debe tener `userId` = `auth.uid`.

---

## 7) Diseño (wireframes rápidos)

En tablero o papel:

1. **Login**
2. **Register**
3. **Home (lista + filtros)**
4. **Create/Edit Task (form)**

Define componentes:

- Input email/password
- Botón principal
- Lista con check
- Chips de filtros

---

## 8) Definir fases del proyecto

Enfatiza que el curso seguirá estas fases:

### Fase 0 — Planeación y diseño (Semana 1)

- Requisitos + historias + modelo + wireframes

### Fase 1 — UI + navegación (Semanas 2–3)

- Pantallas y flujo

### Fase 2 — Auth (Semana 4)

- Firebase Auth

### Fase 3 — CRUD (Semanas 5–6)

- Firestore tasks

### Fase 4 — Arquitectura y estado (Semana 7)

- capas y state management

### Fase 5 — Offline + reglas (Semanas 8–10)

- sincronización + security rules

### Fase 6 — Calidad + release (Semanas 11–12)

- tests + APK + docs

### Final — Mini-proyecto equipos (Semanas 13–14)

---

# Entregable

Para cerrar la sesión A o dejarlo para la sesión B:

**Documento “Especificación To-Do UFPSO v1”** (1–2 páginas) con:

1. Objetivo del producto
2. RF (MVP + extras)
3. 6–8 historias de usuario con criterios de aceptación
4. Modelo Firestore
5. Wireframes (foto del cuaderno sirve)

---

# Sesión B — Taller de especificación (en equipos)

### Actividad

En equipos de 3–4:

- Completar el documento v1
- Elegir 2 extras
- Definir 8 historias totales (6 MVP + 2 extras)
- Presentación relámpago (2 min por equipo)

### Rúbrica del documento

- 30: requisitos claros y completos (MVP)
- 30: historias + criterios de aceptación bien escritos
- 20: modelo de datos coherente
- 10: wireframes claros
- 10: calidad del documento (orden, claridad)

---

## 📚 Documentación y Material de Referencia

Para facilitar el aprendizaje y el desarrollo, aquí tienes enlaces directos a guías y explicaciones adicionales del proyecto:

- 📂 [Estructura del Proyecto](./docs/01_estructura_proyecto.md): Conoce cómo están organizadas las carpetas y archivos, y para qué sirve cada una.
- 🧪 [Pruebas Unitarias en Flutter](./docs/02_pruebas_unitarias.md): Descubre qué son, por qué son vitales para mantener la calidad del código, y cómo usar nuestros ejemplos en el proyecto.
- 📝 [Registro de Usuario (UI Validaciones)](./docs/03_registro_ui.md): Explicación del flujo de "Mock Login" de esta primera fase de interfaz y ejemplos de campos funcionales.
