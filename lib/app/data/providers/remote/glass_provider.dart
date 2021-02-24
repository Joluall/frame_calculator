import 'package:dio/dio.dart' as d;
import 'package:frame_calculator/app/data/models/glass.dart';
import 'package:get/get.dart';

class GlassProvider {
  final d.Dio _dio = Get.find<d.Dio>();

  Future<List<Glass>> getGlass() async {
    final d.Response response = await _dio.get('glass');

    return (response.data as List).map((e) => Glass.fromJson(e)).toList();
  }
}
