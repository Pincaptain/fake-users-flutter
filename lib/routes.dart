import 'package:sailor/sailor.dart';

import 'package:fake_users/features/map/presentation/pages/map.dart';
import 'package:fake_users/features/users/presentation/pages/users.dart';
import 'package:fake_users/features/users/presentation/pages/user.dart';

final sailor = Sailor();

void setupRoutes() {
  sailor.addRoutes(
    [
      SailorRoute(
        name: '/map',
        builder: (context, args, params) => MapPage(),
      ),
      SailorRoute(
        name: '/users',
        builder: (context, args, params) => UsersPage(),
      ),
      SailorRoute(
        name: '/users/detail',
        builder: (context, args, params) => UserPage(
          pageArgs: args,
        ),
      ),
    ],
  );
}