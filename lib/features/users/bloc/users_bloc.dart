import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_state.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersBlocEvent, UsersBlocState> {
  final UsersRepository usersRepository;

  UsersBloc({required this.usersRepository}) : super(UsersBlocStateLoading()) {
    on<UsersBlocEventFetch>(_onFetch);
    on<UsersBlocEventFetchMore>(
      _onFetchMore,
      transformer: droppable(),
    );
    on<UsersBlocEventRefresh>(_onRefresh);

    add(UsersBlocEventFetch());
  }

  int _page = 0;

  Future<void> _onFetch(
    UsersBlocEventFetch event,
    Emitter<UsersBlocState> emit,
  ) async {
    final usersRes = await usersRepository.fetchUsers(
      limit: 30,
      page: _page++,
    );
    if (usersRes.$2 == null) {
      final users = usersRes.$1!;

      emit(
        UsersBlocStateLoaded(
          users: users,
          canLoadMore: users.length == 30,
        ),
      );
    } else {
      emit(UsersBlocStateError(usersRes.$2!));
    }
  }

  Future<void> _onFetchMore(
    UsersBlocEventFetchMore event,
    Emitter<UsersBlocState> emit,
  ) async {
    if (state is! UsersBlocStateLoaded) {
      return;
    }

    final currState = state as UsersBlocStateLoaded;

    if (!currState.canLoadMore) {
      return;
    }

    final usersRes = await usersRepository.fetchUsers(
      limit: 30,
      page: _page++,
    );
    if (usersRes.$2 == null) {
      final users = usersRes.$1!;

      emit(
        UsersBlocStateLoaded(
          users: [
            ...currState.users,
            ...users,
          ],
          canLoadMore: users.length == 30,
        ),
      );
    } else {
      emit(UsersBlocStateError(usersRes.$2!));
    }
  }

  Future<void> _onRefresh(
    UsersBlocEventRefresh event,
    Emitter<UsersBlocState> emit,
  ) async {
    _page = 0;

    emit(UsersBlocStateLoading());

    add(UsersBlocEventFetch());
  }
}
