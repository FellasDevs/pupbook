import 'package:flutter/material.dart';
import 'package:pupbook/components/animals/animals_page_layout.dart';
import 'package:pupbook/controllers/animals_controller.dart';

class Animals extends StatelessWidget {
  const Animals({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimalsPageLayout(controller: AnimalsController('animals'));
  }
}
