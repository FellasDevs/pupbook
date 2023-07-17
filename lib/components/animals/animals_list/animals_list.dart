import 'package:flutter/material.dart';
import 'package:pupbook/components/animals/animals_list/animals_list_item.dart';
import 'package:pupbook/models/animal.dart';

class AnimalsList extends StatelessWidget {
  final List<Animal> animals;
  final bool Function(Animal)? userCanModifyAnimal;
  final void Function(Animal) onDelete;
  final void Function(Animal) onEdit;

  const AnimalsList({
    super.key,
    required this.animals,
    required this.onEdit,
    required this.onDelete,
    this.userCanModifyAnimal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scrollbar(
            child: ListView.separated(
              padding: const EdgeInsets.all(15),
              itemCount: animals.length,
              separatorBuilder: (context, index) =>
                  const Padding(padding: EdgeInsets.only(top: 12)),
              itemBuilder: (context, index) => AnimalsListItem(
                animal: animals[index],
                onEdit: onEdit,
                onDelete: onDelete,
                canModify: userCanModifyAnimal != null
                    ? userCanModifyAnimal!(animals[index])
                    : false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
