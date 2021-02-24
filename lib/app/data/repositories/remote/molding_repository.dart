import 'package:frame_calculator/app/data/models/molding.dart';
import 'package:frame_calculator/app/data/providers/remote/molding_provider.dart';
import 'package:get/get.dart';

class MoldingRepository {
  final MoldingProvider _moldingsProvider = Get.find<MoldingProvider>();

  Future<List<Molding>> getMolding() => _moldingsProvider.getMolding();
}
