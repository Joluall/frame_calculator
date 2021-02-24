import 'package:dio/dio.dart';
import 'package:frame_calculator/app/data/providers/remote/glass_provider.dart';
import 'package:frame_calculator/app/data/providers/remote/molding_provider.dart';
import 'package:frame_calculator/app/data/providers/remote/users_provider.dart';
import 'package:frame_calculator/app/data/repositories/remote/glass_repository.dart';
import 'package:frame_calculator/app/data/repositories/remote/molding_repository.dart';
import 'package:frame_calculator/app/data/repositories/remote/users_repository.dart';
import 'package:frame_calculator/app/utils/global_controller.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put(GlobalController());
    Get.lazyPut<Dio>(
        () => Dio(BaseOptions(
            baseUrl:
                'https://starprest-m24jj3gwwq-uc.a.run.app/starphoto/public/')),
        fenix: true);

    // providers
    Get.lazyPut<UsersProvider>(() => UsersProvider(), fenix: true);
    Get.lazyPut<MoldingProvider>(() => MoldingProvider(), fenix: true);
    Get.lazyPut<GlassProvider>(() => GlassProvider(), fenix: true);

    /// repositories
    Get.lazyPut<UsersRepository>(() => UsersRepository(), fenix: true);
    Get.lazyPut<MoldingRepository>(() => MoldingRepository(), fenix: true);
    Get.lazyPut<GlassRepository>(() => GlassRepository(), fenix: true);
  }
}
