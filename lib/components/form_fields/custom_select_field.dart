import 'package:flutter/material.dart';

class CustomSelectField extends StatelessWidget {
  final Iterable<DropdownMenuItem<String>> items;
  final String label;
  final FormFieldValidator? validator;
  final String? value;
  final ValueChanged<String> onChanged;
  final bool required;

  const CustomSelectField({
    super.key,
    required this.onChanged,
    required this.items,
    this.label = '',
    this.value,
    this.validator,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue:
          value != null && value!.isNotEmpty ? value : items.first.value,
      validator: validator,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(label[0].toUpperCase() + label.substring(1),
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    )),
                if (required)
                  const Text('*', style: TextStyle(color: Colors.red)),
              ],
            ),
            DropdownButton<String>(
              hint: const Text('Selecione um item'),
              value: state.value,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (value) {
                if (value == null) return;

                onChanged(value);
                state.didChange(value);
              },
              items: items.toList(),
            ),
          ],
        );
      },
    );
  }
}
