class Animal {
  final String? id;
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
    this.id,
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

  factory Animal.fromFirestore(String id, Map<String, dynamic> doc) {
    return Animal(
      id: id,
      name: doc['name'],
      description: doc['description'],
      gender: doc['gender'],
      size: doc['size'],
      weight: doc['weight'],
      species: doc['species'],
      vaccines: List<String>.from(doc['vaccines']),
      breed: doc['breed'],
      birthDate: DateTime.tryParse(doc['birth_date'].toString()),
      image: doc['image'],
      createdBy: doc['created_by'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return Map<String, dynamic>.fromEntries([
      MapEntry('name', name),
      MapEntry('description', description),
      MapEntry('gender', gender),
      MapEntry('size', size),
      MapEntry('weight', weight),
      MapEntry('species', species),
      MapEntry('vaccines', vaccines),
      MapEntry('breed', breed),
      MapEntry('birth_date', birthDate),
      MapEntry('image', image),
      MapEntry('created_by', createdBy),
    ]);
  }
}
