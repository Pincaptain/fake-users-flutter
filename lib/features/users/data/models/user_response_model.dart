import 'package:fake_users/features/users/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  UserResponseModel(this.data);

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => _$UserResponseModelFromJson(json);

  final UserModel data;

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}