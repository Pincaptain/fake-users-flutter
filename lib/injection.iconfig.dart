// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:fake_users/features/users/data/providers/users_provider.dart';
import 'package:fake_users/features/users/data/repositories/users_repository.dart';
import 'package:fake_users/features/users/domain/repositories/users_repository.dart';
import 'package:fake_users/features/users/presentation/blocs/users_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void $initGetIt({String environment}) {
  getIt
    ..registerFactory<IUsersProvider>(() => UsersApiProvider())
    ..registerFactory<UsersApiProvider>(() => UsersApiProvider())
    ..registerFactory<UsersRepository>(
        () => UsersRepository(getIt<IUsersProvider>()))
    ..registerFactory<IUsersRepository>(
        () => UsersRepository(getIt<IUsersProvider>()))
    ..registerFactory<UsersBloc>(() => UsersBloc(getIt<IUsersRepository>()));
}
