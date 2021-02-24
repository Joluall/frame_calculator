import 'package:flutter/material.dart';

class SubMenuButton extends StatelessWidget {
  final String textButton;
  final String imageUrl;
  final VoidCallback onPressFuntion;

  const SubMenuButton(
      {Key key,
      @required this.textButton,
      @required this.imageUrl,
      @required this.onPressFuntion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: SizedBox(
        width: 300,
        child: InkWell(
          onTap: onPressFuntion,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  ImageIcon(
                    NetworkImage(imageUrl),
                    color: Colors.black,
                    size: 28,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    textButton,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
