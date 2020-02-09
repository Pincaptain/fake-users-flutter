// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    json['id'] as int,
    json['email'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['avatar'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'email': instance.email,
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
