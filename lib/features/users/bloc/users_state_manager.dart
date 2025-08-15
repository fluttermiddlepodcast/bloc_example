import 'package:bloc_example/features/users/bloc/users_state.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:yx_state/yx_state.dart';

class UsersStateManager extends StateManager<UsersState> {
  final UsersRepository usersRepository;

  UsersStateManager({required this.usersRepository}) : super(UsersState()) {
    if (state.isLoading) {
      loadUsers();
    }
  }

  Future<void> loadUsers() {
    return handle(
      (emit) async {
        emit(
          state.copyWith(
            users: const [],
            page: 0,
            isLoading: true,
            error: null,
          ),
        );

        final usersRes = await usersRepository.fetchUsers(
          limit: 30,
          page: state.page,
        );
        if (usersRes.$2 == null) {
          final users = usersRes.$1!;

          emit(
            state.copyWith(
              users: users,
              canLoadMore: users.length == 30,
              isLoading: false,
              page: 1,
            ),
          );
        } else {
          emit(
            state.copyWith(
              isLoading: false,
              error: usersRes.$2!,
            ),
          );
        }
      },
    );
  }

  Future<void> loadMoreUsers() {
    return handle(
      (emit) async {
        if (!state.isLoading && state.canLoadMore) {
          final page = state.page;

          final usersRes = await usersRepository.fetchUsers(
            limit: 30,
            page: page,
          );
          if (usersRes.$2 == null) {
            final users = usersRes.$1!;

            emit(
              state.copyWith(
                users: [
                  ...state.users,
                  ...users,
                ],
                canLoadMore: users.length == 30,
                page: page + 1,
              ),
            );
          } else {
            emit(
              state.copyWith(
                isLoading: false,
                error: usersRes.$2!,
              ),
            );
          }
        }
      },
    );
  }

  Future<void> refreshUsers() => loadUsers();
}
