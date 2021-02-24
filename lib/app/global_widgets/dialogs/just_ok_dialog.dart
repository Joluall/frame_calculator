import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JustOkDialog extends StatelessWidget {
  final String titleString;
  final String contentString;

  const JustOkDialog(
      {Key key, @required this.titleString, @required this.contentString})
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
            child: Text("Ok"),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
