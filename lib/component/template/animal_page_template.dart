import 'package:flutter/material.dart';

class AnimalsPageTemplate extends StatelessWidget {
  final Widget? child;
  final String title;
  final bool showAddButton;
  final VoidCallback? onClick;

  const AnimalsPageTemplate({super.key, this.child, required this.title, this.onClick, this.showAddButton = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: child,

      floatingActionButton: showAddButton ? FloatingActionButton(
        onPressed: () => onClick,
        child: Icon(Icons.add),
      ): null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
