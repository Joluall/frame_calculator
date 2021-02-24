import 'package:flutter/material.dart';
import 'package:frame_calculator/app/data/models/molding.dart';
import 'package:frame_calculator/app/modules/home/controllers/home_controller.dart';
import 'package:frame_calculator/app/modules/molding/controllers/molding_controller.dart';
import 'package:frame_calculator/app/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class EditMoldingController extends GetxController {
  final d.Dio _dio = Get.find<d.Dio>();
  final _moldingController = Get.find<MoldingController>();
  final _homeController = Get.find<HomeController>();

  final formKey = GlobalKey<FormState>();

  Molding mold;
  String name;
  String price;

  @override
  void onInit() {
    super.onInit();
    mold = Get.arguments;
    name = mold.name;
    price = mold.price.toStringAsFixed(2);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void editMolding() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      int _id;
      String _name;
      double _price;

      _id = mold.id;

      _name = setString(name);
      _price = setDouble(price);

      Molding _molding = Molding(
        id: _id,
        name: _name,
        price: _price,
      );

      final d.Response response = await _dio
          .patch('molding?id=${_id.toString()}', data: _molding.toJson());

      var data = response.data;
      print(data);
      _moldingController.loadMolding();
      _homeController.load();
      Get.back();
    }
  }
}
