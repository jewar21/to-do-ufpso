import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Tareas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/register');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          '¡Bienvenido a To-Do UFPSO!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implementar creación de tareas
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
