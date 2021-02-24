import 'package:frame_calculator/app/data/models/molding.dart';
import 'package:frame_calculator/app/data/repositories/remote/molding_repository.dart';
import 'package:frame_calculator/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MoldingController extends GetxController {
  final MoldingRepository _moldingRepository = Get.find<MoldingRepository>();
  List<Molding> molding = [];
  List<Molding> filteredMolding = [];
  bool isSearching = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadMolding();
  }

  @override
  void onClose() {}

  void isSearchingToTrue() {
    isSearching = true;
    update();
  }

  void isSearchingToFalse() {
    isSearching = false;
    update();
    loadMolding();
  }

  void filterMolding(value) {
    filteredMolding = molding
        .where((molding) =>
            molding.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    update(["molding_list_view"]);
  }

  void resetFilteredMolding() {
    filteredMolding = molding;
    update(["molding_list_view"]);
  }

  void goToAddMoldingPage() {
    Get.toNamed(Routes.ADD_MOLDING);
  }

  Future<void> loadMolding() async {
    try {
      molding = await _moldingRepository.getMolding();
      molding.sort((a, b) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });
      filteredMolding = molding;
      update(["molding_list_view"]);
    } catch (e) {
      print("Error: ${e.response.toString()}");
    }
  }
}
