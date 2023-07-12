import 'package:flutter/material.dart';

class AnimalsPageTemplate extends StatelessWidget {
  final Widget? child;
  final String title;

  const AnimalsPageTemplate({Key? key, this.child, required this.title}) : super(key: key);

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
      body: Stack(
        children: [
          if (child != null) Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: child!,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic for adding items to the table here
          // You can display a dialog or navigate to another screen to add items
          // For this example, we'll just print a message to the console
          print('Add button pressed');
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
