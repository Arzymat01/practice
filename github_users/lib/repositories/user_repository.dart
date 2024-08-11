import 'package:github_users/models/users.dart';
import 'package:github_users/services/api_services.dart';



class UserRepository {
  final GithubApiService _apiService = GithubApiService();

  Future<List<User>> getUsers(int since, int perPage) {
    return _apiService.fetchUsers(since, perPage);
  }
}
