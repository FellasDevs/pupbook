import 'package:flutter/material.dart';
import 'package:pupbook/components/animals/animal_info/animal_info_row.dart';
import 'package:pupbook/components/layout/page_scaffold.dart';
import 'package:pupbook/models/animal.dart';
import 'package:pupbook/utils/calculate_age.dart';

class AnimalInfo extends StatelessWidget {
  final Animal animal;

  const AnimalInfo({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    final animalAge =
        animal.birthDate != null ? calculateAge(animal.birthDate!) : null;

    final imageExists = animal.image != null && animal.image!.isNotEmpty;

    final fields = [
      ...[
        imageExists
            ? Image.network(
                animal.image!,
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : const Spacer()
      ],
      Text(
        animal.name,
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16.0),
      AnimalInfoRow(label: 'Espécie', value: animal.species),
      AnimalInfoRow(label: 'Gênero', value: animal.gender),
      AnimalInfoRow(label: 'Tamanho', value: animal.size),
      AnimalInfoRow(label: 'Peso', value: '${animal.weight} kg'),
      if (animal.breed != null)
        AnimalInfoRow(label: 'Raça', value: animal.breed!),
      if (animal.birthDate != null)
        AnimalInfoRow(label: 'Idade', value: animalAge.toString()),
      if (animal.vaccines.isNotEmpty) ...[
        const SizedBox(height: 16.0),
        const Text(
          'Vacinas:',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: animal.vaccines.map((vaccine) => Text(vaccine)).toList(),
          ),
        ),
      ],
    ];

    return PageScaffold(
      title: animal.name,
      child: Column(
        children: [
          Expanded(
            child: Scrollbar(
              child: ListView.separated(
                padding: const EdgeInsets.all(15),
                itemCount: fields.length,
                separatorBuilder: (context, index) =>
                    const Padding(padding: EdgeInsets.only(top: 12)),
                itemBuilder: (context, index) => fields[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
