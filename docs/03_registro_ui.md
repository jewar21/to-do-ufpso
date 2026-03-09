# HU-01: Registro de Usuario (Fase UI)

## Objetivo de la Fase 1

Actualmente nuestra aplicación de To-Do se encuentra en la **Fase 1**, la cual está enfocada exclusivamente en el diseño de la **Interfaz de Usuario (UI)** y el flujo de **Navegación**. 

Por esta razón, aún no estamos conectando la aplicación a Firebase Authentication ni verificando usuarios reales almacenados en una base de datos. El objetivo principal es asegurarnos de que la captura de datos del usuario, las validaciones de formato locales, y los cambios visuales de pantalla funcionen de forma fluida.

## Interfaz de Registro (`register_screen.dart`)

Al abrir la aplicación, la pantalla inicial es la de *Registro*. Su responsabilidad actual es:
1. Capturar el correo electrónico.
2. Capturar la contraseña.
3. Validar localmente que ambos datos tengan la estructura correcta.
4. Mostrar un indicador de carga (`CircularProgressIndicator`) al presionar el botón si los datos son correctos.
5. Simular internamente una espera de un (1) segundo (como si habláramos con el servidor).
6. Redirigir de manera exitosa a la pantalla principal (`home_screen.dart`).

## Validaciones ("Mocks") Actuales

Para probar el flujo completo con éxito hacia la pantalla principal, puedes ingresar **cualquier par de datos válidos**. 

No existe hoy en día una validación lógica contra una lista de usuarios registrados previamente. El formulario validará lo siguiente:

### Correo Electrónico
- **Debe existir:** No puede dejarse el campo vacío.
- **Debe tener formato de email:** Es evaluado usando una Expresión Regular (`Regex`). Esto significa que debe contener texto, un arroba (`@`), un dominio y una extensión. 
  - ❌ Incorrecto: `usuario` o `hola@dominio_sin_extension`. 
  - ✅ Correcto: `estudiante@ufpso.edu.co` o `prueba@gmail.com`.

### Contraseña
- **Debe existir:** No puede dejarse el campo vacío.
- **Mínimo de caracteres:** No importa qué palabras, letras o números ingreses, siempre y cuando la contraseña escrita contenga **6 caracteres o más**.
  - ❌ Incorrecto: `12345` (5 caracteres).
  - ✅ Correcto: `123456` (6 caracteres) o `MiClaveSegura2026`.

*Nota: La validación es extraída del archivo utilitario `lib/utils/validators.dart`, la cual fue previamente testeada de forma unitaria en `test/utils/validators_test.dart`.*
