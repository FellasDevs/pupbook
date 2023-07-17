import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        results.add(Animal.fromFirestore(doc.id, doc.data()));
      }

      return results;
    } catch (error) {
      return [];
    }
  }

  create(BuildContext context, Animal animal) async {
    try {
      await _db.collection(_collection).doc().set(animal.toFirestore());
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao adicionar animal: $error'),
        ),
      );
    }
  }

  edit(BuildContext context, Animal animal) async {
    try {
      await _db
          .collection(_collection)
          .doc(animal.id)
          .set(animal.toFirestore());
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao editar animal: $error'),
        ),
      );
    }
  }

  delete(BuildContext context, Animal animal) async {
    try {
      await _db.collection(_collection).doc(animal.id).delete();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao deletar animal: $error'),
        ),
      );
    }
  }
}
