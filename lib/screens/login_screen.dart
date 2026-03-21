import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:to_do_ufpso/utils/app_theme.dart';
import 'package:to_do_ufpso/utils/validators.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pushReplacementNamed('/home');
  }

  Widget _buildSocialButton({
    required Widget icon,
    required String semanticLabel,
  }) {
    return SizedBox(
      width: 52,
      height: 52,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          side: const BorderSide(color: Color(0xFFB2D8D8)),
          backgroundColor: const Color(0xFFF5FBFB),
        ),
        child: Semantics(
          label: semanticLabel,
          button: true,
          child: icon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4F4),
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
        backgroundColor: const Color(0xFFEAF4F4),
        elevation: 0,
        foregroundColor: Color(0xFF2C7873),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE0F0EE),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.brain,
                          size: 32,
                          color: Color(0xFF2C7873),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'CalmSpace',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C7873),
                    ),
                  ),
                  const SizedBox(height: 6),

                  const Text(
                    'Tu espacio de bienestar mental',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7FAEAD),
                    ),
                  ),
                  const SizedBox(height: 40),

                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Color(0xFF2C7873)),
                    decoration: InputDecoration(
                      labelText: 'Correo Electrónico',
                      labelStyle: const TextStyle(color: Color(0xFF7FAEAD)),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0xFF7FAEAD),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF5FBFB),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFB2D8D8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2C7873),
                          width: 1.5,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.redAccent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.redAccent),
                      ),
                    ),
                    validator: Validators.validateEmail,
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Color(0xFF2C7873)),
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: const TextStyle(color: Color(0xFF7FAEAD)),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFF7FAEAD),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF5FBFB),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFB2D8D8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2C7873),
                          width: 1.5,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.redAccent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.redAccent),
                      ),
                    ),
                    validator: Validators.validatePassword,
                  ),
                  const SizedBox(height: 32),

                  ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C7873),
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: const Color(0xFF9BBFBE),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Ingresar',
                            style: TextStyle(fontSize: 18),
                          ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'O continúa con',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF9BBFBE)),
                  ),
                  const SizedBox(height: 16),

                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildSocialButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Color(0xFF2C7873),
                        ),
                        semanticLabel: 'Google',
                      ),
                      _buildSocialButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.github,
                          color: Color(0xFF2C7873),
                        ),
                        semanticLabel: 'GitHub',
                      ),
                      _buildSocialButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.facebookF,
                          color: Color(0xFF2C7873),
                        ),
                        semanticLabel: 'Facebook',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿No tienes una cuenta? ',
                        style: TextStyle(color: Color(0xFF9BBFBE)),
                      ),
                      TextButton(
                        onPressed: _isLoading
                            ? null
                            : () {
                                Navigator.of(
                                  context,
                                ).pushReplacementNamed('/register');
                              },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          foregroundColor: const Color(0xFF2C7873),
                        ),
                        child: const Text(
                          'Regístrate gratis',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}