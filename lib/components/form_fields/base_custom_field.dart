import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseCustomField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final bool required;
  final void Function(FormFieldState<T> state)? onTap;
  final FormFieldValidator<dynamic>? validator;
  final ValueChanged<String>? onChanged;
  final String text;
  final bool readOnly;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const BaseCustomField({
    super.key,
    required this.required,
    this.value,
    this.text = '',
    this.label = '',
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onTap,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: value,
        validator: validator,
        builder: (state) {
          return TextFormField(
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            onChanged: onChanged,
            initialValue: text,
            onTap: () => onTap != null ? onTap!(state) : null,
            readOnly: readOnly,
            decoration: InputDecoration(
              label: Row(
                children: [
                  Text(label[0].toUpperCase() + label.substring(1)),
                  if (required)
                    const Text('*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          );
        });
  }
}
