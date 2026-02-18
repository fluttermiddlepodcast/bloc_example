import 'dart:io';

import 'package:bloc_example/core/network/failure.dart';
import 'package:bloc_example/core/network/result.dart';
import 'package:bloc_example/features/users/model/user.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// --- RECORDS ---
class UsersRepositoryImpl extends UsersRepository {
  final Dio dio;

  UsersRepositoryImpl(this.dio);

  @override
  Future<(List<User>?, String?)> fetchUsers({
    int limit = 30,
    int page = 0,
  }) async {
    try {
      final res = await dio.get('?page=$page&results=$limit');
      if (res.statusCode == HttpStatus.ok) {
        final rawUsers = res.data['results'] as List<dynamic>;
        final users = rawUsers.map((rawUser) => User.fromJson(rawUser)).toList();

        return (users, null);
      }

      return (
        null,
        '''Network error:
             - status code: ${res.statusCode}
             - data: ${res.data}
          ''',
      );
    } catch (e) {
      return (null, 'Network error: $e');
    }
  }
}

// --- EITHER (dartz) ---
// class UsersRepositoryImpl extends UsersRepository {
//   final Dio dio;

//   UsersRepositoryImpl(this.dio);

//   @override
//   Future<Either<String, List<User>>> fetchUsers({
//     int limit = 30,
//     int page = 0,
//   }) async {
//     try {
//       final res = await dio.get('?page=$page&results=$limit');
//       if (res.statusCode == HttpStatus.ok) {
//         final rawUsers = res.data['results'] as List<dynamic>;
//         final users = rawUsers.map((rawUser) => User.fromJson(rawUser)).toList();

//         return Right(users);
//       }

//       return Left(
//         '''Network error:
//              - status code: ${res.statusCode}
//              - data: ${res.data}
//           ''',
//       );
//     } catch (e) {
//       return Left('Network error: $e');
//     }
//   }
// }

// --- SEALED CLASSES ---
// class UsersRepositoryImpl extends UsersRepository {
//   final Dio dio;

//   UsersRepositoryImpl(this.dio);

//   @override
//   Future<Result<List<User>>> fetchUsers({
//     int limit = 30,
//     int page = 0,
//   }) async {
//     try {
//       final res = await dio.get('?page=$page&results=$limit');
//       if (res.statusCode == HttpStatus.ok) {
//         final rawUsers = res.data['results'] as List<dynamic>;
//         final users = rawUsers.map((rawUser) => User.fromJson(rawUser)).toList();

//         return Result.ok(users);
//       }

//       return Result.err(
//         SomeFailure(
//           '''Network error:
//              - status code: ${res.statusCode}
//              - data: ${res.data}
//           ''',
//         ),
//       );
//     } catch (e) {
//       return Result.err(
//         SomeFailure(
//           'Network error: $e',
//         ),
//       );
//     }
//   }
// }
