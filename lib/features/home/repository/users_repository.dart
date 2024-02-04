import 'package:bloc_example/features/home/model/user.dart';

abstract class UsersRepository {
  Future<(List<User>?, String?)> fetchUsers();
}
