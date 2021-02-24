import 'package:flutter/material.dart';
import 'package:frame_calculator/app/data/models/molding.dart';
import 'package:frame_calculator/app/modules/home/controllers/home_controller.dart';
import 'package:frame_calculator/app/modules/molding/controllers/molding_controller.dart';
import 'package:frame_calculator/app/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class AddMoldingController extends GetxController {
  final d.Dio _dio = Get.find<d.Dio>();
  final _moldingController = Get.find<MoldingController>();
  final _homeController = Get.find<HomeController>();

  final formKey = GlobalKey<FormState>();

  String name = "";
  String category = "Productos";
  String price = "";
  String model = "";
  String brand = "";
  String year = "";
  String cost = "";
  bool onSale = true;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void addMolding() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      String _name;
      double _price;

      _name = setString(name);
      _price = setDouble(price);

      Molding _molding = Molding(
        name: _name,
        price: _price,
      );

      final d.Response response =
          await _dio.post('molding', data: _molding.toJson());

      var data = response.data;
      print(data);
      _moldingController.loadMolding();
      _homeController.load();
      Get.back();
    }
  }
}
