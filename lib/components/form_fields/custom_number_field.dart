import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pupbook/components/form_fields/base_custom_field.dart';

class CustomNumberField extends StatelessWidget {
  final String label;
  final FormFieldValidator? validator;
  final num value;
  final ValueChanged<num> onChanged;
  final bool required;

  const CustomNumberField({
    super.key,
    required this.onChanged,
    required this.value,
    this.label = '',
    this.validator,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCustomField(
      required: required,
      value: value,
      text: value.toString(),
      validator: validator,
      onChanged: (newValue) {
        final parsedValue = num.tryParse(newValue);

        if (parsedValue == null) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'O valor inserido contém erros, por favor insira um número válido',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onError),
                  ),
                ),
              ),
            ),
          );
        }

        onChanged(parsedValue!);
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]'))],
      label: label,
    );
  }
}
