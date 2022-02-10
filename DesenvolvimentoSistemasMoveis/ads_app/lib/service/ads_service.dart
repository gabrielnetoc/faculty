import 'dart:convert';
import 'package:ads_app/models/ads.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AdsService {
  Future<List<Ads>> getAds() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    final url = '';
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': token!,
      },
    );
    List<Ads> adss = List<Ads>.empty(growable: true);

    if (response.statusCode == 200) {
      List resList = jsonDecode(response.body);

      resList.forEach((mAds) {
        adss.add(Ads.fromJson(mAds));
      });
    }
    return adss;
  }

  Future<bool?> newAds(Ads ads) async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    final url = '';
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token!,
        },
        body: json.encode(ads.toJson()));
    print(ads.preco);
    print(response.body);
    print(json.encode(ads.toJson()));
    print(prefs.getString("token"));
    if (response.statusCode == 201) {
      return true;
    } else {
      Exception('Falaha na conexão');
    }
  }

  Future<bool> editAds(Ads ads) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    String url = await '';
    final res = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
      body: json.encode(ads.toJson()),
    );

    if (res.statusCode == 200) {
      //Ads rAds = Ads.fromJson(jsonDecode(res.body));
      return true;
    } else {
      return false;
      //Exception('Falha na conexão');
    }
  }

  Future<bool> deleteAds(int id) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    String url = '' + id.toString();
    final res = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
    );
    if (res.statusCode == 200) {
      //Ads rAds = Ads.fromJson(jsonDecode(res.body));
      return true;
    } else {
      return false; //Exception('Olha o erro aê');
    }
  }
}
