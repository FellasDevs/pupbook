import 'package:flutter/material.dart';
import 'package:pupbook/component/template/animal_page_template.dart';

class Animals extends StatelessWidget {
  const Animals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimalsPageTemplate(
      title: 'Animais',
      child: const Center(child: Text('Animais')),
    );
  }
}