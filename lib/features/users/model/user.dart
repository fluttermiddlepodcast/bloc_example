import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final Name name;
  final String email;
  final Picture picture;

  User({required this.name, required this.email, required this.picture});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          picture == other.picture;

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ picture.hashCode;
}

@JsonSerializable()
class Name {
  final String title;
  final String first;
  final String last;

  String get fullName => '$title $first $last';

  Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Name &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          first == other.first &&
          last == other.last;

  @override
  int get hashCode => title.hashCode ^ first.hashCode ^ last.hashCode;
}

@JsonSerializable()
class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({required this.large, required this.medium, required this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);

  Map<String, dynamic> toJson() => _$PictureToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Picture &&
          runtimeType == other.runtimeType &&
          large == other.large &&
          medium == other.medium &&
          thumbnail == other.thumbnail;

  @override
  int get hashCode => large.hashCode ^ medium.hashCode ^ thumbnail.hashCode;
}
