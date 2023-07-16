import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pupbook/models/animal.dart';

class AnimalsController {
  final String _collection;
  final _db = FirebaseFirestore.instance;

  AnimalsController(this._collection);

  Future<List<Animal>> getAnimals() async {
    try {
      List<Animal> results = [];

      final result = await _db.collection(_collection).get();

      for (var doc in result.docs) {
        results.add(Animal.fromFirestore(
          Map<String, dynamic>.from(Map<String, dynamic>.from(doc.data())),
        ));
      }

      return results;
    } catch (error) {
      return [];
    }
  }
}
