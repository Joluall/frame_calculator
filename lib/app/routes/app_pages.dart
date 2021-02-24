import 'package:get/get.dart';

import 'package:frame_calculator/app/modules/add_molding/bindings/add_molding_binding.dart';
import 'package:frame_calculator/app/modules/add_molding/views/add_molding_view.dart';
import 'package:frame_calculator/app/modules/edit_glass/bindings/edit_glass_binding.dart';
import 'package:frame_calculator/app/modules/edit_glass/views/edit_glass_view.dart';
import 'package:frame_calculator/app/modules/edit_molding/bindings/edit_molding_binding.dart';
import 'package:frame_calculator/app/modules/edit_molding/views/edit_molding_view.dart';
import 'package:frame_calculator/app/modules/home/bindings/home_binding.dart';
import 'package:frame_calculator/app/modules/home/views/home_view.dart';
import 'package:frame_calculator/app/modules/login/bindings/login_binding.dart';
import 'package:frame_calculator/app/modules/login/views/login_view.dart';
import 'package:frame_calculator/app/modules/molding/bindings/molding_binding.dart';
import 'package:frame_calculator/app/modules/molding/views/molding_view.dart';
import 'package:frame_calculator/app/modules/splash/bindings/splash_binding.dart';
import 'package:frame_calculator/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MOLDING,
      page: () => MoldingView(),
      binding: MoldingBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MOLDING,
      page: () => AddMoldingView(),
      binding: AddMoldingBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MOLDING,
      page: () => EditMoldingView(),
      binding: EditMoldingBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_GLASS,
      page: () => EditGlassView(),
      binding: EditGlassBinding(),
    ),
  ];
}
