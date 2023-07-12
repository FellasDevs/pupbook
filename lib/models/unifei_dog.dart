import 'package:pupbook/models/animal.dart';

class UnifeiDog extends Animal {
  UnifeiDog({
    required super.name,
    required super.gender,
    required super.size,
    required super.weight,
    required super.image,
    required super.vaccines,
    super.birthDate,
    super.breed,
  }) : super(species: 'dog');
}
