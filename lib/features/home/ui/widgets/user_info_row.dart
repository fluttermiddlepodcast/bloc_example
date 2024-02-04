import 'package:bloc_example/features/home/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserInfoRow extends StatelessWidget {
  final User user;

  const UserInfoRow({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await SystemChannels.platform.invokeMethod<void>(
          'HapticFeedback.vibrate',
          'HapticFeedbackType.lightImpact',
        );
      },
      child: ListTile(
        leading: Image.network(user.picture.medium),
        title: Text(user.name.fullName),
        subtitle: Text(user.email),
      ),
    );
  }
}
