import 'package:flutter/material.dart';

class CustomRadioField extends StatelessWidget {
  final Iterable<MapEntry<String, String>> items;
  final String label;
  final FormFieldValidator? validator;
  final String value;
  final ValueChanged<String> onChanged;
  final bool required;

  const CustomRadioField({
    super.key,
    required this.onChanged,
    required this.items,
    required this.value,
    this.label = '',
    this.validator,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: value.isNotEmpty ? value : items.first.value,
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
            ...items.map<Widget>(
              (item) => GestureDetector(
                onTap: () {
                  onChanged(item.value);
                  state.didChange(item.value);
                },
                child: Row(
                  children: [
                    Radio<String>(
                      value: item.value,
                      groupValue: state.value,
                      onChanged: (value) {},
                    ),
                    Text(item.key),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
