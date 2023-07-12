import 'package:flutter/material.dart';
import 'package:pupbook/components/template/page_scaffold.dart';

class UnifeiDogs extends StatelessWidget {
  const UnifeiDogs({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: 'Cães da Unifei',
      child: Center(child: Text('Animais')),
    );
  }
}
