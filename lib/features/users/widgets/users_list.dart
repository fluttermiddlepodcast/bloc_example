import 'package:bloc_example/core/di/app_scope.dart';
import 'package:bloc_example/features/users/bloc/users_state_manager.dart';
import 'package:bloc_example/features/users/bloc/users_state.dart';
import 'package:bloc_example/features/users/widgets/user_info_row.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';
import 'package:yx_state_flutter/yx_state_flutter.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final _scrollController = ScrollController();
  late UsersStateManager _usersStateManager;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(
      () {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.position.pixels;

        if (maxScroll - currentScroll <= 300) {
          _usersStateManager.loadMoreUsers();
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _usersStateManager = ScopeProvider.of<AppScopeContainer>(context)!.usersStateManager.get;
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder<UsersState>(
      stateReadable: _usersStateManager,
      buildWhen: (prev, curr) {
        return !const DeepCollectionEquality().equals(prev.users, curr.users);
      },
      builder: (_, state, __) {
        if (state.isLoading) {
          return const UsersListShimmer();
        }

        if (state.error != null) {
          return Center(
            child: Text(
              state.error!,
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => _usersStateManager.refreshUsers(),
          child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (_, index) {
              if (state.canLoadMore && index == state.users.length) {
                return const UserInfoRowShimmer();
              }

              return UserInfoRow(
                user: state.users[index],
              );
            },
            itemCount: state.users.length + (state.canLoadMore ? 1 : 0),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }
}

class UsersListShimmer extends StatelessWidget {
  const UsersListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        12,
        (_) => const UserInfoRowShimmer(),
      ),
    );
  }
}
