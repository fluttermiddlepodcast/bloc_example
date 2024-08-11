import 'package:bloc_example/features/home/model/user.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'users_bloc_state.freezed.dart';

// @freezed
// class UsersBlocState with _$UsersBlocState {
//   const factory UsersBlocState({
//     @Default(true) bool isLoading,
//     String? error,
//     @Default(<User>[]) List<User> users,
//   }) = _UsersBlocState;
// }

class UsersBlocState {
  final bool isLoading;
  final NullableValue error;
  final List<User> users;

  UsersBlocState({
    required this.isLoading,
    required this.error,
    required this.users,
  });

  factory UsersBlocState.initial() => UsersBlocState(
        isLoading: true,
        error: NullableValue(
          value: null,
        ),
        users: <User>[],
      );

  UsersBlocState copyWith({
    bool? isLoading,
    NullableValue? error,
    List<User>? users,
  }) {
    return UsersBlocState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      users: users ?? this.users,
    );
  }
}

class NullableValue<T> {
  final T? value;

  NullableValue({required this.value});
}
