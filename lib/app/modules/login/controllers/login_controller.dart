import 'package:flutter/material.dart';
import 'package:frame_calculator/app/data/models/user.dart';
import 'package:frame_calculator/app/data/repositories/remote/users_repository.dart';
import 'package:frame_calculator/app/global_widgets/dialogs/loading_dialog.dart';
import 'package:frame_calculator/app/utils/constants.dart';
import 'package:frame_calculator/app/utils/global_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final GlobalController _globalController = Get.find<GlobalController>();
  final UsersRepository _usersRepository = Get.find<UsersRepository>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode userNameFocusNode;
  FocusNode passwordFocusNode;
  //
  List<User> users = [];

  @override
  void onReady() {
    super.onReady();
    userNameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  Future<void> load() async {
    Get.dialog(LoadingDialog());
    try {
      final GetStorage sessionBox = GetStorage();

      List<User> _users = await _usersRepository.getUsers();
      bool found = false;
      for (var u in _users) {
        if (u.name == userNameController.text &&
            u.password == passwordController.text) {
          sessionBox.write("user_id", u.userId);
          sessionBox.write("user_name", u.name);
          _globalController.userId = u.userId;
          _globalController.userName = u.name;
          found = true;
        }
      }

      if (found == true) {
        Get.back();
        Get.offAllNamed("/home");
      } else {
        Get.back();
        Get.snackbar("Credenciales Incorrectas",
            "Los datos para nombre de usuario o contraseña que usted ingresó con incorrectos",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar(Constants.titleError, Constants.networkError,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    super.onClose();
    userNameFocusNode.dispose();
    passwordFocusNode.dispose();
  }
}
