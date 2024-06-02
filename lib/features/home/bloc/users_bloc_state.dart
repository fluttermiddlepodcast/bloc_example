import 'package:bloc_example/features/home/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_bloc_state.freezed.dart';

@freezed
class UsersBlocState with _$UsersBlocState {
  const factory UsersBlocState({
    @Default(true) bool isLoading,
    String? error,
    @Default(<User>[]) List<User> users,
  }) = _UsersBlocState;
}
