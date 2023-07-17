class Animal {
  String name;
  String description;
  String gender;
  String size;
  num weight;
  String species;
  List<String> vaccines;
  DateTime? birthDate;
  String? breed;
  String? image;
  String? createdBy;

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
    this.createdBy,
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
      createdBy: doc['created_by'],
    );
  }
}
