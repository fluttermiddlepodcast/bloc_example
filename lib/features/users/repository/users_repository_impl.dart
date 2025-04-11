import 'dart:io';

import 'package:bloc_example/features/users/model/user.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:dio/dio.dart';

class UsersRepositoryImpl extends UsersRepository {
  final Dio dio;

  UsersRepositoryImpl(this.dio);

  @override
  Future<(List<User>?, String?)> fetchUsers({
    int limit = 30,
    int page = 0,
    bool makeError = false,
  }) async {
    try {
      if (makeError) {
        await Future.delayed(const Duration(seconds: 2));

        throw Exception('Exception from makeError argument');
      }

      final res = await dio.get('?page=$page&results=$limit');
      if (res.statusCode == HttpStatus.ok) {
        final rawUsers = res.data['results'] as List<dynamic>;
        final users =
            rawUsers.map((rawUser) => User.fromJson(rawUser)).toList();

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
