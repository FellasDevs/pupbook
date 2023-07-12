import 'package:flutter/material.dart';
import 'package:pupbook/components/template/animal_page_template.dart';

class Animals extends StatelessWidget {
  const Animals({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimalsPageTemplate(
      title: 'Animais',
      child: Center(child: Text('Animais')),
    );
  }
}
