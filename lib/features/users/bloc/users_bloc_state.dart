import 'package:bloc_example/features/users/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_bloc_state.freezed.dart';

@freezed
abstract class UsersBlocState with _$UsersBlocState {
  const factory UsersBlocState({
    @Default([]) List<User> users,
    @Default(true) bool canLoadMore,
    @Default(0) int page,
    @Default(UsersBlocStatus.loading) UsersBlocStatus status,
    String? error,
  }) = _UsersBlocState;
}

enum UsersBlocStatus {
  loading,
  loaded,
  error,
}
