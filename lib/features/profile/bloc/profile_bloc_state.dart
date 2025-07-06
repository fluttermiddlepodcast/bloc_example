import 'package:bloc_example/features/profile/model/profile.dart';

sealed class ProfileBlocState {}

class ProfileBlocStateLoading extends ProfileBlocState {}

class ProfileBlocStateLoaded extends ProfileBlocState {
  final Profile profile;
  final bool isLoggedIn;

  ProfileBlocStateLoaded({
    required this.profile,
    required this.isLoggedIn,
  });
}

class ProfileBlocStateError extends ProfileBlocState {
  final String error;

  ProfileBlocStateError({required this.error});
}
