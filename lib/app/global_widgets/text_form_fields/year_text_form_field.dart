import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YearTextFormField extends StatelessWidget {
  final String initialValue;
  final String Function(String) validatorFunction;
  final void Function(String) onSavedFunction;
  final String label;

  const YearTextFormField(
      {Key key,
      @required this.initialValue,
      this.validatorFunction,
      @required this.onSavedFunction,
      @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: validatorFunction,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter(RegExp(r"\d{1,4}$"), allow: true)
      ],
      onSaved: onSavedFunction,
      decoration: InputDecoration(labelText: label),
    );
  }
}
