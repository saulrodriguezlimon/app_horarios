import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController userController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  void login() {

    final username = userController.text;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(
          username: username,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: SingleChildScrollView(

          padding: const EdgeInsets.all(30),

          child: Column(
            children: [

              const Icon(
                Icons.school,
                size: 90,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              const Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: userController,

                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: true,

                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: login,

                  child: const Text(
                    'Entrar',
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const RegisterScreen(),
                    ),
                  );
                },

                child: const Text(
                  'Crear cuenta',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}