import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:fake_users/features/users/presentation/blocs/users_bloc_events.dart';
import 'package:fake_users/features/users/presentation/blocs/users_bloc_states.dart';
import 'package:fake_users/features/users/domain/repositories/users_repository.dart';
import 'package:fake_users/features/users/data/providers/users_provider.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(this.usersRepository);

  IUsersRepository usersRepository;

  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    yield UsersLoadingState();

    try {
      if (event is GetUser) {
        var user = await usersRepository.getUser(event.userId);

        yield UserLoadedState(
          user: user,
        );
      } else {
        var users = await usersRepository.getUsers();

        yield UsersLoadedState(
          users: users,
        );
      }
    } on UsersException {
      yield UsersErrorState(
        errorMessage: 'User/s data unavailable'
      );
    }
  }

  @override
  UsersState get initialState => UsersUninitializedState();
}