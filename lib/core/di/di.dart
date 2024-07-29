import 'package:bloc_example/core/network/dio.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:bloc_example/features/users/repository/users_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  di.registerSingleton<Dio>(dio);
  di.registerSingleton<UsersRepository>(
    UsersRepositoryImpl(
      di.get<Dio>(),
    ),
  );
}
