import 'package:frame_calculator/app/data/models/user.dart';
import 'package:frame_calculator/app/data/providers/remote/users_provider.dart';
import 'package:get/get.dart';

class UsersRepository {
  final UsersProvider _usersProvider = Get.find<UsersProvider>();

  Future<List<User>> getUsers() => _usersProvider.getUsers();
}
