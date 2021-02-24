import 'package:flutter/material.dart';
import 'package:frame_calculator/app/data/models/glass.dart';
import 'package:frame_calculator/app/modules/home/controllers/home_controller.dart';

import 'package:frame_calculator/app/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class EditGlassController extends GetxController {
  final d.Dio _dio = Get.find<d.Dio>();
  final _homeController = Get.find<HomeController>();

  final formKey = GlobalKey<FormState>();

  String price;

  @override
  void onInit() {
    super.onInit();
    price = _homeController.glass.price.toStringAsFixed(2);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void editGlass() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      double _price = setDouble(price);

      Glass _glass = Glass(
        id: _homeController.glass.id,
        name: _homeController.glass.name,
        price: _price,
      );

      final d.Response response = await _dio.patch(
          'glass?id=${_homeController.glass.id.toString()}',
          data: _glass.toJson());

      var data = response.data;
      print(data);
      _homeController.load();

      Get.back();
    }
  }
}
