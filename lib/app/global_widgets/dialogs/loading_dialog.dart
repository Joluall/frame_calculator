import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        content: SizedBox(
          height: 50,
          width: 50,
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
