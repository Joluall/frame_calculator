import 'package:flutter/material.dart';
import 'package:frame_calculator/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/molding_controller.dart';
import 'local_widgets/molding_search_app_bar.dart';

class MoldingView extends GetView<MoldingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MoldingSearchAppBar(),
      body: GetBuilder<MoldingController>(
        id: "molding_list_view",
        builder: (_) {
          if (_.filteredMolding.length != 0 || _.molding.length != 0) {
            if (_.filteredMolding.length != 0) {
              return ListView.builder(
                itemCount: _.filteredMolding.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: ImageIcon(
                            NetworkImage("https://i.imgur.com/UhVZ9bL.png")),
                        title: Text("${_.filteredMolding[index].name}"),
                        onTap: () {
                          Get.toNamed(Routes.EDIT_MOLDING,
                              arguments: _.filteredMolding[index]);
                        },
                        trailing: Text(
                            "L${_.filteredMolding[index].price.toStringAsFixed(2)}"),
                      ),
                      Divider(),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  "Sin resultados",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.goToAddMoldingPage();
        },
      ),
    );
  }
}
