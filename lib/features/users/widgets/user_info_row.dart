import 'package:bloc_example/core/widgets/be_shimmer.dart';
import 'package:bloc_example/features/users/model/user.dart';
import 'package:flutter/material.dart';

class UserInfoRow extends StatelessWidget {
  final User user;

  const UserInfoRow({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(user.picture.medium),
      title: Text(user.name.fullName),
      subtitle: Text(user.email),
    );
  }
}

class UserInfoRowShimmer extends StatelessWidget {
  const UserInfoRowShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 72.0,
      child: Row(
        children: [
          SizedBox(width: 16.0),
          BEShimmer(height: 56.0, width: 56.0),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BEShimmer(height: 14.0, width: 172.0),
              SizedBox(height: 8.0),
              BEShimmer(height: 12.0, width: 256.0),
            ],
          ),
          SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
