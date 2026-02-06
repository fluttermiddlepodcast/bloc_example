sealed class ProfileBlocEvent {}

class ProfileBlocEventFetch extends ProfileBlocEvent {
  final bool isLogIn;

  ProfileBlocEventFetch({
    required this.isLogIn,
  });

  @override
  String toString() {
    return 'ProfileBlocEventFetch{isLogIn: $isLogIn}';
  }
}

class ProfileBlocEventLogIn extends ProfileBlocEvent {}

class ProfileBlocEventLogOut extends ProfileBlocEvent {}
