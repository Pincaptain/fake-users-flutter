import 'package:fake_users/features/users/data/providers/users_provider.dart';
import 'package:fake_users/features/users/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

import 'package:fake_users/features/users/domain/repositories/users_repository.dart';

@injectable
class UsersRepository implements IUsersRepository {
  UsersRepository(this.usersProvider);

  IUsersProvider usersProvider;

  @override
  Future<List<User>> getUsers() async {
    var users = await usersProvider.getUsers();
    
    return users
      .map((user) => User.fromModel(user))
      .toList();
  }

  @override
  Future<User> getUser(int userId) async {
    var user = await usersProvider.getUser(userId);

    return User.fromModel(user);
  }
}