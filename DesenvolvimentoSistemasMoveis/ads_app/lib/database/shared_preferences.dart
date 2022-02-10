import 'package:shared_preferences/shared_preferences.dart';

class Shared_Preferences {
  static void login(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged', true);
    prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<bool?> logged() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('logged');
  }

  static void logout() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isLogged = prefs.getBool('logged');
    if (isLogged != null && isLogged) {
      prefs.setBool('logged', false);
      prefs.remove('token');
    }
  }
}
