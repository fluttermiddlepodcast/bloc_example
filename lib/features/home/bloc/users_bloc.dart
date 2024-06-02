import 'package:bloc_example/features/home/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/home/bloc/users_bloc_state.dart';
import 'package:bloc_example/features/home/repository/users_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersBlocEvent, UsersBlocState> {
  final UsersRepository usersRepository;

  UsersBloc({required this.usersRepository}) : super(const UsersBlocState()) {
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
      emit(
        state.copyWith(
          isLoading: false,
          users: usersRes.$1!,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          error: usersRes.$2,
        ),
      );
    }
  }

  Future<void> _onRefresh(
    UsersBlocEventRefresh event,
    Emitter<UsersBlocState> emit,
  ) async {
    emit(
      const UsersBlocState(
        isLoading: true,
      ),
    );

    add(UsersBlocEventFetch());
  }
}
