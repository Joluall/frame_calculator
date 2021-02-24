import 'package:dio/dio.dart' as d;
import 'package:frame_calculator/app/data/models/user.dart';
import 'package:get/get.dart';

class UsersProvider {
  final d.Dio _dio = Get.find<d.Dio>();

  Future<List<User>> getUsers() async {
    final d.Response response = await _dio.get('user');

    return (response.data as List).map((e) => User.fromJson(e)).toList();
  }
}
