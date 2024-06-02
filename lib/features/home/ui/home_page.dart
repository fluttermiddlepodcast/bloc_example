import 'package:bloc_example/core/di/di.dart';
import 'package:bloc_example/features/home/bloc/users_bloc.dart';
import 'package:bloc_example/features/home/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/home/bloc/users_bloc_state.dart';
import 'package:bloc_example/features/home/model/user.dart';
import 'package:bloc_example/features/home/repository/users_repository.dart';
import 'package:bloc_example/features/home/ui/widgets/user_info_row.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BLoC Example',
        ),
      ),
      body: BlocProvider<UsersBloc>(
        create: (_) => UsersBloc(
          usersRepository: di.get<UsersRepository>(),
        ),
        child: BlocBuilder<UsersBloc, UsersBlocState>(
          buildWhen: (prev, curr) {
            return !const DeepCollectionEquality().equals(prev.users, curr.users);
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.error == null) {
              return _UsersList(
                users: state.users,
              );
            }

            return Center(
              child: Text(
                state.error!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _UsersList extends StatelessWidget {
  final List<User> users;

  const _UsersList({
    required this.users,
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
