import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

import 'package:fake_users/features/users/domain/entities/user.dart';

abstract class UsersState extends Equatable {}

class UsersUninitializedState extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoadingState extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoadedState extends UsersState {
  UsersLoadedState({
    @required this.users,
  });

  final List<User> users;

  @override
  List<Object> get props => [
    users,
  ];
}

class UsersErrorState extends UsersState {
  UsersErrorState({
    @required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [
    errorMessage,
  ];
}

class UserLoadedState extends UsersState {
  UserLoadedState({
    @required this.user,
  });

  final User user;

  @override
  List<Object> get props => [
    user,
  ];
}