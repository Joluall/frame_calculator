import 'package:get/get.dart';

import '../controllers/add_molding_controller.dart';

class AddMoldingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMoldingController>(
      () => AddMoldingController(),
    );
  }
}
