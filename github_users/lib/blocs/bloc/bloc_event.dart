import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUsers extends UserEvent {
  final int since;
  final int perPage;

  const FetchUsers({required this.since, required this.perPage});

  @override
  List<Object> get props => [since, perPage];
}
