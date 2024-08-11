import 'package:equatable/equatable.dart';

import 'package:test_aassignments/feature/domain/entites/user_entity_list.dart';

abstract class UserListState extends Equatable {}

class UserListLoading extends UserListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserListLoaded extends UserListState {
  final List<UserListEntity> users;

  UserListLoaded({required this.users});

  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class UserListError extends UserListState {
  final String message;

  UserListError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
