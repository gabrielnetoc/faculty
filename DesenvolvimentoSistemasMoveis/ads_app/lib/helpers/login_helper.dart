import 'package:ads_app/database/shared_preferences.dart';
import 'package:ads_app/models/user.dart';
import 'package:ads_app/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginHelper {
  Future<bool?> login(User user) async {
    String url = 'http://149.28.39.130:8080/login';
    final res = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(user.toJson()));

    if (res.statusCode == 200) {
      Map<String, dynamic> resMap = json.decode(res.body);
      String token = resMap['token'].toString();
      Shared_Preferences.login(token);
      return true;
    }
  }

  Future<bool?> logout() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");

    String url = 'http://149.28.39.130:8080/logout';
    final res = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': token!,
      },
    );

    if (res.statusCode == 200) {
      print(prefs.getString("token" + 'não existe'));
      Shared_Preferences.logout();
      return false;
    }
  }
}
