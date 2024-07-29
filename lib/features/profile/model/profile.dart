class Profile {
  final String firstName;
  final String lastName;

  Profile({
    required this.firstName,
    required this.lastName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode;
}
