import 'package:bloc_example/features/users/bloc/users_bloc.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_state.dart';
import 'package:bloc_example/features/users/widgets/user_info_row.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;

      if (maxScroll - currentScroll <= 300) {
        context.read<UsersBloc>().add(UsersBlocEventFetchMore());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersBlocState>(
      buildWhen: (prev, curr) {
        if (prev is UsersBlocStateLoaded && curr is UsersBlocStateLoaded) {
          return !const DeepCollectionEquality().equals(prev.users, curr.users);
        }

        return true;
      },
      builder: (context, state) {
        return switch (state) {
          UsersBlocStateLoading _ => const UsersListShimmer(),
          UsersBlocStateLoaded state => RefreshIndicator(
            onRefresh: () async => context.read<UsersBloc>().add(UsersBlocEventRefresh()),
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (_, index) {
                if (state.canLoadMore && index == state.users.length) {
                  return const UserInfoRowShimmer();
                }

                return UserInfoRow(user: state.users[index]);
              },
              itemCount: state.users.length + (state.canLoadMore ? 1 : 0),
            ),
          ),
          UsersBlocStateError state => Center(child: Text(state.error)),
        };
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
      children: List.generate(12, (_) => const UserInfoRowShimmer()),
    );
  }
}
