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
        Image.asset('assets/images/girl-&-cat-alt.png'),
        const Text('PupBook',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
        ElevatedButton(
            onPressed: () => authController.signOut(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text(
              'Sair',
              style: TextStyle(fontSize: 20.0),
            )),
      ],
    ));
  }
}
