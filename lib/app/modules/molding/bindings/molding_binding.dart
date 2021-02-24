import 'package:get/get.dart';

import '../controllers/molding_controller.dart';

class MoldingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoldingController>(
      () => MoldingController(),
    );
  }
}
