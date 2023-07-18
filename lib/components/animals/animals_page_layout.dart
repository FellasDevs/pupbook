import 'package:flutter/material.dart';
import 'package:pupbook/components/animals/animals_list/animals_list.dart';
import 'package:pupbook/components/animals/create_animal.dart';
import 'package:pupbook/components/generic/confirmation_dialog.dart';
import 'package:pupbook/components/layout/page_scaffold.dart';
import 'package:pupbook/controllers/animals_controller.dart';
import 'package:pupbook/models/animal.dart';

class AnimalsPageLayout extends StatefulWidget {
  final bool Function(Animal)? userCanModifyAnimal;
  final bool userCanAddAnimal;
  final String title;

  final AnimalsController controller;

  const AnimalsPageLayout({
    super.key,
    required this.controller,
    this.userCanModifyAnimal,
    this.userCanAddAnimal = false,
    required this.title,
  });

  @override
  createState() => _AnimalsPageLayoutState();
}

class _AnimalsPageLayoutState extends State<AnimalsPageLayout> {
  List<Animal> animals = [];
  var isLoading = false;

  onAdd() async {
    Animal? newAnimal = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateAnimal(),
      ),
    );

    if (newAnimal == null) return;

    setState(() {
      isLoading = true;
    });

    await widget.controller.create(context, newAnimal);
    await getAnimals();
  }

  onEdit(Animal animal) async {
    Animal? newAnimal = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateAnimal(animal: animal),
      ),
    );

    if (newAnimal == null) return;

    setState(() {
      isLoading = true;
    });

    await widget.controller.edit(context, newAnimal);
    await getAnimals();
  }

  onDelete(Animal animal) async {
    final shouldDelete = await ConfirmationDialog(
      context,
      title: 'Deseja deletar ${animal.name}?',
      description:
          'Tem certeza que deseja deletar ${animal.name}? Essa ação não pode ser desfeita!',
      confirmBtnTxt: 'Deletar',
      confirmButtonBgColor: Theme.of(context).colorScheme.error,
      confirmButtonTxtColor: Theme.of(context).colorScheme.onError,
    );

    if (shouldDelete != true) return;

    setState(() {
      isLoading = true;
    });

    await widget.controller.delete(context, animal);
    await getAnimals();
  }

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
            title: widget.title,
            actionButtonOnPressed:
                widget.userCanAddAnimal ? () => onAdd() : null,
            child: AnimalsList(
              animals: animals,
              onEdit: onEdit,
              onDelete: onDelete,
              userCanModifyAnimal: widget.userCanModifyAnimal,
            ),
          );
  }
}
