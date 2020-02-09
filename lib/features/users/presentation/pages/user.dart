import 'package:fake_users/features/users/presentation/blocs/users_bloc_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sailor/sailor.dart';

import 'package:fake_users/features/users/presentation/blocs/users_bloc.dart';
import 'package:fake_users/injection.iconfig.dart';
import 'package:fake_users/features/users/presentation/blocs/users_bloc_events.dart';

class UserPage extends StatefulWidget {
  final UserPageArgs pageArgs;

  UserPage({
    @required this.pageArgs,
  });

  @override
  UserPageState createState() => UserPageState(this.pageArgs);
}

class UserPageState extends State<UserPage> {
  final UserPageArgs pageArgs;
  final UsersBloc usersBloc = getIt<UsersBloc>();

  UserPageState(this.pageArgs);

  @override
  void initState() {
    super.initState();
    usersBloc.add(GetUser(userId: pageArgs.userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => usersBloc,
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is UserLoadedState) {
                return Text(
                  '${state.user.firstName} ${state.user.lastName[0]}.'
                );
              } else {
                return Text(
                  'Fake Users',
                );
              }
            },
          ),
        ),
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UserLoadedState) {
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 18.0,
                  ),
                  onLongPress: () {},
                  leading: ClipOval(
                    child: Image.network(
                      state.user.avatar,
                    ),
                  ),
                  title: Text(
                    '${state.user.firstName} ${state.user.lastName}'
                  ),
                  subtitle: Text(
                    '${state.user.email}'
                  ),
                  trailing: Icon(
                    Icons.favorite
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    usersBloc.close();
  }
}

class UserPageArgs extends BaseArguments {
  final int userId;

  UserPageArgs({
    @required this.userId,
  });
}