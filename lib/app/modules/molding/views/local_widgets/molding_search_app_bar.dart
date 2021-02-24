import 'package:flutter/material.dart';
import 'package:frame_calculator/app/modules/molding/controllers/molding_controller.dart';
import 'package:get/get.dart';

class MoldingSearchAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoldingController>(
        builder: (_) => AppBar(
              title: !_.isSearching
                  ? Text('Molduras')
                  : TextField(
                      autofocus: true,
                      cursorColor: Colors.white,
                      cursorHeight: 25,
                      onChanged: (value) {
                        _.filterMolding(value);
                      },
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " Buscar",
                          hintStyle: TextStyle(color: Colors.white60)),
                    ),
              actions: <Widget>[
                _.isSearching
                    ? IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          _.isSearchingToFalse();
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          _.isSearchingToTrue();
                        },
                      )
              ],
            ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
