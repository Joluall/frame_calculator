import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumsOnlyTextField extends StatelessWidget {
  final String initialValue;
  final String label;
  final TextEditingController controller;

  const NumsOnlyTextField(
      {Key key, this.initialValue, @required this.label, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        labelText: 'ID',
        border: OutlineInputBorder(),
      ),
    );
  }
}
