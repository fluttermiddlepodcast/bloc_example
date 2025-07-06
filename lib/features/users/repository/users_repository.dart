import 'package:bloc_example/features/users/model/user.dart';

abstract class UsersRepository {
  Future<(List<User>?, String?)> fetchUsers({int limit, int page});
}
