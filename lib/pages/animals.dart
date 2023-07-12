import 'package:flutter/material.dart';
import 'package:pupbook/components/template/page_scaffold.dart';

class Animals extends StatelessWidget {
  const Animals({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: 'Animais',
      child: Center(child: Text('Animais')),
    );
  }
}
