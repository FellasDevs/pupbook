import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
          title: const Text('Login'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Sign in with Google'),
            onPressed: () => authController.signInWithGoogle(context),
          ),
        ));
  }
}
