import 'package:equatable/equatable.dart';

import 'package:test_aassignments/feature/domain/entites/user_entity.dart';

abstract class UserDetailState extends Equatable {}

class UserDetailLoading extends UserDetailState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDetailLoaded extends UserDetailState {
  final UserDetailEntity user;

  UserDetailLoaded({required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class UserDetailError extends UserDetailState {
  final String message;

  UserDetailError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
