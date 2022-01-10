import 'dart:convert';
import 'dart:io';

import 'package:ads_app/models/ads.dart';
import 'package:path_provider/path_provider.dart';

class FilePersistence {
  Future<File> _getLocalFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    String _localPath = diretorio.path;
    return File("$_localPath/adsList.json");
  }

  Future saveData(List<Ads> adss) async {
    final localFile = await _getLocalFile();
    List adsList = [];

    adss.forEach((ads) {
      adsList.add(ads.toMap());
    });

    String data = json.encode(adsList);
    return localFile.writeAsStringSync(data);
  }

  Future<List<Ads>> getData() async {
    final localFile = await _getLocalFile();

    String data = await localFile.readAsString();
    List adsList = json.decode(data);
    List<Ads> adss = [];

    adsList.forEach((mapAds) {
      adss.add(Ads.fromMap(mapAds));
    });
    return adss;
  }
}
