import 'package:bloc_example/features/users/model/user.dart';

sealed class UsersBlocState {}

class UsersBlocStateLoading extends UsersBlocState {}

class UsersBlocStateLoaded extends UsersBlocState {
  final List<User> users;
  final bool canLoadMore;
  final int page;

  UsersBlocStateLoaded({
    required this.users,
    required this.canLoadMore,
    required this.page,
  });
}

class UsersBlocStateError extends UsersBlocState {
  final String error;

  UsersBlocStateError(this.error);
}
