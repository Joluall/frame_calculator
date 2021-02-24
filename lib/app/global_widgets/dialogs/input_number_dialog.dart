import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNumberDialog extends StatelessWidget {
  final String titleString;
  final TextEditingController dialogController;
  final VoidCallback onPressOkButtonFuntion;
  final Function(String) onSubmitedFunction;

  const InputNumberDialog(
      {Key key,
      @required this.titleString,
      @required this.dialogController,
      @required this.onPressOkButtonFuntion,
      @required this.onSubmitedFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titleString),
      content: TextField(
        keyboardType: TextInputType.number,
        onSubmitted: onSubmitedFunction,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        maxLines: 1,
        maxLengthEnforcement: MaxLengthEnforcement.none,
        autofocus: true,
        enabled: true,
        controller: dialogController,
        decoration: new InputDecoration(
          errorStyle: TextStyle(color: Colors.redAccent),
          border: new UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(40, 40, 40, 1.0),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(40, 40, 40, 1.0),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(40, 40, 40, 1.0),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      actions: [
        TextButton(child: Text("Ok"), onPressed: onPressOkButtonFuntion),
      ],
    );
  }
}
