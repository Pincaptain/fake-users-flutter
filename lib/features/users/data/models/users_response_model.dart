import 'package:json_annotation/json_annotation.dart';

import 'package:fake_users/features/users/data/models/user_model.dart';

part 'users_response_model.g.dart';

@JsonSerializable()
class UsersResponseModel {
  UsersResponseModel(this.page, this.perPage, this.total, this.totalPages, this.data);

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) => _$UsersResponseModelFromJson(json);

  final List<UserModel> data;
  final int page;
  final int total;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  Map<String, dynamic> toJson() => _$UsersResponseModelToJson(this);
}