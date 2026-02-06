import 'package:bloc_example/features/users/model/user.dart';

import 'package:collection/collection.dart';

sealed class UsersBlocState {
  const UsersBlocState();

  @override
  bool operator ==(Object other) {
    return runtimeType == other.runtimeType;
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UsersBlocState{}';
  }
}

class UsersBlocStateLoading extends UsersBlocState {
  const UsersBlocStateLoading();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UsersBlocStateLoading && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UsersBlocStateLoading{}';
  }
}

class UsersBlocStateLoaded extends UsersBlocState {
  final List<User> users;
  final bool canLoadMore;
  final int page;

  const UsersBlocStateLoaded({
    required this.users,
    required this.canLoadMore,
    required this.page,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UsersBlocStateLoaded &&
            const DeepCollectionEquality().equals(other.users, users) &&
            other.canLoadMore == canLoadMore &&
            other.page == page;
  }

  @override
  int get hashCode {
    return Object.hash(
      const DeepCollectionEquality().hash(users),
      canLoadMore,
      page,
    );
  }

  @override
  String toString() {
    return 'UsersBlocStateLoaded{users (count): ${users.length}, canLoadMore: $canLoadMore, page: $page}';
  }
}

class UsersBlocStateError extends UsersBlocState {
  final String error;

  const UsersBlocStateError(this.error);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UsersBlocStateError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() {
    return 'UsersBlocStateError{error: $error}';
  }
}
