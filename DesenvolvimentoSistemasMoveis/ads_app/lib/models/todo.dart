import 'dart:io';

class Ads {
  late String text;
  late String price;
  late String description;
  bool done = false;
  File image;

  Ads(this.text, this.description, this.price, this.image);
}
