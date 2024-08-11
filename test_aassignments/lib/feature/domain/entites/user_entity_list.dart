import 'package:equatable/equatable.dart';

class UserListEntity extends Equatable {
  final String? login;
  final int? id;
  final String? avatarUrl;

  const UserListEntity({
    required this.login,
    required this.id,
    required this.avatarUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        login,
        id,
        avatarUrl,
      ];
}
