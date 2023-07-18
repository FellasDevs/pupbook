import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pupbook/components/animals/animals_page_layout.dart';
import 'package:pupbook/controllers/animals_controller.dart';

class Animals extends StatelessWidget {
  const Animals({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return AnimalsPageLayout(
      controller: AnimalsController('animals'),
      title: 'Pets',
      userCanAddAnimal: user != null,
      userCanModifyAnimal: (animal) => animal.createdBy == user?.uid,
    );
  }
}
