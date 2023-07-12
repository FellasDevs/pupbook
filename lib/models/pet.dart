import 'package:pupbook/models/animal.dart';

class Pet extends Animal {
  final String owner;

  Pet({
    required this.owner,
    required super.name,
    required super.gender,
    required super.size,
    required super.weight,
    required super.species,
    required super.vaccines,
    super.birthDate,
    super.breed,
    super.image,
  });
}
