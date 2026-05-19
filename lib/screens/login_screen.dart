import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/backgroundittla.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),

      child: Scaffold(

        backgroundColor: Colors.black.withOpacity(0.45),

        body: Center(

          child: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Container(

                width: 400,

                padding: const EdgeInsets.all(30),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.92),
                  borderRadius: BorderRadius.circular(25),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
const Icon(
  Icons.assignment_ind,
  size: 90,
  color: Colors.green,
),

                    const SizedBox(height: 20),

                    const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    TextField(
                      controller: usernameController,

                      decoration: InputDecoration(
                        labelText: 'Usuario',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: passwordController,
                      obscureText: true,

                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15),
                          ),
                        ),

                        onPressed: () {

                          Navigator.pushReplacement(
                            context,

                            MaterialPageRoute(
                              builder: (_) => HomeScreen(
                                username:
                                    usernameController.text,
                              ),
                            ),
                          );
                        },

                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

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
                        '¿No tienes cuenta? Regístrate',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}