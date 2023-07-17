import 'package:flutter/material.dart';
import 'package:pupbook/models/animal.dart';

class AnimalsListItemContent extends StatelessWidget {
  final Animal animal;

  const AnimalsListItemContent({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    _styledText(String text) {
      return Text(
        text,
        maxLines: 1,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 20,
            color: Theme.of(context).colorScheme.onTertiary),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: animal.image != null
                ? DecorationImage(
                    image: NetworkImage(animal.image!),
                    fit: BoxFit.fill,
                  )
                : null,
          ),
        ),
        Container(
          width: 270,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(shape: BoxShape.rectangle),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _styledText(animal.name),
              _styledText(animal.description),
            ],
          ),
        ),
        Icon(Icons.arrow_forward,
            color: Theme.of(context).colorScheme.onTertiary),
      ],
    );
  }
}
