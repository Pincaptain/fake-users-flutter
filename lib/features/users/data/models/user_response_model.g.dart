// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) {
  return UserResponseModel(
    json['data'] == null
        ? null
        : UserModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
