import 'package:flutter/material.dart';
import 'package:pupbook/component/template/animal_page_template.dart';

class UnifeiDogs extends StatelessWidget {
  const UnifeiDogs({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimalsPageTemplate(
      title: 'Cães da Unifei',
      child: Center(child: Text('Animais')),
    );
  }
}
