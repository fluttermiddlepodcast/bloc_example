import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_state.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:replay_bloc/replay_bloc.dart';

class UsersBloc extends ReplayBloc<UsersBlocEvent, UsersBlocState> {
  final UsersRepository usersRepository;

  UsersBloc({required this.usersRepository}) : super(UsersBlocState()) {
    on<UsersBlocEventFetch>(_onFetch);
    on<UsersBlocEventFetchMore>(
      _onFetchMore,
      transformer: droppable(),
    );
    on<UsersBlocEventRefresh>(_onRefresh);

    if (state.status == UsersBlocStatus.loading) {
      add(UsersBlocEventFetch());
    }
  }

  Future<void> _onFetch(
    UsersBlocEventFetch event,
    Emitter<UsersBlocState> emit,
  ) async {
    final usersRes = await usersRepository.fetchUsers(
      limit: 30,
      page: 0,
      makeError: event.withRollback,
    );
    if (usersRes.$2 == null) {
      final users = usersRes.$1!;

      emit(
        state.copyWith(
          users: users,
          status: UsersBlocStatus.loaded,
          canLoadMore: users.length == 30,
          page: 1,
          error: null,
        ),
      );
    } else {
      if (event.withRollback) {
        undo();
      } else {
        emit(
          state.copyWith(
            status: UsersBlocStatus.error,
            error: usersRes.$2!,
          ),
        );
      }
    }
  }

  Future<void> _onFetchMore(
    UsersBlocEventFetchMore event,
    Emitter<UsersBlocState> emit,
  ) async {
    if (state.status != UsersBlocStatus.loaded) {
      return;
    }

    if (!state.canLoadMore) {
      return;
    }

    final usersRes = await usersRepository.fetchUsers(
      limit: 30,
      page: state.page,
    );
    if (usersRes.$2 == null) {
      final users = usersRes.$1!;

      emit(
        state.copyWith(
          users: [
            ...state.users,
            ...users,
          ],
          status: UsersBlocStatus.loaded,
          canLoadMore: users.length == 30,
          page: state.page + 1,
          error: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: UsersBlocStatus.error,
          error: usersRes.$2!,
        ),
      );
    }
  }

  Future<void> _onRefresh(
    UsersBlocEventRefresh event,
    Emitter<UsersBlocState> emit,
  ) async {
    emit(
      state.copyWith(
        users: [],
        canLoadMore: true,
        page: 0,
        status: UsersBlocStatus.loading,
      ),
    );

    add(
      UsersBlocEventFetch(
        withRollback: true,
      ),
    );
  }
}
