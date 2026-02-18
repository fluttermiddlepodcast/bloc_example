import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_example/core/bloc/transformers/measure_time.dart';
import 'package:bloc_example/core/network/failure.dart';
import 'package:bloc_example/core/network/result.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_state.dart';
import 'package:bloc_example/features/users/model/user.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class UsersBloc extends HydratedBloc<UsersBlocEvent, UsersBlocState> {
  final UsersRepository usersRepository;

  UsersBloc({required this.usersRepository}) : super(UsersBlocStateLoading()) {
    on<UsersBlocEventFetch>(
      _onFetch,
      transformer: measureTime(
        blocName: 'UsersBloc',
      ),
    );
    on<UsersBlocEventFetchMore>(
      _onFetchMore,
      transformer: droppable(),
    );
    on<UsersBlocEventRefresh>(_onRefresh);

    if (state is UsersBlocStateLoading) {
      add(UsersBlocEventFetch());
    }
  }

  // --- RECORDS ---
  Future<void> _onFetch(
    UsersBlocEventFetch event,
    Emitter<UsersBlocState> emit,
  ) async {
    final usersRes = await usersRepository.fetchUsers(
      limit: 30,
      page: 0,
    );

    if (usersRes.$2 == null) {
      final users = usersRes.$1!;

      emit(
        UsersBlocStateLoaded(
          users: users,
          canLoadMore: users.length == 30,
          page: 1,
        ),
      );
    } else {
      emit(UsersBlocStateError(usersRes.$2!));
    }
  }

  // --- EITHER (dartz) ---
  // Future<void> _onFetch(
  //   UsersBlocEventFetch event,
  //   Emitter<UsersBlocState> emit,
  // ) async {
  //   final usersRes = await usersRepository.fetchUsers(
  //     limit: 30,
  //     page: 0,
  //   );

  //   usersRes.fold(
  //     (error) => emit(UsersBlocStateError(error)),
  //     (users) {
  //       emit(
  //         UsersBlocStateLoaded(
  //           users: users,
  //           canLoadMore: users.length == 30,
  //           page: 1,
  //         ),
  //       );
  //     },
  //   );
  // }

  // --- SEALED CLASSES ---
  // Future<void> _onFetch(
  //   UsersBlocEventFetch event,
  //   Emitter<UsersBlocState> emit,
  // ) async {
  //   final usersRes = await usersRepository.fetchUsers(
  //     limit: 30,
  //     page: 0,
  //   );

  //   usersRes.fold(
  //     onErr: (failure) => emit(
  //       UsersBlocStateError(
  //         failure.toString(),
  //       ),
  //     ),
  //     onOk: (users) => emit(
  //       UsersBlocStateLoaded(
  //         users: users,
  //         canLoadMore: users.length == 30,
  //         page: 1,
  //       ),
  //     ),
  //   );
  // }

  // --- RECORDS ---
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

    final page = currState.page;

    final usersRes = await usersRepository.fetchUsers(
      limit: 30,
      page: page,
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
          page: page + 1,
        ),
      );
    } else {
      emit(UsersBlocStateError(usersRes.$2!));
    }
  }

  // --- EITHER (dartz) ---
  // Future<void> _onFetchMore(
  //   UsersBlocEventFetchMore event,
  //   Emitter<UsersBlocState> emit,
  // ) async {
  //   if (state is! UsersBlocStateLoaded) {
  //     return;
  //   }

  //   final currState = state as UsersBlocStateLoaded;

  //   if (!currState.canLoadMore) {
  //     return;
  //   }

  //   final page = currState.page;

  //   final usersRes = await usersRepository.fetchUsers(
  //     limit: 30,
  //     page: page,
  //   );

  //   usersRes.fold(
  //     (error) => emit(UsersBlocStateError(error)),
  //     (users) {
  //       emit(
  //         UsersBlocStateLoaded(
  //           users: [
  //             ...currState.users,
  //             ...users,
  //           ],
  //           canLoadMore: users.length == 30,
  //           page: page + 1,
  //         ),
  //       );
  //     },
  //   );
  // }

  // --- SEALED CLASSES ---
  // Future<void> _onFetchMore(
  //   UsersBlocEventFetchMore event,
  //   Emitter<UsersBlocState> emit,
  // ) async {
  //   if (state is! UsersBlocStateLoaded) {
  //     return;
  //   }

  //   final currState = state as UsersBlocStateLoaded;

  //   if (!currState.canLoadMore) {
  //     return;
  //   }

  //   final page = currState.page;

  //   final usersRes = await usersRepository.fetchUsers(
  //     limit: 30,
  //     page: page,
  //   );

  //   switch (usersRes) {
  //     case Ok<List<User>>(:final value):
  //       emit(
  //         UsersBlocStateLoaded(
  //           users: [
  //             ...currState.users,
  //             ...value,
  //           ],
  //           canLoadMore: value.length == 30,
  //           page: page + 1,
  //         ),
  //       );
  //     case Err<List<User>>(:final failure):
  //       switch (failure) {
  //         case SomeFailure(:final error):
  //           emit(
  //             UsersBlocStateError(
  //               error,
  //             ),
  //           );
  //       }
  //   }
  // }

  Future<void> _onRefresh(
    UsersBlocEventRefresh event,
    Emitter<UsersBlocState> emit,
  ) async {
    emit(UsersBlocStateLoading());

    add(UsersBlocEventFetch());
  }

  @override
  UsersBlocState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey('users')) {
      return UsersBlocStateLoaded(
        users: (json['users'] as List)
            .map(
              (json) => User.fromJson(json),
            )
            .toList(),
        canLoadMore: json['canLoadMore'] ?? true,
        page: json['page'] ?? 0,
      );
    }

    return null;
  }

  @override
  Map<String, dynamic>? toJson(UsersBlocState state) {
    if (state is UsersBlocStateLoaded) {
      return {
        'users': state.users.map((user) => user.toJson()).toList(),
        'canLoadMore': state.canLoadMore,
        'page': state.page,
      };
    }

    return null;
  }
}
