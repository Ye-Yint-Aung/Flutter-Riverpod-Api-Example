import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_api/model/user.dart';

class ApiService {
  String URL = "http://192.168.20.84:8090/api/users";

  Future<List<UserModel>> getUser() async {
    Response response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final List<dynamic> data = decodedData["data"];
      print("DATA ::::::::::::::: ${data}");
      final List<UserModel> userList = data.map((data) => UserModel.fromJson(data)).toList();
      print("UserList ::::::::::::::: ${userList[0].userName}");
      return userList;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final apiProvider = Provider<ApiService>((ref) => ApiService());
