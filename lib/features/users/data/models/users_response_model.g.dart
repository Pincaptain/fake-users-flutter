// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponseModel _$UsersResponseModelFromJson(Map<String, dynamic> json) {
  return UsersResponseModel(
    json['page'] as int,
    json['per_page'] as int,
    json['total'] as int,
    json['total_pages'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : UserModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsersResponseModelToJson(UsersResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
      'total': instance.total,
      'per_page': instance.perPage,
      'total_pages': instance.totalPages,
    };
