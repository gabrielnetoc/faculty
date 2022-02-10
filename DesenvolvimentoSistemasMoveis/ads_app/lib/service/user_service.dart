import 'dart:convert';
import 'package:ads_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<bool?> newUser(User user) async {
    String url = '';
    final res = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(user.toJson()),
    );

    if (res.statusCode == 201) {
      return true;
    } else {
      Exception('Falha no conexão');
    }
  }
}
