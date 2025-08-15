import 'package:bloc_example/core/network/dio.dart';
import 'package:bloc_example/features/profile/bloc/profile_state_manager.dart';
import 'package:bloc_example/features/users/bloc/users_state_manager.dart';
import 'package:bloc_example/features/users/repository/users_repository_impl.dart';
import 'package:yx_scope/yx_scope.dart';

class AppScopeContainer extends ScopeContainer {
  late final profileStateManager = dep(() => ProfileStateManager());

  late final usersStateManager = dep(
    () => UsersStateManager(
      usersRepository: UsersRepositoryImpl(dio),
    ),
  );
}

class AppScopeHolder extends ScopeHolder<AppScopeContainer> {
  @override
  AppScopeContainer createContainer() => AppScopeContainer();
}
