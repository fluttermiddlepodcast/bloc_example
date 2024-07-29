import 'package:bloc_example/domain/user/model/user.dart';

abstract class UsersRepository {
  Future<(List<User>?, String?)> fetchUsers();
}
