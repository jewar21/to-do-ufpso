import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_ufpso/utils/validators.dart';

void main() {
  group('Validators Test', () {
    group('validateEmail', () {
      test('debe retornar mensaje de error si el email está vacío', () {
        expect(Validators.validateEmail(''), 'Por favor, ingrese su correo electrónico');
        expect(Validators.validateEmail(null), 'Por favor, ingrese su correo electrónico');
      });

      test('debe retornar mensaje de error si el email no tiene formato válido', () {
        expect(Validators.validateEmail('correo_invalido'), 'Por favor, ingrese un correo válido');
        expect(Validators.validateEmail('correo@dominio'), 'Por favor, ingrese un correo válido');
      });

      test('debe retornar null si el email es válido', () {
        expect(Validators.validateEmail('test@test.com'), null);
      });
    });

    group('validatePassword', () {
      test('debe retornar mensaje de error si la contraseña está vacía', () {
        expect(Validators.validatePassword(''), 'Por favor, ingrese una contraseña');
        expect(Validators.validatePassword(null), 'Por favor, ingrese una contraseña');
      });

      test('debe retornar mensaje de error si la contraseña tiene menos de 6 caracteres', () {
        expect(Validators.validatePassword('12345'), 'La contraseña debe tener mínimo 6 caracteres');
      });

      test('debe retornar null si la contraseña tiene 6 o más caracteres', () {
        expect(Validators.validatePassword('123456'), null);
        expect(Validators.validatePassword('passwordSegura123'), null);
      });
    });
  });
}
