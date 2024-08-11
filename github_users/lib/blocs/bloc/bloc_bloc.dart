import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/blocs/bloc/bloc_event.dart';
import 'package:github_users/blocs/bloc/bloc_state.dart';
import 'package:github_users/repositories/user_repository.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUsers) {
      yield UserLoading();
      try {
        final users = await userRepository.getUsers(event.since, event.perPage);
        yield UserLoaded(users: users);
      } catch (e) {
        yield UserError(message: e.toString());
      }
    }
  }
}
