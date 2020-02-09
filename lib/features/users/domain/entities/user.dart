import 'package:equatable/equatable.dart';
import 'package:fake_users/features/users/data/models/user_model.dart';

class User extends UserModel with EquatableMixin {
  User(int id, String email, String firstName, String lastName, String avatar) : super(id, email, firstName, lastName, avatar);

  factory User.fromModel(UserModel userModel) {
    return User(
      userModel.id,
      userModel.email,
      userModel.firstName,
      userModel.lastName,
      userModel.avatar
    );
  }

  @override
  List<Object> get props => [
    id,
    email,
    firstName,
    lastName,
    avatar,
  ];
}