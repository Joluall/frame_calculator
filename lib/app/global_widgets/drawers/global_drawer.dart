import 'package:flutter/material.dart';
import 'package:frame_calculator/app/utils/global_controller.dart';
import 'package:get/get.dart';

class GlobalDrawer extends StatelessWidget {
  final GlobalController _globalController = Get.find<GlobalController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Card(
            child: ListTile(
              trailing: IconButton(
                onPressed: () {
                  _globalController.logOut();
                },
                icon: Icon(Icons.logout),
              ),
              leading: Icon(Icons.account_box),
              title: Text('${_globalController.userName}'),
              subtitle: Text("Administrador"),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () => {Get.toNamed("/home")},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
