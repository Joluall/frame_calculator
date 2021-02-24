import 'package:get/get.dart';

import '../controllers/edit_molding_controller.dart';

class EditMoldingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMoldingController>(
      () => EditMoldingController(),
    );
  }
}
