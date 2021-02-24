import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GlobalController extends GetxController {
  final GetStorage sessionBox = GetStorage();
  int userId;
  String userName;
  String storeName;
  int storeId;

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

  logOut() {
    sessionBox.erase();
    Get.offAllNamed("/login");
  }
}
