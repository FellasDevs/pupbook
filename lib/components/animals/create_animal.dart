import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pupbook/components/form_fields/custom_date_field.dart';
import 'package:pupbook/components/form_fields/custom_number_field.dart';
import 'package:pupbook/components/form_fields/custom_radio_field.dart';
import 'package:pupbook/components/form_fields/custom_select_field.dart';
import 'package:pupbook/components/form_fields/custom_text_field.dart';
import 'package:pupbook/components/layout/page_scaffold.dart';
import 'package:pupbook/models/animal.dart';

class CreateAnimal extends StatefulWidget {
  final Animal? animal;

  const CreateAnimal({super.key, this.animal});

  @override
  State<CreateAnimal> createState() => _CreateAnimalState();
}

class _CreateAnimalState extends State<CreateAnimal> {
  Animal animal = Animal(
    name: '',
    gender: 'male',
    size: '',
    weight: 0,
    species: '',
    // opcionais \/
    description: '',
    image: '',
    breed: '',
    vaccines: [],
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.animal != null) animal = widget.animal!;
  }

  @override
  Widget build(BuildContext context) {
    final listItems = [
      CustomTextField(
        label: 'nome',
        value: animal.name,
        onChanged: (value) => animal.name = value,
        required: true,
      ),
      CustomRadioField(
        label: 'Sexo',
        value: animal.gender,
        onChanged: (value) => animal.gender = value,
        required: true,
        items: const [
          MapEntry('Macho', 'male'),
          MapEntry('Fêmea', 'female'),
        ],
      ),
      CustomSelectField(
        label: 'Tamanho',
        value: animal.size,
        onChanged: (value) => animal.size = value,
        required: true,
        items: const [
          DropdownMenuItem(value: 'small', child: Text('Pequeno')),
          DropdownMenuItem(value: 'medium', child: Text('Médio')),
          DropdownMenuItem(value: 'large', child: Text('Grande')),
        ],
      ),
      CustomSelectField(
        label: 'Espécie',
        value: animal.species,
        onChanged: (value) => animal.species = value,
        required: true,
        items: const [
          DropdownMenuItem(value: 'dog', child: Text('Cão')),
          DropdownMenuItem(value: 'cat', child: Text('Gato')),
        ],
      ),
      CustomNumberField(
        label: 'peso',
        value: animal.weight,
        onChanged: (value) => animal.weight = value,
        required: true,
      ),
      // Species
      CustomTextField(
        label: 'raça',
        value: animal.breed,
        onChanged: (value) => animal.breed = value,
      ),
      CustomTextField(
        label: 'descrição',
        value: animal.description,
        onChanged: (value) => animal.description = value,
      ),
      CustomDateField(
        onChanged: (value) => animal.birthDate = value,
        value: animal.birthDate,
        label: 'data de nascimento',
      ),
      // Breed
      // Vaccines
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;
              context.pop(animal);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    ];

    return PageScaffold(
      title: 'Animal',
      child: Column(
        children: [
          Expanded(
            child: Scrollbar(
              child: Form(
                key: _formKey,
                child: ListView.separated(
                  padding: const EdgeInsets.all(15),
                  itemCount: listItems.length,
                  itemBuilder: (context, index) => listItems[index],
                  separatorBuilder: (context, index) =>
                      const Padding(padding: EdgeInsets.only(top: 12)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
