import 'dart:convert';
import 'dart:io';

import 'package:fake_users/features/users/data/models/user_response_model.dart';
import 'package:fake_users/features/users/data/models/users_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'package:fake_users/features/users/data/models/user_model.dart';

@Bind.toType(UsersApiProvider)
@injectable
abstract class IUsersProvider {
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUser(int userId);
}

@injectable
class UsersApiProvider extends IUsersProvider {
  final providerUrl = 'https://reqres.in/api/users';

  @override
  Future<List<UserModel>> getUsers() async {
    var response = await http.get(
      Uri.encodeFull(providerUrl),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    switch (response.statusCode) {
      case 200:
        var jsonString = utf8.decode(response.bodyBytes);
        var jsonData = json.decode(jsonString);
        var usersResponse = UsersResponseModel.fromJson(jsonData);
        var users = usersResponse.data;

        return users;

      default:
        throw UsersException();
    }
  }

  @override
  Future<UserModel> getUser(int userId) async {
    var response = await http.get(
      Uri.encodeFull('$providerUrl/$userId'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    switch (response.statusCode) {
      case 200:
        var jsonString = utf8.decode(response.bodyBytes);
        var jsonData = json.decode(jsonString);
        var userResponse = UserResponseModel.fromJson(jsonData);
        var user = userResponse.data;

        return user;

      default:
        throw UsersException();
    }
  }
}

class UsersException implements Exception {}