import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_aassignments/core/error/exceoption.dart';
import 'package:test_aassignments/feature/data/datasaources/feature_remote_source.dart';
import 'package:test_aassignments/feature/data/models/user_list_model.dart';
import 'package:test_aassignments/feature/data/models/user_model.dart';

class FeatureRemoteDataSourceImpl extends FeatureRemoteDataSource {
  FeatureRemoteDataSourceImpl();

  @override
  Future<List<UserListModel>> getUsers(int page, int totalUser) async {
    var url = Uri.https(
      'api.github.com',
      'users',
      {
        "per_page": totalUser.toString(),
        "since": (totalUser * (page - 1)).toString(),
      },
    );
    print(url);
    var response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((user) => UserListModel.fromJson(user)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUser(String name) async {
    var url = Uri.https(
      'api.github.com',
      'users/$name',
    );
    print(url);
    var response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
