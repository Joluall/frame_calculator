import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YesNoDialog extends StatelessWidget {
  final String titleString;
  final String contentString;
  final VoidCallback yesFunction;

  const YesNoDialog(
      {Key key,
      @required this.titleString,
      @required this.contentString,
      @required this.yesFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        title: Text(titleString),
        content: Text(contentString),
        actions: [
          TextButton(
            child: Text("No"),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: Text("Si"),
            onPressed: yesFunction,
          )
        ],
      ),
    );
  }
}
