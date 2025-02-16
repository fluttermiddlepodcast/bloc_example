import 'package:bloc_example/features/users/bloc/users_bloc.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/users/model/user.dart';
import 'package:bloc_example/features/users/widgets/user_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatelessWidget {
  final List<User> users;

  const UsersList({
    required this.users,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<UsersBloc>().add(
            UsersBlocEventRefresh(),
          ),
      child: ListView.builder(
        itemBuilder: (_, index) => UserInfoRow(
          user: users[index],
        ),
        itemCount: users.length,
      ),
    );
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
