import 'package:test_aassignments/feature/domain/entites/user_entity.dart';

class UserModel extends UserDetailEntity {
  const UserModel(
      {required login,
      required id,
      required avatarUrl,
      required url,
      required name,
      required location,
      required email,
      required bio,
      required followers,
      required following})
      : super(
          login: login,
          id: id,
          avatarUrl: avatarUrl,
          url: url,
          name: name,
          location: location,
          email: email,
          bio: bio,
          followers: followers,
          following: following,
        );
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        login: json['login'],
        id: json['id'],
        avatarUrl: json['avatar_url'],
        url: json['url'],
        name: json['name'],
        location: json['location'],
        email: json['email'],
        bio: json['bio'],
        followers: json['followers'],
        following: json['following']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['avatar_url'] = avatarUrl;
    data['url'] = url;
    data['name'] = name;
    data['location'] = location;
    data['email'] = email;
    data['bio'] = bio;
    data['followers'] = followers;
    data['following'] = following;
    return data;
  }
}
