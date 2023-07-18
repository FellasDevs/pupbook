import 'package:flutter/material.dart';
import 'package:pupbook/components/animals/animals_page_layout.dart';
import 'package:pupbook/controllers/animals_controller.dart';

class UnifeiDogs extends StatelessWidget {
  const UnifeiDogs({super.key});

  @override
  Widget build(BuildContext context) {
    final userIdAdmin = false; // FirebaseAuth.instance.currentUser != null;

    return AnimalsPageLayout(
      controller: AnimalsController('unifei_dogs'),
      userCanModifyAnimal: (animal) => userIdAdmin,
      userCanAddAnimal: userIdAdmin,
      title: 'Unifei Dogs',
    );
  }
}
