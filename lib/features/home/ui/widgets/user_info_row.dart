import 'package:bloc_example/features/home/model/user.dart';
import 'package:flutter/material.dart';

class UserInfoRow extends StatelessWidget {
  final User user;

  const UserInfoRow({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(user.picture.medium),
      title: Text(user.name.fullName),
      subtitle: Text(user.email),
    );
  }
}
