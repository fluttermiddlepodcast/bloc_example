import 'package:bloc_example/features/users/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_state.freezed.dart';

@freezed
sealed class UsersState with _$UsersState {
  const factory UsersState({
    @Default([]) List<User> users,
    @Default(0) int page,
    @Default(true) bool canLoadMore,
    @Default(true) bool isLoading,
    String? error,
  }) = _UsersState;
}
