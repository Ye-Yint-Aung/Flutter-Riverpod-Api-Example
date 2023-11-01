import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_api/model/user.dart';

class ApiService {
  String URL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<UserModel>> getUser() async {
    Response response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);

      List responseData = result.map((e) => UserModel.fromJson(e)).toList();
      print("API SERVICE USERS: ${responseData.runtimeType}");
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final apiProvider = Provider<ApiService>((ref) => ApiService());
