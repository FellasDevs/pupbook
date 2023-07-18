import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:go_router/go_router.dart';
import 'package:pupbook/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final authController = AuthController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) context.go('/home');
    });

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Bem vindo ao Pupbook')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Woof, Woof, como vai humano ?',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/images/dog-&-boy.png'),
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () => authController.signInWithGoogle(context),
            ),
          ],
        ),
      ),
    );
  }
}
