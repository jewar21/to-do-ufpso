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

**RF1.** Registrar usuario con email y contraseña.

**RF2.** Iniciar sesión con email y contraseña.

**RF3.** Mantener sesión iniciada y permitir cerrar sesión.

**RF4.** Crear una tarea con: título (obligatorio) y notas (opcional).

**RF5.** Listar solo las tareas del usuario autenticado.

**RF6.** Marcar una tarea como completada / pendiente.

**RF7.** Editar título/notas de una tarea.

**RF8.** Eliminar una tarea.

**RF9.** Filtrar tareas: Todas / Pendientes / Completadas.

**RF10.** Funcionar offline y sincronizar al recuperar conexión (Firestore offline).

**RF11.** Aplicar reglas de seguridad para que cada usuario solo acceda a sus tareas.

### Extras (elige 2–3)

**RF12.** Prioridad (alta/media/baja).

**RF13.** Fecha límite (due date).

**RF14.** Búsqueda por texto.

**RF15.** Etiquetas (tags).

---

## 4) Requisitos no funcionales

**RNF1.** La app debe mostrar estados: loading/empty/error.

**RNF2.** Validación de formularios (email/password/título).

**RNF3.** Respuesta ante errores de Auth/Firestore con mensajes claros (no “Exception”).

**RNF4.** Código organizado por capas (UI/State/Repo).

**RNF5.** Evidencias: repo, README, video demo, APK final.

---

## 5) Historias de usuario + criterios de aceptación

Aquí es donde se ponen serios (sin aburrirse).

### Plantilla

**HU-X:** Como **[tipo de usuario]**, quiero **[acción]** para **[beneficio]**.

**Criterios de aceptación:** (Given/When/Then)

### HU-01 Registro

Como usuario quiero registrarme para crear mi cuenta.

**CA:**

- Dado que ingreso email válido y password con mínimo 6 caracteres
- Cuando presiono “Crear cuenta”
- Entonces se crea el usuario y entro a Home
- Y si hay error, se muestra un mensaje entendible.

### HU-04 Crear tarea

Como usuario quiero crear una tarea para organizarme.

**CA:**

- Dado que estoy autenticado
- Cuando creo una tarea con título no vacío
- Entonces la tarea aparece en mi lista
- Y si estoy sin internet, se guarda y al volver sincroniza
- Y no debo ver tareas de otros usuarios.

### HU-06 Completar tarea

Como usuario quiero marcar tareas como completadas para llevar control.

**CA:**

- Cuando marco una tarea
- Entonces cambia el estado visual y se actualiza en Firestore.

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
