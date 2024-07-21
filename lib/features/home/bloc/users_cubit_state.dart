import 'package:bloc_example/features/home/model/user.dart';

class UsersCubitState {
  final List<User> users;
  final String? error;
  final bool isLoading;

  UsersCubitState({
    required this.users,
    required this.isLoading,
    this.error,
  });

  factory UsersCubitState.initial() {
    return UsersCubitState(
      users: [],
      isLoading: true,
      error: null,
    );
  }

  UsersCubitState copyWith({
    List<User>? users,
    String? error,
    bool? isLoading,
  }) {
    return UsersCubitState(
      users: users ?? this.users,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
