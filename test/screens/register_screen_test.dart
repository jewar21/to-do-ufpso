import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_ufpso/screens/register_screen.dart';

void main() {
  testWidgets('RegisterScreen UI test', (WidgetTester tester) async {
    // Construimos nuestro widget y provocamos un frame.
    await tester.pumpWidget(const MaterialApp(
      home: RegisterScreen(),
    ));

    // Verificamos que los textos y campos existan.
    expect(find.text('Crear Cuenta'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Registrarse'), findsOneWidget);

    // Tocamos el botón de Registrarse sin ingresar datos
    await tester.tap(find.text('Registrarse'));
    await tester.pump();

    // Verificamos que aparezcan los mensajes de error por validación vacía
    expect(find.text('Por favor, ingrese su correo electrónico'), findsOneWidget);
    expect(find.text('Por favor, ingrese una contraseña'), findsOneWidget);
    
    // Ingresamos un correo inválido y contraseña corta
    await tester.enterText(find.byType(TextFormField).first, 'correo_invalido');
    await tester.enterText(find.byType(TextFormField).last, '12345');
    
    // Tocamos el botón de Registrarse nuevamente
    await tester.tap(find.text('Registrarse'));
    await tester.pump();
    
    // Verificamos que aparezcan los mensajes de error de formato
    expect(find.text('Por favor, ingrese un correo válido'), findsOneWidget);
    expect(find.text('La contraseña debe tener mínimo 6 caracteres'), findsOneWidget);
  });
}
