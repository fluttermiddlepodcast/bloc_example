import 'package:bloc_example/core/di/di.dart';
import 'package:bloc_example/features/profile/bloc/profile_bloc.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_state.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersBlocEvent, UsersBlocState> {
  final UsersRepository usersRepository;

  UsersBloc({required this.usersRepository}) : super(UsersBlocStateLoading()) {
    on<UsersBlocEventFetch>(_onFetch);
    on<UsersBlocEventRefresh>(_onRefresh);

    add(UsersBlocEventFetch());

    di.get<ProfileBloc>().stream.listen((event) {
      add(UsersBlocEventRefresh());
    });
  }

  Future<void> _onFetch(
    UsersBlocEventFetch event,
    Emitter<UsersBlocState> emit,
  ) async {
    final usersRes = await usersRepository.fetchUsers();
    if (usersRes.$2 == null) {
      emit(UsersBlocStateLoaded(usersRes.$1!));
    } else {
      emit(UsersBlocStateError(usersRes.$2!));
    }
  }

  Future<void> _onRefresh(
    UsersBlocEventRefresh event,
    Emitter<UsersBlocState> emit,
  ) async {
    emit(UsersBlocStateLoading());

    add(UsersBlocEventFetch());
  }
}
