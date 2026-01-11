import 'package:bloc_example/features/profile/model/profile.dart';

sealed class ProfileBlocState {}

class ProfileBlocStateLoading extends ProfileBlocState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ProfileBlocStateLoading && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ProfileBlocStateLoaded extends ProfileBlocState {
  final Profile profile;
  final bool isLoggedIn;

  ProfileBlocStateLoaded({
    required this.profile,
    required this.isLoggedIn,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileBlocStateLoaded &&
          runtimeType == other.runtimeType &&
          profile == other.profile &&
          isLoggedIn == other.isLoggedIn;

  @override
  int get hashCode => Object.hash(profile, isLoggedIn);
}

class ProfileBlocStateError extends ProfileBlocState {
  final String error;

  ProfileBlocStateError({
    required this.error,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileBlocStateError && runtimeType == other.runtimeType && error == other.error;

  @override
  int get hashCode => error.hashCode;
}
