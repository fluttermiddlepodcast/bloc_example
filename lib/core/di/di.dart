import 'package:bloc_example/core/network/dio.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:bloc_example/features/users/repository/users_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:technical_debt/technical_debt/severity.dart';
import 'package:technical_debt/technical_debt/technical_debt.dart';

final di = GetIt.instance;

@TechnicalDebt(
  author: 'fluttermiddlepodcast',
  description: 'Migrate to code gen solution',
  severity: Severity.minor,
  deadline: '2025-12-12',
)
Future<void> initDI() async {
  di.registerSingleton<Dio>(dio);
  di.registerSingleton<UsersRepository>(
    UsersRepositoryImpl(
      di.get<Dio>(),
    ),
  );
}
