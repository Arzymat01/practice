import 'package:equatable/equatable.dart';

class UserDetailEntity extends Equatable {
  final String? login;
  final int? id;
  final String? avatarUrl;
  final String? url;
  final String? name;
  final String? location;
  final String? email;
  final String? bio;
  final int? followers;
  final int? following;

  const UserDetailEntity({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.url,
    required this.name,
    required this.location,
    required this.email,
    required this.bio,
    required this.followers,
    required this.following,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        login,
        id,
        avatarUrl,
        url,
        name,
        location,
        email,
        bio,
        followers,
        following,
      ];
}
