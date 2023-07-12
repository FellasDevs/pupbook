import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimalsPageTemplate extends StatelessWidget {
  final Widget? child;
  final String title;
  final VoidCallback? actionButtonOnPressed;

  const AnimalsPageTemplate({super.key, this.child, required this.title, this.actionButtonOnPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: child,

      floatingActionButton: actionButtonOnPressed != null ? FloatingActionButton(
        onPressed: actionButtonOnPressed ,
        child: const Icon(Icons.add),
      ): null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
