import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/dependency_injection.dart';

Future<void> main() async {
  DependencyInjection.init();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Calculadora de Marcos",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
