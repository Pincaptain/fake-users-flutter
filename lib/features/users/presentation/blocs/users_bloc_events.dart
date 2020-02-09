import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

abstract class UsersEvent extends Equatable {}

class GetUsers extends UsersEvent {
  @override
  List<Object> get props => [];
}

class GetUser extends UsersEvent {
  GetUser({
    @required this.userId,
  });

  final int userId;

  @override
  List<Object> get props => [
    userId,
  ];
}