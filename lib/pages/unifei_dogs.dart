import 'package:flutter/material.dart';
import 'package:pupbook/components/animals/animals_page_layout.dart';
import 'package:pupbook/controllers/animals_controller.dart';

class UnifeiDogs extends StatelessWidget {
  const UnifeiDogs({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimalsPageLayout(
      controller: AnimalsController('unifei_dogs'),
      userCanModifyAnimal: (animal) => true,
      userCanAddAnimal: true,
    );
  }
}
