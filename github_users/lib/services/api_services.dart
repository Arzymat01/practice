import 'package:github_users/models/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class GithubApiService {
  final String baseUrl = 'https://api.github.com/users';

  Future<List<User>> fetchUsers(int since, int perPage) async {
    final response = await http.get(Uri.parse('$baseUrl?since=$since&per_page=$perPage'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
