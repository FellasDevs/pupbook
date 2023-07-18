import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pupbook/controllers/auth_controller.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

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
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Woof, Woof, como vai humano ?',
                      style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Image.asset('assets/images/login-image.png'),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () => authController.signInWithGoogle(context),
                  ),
                ),
              ),
            ],
          ),
        ),);
  }
}
