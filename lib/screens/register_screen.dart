import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {

  final TextEditingController userController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  void register() {

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(
        content: Text(
          'Usuario registrado',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Registro'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Column(
          children: [

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
                onPressed: register,

                child: const Text(
                  'Registrarse',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}