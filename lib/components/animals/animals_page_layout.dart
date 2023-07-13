import 'package:flutter/material.dart';
import 'package:pupbook/components/animals/animals_list/animals_list.dart';
import 'package:pupbook/components/layout/page_scaffold.dart';
import 'package:pupbook/controllers/animals_controller.dart';
import 'package:pupbook/models/animal.dart';

class AnimalsPageLayout extends StatefulWidget {
  final AnimalsController controller;

  const AnimalsPageLayout({super.key, required this.controller});

  @override
  createState() => _AnimalsPageLayoutState();
}

class _AnimalsPageLayoutState extends State<AnimalsPageLayout> {
  List<Animal> animals = [];
  var isLoading = false;

  getAnimals() async {
    setState(() {
      isLoading = true;
    });

    final results = await widget.controller.getAnimals();

    setState(() {
      animals = results;
      isLoading = false;
    });
  }

  @override
  initState() {
    super.initState();
    getAnimals();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.surface),
          )
        : PageScaffold(
            title: 'Cães da Unifei',
            child: Column(children: [
              AnimalsList(
                animals: animals,
              ),
            ]),
          );
  }
}
