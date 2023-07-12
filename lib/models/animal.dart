abstract class Animal {
  final String name;
  final String gender;
  final String size;
  final double weight;
  final String species;
  final List<String> vaccines;
  final DateTime? birthDate;
  final String? breed;
  final String? image;

  Animal({
    required this.name,
    required this.gender,
    required this.size,
    required this.weight,
    required this.species,
    this.vaccines = const [],
    this.breed,
    this.birthDate,
    this.image,
  });
}
