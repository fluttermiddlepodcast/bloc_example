import 'package:bloc_example/core/di/di.dart';
import 'package:bloc_example/features/profile/bloc/profile_bloc.dart';
import 'package:bloc_example/features/profile/bloc/profile_bloc_state.dart';
import 'package:bloc_example/features/users/bloc/users_bloc.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_state.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:bloc_example/features/users/widgets/users_list.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersBloc>(
      create: (context) => UsersBloc(
        usersRepository: di.get<UsersRepository>(),
      ),
      child: BlocConsumer<ProfileBloc, ProfileBlocState>(
        listener: (context, state) {
          context.read<UsersBloc>().add(UsersBlocEventRefresh());
        },
        builder: (context, state) {
          return switch (state) {
            ProfileBlocStateLoaded state => Scaffold(
                appBar: AppBar(
                  title: Text(
                    "${state.profile.firstName} ${state.profile.lastName}",
                  ),
                ),
                body: BlocBuilder<UsersBloc, UsersBlocState>(
                  buildWhen: (prev, curr) {
                    if (prev is UsersBlocStateLoaded && curr is UsersBlocStateLoaded) {
                      return !const DeepCollectionEquality().equals(prev.users, curr.users);
                    }

                    return true;
                  },
                  builder: (context, state) {
                    return switch (state) {
                      UsersBlocStateLoading _ => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      UsersBlocStateLoaded state => UsersList(
                          users: state.users,
                        ),
                      UsersBlocStateError state => Center(
                          child: Text(
                            state.error,
                          ),
                        ),
                    };
                  },
                ),
              ),
            ProfileBlocStateLoading _ => const Center(
                child: CircularProgressIndicator(),
              ),
            ProfileBlocStateError state => Center(
                child: Text(
                  state.error,
                ),
              ),
          };
        },
      ),
    );
  }
}
