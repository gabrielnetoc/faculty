// To parse this JSON data, do
//
//     final ads = adsFromJson(jsonString);

import 'dart:convert';

Ads adsFromJson(String str) => Ads.fromJson(json.decode(str));

String adsToJson(Ads data) => json.encode(data.toJson());

class Ads {
  Ads(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.preco});

  int id;
  String titulo;
  String descricao;
  double preco;

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
      id: json["id"],
      titulo: json["titulo"],
      descricao: json["descricao"],
      preco: json["preco"].toDouble());

  Map<String, dynamic> toJson() =>
      {"id": id, "titulo": titulo, "descricao": descricao, "preco": preco};
}
