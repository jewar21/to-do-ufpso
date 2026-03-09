# Pruebas Unitarias en Flutter

## ¿Qué son las pruebas unitarias?

Las pruebas unitarias (o *unit tests*) son fragmentos de código escritos para verificar que una parte específica y aislada de nuestra aplicación (una función, un método, o una clase) funcione exactamente según lo esperado.

En Flutter, utilizamos el paquete oficial `flutter_test` para crear y ejecutar estas validaciones.

## ¿Por qué son importantes en nuestro proyecto?

1. **Detección temprana de errores:** Al probar de manera individual nuestros modelos o la lógica, es muy fácil saber dónde ocurre una falla antes de correr toda la app en un emulador.
2. **Refactorización sin miedo:** Cuando mejoramos o reorganizamos el código, tener pruebas nos asegura que no rompimos nada accidentalmente si todas las pruebas siguen en "verde" (aprobadas).
3. **Documenta el comportamiento:** Leer un archivo de pruebas es como leer un manual sobre qué hace una parte específica del sistema y cómo reacciona en diferentes casos.
4. **Mejora el diseño del código:** Pensar en cómo algo va a ser probado nos empuja a no mezclar la interfaz gráfica (UI) con las reglas de negocio, logrando un código más limpio.

## ¿Cómo ejecutar las pruebas en este proyecto?

Para facilitar la ejecución, tienes un comando rápido gracias al `Makefile` incluido en la raíz del repositorio. Solo abre la terminal en el proyecto y ejecuta:

```bash
make test
```

Esto buscará y correrá de forma automática cualquier archivo que termine en `_test.dart` dentro de la carpeta `test/`.

*(Alternativamente, también puedes usar `flutter test`)*.

## Ve a explorar el código

Te invitamos a ver un caso real en nuestro proyecto:
1. Revisa el modelo de tarea en `lib/models/task.dart`.
2. Ve cómo lo estamos comprobando paso a paso en su archivo de pruebas: `test/models/task_test.dart`.

Notarás que verificar código en Flutter es muy intuitivo usando palabras clave como `group()`, `test()`, y sobre todo, `expect()` para comparar los resultados que obtenemos contra los que esperamos.
