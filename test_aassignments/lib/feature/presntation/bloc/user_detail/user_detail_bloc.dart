import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_aassignments/core/error/failure.dart';
import 'package:test_aassignments/feature/domain/usecases/get_user.dart';
import 'package:test_aassignments/feature/presntation/bloc/user_detail/user_detail_event.dart';
import 'package:test_aassignments/feature/presntation/bloc/user_detail/user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final GetUsers getUsers;

  final String login;
  UserDetailBloc({required this.getUsers, required this.login})
      : super(UserDetailLoading()) {
    on<LoadUserDetailEvent>((event, emit) async {
      emit(UserDetailLoading());
      final failureOrUsers = await getUsers.getUser(login);

      emit(failureOrUsers.fold(
          (failure) => UserDetailError(message: _mapFailureToMessage(failure)),
          (user) => UserDetailLoaded(user: user)));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Ошибка сервера";
      case InternetFailure:
        return "Интернет не работает";
      default:
        return 'Неизвестная ошибка';
    }
  }
}
