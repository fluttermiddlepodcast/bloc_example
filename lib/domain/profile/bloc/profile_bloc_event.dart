sealed class ProfileBlocEvent {}

class ProfileBlocEventFetch extends ProfileBlocEvent {
  final bool isLogIn;

  ProfileBlocEventFetch({
    required this.isLogIn,
  });
}

class ProfileBlocEventLogIn extends ProfileBlocEvent {}

class ProfileBlocEventLogOut extends ProfileBlocEvent {}
