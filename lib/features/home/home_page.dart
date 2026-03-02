import 'package:bloc_example/core/di/di.dart';
import 'package:bloc_example/features/app_update/bloc/app_update_bloc.dart';
import 'package:bloc_example/features/app_update/bloc/app_update_event.dart';
import 'package:bloc_example/features/app_update/bloc/app_update_state.dart';
import 'package:bloc_example/features/app_update/widgets/app_update_view.dart';
import 'package:bloc_example/features/profile/bloc/profile_bloc.dart';
import 'package:bloc_example/features/profile/bloc/profile_bloc_state.dart';
import 'package:bloc_example/features/users/bloc/users_bloc.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:bloc_example/features/users/widgets/users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
      body: MultiBlocProvider(
        providers: [
          BlocProvider<UsersBloc>(
            create: (_) => UsersBloc(
              usersRepository: di.get<UsersRepository>(),
            ),
          ),
          BlocProvider<AppUpdateBloc>(
            create: (_) => AppUpdateBloc()..add(AppUpdateEventInit()),
          ),
        ],
        child: BlocListener<AppUpdateBloc, AppUpdateState>(
          listener: (context, state) {
            if (state is AppUpdateStateLoaded) {
              if (state.needUpdate) {
                showModalBottomSheet(
                  context: context,
                  isDismissible: !state.forceUpdate,
                  enableDrag: !state.forceUpdate,
                  builder: (_) {
                    return PopScope(
                      canPop: !state.forceUpdate,
                      onPopInvokedWithResult: (didPop, __) {
                        if (!didPop) {
                          return;
                        }

                        context.read<AppUpdateBloc>().add(AppUpdateEventSkip());
                      },
                      child: AppUpdateView(
                        message: state.forceUpdate
                            ? 'Для дальнейшего использования приложения необходимо его обновить!'
                            : 'Новая версия уже доступна в вашем магазине приложений!',
                        isForceUpdate: state.forceUpdate,
                        onUpdate: () {
                          launchUrlString(
                            'https://github.com/fluttermiddlepodcast/bloc_example',
                          );
                        },
                        onSkip: () {
                          context.read<AppUpdateBloc>().add(AppUpdateEventSkip());

                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                );
              }
            }
          },
          child: BlocListener<ProfileBloc, ProfileBlocState>(
            listener: (context, state) {
              context.read<UsersBloc>().add(UsersBlocEventRefresh());
            },
            child: const UsersList(),
          ),
        ),
      ),
    );
  }
}
