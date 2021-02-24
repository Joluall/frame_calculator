import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frame_calculator/app/modules/home/views/local_widgets/home_drawer.dart';
import 'package:frame_calculator/app/routes/app_pages.dart';
import 'package:frame_calculator/app/utils/helpers.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calcular precio de marcos"),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: 'Menú principal',
              );
            },
          ),
          actions: [
            IconButton(
              tooltip: "Editar precio del vidrio",
              icon: ImageIcon(NetworkImage("https://i.imgur.com/tXVSeiP.png")),
              onPressed: () {
                Get.toNamed(Routes.EDIT_GLASS);
              },
            ),
            IconButton(
              tooltip: "Editar molduras",
              icon: ImageIcon(NetworkImage("https://i.imgur.com/UhVZ9bL.png")),
              onPressed: () {
                Get.toNamed(Routes.MOLDING);
              },
            )
          ],
        ),
        drawer: SafeArea(child: HomeDrawer()),
        body: FutureBuilder(
          future: controller.load(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: GetBuilder<HomeController>(
                  id: "home_b01",
                  builder: (_) => Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          width: 400,
                          child: TextFormField(
                            autofocus: true,
                            controller: _.anchuraController,
                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                              _.makeTheCalculation();
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter(
                                  RegExp(
                                      r"^([+|-])?\d*([.])?(\d\.\d{1,2})?(\.\d{1,2})?$"),
                                  allow: true)
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Anchura(pulgadas) "),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: 400,
                          child: TextFormField(
                            controller: _.alturaController,
                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                              _.makeTheCalculation();
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter(
                                  RegExp(
                                      r"^([+|-])?\d*([.])?(\d\.\d{1,2})?(\.\d{1,2})?$"),
                                  allow: true)
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Altura(pulgadas)"),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: 400,
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            selectedItem: _.moldingName,
                            showSelectedItem: true,
                            items: _.moldingStrings,
                            label: "Moldura",
                            hint: "Moldura",
                            showSearchBox: true,
                            onChanged: (value) {
                              _.dropDownButtonChange(value);
                            },
                            maxHeight: 300,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: 400,
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            selectedItem: _.calculationName,
                            showSelectedItem: true,
                            items: _.calculationStrings,
                            label: "Precio a calcular",
                            hint: "Precio a calcular",
                            showSearchBox: true,
                            onChanged: (value) {
                              _.dropDownButtonChange2(value);
                            },
                            maxHeight: 300,
                          ),
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Wrap(
                                children: [
                                  Text(
                                    "Precio por pulgada de la moldura: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "${setMoneyString(_.moldingSelected.price.toString())}"),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Wrap(
                                children: [
                                  Text(
                                    "Precio por pulgada cuadrada del vidrio: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "${setMoneyString(_.glass.price.toString())}"),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              child: Wrap(
                                children: [
                                  Text(
                                    "Formula utilizada: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("${_.calculationSelected.formula}"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              child: totalColumn(_),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Column totalColumn(HomeController _) {
    Column b;
    if (_.total != null) {
      b = Column(
        children: [
          Text(
            "Precio:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("${setMoneyString(_.total.toStringAsFixed(0))}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ],
      );
    } else {
      b = Column();
    }
    return b;
  }
}
