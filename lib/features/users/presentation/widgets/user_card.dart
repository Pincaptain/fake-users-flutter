import 'package:fake_users/features/users/presentation/pages/user.dart';
import 'package:fake_users/routes.dart';
import 'package:flutter/material.dart';

import 'package:fake_users/features/users/domain/entities/user.dart';

class UserCard extends StatelessWidget {
  UserCard({
    @required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          sailor.navigate(
            '/users/detail',
            args: UserPageArgs(
              userId: user.id
            ),
          );
        },
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person,
              size: 32.0,
            ),
          ],
        ),
        title: Text(
          '${user.firstName} ${user.lastName}',
        ),
        subtitle: Text(
          '${user.email}'
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
        ),
      ),
    );
  }
}