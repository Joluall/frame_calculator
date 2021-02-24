import 'package:frame_calculator/app/utils/global_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final GetStorage sessionBox = GetStorage();
  final GlobalController _globalController = Get.find<GlobalController>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    Future.delayed(Duration(seconds: 2), () {
      if (sessionBox.read("user_id") != null) {
        _globalController.userId = sessionBox.read("user_id");
        _globalController.userName = sessionBox.read("user_name");
        _globalController.storeName = sessionBox.read("store_name");
        _globalController.storeId = sessionBox.read("store_id");

        print(sessionBox.read("user_name"));
        Get.offAllNamed("/home");
      } else {
        print(sessionBox.read("user_name"));
        Get.offAllNamed("/login");
      }
    });
  }

  @override
  void onClose() {}
}
