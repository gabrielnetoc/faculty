import 'dart:io';

class Ads {
  late String text;
  late String price;
  late String description;
  bool done = false;
  late File image;

  Ads(this.text, this.description, this.price, this.image);

  Ads.fromMap(Map map) {
    this.text = map['text'];
    this.price = map['price'];
    this.description = map['desc'];
    //this.image = map['imagePath'] != "" ? File(map['imagePath']) : null;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "text": this.text,
      "price": this.price,
      "desc": this.description,
      // "imagePath" : this.image != null ? this.image.path : ""
    };

    return map;
  }
}
