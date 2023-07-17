import 'package:flutter/material.dart';
import 'package:pupbook/controllers/auth_controller.dart';

class Home extends StatelessWidget {
  final authController = AuthController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Text('PupBook'),
        ElevatedButton(
            onPressed: () => authController.signOut(context),
            child: const Text('deslogar'))
      ],
    ));
  }
}
