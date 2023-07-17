import 'package:flutter/material.dart';
import 'package:pupbook/components/form_fields/base_custom_field.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final FormFieldValidator? validator;
  final String? value;
  final ValueChanged<String> onChanged;
  final bool required;

  const CustomTextField({
    super.key,
    required this.onChanged,
    this.label = '',
    this.value,
    this.validator,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCustomField(
      required: required,
      value: value,
      text: value ?? '',
      validator: validator,
      onChanged: onChanged,
      label: label,
    );
  }
}
