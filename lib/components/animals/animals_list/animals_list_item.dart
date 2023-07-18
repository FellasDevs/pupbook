import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:pupbook/components/animals/animals_list/animals_list_item_content.dart';
import 'package:pupbook/models/animal.dart';

class AnimalsListItem extends StatelessWidget {
  final bool canModify;
  final void Function(Animal) onEdit;
  final void Function(Animal) onDelete;

  final Animal animal;

  const AnimalsListItem({
    super.key,
    required this.animal,
    required this.canModify,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    editActionPane() {
      return ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            onPressed: (context) => onEdit(animal),
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Editar',
          ),
        ],
      );
    }

    deleteActionPane() {
      return ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            onPressed: (context) => onDelete(animal),
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Deletar',
          ),
        ],
      );
    }

    return Slidable(
      startActionPane: canModify ? deleteActionPane() : null,
      endActionPane: canModify ? editActionPane() : null,
      child: GestureDetector(
        onTap: () => context.push('/animal-info', extra: animal),
        child: Container(
          height: 70,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 6,
              ),
            ],
          ),
          child: AnimalsListItemContent(animal: animal),
        ),
      ),
    );
  }
}
