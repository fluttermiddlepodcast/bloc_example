import 'package:bloc_example/core/network/result.dart';
import 'package:bloc_example/features/users/model/user.dart';
import 'package:dartz/dartz.dart';

// --- RECORDS ---
abstract class UsersRepository {
  Future<(List<User>?, String?)> fetchUsers({
    int limit,
    int page,
  });
}

// --- EITHER (dartz) ---
// abstract class UsersRepository {
//   Future<Either<String, List<User>>> fetchUsers({
//     int limit,
//     int page,
//   });
// }

// --- SEALED CLASSES ---
// abstract class UsersRepository {
//   Future<Result<List<User>>> fetchUsers({
//     int limit,
//     int page,
//   });
// }
