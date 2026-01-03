import 'package:bloc_example/core/di/app_scope.dart';
import 'package:bloc_example/features/profile/bloc/profile_state.dart';
import 'package:bloc_example/features/users/widgets/users_list.dart';
import 'package:flutter/material.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';
import 'package:yx_state_flutter/yx_state_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appScope = ScopeProvider.of<AppScopeContainer>(context)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BLoC Example',
        ),
      ),
      body: StateConsumer<ProfileState>(
        stateReadable: appScope.profileStateManager.get,
        listener: (_, __) => appScope.usersStateManager.get.refreshUsers(),
        builder: (_, __, ___) => const UsersList(),
      ),
    );
  }
}
