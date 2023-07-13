class Animal {
  final String name;
  final String description;
  final String gender;
  final String size;
  final num weight;
  final String species;
  final List<String> vaccines;
  final DateTime? birthDate;
  final String? breed;
  final String? image;
  final String? owner;

  Animal({
    required this.name,
    required this.description,
    required this.gender,
    required this.size,
    required this.weight,
    required this.species,
    this.vaccines = const [],
    this.breed,
    this.birthDate,
    this.image,
    this.owner,
  });

  factory Animal.fromFirestore(Map<String, dynamic> doc) {
    return Animal(
      name: doc['name'],
      description: doc['description'],
      gender: doc['gender'],
      size: doc['size'],
      weight: doc['weight'],
      species: doc['species'],
      vaccines: List<String>.from(doc['vaccines']),
      breed: doc['breed'],
      birthDate: DateTime.tryParse(doc['birth_date']),
      image: doc['image'],
      owner: doc['owner'],
    );
  }
}
