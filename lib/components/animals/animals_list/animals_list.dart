import 'package:flutter/material.dart';
import 'package:pupbook/components/animals/animals_list/animals_list_item.dart';
import 'package:pupbook/models/animal.dart';

class AnimalsList extends StatelessWidget {
  final List<Animal> animals;

  const AnimalsList({super.key, required this.animals});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        child: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemCount: animals.length,
          separatorBuilder: (context, index) =>
              const Padding(padding: EdgeInsets.only(top: 12)),
          itemBuilder: (context, index) =>
              AnimalsListItem(animal: animals[index]),
        ),
      ),
    );
  }
}
