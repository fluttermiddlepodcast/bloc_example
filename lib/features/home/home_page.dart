import 'package:bloc_example/core/di/di.dart';
import 'package:bloc_example/features/users/bloc/users_bloc.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:bloc_example/features/users/widgets/users_list.dart';
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
        child: const UsersList(),
      ),
    );
  }
}
