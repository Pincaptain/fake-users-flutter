import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel(this.id, this.email, this.firstName, this.lastName, this.avatar);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  final String avatar;
  final String email;
  final int id;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}