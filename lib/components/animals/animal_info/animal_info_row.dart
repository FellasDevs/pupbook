import 'package:flutter/material.dart';

class AnimalInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const AnimalInfoRow({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8.0),
          Text(
            value,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
