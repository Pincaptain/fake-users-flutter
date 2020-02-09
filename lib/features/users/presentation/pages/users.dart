import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fake_users/features/users/presentation/widgets/user_card.dart';
import 'package:fake_users/features/users/presentation/blocs/users_bloc.dart';
import 'package:fake_users/features/users/presentation/blocs/users_bloc_states.dart';
import 'package:fake_users/injection.iconfig.dart';
import 'package:fake_users/features/users/presentation/blocs/users_bloc_events.dart';

class UsersPage extends StatefulWidget {
  @override
  UsersPageState createState() => UsersPageState();
}

class UsersPageState extends State<UsersPage> {
  final UsersBloc usersBloc = getIt<UsersBloc>();

  @override
  void dispose() {
    super.dispose();
    usersBloc.close();
  }

  @override
  void initState() {
    super.initState();
    usersBloc.add(GetUsers());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => usersBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Fake Users',
          ),
        ),
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoadedState) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) => UserCard(
                  user: state.users[index],
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
}