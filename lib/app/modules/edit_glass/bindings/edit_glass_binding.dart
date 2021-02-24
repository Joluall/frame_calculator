import 'package:get/get.dart';

import '../controllers/edit_glass_controller.dart';

class EditGlassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditGlassController>(
      () => EditGlassController(),
    );
  }
}
