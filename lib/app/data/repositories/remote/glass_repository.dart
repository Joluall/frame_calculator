import 'package:frame_calculator/app/data/models/glass.dart';
import 'package:frame_calculator/app/data/providers/remote/glass_provider.dart';
import 'package:get/get.dart';

class GlassRepository {
  final GlassProvider _glasssProvider = Get.find<GlassProvider>();

  Future<List<Glass>> getGlass() => _glasssProvider.getGlass();
}
