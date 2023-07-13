import 'package:flutter/material.dart';
import 'package:pupbook/models/animal.dart';
import 'package:pupbook/pages/animal_info/pieces/build_info_row.dart';
import 'package:pupbook/pages/animal_info/logic/calculate_age.dart';

class AnimalInfo extends StatelessWidget {
  final Animal animal;

  const AnimalInfo({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    final animalAge = AgeCalculator.calculateAge(animal.birthDate);

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (animal.image != null) ...[
            Image.network(
                animal.image!,
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16.0),
          ],
          Text(
            animal.name,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          buildInfoRow('Espécie', animal.species),
          buildInfoRow('Gênero', animal.gender),
          buildInfoRow('Tamanho', animal.size),
          buildInfoRow('Peso', '${animal.weight} kg'),
          if (animal.breed != null) buildInfoRow('Raça', animal.breed!),
          if (animal.birthDate != null) buildInfoRow('Idade', animalAge),
          if (animal.owner != null) buildInfoRow('Dono', animal.owner!),
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
        ],
      ),
    );
  }
}
