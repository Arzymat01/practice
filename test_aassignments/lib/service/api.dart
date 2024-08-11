import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_aassignments/feature/data/models/user_model.dart';

class ApiService {
  static Future<dynamic> getUserList() async {
    var url = Uri.https('api.github.com', 'users');
    print("-------get");
    var response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      List<dynamic> data = jsonDecode(response.body);
      List<UserModel> list = [];
      data.forEach((element) => list.add(UserModel.fromJson(element)));
      return list;
    } else {
      return false;
    }
  }
}
