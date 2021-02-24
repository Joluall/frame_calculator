import 'package:dio/dio.dart' as d;
import 'package:frame_calculator/app/data/models/molding.dart';
import 'package:get/get.dart';

class MoldingProvider {
  final d.Dio _dio = Get.find<d.Dio>();

  Future<List<Molding>> getMolding() async {
    final d.Response response = await _dio.get('molding');

    return (response.data as List).map((e) => Molding.fromJson(e)).toList();
  }
}
