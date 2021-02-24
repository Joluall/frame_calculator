import 'package:flutter/material.dart';
import 'package:frame_calculator/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: "HI",
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                "https://i.imgur.com/IBZtTTn.png",
              ),
            )),
          ),
          Card(
            child: ListTile(
              title: Text(
                'Usuario: ${_homeController.userName}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () => {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar Sesión'),
            onTap: () {
              _homeController.logOut();
            },
          ),
        ],
      ),
    );
  }
}
