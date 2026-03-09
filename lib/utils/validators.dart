class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    }
    
    // Regex simple para validación de email
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor, ingrese un correo válido';
    }
    
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese una contraseña';
    }
    
    if (value.length < 6) {
      return 'La contraseña debe tener mínimo 6 caracteres';
    }
    
    return null;
  }
}
