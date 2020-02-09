import 'package:injectable/injectable.dart';

import 'package:fake_users/features/users/data/repositories/users_repository.dart';
import 'package:fake_users/features/users/domain/entities/user.dart';

@Bind.toType(UsersRepository)
@injectable
abstract class IUsersRepository {
  Future<List<User>> getUsers();
  Future<User> getUser(int userId);
}