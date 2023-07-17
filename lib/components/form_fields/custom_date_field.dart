import 'package:flutter/material.dart';
import 'package:pupbook/components/form_fields/base_custom_field.dart';

class CustomDateField extends StatefulWidget {
  final String label;
  final FormFieldValidator? validator;
  final DateTime? value;
  final ValueChanged<DateTime> onChanged;
  final bool required;

  const CustomDateField({
    super.key,
    required this.onChanged,
    this.label = '',
    this.value,
    this.validator,
    this.required = false,
  });

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  static const firstDate = Duration(days: 365 * 100);
  DateTime? statefulValue;

  @override
  void initState() {
    super.initState();
    statefulValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return BaseCustomField<DateTime>(
      label: widget.label,
      value: widget.value,
      text: statefulValue?.toLocal().toString() ?? '',
      validator: widget.validator,
      required: widget.required,
      readOnly: true,
      onTap: (state) async {
        final date = await showDatePicker(
          context: context,
          initialDate: widget.value ?? DateTime.now(),
          firstDate: DateTime.now().subtract(firstDate),
          lastDate: DateTime.now(),
        );

        if (date == null) return;

        widget.onChanged(date);
        setState(() {
          statefulValue = date;
        });
      },
    );
  }
}
