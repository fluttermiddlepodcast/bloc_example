import 'package:bloc_example/data/users/repository/users_repository.dart';
import 'package:bloc_example/domain/user/bloc/users_bloc_event.dart';
import 'package:bloc_example/domain/user/bloc/users_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersBlocEvent, UsersBlocState> {
  final UsersRepository usersRepository;

  UsersBloc({required this.usersRepository}) : super(UsersBlocStateLoading()) {
    on<UsersBlocEventFetch>(_onFetch);
    on<UsersBlocEventRefresh>(_onRefresh);

    add(UsersBlocEventFetch());
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
